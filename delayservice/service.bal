import ballerina/http;
import ballerina/lang.runtime;

configurable decimal sleepTime = ?;

service / on new http:Listener(9091, {timeout: 300}) {

    resource function post \*() returns json|error {

        runtime:sleep(sleepTime);
        return {
            "success": true,
            "message": "Data retrieved successfully",
            "data": {
                "user": {
                    "id": 123,
                    "username": "example_user",
                    "email": "user@example.com"
                },
                "products": [
                    {
                        "id": 1,
                        "name": "Product A",
                        "price": 19.99
                    },
                    {
                        "id": 2,
                        "name": "Product B",
                        "price": 29.99
                    }
                ]
            }
        };
    }
}
