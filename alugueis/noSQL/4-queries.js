// [Size] [Find] Exibe todos os times solos
db.Teams.find({
    players: {
        $size: 1 
    }
}).count();

// [Limit] [Sort] Exibindo primeiros 10 jogadores com o nome em ordem alfabética
db.Teams.aggregate([{
    $unwind: {
        path: '$players'
    }  
}, {
    $project: {
        name: '$players.name',
        gender: '$players.gender',
        nickname: '$players.nickname',
        description: '$players.description'
    }
}, {
    $sort: {
        name: 1
    },
}, {
    $limit: 10
}]);

// [Lookup] [Gte] Quantidade de jogadores que participaram de campeonatos com prêmio acima de 10000
db.Championships.aggregate([{
    $lookup: {
        from: 'Teams',
        localField: 'matches.teams',
        foreignField: 'name',
        as: 'teams'
    }
}, {
    $unwind: {
        path: '$teams'
    }
}, {
    $unwind: {
        path: '$teams.players'
    }
}, {
    $match: {
        prize: {
            $gte: 100000
        }
    }
}, {
    $count: 'teams'
}])

// [Count] [Match] [Cond] Porcentagem de times com meninas
let teamsWithGirls = db.Teams.aggregate([{
    $project: {
        girlsCount: {
            $size: {
                $filter: {
                    input: '$players.gender',
                    as: 'gender',
                    cond: {
                        $eq: [
                            '$$gender',
                            'F'
                        ]
                    }
                }
            }
        }
    }
}, {
    $match: {
        girlsCount: {
           $gte: 1
        }
    }
}, {
    $count: 'girlsCount'
}]).toArray()[0].girlsCount;
let teamsCount = db.Teams.find().count();
Math.round(teamsWithGirls / teamsCount * 100) + '%';


// [Text] [Search] Busca todos os campeonatos com CS GO no nome
db.Championships.createIndex({ name: "text"});
db.Championships.find({
    $text: {
        $search: "\"CS GO\""
    }
}).pretty();


// [Aggregate] [AVG] Retorna a média de premiação de todos os campeonatos
db.Championships.aggregate([
    {
        $group:
            {
                _id: null,
                avgPrize: {
                    $avg: "$prize"
                }
            }
    }
]).toArray()[0].avgPrize;


// [Max] [Group] Retorna a maior premiação de todos os campeonatos
db.Championships.aggregate([
    {
        $group:
            {
                _id: null,
                maxPrize: {
                    $max: "$prize"
                }
            }
    }
]).toArray()[0].maxPrize;

// [Exists] [Find]: O treinador da Imperial precisou se afastar e agora o time está sem treinador
db.Teams.updateOne({name: "Imperial"}, {$unset: {"trainer": null}});
db.Teams.find({trainer: {$exists: false}}).pretty();


// [All] [Pretty]: Lista os campeonatos em que possuem os times listados (Furia e Imperial)
db.Championships.find({teams: {$all: [
    db.teams.findOne({name: "Furia"})._id,
    db.teams.findOne({name: "Imperial"})._id,
]}}).pretty();


// [Where] [Function] Devolve todos os times com pontuação superior a 0
db.Teams.find({
    $where: function() {
        return this.score > 0;
    }
}).pretty();


// [MapReduce] [Sum] A soma de todas as pontuações dos times
var mapFunction = function() {
    emit(this.score) 
}
var reduceFunction = function(scores) {
    return Array.sum(scores) 
}
db.Teams.mapReduce(
    mapFunction, 
    reduceFunction,
    {
        query: {},
        out: "mapReduceFunc"
    }
)  
db.mapReduceFunc.find();
