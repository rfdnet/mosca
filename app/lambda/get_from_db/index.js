// Load the AWS SDK for Node.js
const AWS = require("aws-sdk");
// Create DynamoDB document client
let dynamodb = new AWS.DynamoDB.DocumentClient({ apiVersion: "2012-08-10" });


// Define handler function, the entry point to our code for the Lambda service
// We receive the object that triggers the function as a parameter
exports.handler = function(event, context, callback){
   
    // Create JSON object with parameters for DynamoDB and store in a variable
	let id = event.firstName;
	let surname = event.lastName; 
    let params = {
        TableName:'HelloWorldDatabase',
        Key: {
           "ID": id,
           "Surname": surname
        }
    };
    // Using await, make sure object writes to DynamoDB table before continuing execution
    dynamodb.get(params, function (err, data) {
      if (err) {
        console.log("Error", err);
      } else {
        console.log("Success", data);
        
      }
       
    callback(null, JSON.stringify(data));
    });
    
   
    
}
;