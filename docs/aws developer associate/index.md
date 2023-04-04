---
hide:
 - navigation
---

 # AWS Developer Associate

## Elastic BeanStalk
* Platoform as a service
* Not Recommended for Production applications - for Enterprise and large companies
* Powered by CloudFormation template
* Multiple resources are created
	* Elastic Load Balancer
	* Autoscaling groups
	* RDS Database
	* EC2 Instance
	* Monitoring - Blue/Green Deployment methodologies
	* Can run dockerized environments
### Supported languages
* Ruby - Rails
* Python - Django
* PHP - Laravel
* Java - Spring
* Tomcat
* NodeJS
* Docker
* ASP.NET
### Web vs Worker Environment
* Web
	* Creates ASG
	* Types
		* Single Instance Env
			* Uses ASG with Desired capacity to one
		* Load Balanced Env
			* Uses ELB
			* Designed to scale
* Worker
	* Creates ASG
	* Creates SQS queue
	* Installs SQSd daemon on the ec2 instance
	* Creates CloudWatch Alarm to dynamically scale instances based on health
## Number of instances environment
* Single-instance Env
	* Uses ASG with capacity set to one
	* No ELB to save on cost
	* Public IP address to route traffic to server
* Load Balanced Env
	* Uses ASG set to scale
	* Uses and ELB
	* Designed to scale

| Deployment Policy | Load Balanced Env | Single Instance Env | 
| ----------- | ----------- | ----------- |
| All at once | Yes         | Yes |
| Rolling     | Yes         | No |
| Rolling with additional batch    | Yes         | No |
| Immutable    | Yes         | Yes |

### Deployments

#### All at once deployment
1. Deploys the new app version to all instances at the same time
2. Takes all instances out of service while the deployment lasts
3. Servers become available again
* Fastest deployment method
* Most dangerous deployment method
* In case of failure, all changes need to be rolled-back by redeploying the original version to all instances
#### Rolling
1. Deploys the new app version to a batch of instances at a time
2. Takes batch's instances out of service while the deployment processes
3. Reattaches updated instances
4. Goes to the next batch, taking them out of service
5. Reattaches those instances, repeat
* In case of Failure, we need to perform an additional rolling update in order to roll back the changes
#### Rolling with additional batch
1. Launch new isntance that will be used to replace a batch
2. Deploy update app version to new batch
3. Attach the new batch and terminate the existing batch
* Rolling with additional batch ensure capacity is never reduces - important for applications where reduction in capacity could cause availability issues
* In case of failure - we need to perform an additional rolling update to roll back the changes
#### Immutable
1. Create a new ASG group with EC2 instances
2. Deploy the updated version of the app on the new ec2 instances
3. Point the ELB to the new ASG and delete the old ASG, which will terminate the old instances
* Safest way to deploy critical applications
* In case of failure - we just need to terminate new instances since existing instances still remain
#### Summary
![[Pasted image 20230201120306.png]]


### Configuration files
* Lets developers customize Elastic Beanstalk environment using these files
* .ebextension is a hidden folder at a root of project which contains the config files
* .config is an extension for the config files which need to be stored in the .ebextension folder
* Dockerrun.aws.json - similar to ECS Task Definition Files - defines mutli-container configuration
* With config files, we can configure
	* Option Settings
	* Linix/Windows Server Congifuration
	* Custom Resources
### Env Manifest
* Used for overriding defaults of Elastic BeanStalk environments
* We cna configure for example
	* Name of the environment
	* Chose the stack solution
	* Assiciating the environment links
	* Default Configuration of Services
### Linux Server Configuration
* Packages - Lets download and install prepacked applications and components
* Unix Groups
* Users
* Files to create on e2 instance - inline of from URL
* Commands - execute commands before app is setup
* Services - Define what services should be started or stopped when the intance is launched
* Container Commands - execute commands that affect application source code - not docker commands
### EB CLI
* The CLI is hosted on GitHub 
* Commands
	* eb init - configure project directory and eb cli
	* eb create - create first env
	* eb status - current status of env
	* eb health - health info about the instances
	* eb events - see a list of events ouputs by EB
	* eb logs - pull logs from an instance
	* eb open - open env website in browser
	* eb deploy - once env is running, deploy an update
	* eb config - take a look at the configuration option available for running env
	* eb terminate - delete environment
