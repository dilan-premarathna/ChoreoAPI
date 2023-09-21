import ballerina/http;

service class RequestInterceptor {
    *http:RequestInterceptor;
    resource function 'default [string... path](http:RequestContext ctx, http:Request req)
        returns http:NotImplemented|http:NextService|error? {
        req.removeHeader("Set-Cookie");
        return ctx.next();
    }
}

service class ResponseInterceptor {
    *http:ResponseInterceptor;

    remote function interceptResponse(http:RequestContext ctx,
            http:Response res) returns http:NextService|error? {

        res.removeHeader("Set-Cookie");
        res.removeHeader("X-JWT-Assertion");
        return ctx.next();
    }
}

//configurable string host = ?;
string host2 = "https://shanaka.requestcatcher.com/test";
final http:Client clientEP = check new (host2);
RequestInterceptor requestInterceptor = new;
ResponseInterceptor responseInterceptor = new;

listener http:Listener serviceListener = new (9090, config = {
    interceptors: [requestInterceptor, responseInterceptor]
});

service / on serviceListener {

    isolated resource function get \*(http:Request req) returns string|error {
        string payload = check clientEP->forward(req.rawPath, req);
        return payload;
    }

    isolated resource function post \*(http:Request req) returns string|error {
        string payload = check clientEP->forward(req.rawPath, req);
        return payload;
    }

    isolated resource function put \*(http:Request req) returns string|error {
        string payload = check clientEP->forward(req.rawPath, req);
        return payload;
    }

    isolated resource function patch \*(http:Request req) returns string|error {
        string payload = check clientEP->forward(req.rawPath, req);
        return payload;
    }

    isolated resource function delete \*(http:Request req) returns string|error {
        string payload = check clientEP->forward(req.rawPath, req);
        return payload;
    }

    isolated resource function head \*(http:Request req) returns string|error {
        string payload = check clientEP->forward(req.rawPath, req);
        return payload;
    }

    isolated resource function get foo(http:Request req) returns string|error {
        req.setHeader("headerfoo", "foo header ");
        string payload = check clientEP->forward(req.rawPath, req);
        return payload;
    }

    isolated resource function get foo/shanaka(http:Request req) returns string|error {
        req.setHeader("headerfooshanaka", "foo  shanaka header ");
        string payload = check clientEP->forward(req.rawPath, req);
        return payload;
    }
}
