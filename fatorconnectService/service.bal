import ballerina/http;

type Album readonly & record {
    string title;
    string artist;
};

final http:Client clientEP = check new ("https://shanaka.requestcatcher.com/test");

service / on new http:Listener(9090) {

    isolated resource function get \*(http:Request req) returns string|error {
        string payload = check clientEP->forward(req.rawPath, req);
        return payload;
    }
}
