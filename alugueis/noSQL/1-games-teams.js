// use championshipManagement

db.createCollection("games");
db.games.insertMany([
    {
        "name": "Fifa 2019",
        "platform": "PS4",
        "genre": "Esporte",
        "publisher": "EA Sports"
    },
    {
        "name": "CS GO",
        "platform": "PC",
        "genre": "FPS",
        "publisher": "Valve"
    },
    {
        "name": "Rainbow Six Siege",
        "platform": "PC",
        "genre": "FPS",
        "publisher": "Ubisoft"
    }
]);

db.createCollection("teams");
db.teams.insertMany([
    { // Times de Fifa
        "name": "Flamengo",
        "trainer": "Olavo aguiar",
        "nationality": "Brasileira",
        "game": {
            $ref: "games",
            $id: db.games.findOne({name: "Fifa 2019"})._id
        },
        "players": [
            {
                "name": "Gabigol",
                "cpf": "123.456.789-00",
                "nickname": "Gabigolzinho",
                "description": "Fifa player",
                "gender": "M",
            }
        ],
        "score": 0,
    },
    {
        "name": "NY city",
        "trainer": "Sergey Star",
        "nationality": "Estadunidense",
        "game": {
            $ref: "games",
            $id: db.games.findOne({name: "Fifa 2019"})._id
        },
        "players": [
            {
                "name": "Chris Bertrand",
                "cpf": "934.456.142-34",
                "nickname": "Bert",
                "description": "Fifa player",
                "gender": "M",
            }
        ],
        "score": 0,
    },
    {
        "name": "Frankfurt",
        "trainer": "Jonas terk",
        "nationality": "Alemanha",
        "game": {
            $ref: "games",
            $id: db.games.findOne({name: "Fifa 2019"})._id
        },
        "players": [
            {
                "name": "Michel agsmot",
                "cpf": "333.981.649-00",
                "nickname": "Mot",
                "description": "Fifa player",
                "gender": "M",
            }
        ],
        "score": 0,
    },
    {
        "name": "Santos",
        "trainer": "Alexandre",
        "nationality": "Brasileira",
        "game": {
            $ref: "games",
            $id: db.games.findOne({name: "Fifa 2019"})._id
        },
        "players": [
            {
                "name": "Paulo",
                "cpf": "141.788.789-00",
                "nickname": "Palao",
                "description": "Fifa player",
                "gender": "M",
            }
        ],
        "score": 0,
    }, 
    {   // times de CSGO
        "name": "Furia",
        "trainer": "Ricardo Farias",
        "nationality": "Brasileira",
        "game": {
            $ref: "games",
            $id: db.games.findOne({name: "CS GO"})._id
        },
        "players": [
            {
                "name": "Carlos",
                "cpf": "964.456.789-00",
                "nickname": "Solrac",
                "description": "Ancora",
                "gender": "M",
            },
            {
                "name": "João",
                "cpf": "954.916.789-00",
                "nickname": "Jgx",
                "description": "Entry",
                "gender": "M",
            },
            {
                "name": "Felipe",
                "cpf": "864.456.154-00",
                "nickname": "Blank",
                "description": "Entry",
                "gender": "M",
            },
            {
                "name": "Pedro",
                "cpf": "324.649.789-00",
                "nickname": "Pedroca",
                "description": "Suporte",
                "gender": "M",
            },
            {
                "name": "Fabricio",
                "cpf": "564.489.888-00",
                "nickname": "Fabr",
                "description": "Suporte",
                "gender": "M",
            }
        ],
        "score": 0,
    },
    { 
        "name": "Imperial",
        "trainer": "Lincoln Lau",
        "nationality": "Brasileira",
        "game": {
            $ref: "games",
            $id: db.games.findOne({name: "CS GO"})._id
        },
        "players": [
            {
                "name": "Gabriel Toledo",
                "cpf": "964.456.119-00",
                "nickname": "Fallen",
                "description": "AWPer",
                "gender": "M",
            },
            {
                "name": "Fernando Alvarenga",
                "cpf": "111.916.789-00",
                "nickname": "fer",
                "description": "Entry",
                "gender": "M",
            },
            {
                "name": "Ricardo Prass",
                "cpf": "864.111.154-21",
                "nickname": "boltz",
                "description": "Entry",
                "gender": "M",
            },
            {
                "name": "Vinicius Figueiredo",
                "cpf": "390.249.729-11",
                "nickname": "VINI",
                "description": "Suporte",
                "gender": "M",
            },
            {
                "name": "Marcelo Cespedes",
                "cpf": "564.489.888-00",
                "nickname": "chelo",
                "description": "Entry",
                "gender": "M",
            }
        ],
        "score": 0,
    },
    { 
        "name": "G2",
        "trainer": "Elisabeth nielsen",
        "nationality": "Alemanha",
        "game": {
            $ref: "games",
            $id: db.games.findOne({name: "CS GO"})._id
        },
        "players": [
            {
                "name": "Hannah",
                "cpf": "912.555.355-02",
                "nickname": "Ray",
                "description": "Ancora",
                "gender": "F",
            },
            {
                "name": "Marthe",
                "cpf": "955.922.789-31",
                "nickname": "The",
                "description": "Entry",
                "gender": "F",
            },
            {
                "name": "Franziska",
                "cpf": "815.400.104-00",
                "nickname": "Zisk",
                "description": "Entry",
                "gender": "F",
            },
            {
                "name": "Agnes",
                "cpf": "249.188.789-97",
                "nickname": "Agnews",
                "description": "Suporte",
                "gender": "F",
            },
            {
                "name": "Charlotte",
                "cpf": "914.419.138-00",
                "nickname": "lottus",
                "description": "Suporte",
                "gender": "F",
            }
        ],
        "score": 0,
    },
    { 
        "name": "Natus vincere",
        "trainer": "Amanda",
        "nationality": "Brasileira",
        "game": {
            $ref: "games",
            $id: db.games.findOne({name: "CS GO"})._id
        },
        "players": [
            {
                "name": "Clara",
                "cpf": "964.401.129-35",
                "nickname": "Gema",
                "description": "Ancora",
                "gender": "F",
            },
            {
                "name": "Mariana",
                "cpf": "177.916.789-01",
                "nickname": "Mari",
                "description": "Entry",
                "gender": "F",
            },
            {
                "name": "Flavia",
                "cpf": "551.398.154-10",
                "nickname": "Fla",
                "description": "Entry",
                "gender": "F",
            },
            {
                "name": "Ana",
                "cpf": "304.609.089-00",
                "nickname": "DeArmas",
                "description": "Suporte",
                "gender": "F",
            },
            {
                "name": "Lorena",
                "cpf": "554.129.888-92",
                "nickname": "Lore",
                "description": "Suporte",
                "gender": "F",
            }
        ],
        "score": 0,
    }, 
    {   // Times de Rainbow Six
        "name": "Team Liquid",
        "trainer": "Rafael",
        "nationality": "Americana",
        "game": {
            $ref: "games",
            $id: db.games.findOne({name: "Rainbow Six Siege"})._id
        },
        "players": [
            {
                "name": "Andre",
                "cpf": "123.515.789-79",
                "nickname": "Nesk",
                "description": "Entry",
                "gender": "M",
            },
            {
                "name": "Luccas",
                "cpf": "123.456.911-15",
                "nickname": "Paluh",
                "description": "Entry",
                "gender": "M",
            },
            {
                "name": "Gabriel",
                "cpf": "331.456.789-11",
                "nickname": "Ask",
                "description": "Ancora",
                "gender": "M",
            },
            {
                "name": "Pablo",
                "cpf": "777.606.149-00",
                "nickname": "Resetz",
                "description": "suporte",
                "gender": "M",
            },
            {
                "name": "Lorenzo",
                "cpf": "981.456.191-99",
                "nickname": "Lagonis",
                "description": "suporte",
                "gender": "M",
            }

        ],
        "score": 0,
    },
    { 
        "name": "Team Solo Mid",
        "trainer": "Pharrel",
        "nationality": "Americana",
        "game": {
            $ref: "games",
            $id: db.games.findOne({name: "Rainbow Six Siege"})._id
        },
        "players": [
            {
                "name": "Macie",
                "cpf": "321.763.349-12",
                "nickname": "Beaulo",
                "description": "Entry",
                "gender": "M",
            },
            {
                "name": "Fisher",
                "cpf": "623.456.712-54",
                "nickname": "Fish",
                "description": "Entry",
                "gender": "M",
            },
            {
                "name": "Alan",
                "cpf": "523.355.789-50",
                "nickname": "Rich",
                "description": "Ancora",
                "gender": "M",
            },
            {
                "name": "Nick",
                "cpf": "451.420.789-63",
                "nickname": "nickname",
                "description": "Ancora",
                "gender": "M",
            },
            {
                "name": "Harry",
                "cpf": "903.456.789-00",
                "nickname": "Potter",
                "description": "Suporte",
                "gender": "M",
            }

        ],
        "score": 0,
    },
    { 
        "name": "Black dragons",
        "trainer": "Rafaela",
        "nationality": "Brasileira",
        "game": {
            $ref: "games",
            $id: db.games.findOne({name: "Rainbow Six Siege"})._id
        },
        "players": [
            {
                "name": "Gabriela",
                "cpf": "173.116.349-00",
                "nickname": "Gabi",
                "description": "Entry",
                "gender": "F",
            },
            {
                "name": "Maria",
                "cpf": "553.998.789-00",
                "nickname": "Mary",
                "description": "Entry",
                "gender": "F",
            },
            {
                "name": "Carol",
                "cpf": "435.775.789-34",
                "nickname": "Roll",
                "description": "Entry",
                "gender": "F",
            },
            {
                "name": "Lais",
                "cpf": "723.456.722-21",
                "nickname": "Lala",
                "description": "Suporte",
                "gender": "F",
            },
            {
                "name": "Fabiana",
                "cpf": "122.126.789-00",
                "nickname": "Fabi",
                "description": "Suporte",
                "gender": "F",
            }

        ],
        "score": 0,
    },
    { 
        "name": "Team one",
        "trainer": "Roberta",
        "nationality": "Brasileira",
        "game": {
            $ref: "games",
            $id: db.games.findOne({name: "Rainbow Six Siege"})._id
        },
        "players": [
            {
                "name": "Larissa",
                "cpf": "443.119.789-32",
                "nickname": "Lari",
                "description": "Entry",
                "gender": "F",
            },
            {
                "name": "Berenice",
                "cpf": "993.456.991-00",
                "nickname": "Bere",
                "description": "Entry",
                "gender": "F",
            },
            {
                "name": "Livia",
                "cpf": "733.177.789-79",
                "nickname": "Liv",
                "description": "Suporte",
                "gender": "F",
            },
            {
                "name": "Jessica",
                "cpf": "823.856.889-00",
                "nickname": "Jessi",
                "description": "Ancora",
                "gender": "F",
            },
            {
                "name": "Leticia",
                "cpf": "202.456.789-00",
                "nickname": "Let",
                "description": "Ancora",
                "gender": "F",
            }

        ],
        "score": 0,
    },
]);
