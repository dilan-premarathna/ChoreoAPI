import ballerina/http;

# A service representing a network-accessible API
# bound to port `9090`.
# configurable string tempvalue = ?;

listener http:Listener httpListener = check new (8090);

service / on httpListener {
    //service / on new http:Listener(9090) {

    # A resource for generating greetings
    # + return - string name with hello message or error
    resource function get greeting() returns string|error {
        // Send a response back to the caller.

        return "Hello, service";
    }
}
