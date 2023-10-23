import ballerina/io;
import ballerina/http;

# A service representing a network-accessible API
# bound to port `9090`.
service / on new http:Listener(9090) {
    resource function get \*(http:Request req) returns string|error {
        // Send a response back to the caller.
        string dummyPayload = "Hello, World from service";
        return dummyPayload + req.rawPath;

    }

    resource function post \*(http:Request req) returns json|error {
        // Send a response back to the caller.
        string|error coorelationheader = req.getHeader("X-Correlation-Id");
        io:println(coorelationheader);
        json dummyPayload = [
            [
                1589744387,
                {
                    "comfortable": true,
                    "everything": {
                        "wet": [
                            true,
                            -1589570800,
                            [
                                true,
                                [
                                    [
                                        false,
                                        [
                                            -1636416572.58738,
                                            -458702447,
                                            [
                                                2038896672,
                                                false,
                                                1456063316,
                                                "journey",
                                                -1954318017,
                                                true,
                                                -492395487,
                                                "fireplace",
                                                "look",
                                                1823545056.9086952
                                            ],
                                            false,
                                            -453119343,
                                            "like",
                                            "eleven",
                                            -1077308352,
                                            "customs",
                                            true
                                        ],
                                        985223481.3095064,
                                        true,
                                        "wish",
                                        false,
                                        330482563,
                                        "north",
                                        -1207305832.1511269,
                                        "being"
                                    ],
                                    1568290279.0796838,
                                    true,
                                    false,
                                    "tight",
                                    1868820396.9406877,
                                    -879481593.4905357,
                                    "evidence",
                                    1111594228.8248687,
                                    "class"
                                ],
                                -153917101.33188677,
                                "paragraph",
                                "gather",
                                true,
                                true,
                                1710322921.1762376,
                                true,
                                false
                            ],
                            -816992780,
                            -2011267054,
                            false,
                            -1767286355.6675682,
                            true,
                            false,
                            "examine"
                        ],
                        "wing": "prove",
                        "film": "car",
                        "softly": false,
                        "rise": 1063500852,
                        "several": false,
                        "corner": true,
                        "grain": "journey",
                        "conversation": 1603123591.7443337,
                        "expect": "she"
                    },
                    "farmer": -543152937,
                    "fly": true,
                    "forgotten": -566266342.7487373,
                    "oldest": "sweet",
                    "guard": "north",
                    "shirt": "tropical",
                    "have": false,
                    "pipe": true
                },
                "native",
                "catch",
                "driven",
                1727658632.985146,
                "look",
                "why",
                true,
                -1302390100.2827144
            ],
            false,
            22630372,
            "law",
            "golden",
            "throughout",
            false,
            false,
            -1530135972,
            -162004621.16377354
        ];
        return dummyPayload;

    }

    resource function put \*(http:Request req) returns string|error {
        // Send a response back to the caller.

        string dummyPayload = "Hello, World from service";
        return dummyPayload + req.rawPath;

    }
}
