import ballerina/http;

# A service representing a network-accessible API
# bound to port `9090`.
//configurable float testValue = ?;

// public type Amount record {
//     string Currency = "USD";
// };

service / on new http:Listener(9090) {

    # A resource for generating greetings
    # + name - the input string name
    # + return - string name with hello message or error
    resource function get greeting(string name) returns Amount {
        // Send a response back to the caller.
        // if name is "" {
        //     return error("name should not be empty!" + testValue.toString());
        // }
        // return "Hello, " + name + testValue.toString();
        //
        return "Hello";
        // Amount val = {};
        // return val;

    }

    resource function get greeting2(string name) returns string|error {

        if name is "" {
            return error("name should not be empty!" + testValue.toString());
        }
        return "Hello, " + name + testValue.toString();

    }
}
