import ballerina/http;

# A service representing a network-accessible API
# bound to port `9090`.
#
type EmailAlertConfig record {|
    string baseUrl;
    string tokenUrl;
    string clientId;
    string clientSecret;
    string uuid;
    string[] to;
    string[] cc;
    string emailFrom;
    string templateId;
|};

configurable EmailAlertConfig emailAlertConfig = ?;

configurable boolean booleanTest = ?;

service / on new http:Listener(9090) {

    # A resource for generating greetings
    # + name - the input string name
    # + return - string name with hello message or error
    resource function get greeting() returns string|error {
        // Send a response back to the caller.
        if booleanTest is true {
            return error("value is true");
        }
        return "Hello, " + emailAlertConfig.toString();
    }
}
