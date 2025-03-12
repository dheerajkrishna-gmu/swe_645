URLs:
S3 bucket:- http://swe-645-g01448319.s3-website-us-east-1.amazonaws.com
EC2 instance:- http://54.161.234.214/Assignment-1/survey.html

S3 Bucket Instructions

-> Navigate to the S3 service from the AWS console and create a bucket by giving it a bucket name.

1. Enable Static Hosting:

->Go to the "Properties" section of the bucket.
->Edit the static hosting properties to enable static hosting.
->Select the hosting type "Host a static website".
->Specify the index document (default/home page of the website) and the error document (error page of the website).

2. Update Permissions:

->Navigate to the "Permissions" section of the bucket.
->Uncheck "Block all public access".
->Edit the bucket policy with the following JSON to enable public read access to the website:

json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::Bucket-Name/*"
            ]
        }
    ]
}

3. Upload Static Content:

->Upload your static HTML content as objects to the bucket to host them using S3's static hosting.



EC2 instructions:

Navigate to the EC2 Service:

->Open the AWS Management Console and navigate to the EC2 service.
->Click on the "Launch Instance" button to start the process.

Configure Your Instance:

->Enter the name for your web server.
->Select the appropriate Amazon Machine Image (AMI) and instance type based on your operating system and physical resource requirements.
->Generate a new key pair, which will be used later as an authentication mechanism to securely connect to the EC2 instance.
->Configure the network settings to allow SSH, HTTP, and HTTPS traffic from the internet.
->Choose the storage options for your instance.

Launch Your Instance:

->Click on the "Launch Instance" button. AWS will create the instance, and it will be assigned both a public and private IP address.

Connecting to Your EC2 Instance:

->In the EC2 dashboard, select your instance and click the "Connect" button.
->To connect via a UI, you can download a SSH client and use the .pem private key file to connect to the instance as an authorized user.

->Once connected, switch to the root user by typing:
"sudo su"

Installing and running a Web Server:

->On your EC2 instance, run the following command to install the Apache web server:

"yum install httpd -y"

->Change the directory to the web server’s root directory where HTML files are served:

"cd /var/www/html"

->Use an SSH client like FileZilla to upload your HTML documents to the /var/www/html directory.
->Start the Apache web server with the following command:

"service httpd start"

Open a Web Browser:

Enter the public IP address of your EC2 instance in the address bar of any web browser. You should see your uploaded HTML document displayed.
