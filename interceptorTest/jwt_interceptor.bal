// Copyright (c) 2023, WSO2 LLC. (http://www.wso2.com). All Rights Reserved.
//
// This software is the property of WSO2 LLC. and its suppliers, if any.
// Dissemination of any information or reproduction of any material contained
// herein in any form is strictly forbidden, unless permitted by WSO2 expressly.
// You may not alter or remove any copyright or other notice from copies of this content.

import ballerina/http;
import ballerina/log;

// Request Interceptor used to decode the JWT and authorize the user privileges.

public const JWT_HEADER = "x-jwt-assertion";
public const READING_JWT_HEADER_ERROR = "Error while reading JWT header";
public const USER_UNAUTHORIZED = "You are Unauthorized for this action/page. Try logging in again. If this issue persists please contact internal-apps team.";

public type AppUnauthorizedError record {|
    *http:Unauthorized;
    ResponseBody body;
|};

public type ResponseBody record {|
    string message;
    string|int? lastInsertId?;
|};

public isolated service class JwtInterceptor {
    *http:RequestInterceptor;
    isolated resource function 'default [string... path](http:RequestContext ctx, http:Request req)
        returns http:NextService|AppUnauthorizedError|error? {
        if req.method == http:OPTIONS || path[0] == "health-check" {
            return ctx.next();
        }
        string|error jwtAssertion = req.getHeader(JWT_HEADER);
        if jwtAssertion is error {
            log:printError("Printing all headers : " + req.getHeaderNames().toString());
            log:printError(READING_JWT_HEADER_ERROR, jwtAssertion, info = jwtAssertion.toString());
            return <AppUnauthorizedError>{
                body: {
                    message: USER_UNAUTHORIZED
                }
            };
        }
    }
}
