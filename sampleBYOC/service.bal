import ballerina/http;

configurable string name = ?;

service / on new http:Listener(9090) {
    resource function get sayHello() returns string {
        return string `Hello, ${name}!`;
    }

}
