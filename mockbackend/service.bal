import ballerina/http;

# A service representing a network-accessible API
# bound to port `9090`.
service / on new http:Listener(9090) {

    resource function get \*(http:Request req) returns string|error {
        // Send a response back to the caller.
        return "Hello, service invoke" + req.rawPath;

    }

    resource function post \*(http:Request req) returns string|error {
        // Send a response back to the caller.

        return "Hello, post resource invoke" + req.rawPath;

    }

    resource function put \*(http:Request req) returns string|error {
        // Send a response back to the caller.

        return "Hello, putg resource invoke" + req.rawPath;

    }
}
