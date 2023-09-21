import ballerina/http;

final http:Client clientEP = check new ("https://shanaka.requestcatcher.com/test");

service / on new http:Listener(9090) {

    isolated resource function get \*(http:Request req) returns string|error {
        req.removeHeader("Set-Cookie");
        string payload = check clientEP->forward(req.rawPath, req);
        return payload;
    }

    isolated resource function post \*(http:Request req) returns string|error {
        string payload = check clientEP->forward(req.rawPath, req);
        return payload;
    }

    isolated resource function put \*(http:Request req) returns string|error {
        string payload = check clientEP->forward(req.rawPath, req);
        return payload;
    }

    isolated resource function patch \*(http:Request req) returns string|error {
        string payload = check clientEP->forward(req.rawPath, req);
        return payload;
    }

    isolated resource function delete \*(http:Request req) returns string|error {
        string payload = check clientEP->forward(req.rawPath, req);
        return payload;
    }

    isolated resource function head \*(http:Request req) returns string|error {
        string payload = check clientEP->forward(req.rawPath, req);
        return payload;
    }
}