### Custom Images
* When  EB environment is created, we can specify an AMI to use instead of standard EB AMI
* A custom AMI can improve provisioning times when instances are launched in environment
* Handy, if we need to install a lot of software
### Configuring RDS
* Database can be added inside or outside for EB environment
* Inside EB ENV
	* Intended generally for development envs
	* Create a database withing EB env
	* When env is terminated, RDS is also terminated 
* Outside EB ENV
	* Intended for production envs
	* Create database from RDS separate for EB
	* When EB ENV is terminated, the database still remains 

## Elastic Container Service
* Fully-managed docker container registry
* Makes it easy to store, manage and deploy container images
* Hihgly secure

## Elastic Container Service
* Fully managed container orchestration service
* Highly secure, reliable, and scalable way to run containers
* Components
	* Cluster - multiple ec2 instance which will house docker containers
	* Task Definition - A JSON file that defines the configuration of container to run
	* Task - launches containers defined in task definition
	* Service - ensure tasks remaining running - web-app
	* Container Agent - binary on each ec2 instance which monitors, start and stop tasks
### Cluster Creation
* Use Spot or on-demand
* EC2 Instance Type
* Number of instances
* EBS Storage Volume
* EC2 can be Amazon Linuc 2 or 1
* Choose VPC or create new VPC
* Assign an IAM Role
* Option to turn on CloudWatch Container insights
### Task definition file
* Can define multiple containers within a task definition
* Images can be provided either via ECR or docker hub
* Must have at least one essential container - if this one is stopped, all other containers will be stopped
* AWS has wizard to create Task Definitions instead of having to create a file by hand

### Fargate
* Create an empty ECS cluster - no ec2 provisioned and then launch tasks as Fargate
* No longer have to provision, configure and scale clusters of ec2 to run containers
* Charged for at least one minute and after its by second
* Pay based on duration and consumption
### Configuring Fargate Tasks
* Define memory and vCPU in Task Definition
* Add containers and allocate the memory and vCPU for required for each
* When a task is run, you can choose in which VPC to run it in
* Able to apply securiy group to a task
* Apply IAM role to the task
* We are able to apply SG and IAM role for both ECS and Fargate Tasks and Services

### Fargate vs Lambda
* Fargate
	* Cold starts - yes, shorter
	* Duration - as long as wanted
	* Memory - up to 30 GB
	* Containers - provide our own containers
	* Integration - more manual labour
	* Pricing - pay at least 1 min and every additional second
* Lambda
	* Cold starts - yes
	* Duration - 15 minutes max
	* Memory - up to 3 GB
	* Containers - Limited to stanarized containers
	* Integration - Seamlessly integrates with other serverless services
	* Pricing - pay per 100ms

## AWS X-Ray
* Helps developers analyze and debug applications utilizing microservice architecture
* Microservice architecture
	* Organizational and architectural approach to software development
	* Software is composed of small independent services that communicate over well-defined APIs
	* Makes applications easier to scale and faster to develop
	* Enables innovations and accelererating time-to-market for new features 
	* Services are owned by small, self-contained teams 
* Is a distributed tracing system - method to profile and monitor apps, especially those build using microservices architecture
* Distributed tracing helps where failures occur and what courses poor performance
* Performance monitoring - monitoring and management of performance and availability of software apps. Strived to detect and diagnose complex application performance problems to maintain an expected level of service
* Third-party service - Cloud monitoring / Application Performance Monitoring Services
	* DataDog
	* New Relic
	* SignalFX
	* Lumigo
* Collects data about requests that application serves
* View, filter collected data to identify issues and avenues for optimization
* For any traced request to application, we can see detailed information about
	* Request and response
	* Calls of applications to downstream AWS resources, microservices and HTTP web APIs
### Anatomy
![[Pasted image 20230201145515.png]]
* The SDK provides
	* Interceptors to add to code to trace incoming HTTP requests
	* Client Handlers to instrument AWS SDK clients that application uses to call other AWS services
	* HTTP Client to use to instrument calls to other internal and external HTTP web services
	* Also supports instrumenting calls to SQL database
	* Automatic AWS SDK client instrumentation 
