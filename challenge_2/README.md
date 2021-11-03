Query the meta data of an instance within AWS:

The script will query the metadata of an EC2 Instance with AWS and will provide JSON formatted output. The code also allows the retreival of value against provided key.

Approach:

Used AWS CLI to fetch the metadata of an instance. The Key retrieval part has been done through script.

-Pre-requisites:

1. AWS CLI 
2. Python 3.10

Below are the execution steps:

1. Fetch the metadata of an EC2 instance by passing the Instance Id and return JSON output

    aws ec2 describe-instances --instance-ids {instance-id} > path/ec2_meta_data.json
    
2. Go to challenge_2 folder and execute the script with name query_ec2_metadata.py by passing the Key to be retrieved.

    
