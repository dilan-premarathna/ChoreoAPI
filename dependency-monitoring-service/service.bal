import ballerina/http;
import ballerinax/redis;

//configurable RedisConfigurables redisConfigurables = ?;

redis:ConnectionConfig redisConfig = {
    host: "FossaRedis-Test.redis.cache.windows.net:6380",
    password: "G4goXuiRyX4uvFs0gXvrNGUuhFt10uUp0AzCaDmDGxM=",
    options: {
        connectionPooling: true,
        isClusterConnection: false,
        ssl: true,
        startTls: false,
        verifyPeer: false
    }
};

service / on new http:Listener(9090) {

    resource function get issues(string product, string productVersion) returns json|error? {

        redis:Client conn = check new (redisConfig);
        string title = product + "-" + productVersion;

        var exists = check conn->hExists("projects", title);
        if !exists {
            return "Invalid project locator / No issues under given project.".toJson();
        }

        string locator = check conn->hGet("projects", title);

        string[] projects = check conn->sMembers(locator);
        json[] response = [];
        foreach string val in projects {

            map<any> iss = check conn->hGetAll(locator + val);
            map<json> issue = {

                "Dependancy": iss.get("Dependancy").toString(),
                "CVE": iss.get("CVE").toString(),
                "Revision": iss.get("Revision").toString(),
                "Severity": iss.get("Severity").toString(),
                "Resolution": iss.get("Resolution").toString()
            };
            response.push(issue);
        }
        if response == [] {
            response.push("Invalid project locator / No issues under given project.".toJson());
        }

        conn.stop();
        return response;
    }

}