* Intrumenting - ability to monitor or emasure the level of a product's performance to diagnose erros and to write trace information
### X-Ray Daemon
* Instead of sending trace data directly to X-Ray, the SDK sends JSON segment documents to a dameon process listening fo UDP traffic
* The X-Ray dameon buffers segments ina queue and uploads them to X-Ray in batches
* Then the batch information is sent to X-RAY API
* The damon us available for Linux, Windows and Mac and is included on Elastic Beanstalk and Lambda platforms
* X-Ray uses trace data from AWS resources that power cloud appliucations to generate a detailed service graph
### X-Ray Concepts
* AWS C-Ray receives data from services as segments
* X-Ray then groups segments that have a common requests into traces
* X-Ray processes the traces to generate a service graph that provides a visual representation of app
#### Service Graph
* Shows the client the architecture's front-end and back-end services
* The service graph is used to solve and improve the performance by identifying
	* Bottlenecks
	* Latency spikes
	* Other issues
#### Segments
* Compute resources running application logic sends data about their work as segments
* Information in the segment
	* Host - hostname, alias or IP address
	* Request - method, cliend, address, path, user agent
	* Response - status, content
	* Work done - start and end times, subsegments
	* Issues that occur - errors, faults and exceptions
![[Pasted image 20230201164805.png]]
#### Subsegments
* More granular timing information and detials about downstream calls that app made to fulfill the original request
* We can define arbitrary subsegments to instrument specific function or lines of code in application
* Can contain additional details about 
	* Call to AWS service
	* External HTTP API
	* SQL Database
	* Arbitrary details
![[Pasted image 20230201165117.png]]
#### Traces
* Trace collects all segments generated by single request
* Trace ID tracks the path of a request through our application
* The first supported service that the HTTP request interacts with adds a trace ID header to the request and propagates it downstream to track the latency, disposition, and other request data
#### Sampling
* X-Ray SDK uses sampling algorithm to determine which requests get traces
* By default, the X-Ray SDK records the first request each second, and 5% of any additional requests - to avoid incurring service charges
* We can modify the default sampling rule and add additional sampling rules
#### Trace Header
* All requests are traces up to a configurable minimum
* After reaching the minimum, a percentage of requests are traced to avoid unnecessary cost
* The sampling decision and trace ID are added to HTTP requests in tracing headers named X-Amzn-Trace-Id
* The first X-Ray-integrated service that the reqests hits adds a tracing header
* A trace header can include a parent if the request originated from an instrumented application
#### Filter Expressions
* With sampling, a complex application generated a lot of data
* Filter expression can be used to narrow downs specifc paths or users
#### Groups
* We can assign a filter expression to a group so we can filter
* We can call the group by name or by Amazon Resource Name, to generate its own service graph, trace summaries and Amazon CloudWatch Metrics
* Can result in merged graph of the new and old expression
#### Annotation and Metadata
* Add information to the segment document as annotations and metadata
* Annotations and metedata aggregated at the trace level, and can be added to any segment/subsegment
* Annotations are key-value pairs that are indexed for use with filter expressions. X-Ray indexed up to 50 annotations per trace
* Metadata are key-value pairs that are not indexed. Values can be of any type, including objects and lists
* Annotations and metadata can be viewed in the X-Ray console in the subsequent segment/subsegment 
#### Erros, Faults and Exceptions
* When an excpetion occurs whie the app is serving an intrumented request, the X-Ray SDK records exception details and the stack trace
* Error - Client Errors - 400/4xx errors
* Fault - Server Faults - 500/5xx errors
* Throttle - Throttling errors - 429 - too many requests
* Exceptions can be viewed under segment details in the X-Ray console
#### AWS Service Integrations
* Lambda
* API Gateway
* Elastic Load balancer
* Simple Notification Service
* Simple Queue Service
* Amazon EC2
* Elastic Load Balancer
* ECS Fargate
* AWS COnfig
* Elastic Beanstalk
* CloudTrail
* CloudWatch
* App Mesh
#### Supported Languages
* Go
* NodeJS
* Python
* .NET
* Ruby
* PHP
* Java

