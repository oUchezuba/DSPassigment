import ballerina/log;
import ballerina/grpc;
import ballerina/crypto;
import ballerina/encoding;

    //used to update an existing record
	log:printInfo("*******Update an existing record*********");
    orderInfo updateReq = {
        date: "22/10/2020",
	artists: [
		{
			name: "Winston Marshall",
			member: yes
		},
		{
			name: "Ben Lovett",
			member: yes
		},
		{
			name: "Baaba Maal",
			member: no
		}
	],
	band: "Mumford & Sons",
	songs: [
		{
			title: "There will be time",
			genre: "folk rock",
			platform: "Deezer"
		}
		status: "updated";
	]
	};
    var addResponse = recordSystem->writeNew(writeRec);
    if (addResponse is error) {
        log:printError("Error writing record: ");
    } else {
        log:printInfo("Record does not exist!");
    };
    
    log:printInfo("*******Update an existing order*******");
    orderInfo updateReq = {"
		date: "22/10/2020",
	artists: [
		{
			name: "Winston Marshall",
			member: yes
		},
		{
			name: "Ben Lovett",
			member: yes
		},
		{
			name: "Baaba Maal",
			member: no
		}
	],
	band: "Mumford & Sons",
	songs: [
		{
			title: "There will be time",
			genre: "folk rock",
			platform: "Deezer"
		}
		status: "updated";
	]"
	};
    var addResponse = recordSystem->writeNew(writeRec);
    if (addResponse is error) {
        log:printError("Record : ");
    } else {
        log:printInfo("Record does not exist!");
    }


 // Update an order
    log:printInfo("Update existing record");
    updatedRecordInfo updatedRecord = {
	        date: "22/10/2020",
	        artists: [
		{
			recVersion : "201"
            id: "107"
			name: "Winston Marshall",
			member: yes
		},
		{
			name: "Ben Lovett",
			member: yes
		},
		{
			name: "Baaba Maal",
			member: no
		}
	],
	band: "Mumford & Sons",
	songs: [
		{
			title: "There will be time",
			genre: "folk rock",
			platform: "Deezer"
		}
	]
    status: "Updated"
}
    var updateResponse = recordSystem->updatingRec(updatedRecord);
    if (updateResponse is error) {
        log:printError("Error from System:");
    } else {
        io:println("Record updated succesfully");
    }

    // Find a record
    log:printInfo("Find existing order");
    var findRecord = recordSystem->Record("107");
    if (findRecord is error) {
        log:printError("Record does not exist!: \n");
    } else {  
        log:printInfo("Record is : " + output + "\n");
    }
}
