import ballerina/http;
import ballerina/log;

//import ballerinax/redis as _;

service / on new http:Listener(9090) {

    resource function get issues(string product, string productVersion) returns json|error? {

        log:printInfo("service invoked");

        return "success";

    }
}
