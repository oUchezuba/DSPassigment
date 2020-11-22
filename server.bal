import ballerina/grpc;
import ballerina/log;
import ballerina/crypto;
import ballerina/encoding;

// gRPC read existing record. 

resource function readRecordWithKeyVer(grpc:Caller caller, string recordId, versionRecordId) {
        string payload = "";
        error? output = ();

        // Find the requested record.
        if (ordersMap.hasKey(recordId) || ordersMap.hasKey(versionRecordId) || (ordersMap.hasKey(recordId) && ordersMap.hasKey(versionRecordId))) {
            var jsonValue = typedesc<json>.constructFrom(ordersMap[recordId, versionRecordId]);
            if (jsonValue is error) {

                // Sets casting (more or less recorded is known) error as internal error
                output = caller->sendError(grpc:INTERNAL, <string>jsonValue.detail()["message"]);
            } else {
                json recordInformation = jsonValue;
                payload = recordInformation.toString();
                // Sends response.
                output = caller->send(payload);
                output = caller->complete();
            }
        } else {
            // Record not found error.
            payload = "Record : '" + recordId + "'does not exist.";
            output = caller->sendError(grpc:NOT_FOUND, payload);
        }
     
    }
}