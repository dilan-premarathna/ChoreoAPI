import ballerina/http;

configurable string backendURL = ?;
final http:Client clientEP = check new (backendURL);

RequestInterceptor requestInterceptor = new;

listener http:Listener serviceListener = new (9090, config = {
    interceptors: [requestInterceptor]
});

// Define resource functions for HTTP methods.
service / on serviceListener {

    isolated resource function get foo () returns string|error {
        string payload = check clientEP->get("/");
        return payload;
    }

    isolated resource function get stats/v2/[string startDate]() returns string|error {
        string payload = check clientEP->get("/stats/v2/"+startDate);
        return payload;
    }

        isolated resource function get stats/v2/[string startDate]/[string endDate]() returns string|error {
        string payload = check clientEP->get("/stats/v2/"+startDate+"/"+endDate);
        return payload;
    }

   
}
