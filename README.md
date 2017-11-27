# AWS Batch Job S3 Processor

This repository is the source code for the following blog article, [AWS Batch to process S3 events](https://blog.justinplute.com/aws-batch-to-process-s3-events/).

The solution provided is for processing S3 events using AWS Batch as opposed to AWS Lambda if running work longer than 5 minutes. Currently, AWS Lambda has a limitation of only being able to run for a maximum of 5 minutes before timing out.

**List of different project components:**

* An **S3 Bucket** to upload files and trigger S3 event notifications
* A **Trigger Lambda** that listens to S3 events (e.g., upload of a file to the `uploads` directory in our S3 bucket). Upon these events, the invoked Lambda will trigger the AWS Batch Job to run for any processing that needs to last longer than 5 minutes.
* An **AWS Batch Job** that grabs the newly uploaded S3 file and then exits. Instead of exiting, however, you can do long-running work.
* An **AWS ECR** repository for the Docker container used in the AWS Batch compute environment

## Prequisites

If this is the first time using AWS Batch in an AWS account, go to the web console and create a temporary AWS Batch compute environment. This will create the `arn:aws:iam::${AWS::AccountId}:role/service-role/AWSBatchServiceRole` IAM role that is used in the CloudFormation stack provided. You can then remove the temporary compute environment. This said, you can also create your own IAM service role in the CloudFormation template.

## Deploying Docker

**NOTE:** You can use this project locally without having to use Docker at all. But if you want to finally push to the AWS ECR docker repository for AWS Batch, then you'll need to follow these steps.

First, you'll need to install [Docker](https://docs.docker.com/engine/installation/). And then you can build and deploy:

```bash
# navigage into batch directory of project
$ cd batch-job
# builds docker image and deploy to AWS ECR
$ ./deploy-docker.sh
```
**NOTE:** Remember to change the `ACCOUNT` variable in the `deploy_docker.sh` script with your own AWS Account Id.

## Contributing

Please [create a new GitHub issue](https://github.com/rplute/aws-batch-job-s3-processor/issues/new) for any feature requests, bugs, or documentation improvements.

Where possible, please also [submit a pull request](https://help.github.com/articles/creating-a-pull-request-from-a-fork/) for the change.
