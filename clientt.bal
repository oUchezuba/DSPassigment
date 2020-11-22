import ballerina/log;
import ballerina/grpc;
import ballerina/crypto;
import ballerina/encoding;

    //used to update an existing record
	log:printInfo("--------------------Update an existing record--------------------");
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
        string output;
        grpc:Headers recordHeaders;
        
    }