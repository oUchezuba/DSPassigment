import ballerina/config;
import ballerina/crypto;
import ballerina/io;
import ballerina/lang.'string;
import ballerina/math;

//code for hash function using md5
public function main() returns error? {
       string input = ""; //replace string with record.
    byte[] inputArr = input.toBytes();

    byte[] output = crypto:hashMd5(inputArr);
    io:println("Hex encoded hash with MD5: " + output.toBase16());
}
