import ballerina/io;
import ballerina/http;

configurable string httpendpoint = "https://5ea3cd2c-5708-4489-bfc3-d82bd90520b2-dev.e1-us-east-azure.choreoapis.dev/xwhw/delay2/endpoint-9091-6c0/v1.0/a";

public function main() returns error? {

    http:Client albumClient = check new (httpendpoint, timeout = 0);

    // Sends a `GET` request to the "/albums" resource.
    // The verb is not mandatory as it is default to "GET".
    json delayResponse = check albumClient->/albums.post({
        title: "Sarah Vaughan and Clifford Brown",
        artist: "Sarah Vaughan"
    });
    io:println("GET request:" + delayResponse.toJsonString());
}
