// [RenameCollection] Renomeia as coleções para ficar capitalized
db.games.renameCollection("Games");
db.teams.renameCollection("Teams");
db.championships.renameCollection("Championships");

// [Save] Adiciona mais um campeonato
db.Championships.save({
    "name": "Campeonato Brasileiro de Rainbow Six Siege",
    "startDate": new Date("2019-01-01"),
    "endDate": new Date("2019-12-31"),
    "prize": 10000,
    "game": {
        $ref: "games",
        $id: db.Games.findOne({name: "Rainbow Six Siege"})._id
    },
    "teams": [
        {
            $ref: "teams",
            $id: db.Teams.findOne({name: "Team Liquid"})._id
        },
        {
            $ref: "teams",
            $id: db.Teams.findOne({name: "Team Solo Mid"})._id
        },
        {
            $ref: "teams",
            $id: db.Teams.findOne({name: "Black dragons"})._id
        },
        {
            $ref: "teams",
            $id: db.Teams.findOne({name: "Team one"})._id
        },
    ],
    "matches": [
        {
            "teams": ["Team Liquid", "Black dragons"],
            "date": new Date("2019-01-01"),
            "winner": null,
        },
        {
            "teams": ["Team Solo Mid", "Team one"],
            "date": new Date("2019-01-01"),
            "winner": null,
        },
        {
            "teams": ["Black dragons", "Team Solo Mid"],
            "date": new Date("2019-01-03"),
            "winner": null,
        },
    ]
});

// [AddToSet] Adiciona um novo curso ao alunos
db.Championships.updateOne({
    "name": "Campeonato Brasileiro de Fifa 2019"
}, {
    $addToSet: {
        "matches": {
            "teams": ["Flamengo", "Frankfurt"],
            "date": new Date("2019-11-03"),
            "winner": "Flamengo",
        },
    }
});

// [Project] [Filter] Contabiliza a pontuação de acordo com a quantidade de vitórias
let nyCityScore = db.Championships.aggregate([{
    $project: {
        winsCount: {
            $size: {
                $filter: {
                    input: '$matches',
                    as: 'match',
                    cond: {
                        $eq: [
                            '$$match.winner',
                            'NY city'
                        ]
                    }
                }
            }
        }
    }
}, {
    $group: {
        _id: null,
        total: {
            $sum: '$winsCount'
        }
    }
}, { 
    $project: {
        _id: 0,
        total: 1
    }
}]).toArray()[0].total;

// [Update] [Set] Atualiza a pontuação do NY City
db.Teams.update(
    {
        name: "NY city"
    },
    {
        $set: {
            "score": nyCityScore
        }
    }
);
