import ballerina/http;

listener http:Listener httpListener = check new (9090);

service / on httpListener {
    resource function get greeting() returns string|error {
        return "Hello, service";
    }
}
