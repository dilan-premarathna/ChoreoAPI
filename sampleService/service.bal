import ballerina/http;
import ballerina/io;

# A service representing a network-accessible API
# bound to port `9090`.
service / on new http:Listener(9090) {

    # A resource for generating greetings
    # + req - the request object
    # + name - the input string name
    # + return - string name with hello message or error
    resource function get greeting(http:Request req, string name) returns string|error {
        // Send a response back to the caller.
        if name is "" {
            return error("name should not be empty!");
        }
        string[] requestHeaders = req.getHeaderNames();
        foreach var item in requestHeaders {
            string itemList = check (req.getHeader(item));
            io:println("header name: " + item + " header value: " + itemList);
        }
        return "Hello, " + name;
    }
}