## ACM
* Amazon Ceritifcate Manager
* Used to provision, manage and deploy public and private SSL/TLS certificates for use with AWS services
* Handles the complexity of creating and managing public SSL/TLS certificates for AWS based websites and applications
* Types
	* Public - certofocates provided by ACM - free
	* Private - certificates to import - 400$ a month
* Can handle multipole subdomains and wildcard domains
* Can be attached to different AWS resources
	* Elastic Load Balancer
	* CloudFront
	* API Gateway
	* Elastic Beanstalk - through ELB

## Route53
* Highly available and scalable cloud Domain Name System
* Register and manage domains, create DNS routing rules, e.g. failovers
* Create various records sets on a domain
* Implement complex traffi flow
* Continously monitor records via health checks
* Resolve VPC's outside of AWS
### Record Sets
* Allows to create record sets which allows us to point our naked domain and subdomain via domain records
* For example, we can send out www sundomain using A record to point to a specific IP address
### Alias Record
* AWS had their own special Alias Record which extends DNS functionality
* It will route traffic to specific AWS resources
* Alias records are smart and can detect change of IP address
### Routing Policies
* Simple Routing policy
	* Default
	* Provide single or multiple and route53 will direct traffic to one of them randomly
* Weighted Routing Policy
	* Split-up traffic based on different weight assigned
	* Allows to send certain percentage of everall traffic to one server
* Latency Based Routing
	* Direct traffic based on region and proximity to the called server
* Failover Routing Policy
	* Allows to create active/passive setups in situations where we want direct traffic to second location if the first location fails
	* Uses healthcheck
* Geolocation Routing Policy
	* Allows to direct traffic based on geographical location of the client
* Geoproximity Routing Policy
	* Allows to direct traffic based on geographical location of the users via the bias value
	* Must use Route53 Traffic Flow for visualization
* Multi-Value Answer Policies
	* Behaves like simple Routing Policy but uses healtchecks to determin the final destination
### Health Checks
* Every 30 seconds by default
* Can be reduced to 10s
* CloudWatch Alarm can be created to alert os unhealthy status
* Health check can monitor other healthchecks to create a chain of reactions
* Up to 50 health checks for AWS endpoint
### Resolver
* Regional service that lets route DNS queries between VPC and network
* Used for Hybrid Environments

## Command Line Interface - CLI
* Let's us interact with AWS from anywhere by simply using a comand line
* Installed using Python script

## Software Development Kit
* Allows developers to control AWS resources with programming languages
* Set of tools and libraries used to create applications for specific software package
* Langauges
	* C++
	* Go
	* Java
	* Javascript
	* .NET
	* NodeJs
	* PHP
	* Python
	* Ruby

## Programmatic Access
* Needs to be enabled when creating a user so we can authenticate to AWS servers

## Key Management Service - KMS
* Create and manage encryption keys
* Compaptible with variety of AWS servuces and in apps
* Makes it easy to create, control and rotate encrytpion keys used to encrypt data on AWS
* KMS is multi-tenant Hardware Security Module - HSM
* HSM - Hardware Security Module
	* Hardware that is specialized for storing encryption keys
	* Its designed to be tamper-proof
	* It stores keys in-memory, so they are never written to disk
* Multi-tenant
	* Multiple customer are utilizin the same piece of hardware
	* Customers are isolated from each other virtually
	* If one customer used the entire piece of Hardware, that would be called single-tenant - Cloud HSM
* CloudHSM
	* Single tenant HSM which gives full control
	* Dedicated HSM that meed strict compliance FIPS 140-2 Level 3
* Encryption - process of encoding a message or information in such a way that only authorized parties can access it and those who are not authorized cannot
* Cryptographic keys - string of data that is used to lock or unlock crypthographic functions, including authentication and encryption
* Master key - stored in secure hardware. The encrypt all other keuys on a system
* Envelope Encryption - key used to encrypt another key
### Customer Managed Key
* Primary resource that AWS KMS is managing
* It is a logical representation of a master key
* CMK includes metadataKey ID
	* Creation date
	* Description
	* Key state
