import ballerina/http;

@http:ServiceConfig {
    cors: {
        allowMethods: [http:GET, http:POST, http:PATCH, http:DELETE]
    },
    interceptors: [new JwtInterceptor()]
}
service / on new http:Listener(9090) {

    resource function get greeting() returns string|error {

        return "Hello, ";
    }
}
