import ballerina/log;
import ballerina/grpc;
import ballerina/crypto;
import ballerina/encoding;

    // This is client implementation for unary blocking scenario
    public function main(string... args) {
    // Client endpoint configuration
    recordManager recordSystem = new("http://localhost:9090");

    // Create new record
    log:printInfo("Create new Record");
    newRec writeNew = {
	        date: "22/10/2020 ",
	        artists: [
		{
			recVersion : "1.2",
            id: "123456",
			name: "Wololo Mingota",
			member: yes
		},
		{
			name: "Mingx Lolita",
			member: yes
		},
		{
			name: "Paul Walker",
			member: no
		}
	],
	band: "Hello Pubs",
	songs: [
		{
			title: "My Lonely Life",
			genre: "Jazz",
			platform: "Spotify"
		}
	]
	};
	
	// Update a record
    log:printInfo("Update existing record");
    updatedRecordInfo updatedRecord = {
	        date: "22/10/2020",
	        artists: [
		{
			recVersion : "1.2"
            id: "123456"
			name: "Wololo Mingota",
			member: yes
		},
		{
			name: "Mingx Lolita",
			member: yes
		},
		{
			name: "Paul Walker",
			member: no
		}
	],
	band: "Hello Pubs",
	songs: [
		{
			title: "My Lonely Life",
			genre: "Jazz",
			platform: "Spotify"
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
    var findRecord = recordSystem->Record("1.2");
    if (findRecord is error) {
        log:printError("Record does not exist!: \n");
    } else {  
        log:printInfo("Record is : " + output + "\n");
    }
}