* KMS supports symmetric and asymmetric CMKs
![[Pasted image 20230201194325.png]]
### KMS - AWS CLI
* Many actions can be performed through AWS CLI
* It is worth mentioning some of the API commands
	* aws kms create-key - creates a unique customer managed master key
	* aws kms encrypt - enrypt plaintext by using customer master key
	* aws kms decrypt - decrypts ciphertext that was encrypted by AWS KMS
	* aws kms re-encrypt - decrypts ciphertext and then re-encrypts it whithin KMS
	* aws kms enable-key-rotation  - enables automatic rotation of the key material 

## Amazon Cognito
* Congito User Pools - User directory wth authentication to IpD to grant access to apps
* Cognito Identity Pools - Provide temporary crednetials for users to access AWS services
* Cognito Sync - Syncs user data and preferences across all devices
* Web Identity Federation - exchange an identity and security information between an identity provider and an application
* Identity Provider - Trusted provider of user identity that lets us authenticate to access other services. Could be: Facebook, Amazon, Google, LinkedIn
* Types of Identity Providers - The technology that is behind the Identity Providers - SAML, OpenID Oauth
### User Pools
* Directory of users used to manage web and mobile apps such as
	* Sign-up
	* Sign-in
	* Account Recovery
	* Account Confirmation
* Allows users to sign-in to teh User Pool or using Web Identity Federation
* Uses AWS Cognito as the identity provider broker between AWS and the identity provider
* Successful user authentication generates a JSON Web Token - JWT
* User Pools can be thought of as the account used to access teh system - e.g. email address and password
* Choose what attributes user needs to input as main attribute
* Choose password requirements
* Apply MFA
* Restrict whether users are allowed to sign-up on their own or need admin verification
### Identity Pools 
* Provide temporary AWS credentials to access services e.g. S3, DynamoDB
* Identity pools can be thought of as the actual mechanism authorizing access to the AWS resources 
### Cognito Sync
* Sync user data and preferences across devices with one line of code
* Uses SNS to send notifications to all user devices when data in the cloud changes

## Simple Notification Service - SNS
* Subscibe and send notifications via text messages, email, webhooks, lambdas, SQS and mobile notifications
* Leverages pub-sub
* SNS is highly available, durable, secure, fully managed pub/sub messaging service
* Enables to decouple microservices, distributed systems and serverless applications
* Publishers push events to SNS Topic
* Subscribers subscribe to SNS Topic to have events pushed to them
* Messages published to SNS are stored redundantly across multiple Availability Zones - AZs
#### Topics
* Allow to group multiple sibscriptions together
* A topic is able to deliver multiple protocols at once - email, text message, http/s
* When topics deliver messages to subscribers, it will automatically ofmrat the message according to the subscriber's protocol
* Topics can be encrypted via KMS
#### Subscriptions
* To receive messages from a topic, the app needs to create a subscription
* Protocols
	* HTTP / HTTPS
	* Email
	* Amazon SQS
	* AWS Lambda
	* SMS
	* Platform application endpoints
	* Amazon SQS
#### Application As Subscriber
* Send push notification messages directly to apps on mobile devices
* Push notification messages sent to a mobile endpoint can appear in the mobile app as message alerts, badge updates or even sound effects
* Types
	* ADM - Amazon Device Messaging
	* APNs - Apple Push Notification
	* FCM - Firebase Cloud Messaging
	* WNS - Windows Push NOtification Services

## Simple Queue Service - SQS
* Fully managed queuin service that ebables to decouple and scale microservices, distributed systems and serverless applications
* Use to provide asynchrounous communication and decouple processes via messages / events from a sender and receiver
* Used for applications integration
* Queue is a temporary repository for messages that are awaiting processing
* It is pull based - not push based
### SQS Limits
* Message Size
	* Size of message can be between 1 byte and 256KB
	* Java Extended Client Libary
		* Let's to send messages from 256KB to 2GB in size
		* The message will be stored in S3 and library will reference the S3 object
* Message Retention
	* How long SQS will hold onto a message in the queue before dropping it from the queue
	* Message retention can be adjusted from a minimum one minute to a max of 14 days
### Queue Types
* Standard Queues
	* Allows to a nearly unlimited number of transactions per second
	* Guarantees that a message will be delivered at least once
	* More than one copy of message could be potentionally delivered out of order
	* Provides best-effort ordering that helps ensure a message is generally delivered in the same order that it was sent
