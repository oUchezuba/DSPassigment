import ballerina/grpc;
import ballerina/log;
import ballerina/crypto;
import ballerina/encoding;

// gRPC endpoint service.
endpoint grpc:Listener listener {
    host:"localhost",
    port:9090
};

map<orderInfo> ordersMap = {}; 

// gRPC service.+ findRecord.reason() 
service songsStorageSystem {

    // write a new record.
    resource function writeNew(grpc:Caller caller, newRec writeRec) {
        // Adds the new record.
        string newRecId = newRecord.id;
        // recordNew[newRecord.id] = orderReq;
        
    string input = newRecord.id;
    string[] newRecId = input.toString(newRecId);

    string[] output = crypto:hashMd5(inputArr);
    io:println("Key: " + output.toBase16());

        // Create response message.
        if (newRecId is boolean) {
        io:println(io:sprintf("Key returned: ", newRecId));
    } else {
        io:println("Record does not exist!");
    }

        // Send response.
        error? output = caller->send(payload);
        output = caller->complete();
        }
        
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

