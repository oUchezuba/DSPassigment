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
}


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
    

    // gRPC update existing record. 
    resource function updatingRec(grpc:Caller caller, recordUpdate updatingRec) {
        string payload;
        error? output = ();

        // Find record to be updated.
        string updatedRecordId = updatingRec.id;
        string versionRecordId = versionRec.recVersion;

        if (ordersMap.hasKey(updatedRecordId) || ordersMap.hasKey(versionRecordId) || ) {

            // Update the existing record.
            ordersMap[updatedRecordId] = updatingRec;
            payload = "Record : '" + updatedRecordId + "'with version : " + versionRecordId + "'updated.";

            // Send response.
            output = caller->send(payload);
            output = caller->complete();
        } else {
            // Send error if record is not found.
            payload = "Record : '" + updatedRecordId + "'does not exist!.";
            output = caller->sendError(grpc:NOT_FOUND, payload);
        }

    }
