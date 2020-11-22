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
