import ballerina/http;

service class RequestInterceptor {
    *http:RequestInterceptor;

    // Intercepts the request.
    // Remove the X-Forwarded-For header from the request to avoid backend invocation failure.
    resource function 'default [string... path](http:RequestContext ctx, http:Request req)
        returns http:NotImplemented|http:NextService|error? {
        req.removeHeader("X-Forwarded-For");
        return ctx.next();
    }
}