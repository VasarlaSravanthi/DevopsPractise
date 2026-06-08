#!/bin/bash

AMI_ID="ami-0220d79f3f480ecf5"
zone_ID="Z087520515H5EQ1JOMP60"
Domian_Name="stringsnbeads.shop"

for instance in $@
do
    echo "Launching instance :: $instance"
    INSTANCE_ID=$( aws ec2 run-instances \
        --image-id ami-0220d79f3f480ecf5 \
        --instance-type t3.micro \
        --security-groups "Roboshop-Common" "roboshop-$instance" \
        --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value="roboshop-$instance"}]' \
        --query 'Instances[0].InstanceId' \
        --output text )I
        echo "InstanceID = $INSTANCE_ID"


    if [ $instance == "frontend" ]; then 

        IP=$(aws ec2 describe-instances --instance-ids $INSTANCE_ID \
        --query "Reservations[*].Instances[*].PublicIpAddress" \
            --output text
        )
        R53_Record="$Domain_Name"
    else 
    IP=$(aws ec2 describe-instances --instance-ids $INSTANCE_ID \
        --query "Reservations[*].Instances[*].PrivateIpAddress" \
            --output text
        )
        R53_Record="$instance.$Domain_Name"
    fi
    #### Updating R53 Record

    aws route53 change-resource-record-sets \
    --hosted-zone-id "'$zone_ID'" \
    --change-batch '
            {
            "Comment": "Updating DNS record to a new IP",
            "Changes": [
                    {
                        "Action": "UPSERT",
                        "ResourceRecordSet": 
                        {
                            "Name": "'$R53_Record'",
                            "Type": "A",
                            "TTL": 1,
                            "ResourceRecords": [
                                {
                                    "Value": "'$IP'"
                                }
                            ]
                         }
                    }
                 ]
            }
     '
done 
