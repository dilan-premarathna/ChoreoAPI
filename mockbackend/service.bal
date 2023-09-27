import ballerina/http;

# A service representing a network-accessible API
# bound to port `9090`.
service / on new http:Listener(9090) {

    resource function get \*() returns string|error {
        // Send a response back to the caller.

        return "Hello, service invoke";

    }

    resource function post \*() returns string|error {
        // Send a response back to the caller.

        return "Hello, post resource invoke";

    }
}
