echo CREATE ROLE ---------------------------------------
aws iam create-role --role-name StudentCICDServer2  --assume-role-policy-document file://./CICD-access-policy.json

echo ATTATCH ROLE POLICY -------------------------------
ARN="arn:aws:iam::aws:policy/AmazonEC2FullAccess"
aws iam attach-role-policy --role-name StudentCICDServer --policy-arn $ARN 

echo CREATE INSTANCE PROFILE ---------------------------
aws iam create-instance-profile --instance-profile-name CICDServer-Instance-Profile

echo ADD ROLE TO INSTANCE PROFILE ----------------------
aws iam add-role-to-instance-profile --role-name cicd --instance-profile-name CICDServer-Instance-Profile

echo ASSOCIATE IAM INSTANCE PROFILE --------------------
aws ec2 associate-iam-instance-profile --instance-id i-0de5f1753399aab72 --iam-instance-profile Name=CICDServer-Instance-Profile