* FIFO Queues
	* Support multiple ordered message groups within a single queue
	* Limited to 300 transactions per second
	* SQS FIFO queues have all the same capabilities of a standard queue
### SQS Visibility Timeout
* Period of time that messages are invisible in the SQS queue after a reader picks up that message
* Messages will be deleted from the queue after a job has processed - before the visibility timeout expires
* If a job is not processed before the visibility timeout period, the message will become visible again and another reader will process it
* This can result in the same message being delivered twice
### Short Polling vs Long Polling
* Short Polling
	* Is method in which we retrieve messages from the queues
	* returns messages immediately, even if the message queue being polled is empty
	* When we need message right away, shortpolling is what should be used
* Long Polling
	* Waits until message arrives in the queue, or the long poll timout expires
	* Long polling makes it inexpensive to retrieve messages from your queue as soon as the messages are available
	* Using long polling will reduce the cost because we can reduce the number of empty receives

## Kinesis
* Scalable and durable real-time data straming service to ingest and analize data inr eal-time from multiple source
* Fully managed solution for collecting, processing and analyzing streaming data in the cloud
* Examples
	* Stock Prices
	* Game Data
	* Social Network Data
	* Geospatial Data
	* Click Stream Data
### Kinesis Data Streams
* Producers produce data and send it to Kinesis Data Streams
* Then data is ingested
* And consumers consume the data stream
* Pay for running shard
* Can have multiple consumers, must manually configure consumers
* Data can be persisted from 24 hours - default to 168 hours before it disappears
### Kinesis Data Firehose
* Simpler to use than Kinesis Data Stream
* Has producers
* When data is consumed, it immidiatelly dissapear from the queue
* Can have only few consumers
	* Redshift
	* Elasticsearch
	* Splunk
	* S3
* Pay only for data ingested
### Kinesis Video Streams
* Ingest video and audio encoded data from various devices and or service
* Output video data to ML or video processing services
	* SageMaker
	* Rekognition
### Kinesis Data Analytics
* Takes an input stream and pass to output stream
* Let's run custom SQL
* Real-time analytics of the data in the stream
* Can be more expensive

## SSM Parameter Store
* Secure hierarchial storage for configuration data management and secrets management
* Store data such as passwords, database strings, license codes as parameter values
* Store configuration data and secure string sin hierarchies and track versions
* Can be encrypted using KMS
* Parameter Tiers
	* Standard
		* Number of params / region - 10000
		* Max size of param value - 4 KB
		* Parameter Policies - No
		* Cost - Free
	* Advanced
		* Number of params / region - 100000
		* Max size of param value - 8 KB
		* Parameter Policies - Yes
		* Cost - 0.05$ per parameter / month
* Standard tier can be changed to advanced anytime, but the advanced parameter cannot be reverted
* Reverting an advanced parameter to a standard parameter would result in data loss, because the system would truncate the size of the parameter from 8KB to 4KB
### Parameter Policies
* Helpful in forcing to update or delete passwords
* Using asynchronous, periodic scans - we don't need to perform additional actions to enforce the policy
* Can assign multiple policies to a parameter
* Policies 
	* Expiration - policy deletes the parameter after a specified date and time
	* ExpirationNotification - policy that triggers an event in Amazon CloudWatch events that notifies about the upcoming expiration
	* NoChangeNotification - triggers an event in CloudWatch if parameter has not been modified for a specific period of time

## Secrets Manager
* Needed to access applications and services 
* Easily rotate, manage and retrieve database credentials, API keys and other secrets throughout their lifecycle
* Mostly used to store and automatically rotate database credentials - RDS, Redshift, DocumentDB, Other Databases
* Enforces encryption at-rest by using KMS
* Pricing
	* 0.40$ per secret per month
	* 0.05$ per 10000 API calls
* Automatic Rotation
	* Can be set for any database credentials
* CLI Commands
	* aws secretmanager describe-secret --secret-id halabala/halabala - shows metadata about the secret
	* aws secretmanager get-secret-value --secret-id halabala/halabala --version-stage - returns value of the secret

## DynamoDB
* Key-value NoSQL database
* Guarantees consistent reads at any scale
* Document Store - form of data which has nested data structure
* Features
	* Fully-managed
	* Multi-region
	* Multi-master
	* Dusrable Database
	* Built-in security
	* Backup and restore
	* In-memory caching
