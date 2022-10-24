db.createCollection("championships");

db.Championships.insertMany([
    {
        "name": "Campeonato Brasileiro de Fifa 2019",
        "startDate": new Date("2019-11-01"),
        "endDate": new Date("2019-11-05"),
        "prize": 100000,
        "game": {
            $ref: "games",
            $id: db.Games.findOne({name: "Fifa 2019"})._id
        },
        "teams": [
            {
                $ref: "teams",
                $id: db.Teams.findOne({name: "Flamengo"})._id
            },
            {
                $ref: "teams",
                $id: db.Teams.findOne({name: "NY city"})._id
            },
            {
                $ref: "teams",
                $id: db.Teams.findOne({name: "Frankfurt"})._id
            },
            {
                $ref: "teams",
                $id: db.Teams.findOne({name: "Santos"})._id
            },
        ],
        "matches": [
            {
                "teams": ["Flamengo", "NY city"],
                "date": new Date("2019-11-02"),
                "winner": "NY city",
            },
            {
                "teams": ["Frankfurt", "Santos"],
                "date": new Date("2019-11-02"),
                "winner": "Santos",
            },
            {
                "teams": ["Santos", "NY city"],
                "date": new Date("2019-11-05"),
                "winner": "Santos",
            },
        ]
    },
    {
        "name": "Campeonato Brasileiro de CS GO",
        "startDate": new Date("2019-01-01"),
        "endDate": new Date("2019-12-31"),
        "prize": 10000,
        "game": {
            $ref: "games",
            $id: db.Games.findOne({name: "CS GO"})._id
        },
        "teams": [
            {
                $ref: "teams",
                $id: db.Teams.findOne({name: "Furia"})._id
            },
            {
                $ref: "teams",
                $id: db.Teams.findOne({name: "Imperial"})._id
            },
            {
                $ref: "teams",
                $id: db.Teams.findOne({name: "G2"})._id
            },
            {
                $ref: "teams",
                $id: db.Teams.findOne({name: "Natus vincere"})._id
            },
        ],
        "matches": [
            {
                "teams": ["Furia", "G2"],
                "date": new Date("2019-01-01"),
                "winner": null,
            },
            {
                "teams": ["Imperial", "Natus vincere"],
                "date": new Date("2019-01-01"),
                "winner": null,
            },
            {
                "teams": ["Furia", "Imperial"],
                "date": new Date("2019-01-02"),
                "winner": null,
            },
        ]
    },
    {
        "name": "IEM RIO Major CS GO 2022",
        "startDate": new Date("2022-10-31"),
        "endDate": new Date("2022-11-14"),
        "prize": 500000,
        "game": {
            $ref: "games",
            $id: db.Games.findOne({name: "CS GO"})._id
        },
        "teams": [
            {
                $ref: "teams",
                $id: db.Teams.findOne({name: "Furia"})._id
            },
            {
                $ref: "teams",
                $id: db.Teams.findOne({name: "Imperial"})._id
            },
            {
                $ref: "teams",
                $id: db.Teams.findOne({name: "Natus vincere"})._id
            },
        ],
        "matches": [
            {
                "teams": ["Furia", "Natus vincere"],
                "date": new Date("2022-11-01"),
                "winner": null,
            },
            {
                "teams": ["Imperial", "Natus vincere"],
                "date": new Date("2022-11-01"),
                "winner": null,
            },
            {
                "teams": ["Furia", "Imperial"],
                "date": new Date("2022-11-02"),
                "winner": null,
            },
        ]
    },
    
]);
