import ballerina/http;
import ballerina/tcp as _;

service / on new http:Listener(9090) {

    resource function get greeting(string name) returns string {

        return "Hello";

    }
}