* Provides
	* Eventual Consistent Reads
	* Strongly Consistent Reads
* We can specify read and write capacity we need
* The data is stored on SSD storage spread across 3 different AZs
* Table - contains rows and columns
* Items - rows of data
* Attributes - the columns of data
* Keys - identifying names of the data
* Value - actual data itslef
### Read Consistency
* When data is updated, DynamoDB needs to write updates to all copies
* It is possible for data to be insocistent when reading from a copy which has yet to be updated
* Ability to read consistency in DynamoDB to meet needs
* Eventual Consistent Reads
	* May return incosistent read after write operation
	* Reads are fast but there is no guarantee of consistent
	* Copues of data become generally consistent within a second
* Strongly Consistent Reads
	* Returns read after write operation only after all copies are consistent
	* Guarantee of consistency
	* May result in slower reads
	* All copes of data will be consistent within a second
### Partitions
* Allocation of storage for table
* Backed by solid state drives
* Automatically repliacated across multiple AZs within an AWS Region
* Slicing table into smalle chunks of data to speed upi reads for very large tables
* DynamoDB automatically creates partitions as the data grows
* Starts with single partition
	* for every 10GB of data
	* When RCUs or WCUs for a single partition is exceeded - each partition has maximum of 3000 Read Capacity Units and 1000 Write Capacity Units
### Primary Key
* When table is created, a primary key needs to be defined
* Primary key determines where and how data is stored in partitions
* Cannot be changed after creation
* Simple Key
	* Using only partition key
	* Internal Hash Functions decides to which partition to write data
* Composite Primary Key
	* Using both partitiona and sort key
	* The combination of partition and sort key needs to be unique
	* Internal Hash Function decides to which partition to write data
### Composite Primary Key
* Partition + Sort Key = composite primary key - the combination needs to be unique
### Primary Key
* Simple
	* Only partition key
	* No two items can have the same partition key
* Composite
	* Partition + Sort Key
	* Two items can have the same partition key, but partition and sort key combined must be unique
* The keys needs tobe as distinct (unique) as possible
* The key should evenly divide data
### Query
* Allow to find items in a table based on primary key values
* Query any table or secondary index that has a composite primary key
* By default, query reads as evenrually consistent, if there is a need for strongly consistent, flag called ConsistentRead needs to be set to True (SDK or CLI)
* By default all attributes are retrieved for items
* Specific attributes can be returned by using ProjectExpression
* By default, the data is sorted ascending
### Scans
* Scans through all items and return one or more items through filters
* By default returns all attributes for items
* Scans can be performed on tables and secondary indexes
* Can return attributes by using ProjectExpression
* Scan operations are sequential, but can be speed up through parallel scans using Segments and Total Segments parameters
### Provisioned Capacity
* Provisioned Throughput Capacity
* The maximum amount of capacity the appliucation is allowed to read or write per second from table or index
* Measured in capacity units
	* RCUs - Read Capacity Units
	* WCUs - Write Capacity Units
* We can set autoscaling to scale up and down based on utilization
* If we go beyond capacity, we'll get ProvisionedThroughputExceededException - known as throttling
* Throhttling - requests will be dropped
### On-Demand Capacity
* Pay per request
* We can pay only for what we use
* Good for 
	* New tables unknown workloads
	* Unpredictable application workloads
	* Ease of paying for only what is used
* Thoughput is limited by the default upper limit for a table
	* 40 000 RCUs
	* 40 000 WCUs
### Calculating Reads
* A read unit represents
	* One strongly consistent read per second
	* Two eventually consistent reads per second
	* For an item up to 4 KB in size
*  How to calculate RCUs for strong consistent reads
	1. Round data up to nearest 4
	2. Divide data by 4
	3. Times by number of reads
*   How to calculate RCUs for eventually consistent reads
	1. Round data up to nearest 4
	2. Divide the data by 4
	3. Times by number of reads
	4. Divide final number by 2
	5. Round up to the nearest whole number
### Calculating Writes
* A write capacity unit represents
	* One write per second
	* For an item up to 1 KB
