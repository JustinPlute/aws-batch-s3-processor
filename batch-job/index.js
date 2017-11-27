'use strict';

const AWS = require('aws-sdk');
const s3 = new AWS.S3();

const myBucket = process.env.MY_BUCKET;
const myKey = process.env.MY_KEY;
const params = { Bucket: myBucket, Key: myKey };

s3.getObject(params, function(err, data) {
  if (err) {
    console.log(err)
  } else {
    console.log("Successfully retrieved object");
    // DO STUFF with your uploaded file

    // data = {
    //     AcceptRanges: "bytes",
    //     ContentLength: 3191,
    //     ContentType: "image/jpeg",
    //     ETag: "\"6805f2cfc46c0f04559748bb039d69ae\"",
    //     LastModified: <Date Representation>,
    //     Metadata: {
    //     },
    //     TagCount: 2,
    //     VersionId: "null"
    // }
  }
});