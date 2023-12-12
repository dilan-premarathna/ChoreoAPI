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

    isolated resource function get stats/v2/[string startDate](http:Request req) returns string|error {
        string|http:HeaderNotFoundError jwtheader = req.getHeader("X-Jwt-Assertion");
        if (jwtheader is string) {
             string payload = check clientEP->get("/stats/v2/"+startDate,{"X-Jwt-Assertion":  jwtheader});
            return payload;
        }
        
        return "Invalid JWT";
    }


    isolated resource function get stats/v2/[string startDate]/[string endDate](http:Request req) returns string|error {
        string|http:HeaderNotFoundError jwtheader = req.getHeader("X-Jwt-Assertion");
        if (jwtheader is string) {
            string payload = check clientEP->get("/stats/v2/"+startDate+"/"+endDate, {"X-Jwt-Assertion":  jwtheader});
            return payload;
        }
        
        return "Invalid JWT";
        
    }


}
