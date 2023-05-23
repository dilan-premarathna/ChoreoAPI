import ballerina/http;

# A service representing a network-accessible API
# bound to port `9090`.
#
configurable string message = ?;

service / on new http:Listener(9090) {

    # A resource for generating greetings
    # + name - the input string name
    # + return - string name with hello message or error

    # add configurable to store string value
    resource function get greeting() returns string|error {
        // Send a response back to the caller.
        if message is "" {
            return error("name should not be empty!");
        }
        return "Hello, " + message;
    }
}