* How to calculate
	1. Round data up to nearest 1
	2. Times by number of writes
### Global Tables
* Fully managed solution for deploying a multi-region, multi-master database, without having to build and maintain our own replication solution
* To create global tables
	* KMS CMK need to be used
	* Streams need to be enabled
	* Stream Type of New and Old Image need to be set
### Transactions
* Represents change will occur to the database, if any dependent conditions fail than a transiction will rollback as if the database change never occured
* Are ACID
	* Atomicity
	* Consistency
	* Isolation
	* Durability
* Offers ability to perform transactions at no additional cost using the TransactWriteItems and TransactGetItems operations
* DynamoDB allow for all-or-nothing changes to multitple items both withinj and across tables
* DynamoDB performs two underlying reads or writes of every item in the transaction
	* One to prepare the transaction
	* One to commit the transaction
* These two underlying read/write operations are visible in Amazon CloudWatch metrics
* Use condition check with DynamoDB transactions to do preconditional check - check that an item exists or to check the condition of specific attributes of the item
### Time-To-Live
* Allows for items to expire at a given time
* Great for keeping databases small and manageable and suited for temporary continous data
	* Session data
	* Event logs
	* Usage patters
* Put attribute name which will have a string in DateTime format that will detemine when this record will be deleted
* The attribute value needs to be formated to datetime string in Epoch format
### Streams
* Can be enabled for DynamoDB table
* Used for capturing modification to data items, so we can react to those chagnes
* When an Insert, Update, Delete occurs, the change will be captured and sent to Lambda function
* Changes are sent in batches
* Sent in near real-time
* Each Stream record appears exactly once in the stream
* For each item that is modified, the stream records appear in the same sequence as the actual modification
### Errors
* ThrottlingException - Rate requests exceeds the allowed throughput. This exception might be returned if operations CreateTablem UpdateTable, DeleteTable are performed too rapidly
* ProvisionedThoughtputExceededException - exceeded maximum allowed provisioned thoughtput for a table or for one or more global secondary indexes
### Secondary Indexes
* Copy of a selected columnd of data in a database which is used to quickly sort
* Two types
	* LSI - Local Secondary Index
		* Can provide strong consistency
		* Scoped to a base table partition
		* Has the same partition key value
		* Total size indexed items cannot exceed 10GB
		* Shares provisioned throughput settings for read and write activity with the table it is indexing
		* Limited to 5 per table
		* Cannot add modify or delete after creation
		* Needs both partition and sort key
		* Partition ket must be the same as the base table
		* The sort key should be different from the base table
	* GSI - Global Secondary Index
		* Use over local
		* Cannot provide strong consistency
		* Considered global because queries on the index can span all of the data in the base table across all partitions 
		* Indexes have no sizes restrictions
		* They have their own provisioned throughput settings, they consume capacity but not from the base table
		* Limited to 20 per table
		* Can be created, modified or deleted at anytime
		* The partition key should be different from the base table
		* Sort key is optional but not required
### DynamoDB Accelerator DAX
* Fully managed in-memory cache for DynamoDB that runs in a cluster
* Reponse times can be in single-digit milliseconds
* DAX can reduce times to microseconds
* Consist of one or more nodes
* Each node runs its own instance of the DAX caching software
* One of the nodes servers as primary for the cluster
* Additional nodes serve as read replicas
* Works with cluster endpoint to perform intelligent load balancing and routing

## EC2
* Resizable compute capacity
### Instance Types
* General purpose - A1, T3, T3a, T2, M5, M5a, M4
* Compute optimized - C5, C5n, C4
* Memory optimized - R5, R5a, X1e, X1
* Accelerated Optimized - P3, P2, G3, F1
* Storage optimized - I3, I3en, D2, H1  
### Placement Groups
* Logical placement of instances for communication, performance or durability
* Free service
* Types
	* Cluster
		* Packs instances close together inside an AZ
		* Low-latency network performance for node-to-node communication
		* Clusters cannot be multi-AZ
	* Partition
		* Places instances across logical partitions
		* Each partition do not share underlying hardware with each other
		* Well suited for distributed workloads
	* Spread
		* Each instance is places in different rack
		* When critical instances should be keep from each other
		* Max  7 instances can be spread

