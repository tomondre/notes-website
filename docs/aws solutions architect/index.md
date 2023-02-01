---
hide:
 - navigation
---

# AWS Solutions Architect Associate

## S3

### Lifecycle rules

The transition between storage classes

Classes
1. Standard
2. Standard IA
3. Intelligent Tiering
4. One-Zone IA
5. Glacier Instant Retrieval
6. Glacier flexible retrieval
7. Glacier Deep Archive

Moving objects can be automated via Lifecycle Rules.

### Lifecycle Rules
* Transition Actions - COnfigure objects to transition to another storage class
	* Move objects to Standard IA class 60 days after creation
	* Move to Glacier for archiving after 6 months
* Expiration actions - configure objects to expire (delete) after some time
	* Access log files can be set to delete after 365 days
	* Delete incomplete multi-part upload
* Rules can be created for certaing prefix
* Rules can be created for certain object tags

### Storage Class Analysis
* Help to decide when to transition objects to the right storage class
* Recommendation for Standard and Standard IA - Does not work for One-Zone IA or Glacier
* Report is updated daily
* 24 to 48 hours to start seeing data analysis
* Good first step to put together lifecycle rules (or improve them)

### Request Pays
* In general, bucket owner pay for all Amazon S3 storage and data transfer, costs associated with their bucket
* With Requester pays buckets, the requester instead of the bucket owner pays the cost opf the request and the data download from the bucket
* Helpful when you wsan tto share large datasets with other accounts
* The requester must be authenticated - cannot be anonymous

### Event Notifications
* Use case - generate thumbails of images uploaded to S3
* Can create as many s3 events as desired
* S3 event notifications typically deliver events in seconds but can take a minute or longer
* Main destinations:
	1.  SNS
	2. SQS
	3. Lambda Functions
	4. Event Bridge - allows to send the events to over 18 aws services as destinations

### Performance
* Baseline - automatically scales to high requests rates, latency 100 - 200 ms
* Applications can achieve at least 3500 PUT/COPY/POST/DELETE and 5500 GET/HEAD requests per second per prefix in a bucket
* No limit to the number of prefixes in a bucket
* Improve performance
	* Multi-part upload
		* Recommended for files  > 100 MB, must use for files > 5 GB
		* Can help parallelize uploads - speed up transfers
	* Transfer Acceleration
		* Increase transfer speed by transferring file to an AWS edge location which will forward the data to the s3 bucket in the target region
		* Compatible with multi-part upload
	* Byte-Range Fetches
		* Parallelize GETs by requesting specific byte ranges
		* Better resilience in case of failures
		* Can be used to speed up downloads
		* Retrieve only partial data 
	* S3 Select & Glacier Select
		* Retrieve less data using SQL bu performing servicer-side filtering
		* Can filder by rows & columns - simple SQL statements
		* Less network transfer, less CPU cost client-side
	* Batch Operations
		* Perform bulk operations on existing S3 objects with a single request, example
			* Modify object metadata & properties
			* Copy objects between s3 bucket
			* Encrypt un-encrypted objects
			* Modify ACLs, tags
			* Restore Objects from S3 Glacier
		* A job consist of a list of objects, teh aciton to perform and optional parameters
		* S3 Batch Operations manages retries, tracks progress, sends completion notifications, generate reports,...
		* S3 Inventory can be used to get object list and use s3


## Databases
* How to choose
	* Question to choose the right database based on architecture
		* Is it read-heavy, write-heavy or balanced workload
		* Throughput needs? Does it need to scale during the day?
		* How much data to store, for how long? Will it grow? Average object size? How accessed?
		* Data durability? Source of truth for the data?
		* Query model? - joins, structured data, semi-structured
		* License costs?
### Types
* RDBMS - RDS, Aurora - great for joins
* NoSQL - DynamoDB, ElsatiCache, Neptune, DocumentDB, Keyspaces - no joins, no SQL
* Object Store - S3 for bigger objects or Glacier for backups
* Data Warehouse - Redshift, Athena, EMR
* Search - OpenSearch - free text, unstructured searches
* Graphs - Amazon Neptune - display relationships between data
* Ledger - Amazon Quantum Ledger Database
* Time series - Amazon Timestream

## RDS
* Managed PostgreSQL, MySQL, SQL Server, MariaDB, Custom
* Provisioned RDS instance Size, EBS Volume Type & Size
* Auto-scaling capability for Storage
* Support read replicase and Multi AZ
* Security through IAM, Security Groups, KMS, SSL in transit
* Automated backup with Point in Time restore feature - up to 35 days
* Manual DB Snapshot for longer term recovery
* Managed and Scheduled maintenance - with downtime
* Support IAM authentication, intetgration with Secrets Manager
* RDS Custom for access to and customize the underlying instance
* Use case: Store relational datasets, perform SQL queries, transactions

## Amazon Aurora
* Compatible API for PostgreSQL / MySQL, separation and compute
* Storage data is stored in 6 replicas across 3 AZ - highly available, self-healing, auto-sclaing
* Compute: Cluster of DB instance across multiple AZ, auto-scaling of Read Replicas
* Cluster: Custom endpoints for writer and reader DB instances
* Same security / monitoring / maintenance features as RDS
* Know the backup & restore options for Aurora
* Aurora Serverless - unpredictable / intermittent workloads, no capicity planning
* Aurora Multi-Master - for continous writes failover - high write availability
* Aurora Global - up to 16 DB read Instances in each region < 1 second storage replications
* Aurora Machine Learning - perform ML using SageMaker & Comprehend on Aurora
* Aurora Database Cloning - new cluster from existing one, faster than restoring a snapshot
* Use Case - same as RDS, but with less maintenance / more flexibility / more performance / more features

## Amazon ElastiCache
* Managed Redis / Memcached
* In-memory data store, sub-milisecond latency
* Must provision an EC2 insatnce type
* Support for Clustering (Redis) and Multi AZ, Read Replicas (sharding)
* Security through IAM, Security Groups, KMS, Redis Auth
* Backup / Snapshot / Point in time restore feature
* Managed and scheduled maintenance
* Requires some application code changed to be leveraged
* Use cases
	* Key/Value store
	* Frequent reads
	* Less writes
	* Cache results for DB queries
	* Store Sessiona data forwebsites, cannot use SQL

## DynamoDB
* Proprietary technology, managed serverless NoSQL database, milisecond latency
* Capacity modes: provisioned capacity with optional auto-scaling or on-demand capacity 
*  Can replace ElastiCache as a key/value store - storing data for example using TTL feature
* Highly Available, Multi AZ by default, Read and Writes are decoupled, transaction capability
* DAX cluster for read cache, microsecond read latency
* Security, authentication and authorization is done through IAM
* Event Processing: DynamoDB Streams to integrate with AWS Lambda, or Kinesis Data Streams
* Global Table feature: active-active setup
* Automated backup up to 35 days with PITR - resotre to new table or on-demand backups
* Export to S3 without using RCU withing PITR window, import from S3 without using WCU
* Great to rapidly evolve schemas
* Use case
	* Serverless applications development - small couments
	* Distributed serversless cache
	* No SQL query language available

## S3
* Key/value store for objects
* Great for bigger objects, not so great for many small objects
* Serverless, scales infinitely,, max object size is 5 TB, versioning capability
* Tiers: S3 Standard, S3 Infrequent Access, S3 Intelligent, S3 Glacier + lifecycle policy
* Features: Versioning, Encryption, Replication, MFA-Delete, Access Logs
* Security: IAM, Bucket Policies, ACL, Access Points, Object Lambda, CORS, Object/Vault Lock
* Encryption: SSE-S3, SSE-KMS, SSE-C, client-side, TLS in transit, default encryption
* Batch operations on objects using S3 Batch, listing files using S3 inverntory
* Performance: multi-part upload, S3 transfer acceleration, s3 select
* Automation: S3 Event Notifications (SNS, SQS, Lambda, EventBrisge)
* Use cases: static files, key value store for big files, website hosting

## DocumentDB
* DocumentDB is the same for MongoDB - which is a NoSQL database
* MongoDB is used to store, query and index JSON data
* Similar deployment concepts as Aurora
* DocumentDB storage automatically grows increments of 10GB up to 64TB
* Automatically scales to workload with millions of requests per seconds

## Amazon Neptune
* Fully managed graph database
* A popular graph dataset would be a social network
	* Users have friends
	* Posts have comments
	* Commnents have likes from users
	* Users share and like posts
* Highly available across 3 AZ, with up to 15 read replicas
* Build and run applications working with higly connected datasets - optimized for these complex and hard queries
* Can store up to billions of relations and query the graph with millisecond latenct
* Highly available with replications across multiplem AZs
* Great for knowledge graphs, fraud detection, recommendation engines, social networking

## Amazon Keyspaces
* Managed Apache Cassandra Service - open-source NoSQL distributed database
* Serverless, Scalable, Highly Available, Fully managed by AWS
* Automatically scale tables up/down based on the application's traffic
* Tables are replicated 3 times across multiple AZ
* Using the Cassandra Query Language (CQL)
* Single-digit millisecond latency at any scale, 1000s of requests per second
* Capacity: On-demand mode or provisioned mode with auto-scaling
* Encryption, backup, Point-In-Time Recovery (PITR) up to 35 days
* Use cases: store IoT devices info, time-series data

## Amazon QLDB
* QLDB stand for Quantum Ledger Database
* A ledger is a book recording financial transactions
* Fully Managed, Serverless, High Available, Replication across 3 AZ
* Used to review the history of all the changes made to your application
* Immutable system: no entry can be removed or modified, cryptographically verifiable
*  2-3x better performance than common ledger blockchain frameworks, manipulate data SQL
* The difference with Amazon Managed Blockchain component, in accordance with financial regulation rule 

## Amazon Timestream
* Fully managed, fast, scalable serverless time series database
* Automatically scales up/down to adjust capacity
* Store and analyse trillions of events per day
* 1000s time faster & 1/10th the cost of SQL compatibility
* Data storage tiering: recent data kept in memory and historical data kept in a cost-optimized
* Built-in time series analytics function - helps to identify patterns in data in near real-time
* Encryption in transit and at rest
* Use cases:
	* IoT apps
	* Operational applications
	* Real-time analytics
* Architecture
	* Inputs
		* AWS IoT
		* Kinesis Data Streams
		* Prometheus
		* Telegraf
		* Kinesis Data Streams
		* Amazon MSK
	*  Outputs
		* Amazon QuickSight
		* Amazon SageMaker
		* Grafana
		* Any JDBC connection

## AWS Security & Encryption
###  Encryption in flight - SSL
* Data is encrypted before sending and decrypted after receiving
* SSL certificates help with encryption - HTTPS
* Encryption in flight ensures no MITM can happen
### Server-side encryption at rest
* Data is encrypted after being received by the server
* Data is decrypted before being sent
* It is stored in an encrypted form thanks to a key - usually a data key
* The encryption / decryption key must be managed somewhere and the server must have access to it
### Client-side encryption
* Data is encrypted by the client and never decrypted by the server
* Data will be decrypted by a receiving client
* The server should not be able to decrypt the data
* Could leverage Envelope Encryption

## AWS KMS
* AWS Manages encryption keys for us
* Fully integrated with IAM for authorization
* Easy way to control access to our data
* Able to audit KMS key usage using CloudTrail
* Seamlessly integrated into most AWS services - EBS, S3, RDS, SSM
* Never store secrets in plaintext, especially in the code
	* KM Key Encryoption also available through API calls - SDK, CLI
	* Encrypted secrets can be stored in the code / environment  variables 
* KMS Key Types
	* Symmetric
		* Single encryption key that is used to Encrypt and Decrypt
		* AWS Services that are integrated with KMS use symmetric CMKs
		* We never ger access to the KMS Key unencrypted - must call KMS API to use
	* Asymetric
		* Public (Encrypt) and private (Decrypt) pair
		* Used for Encrypt/Decrypt or Sign/Verify operations
		* The public key is downloadable, but we can't access the private key unencrypted
		* User case - encryption outside of AWS by users who can't call the KMS API
* Three types
	* AWS Managed Key - free (aws/service-name, example: aws/rds or aws/ebs)
	* Customer Managed Keys - created in KMS - $1
	* Customer Managed Keys imported - must be 256-bit symmetric key - 1$ / month
* Pay  for API call to KMS - $0.03 / 10000 calls
* Automatic Key rotation
	* AWS-Managed KMS Key - automatic every 1 year
	* Customer-managed KMS Key - must be enabled for 1 rotation every 1 year
	* Imported KMS Key - only manual rotation, possible using alias
* Copying snapshots across regions
* Key policies
	* Control access to KMS keys, similar to S3 bucket policies
	* Difference - you cannot control access without them
	* Default KMS Key Policy
		* Created if you don't provide a specfic KMS Key policy
		* Complete access to the key to the root user - entire AWS accoun
	* Custom KMS Key policy
		* Define users, roles that can access the KMS key
		* Define who can administed the key
		* Useful for cross-account access to KMS key
### Multi-Region keys
* Have Primary key in one region and replicate it to other AWS regions - key id is the same
* Set of KMS keys in different AWS regions that can be used interchangeaby
* Multi-Region keys have the same key ID, key materual, automatic rotation
* Encrypt in one Region and decrypt in other regions
* No need to re-encrypt or making cross-region API calls
* KMS Multi-Region are NOT global
* Each Multi-Region key is managed independently
* Use cases - global client-side encryption, encryption on Global DynamoDB, Global Aurora
### S3 Replication Encryption Considerations
* Unecrypted objects and objects encrypted with SSE-S3 are replicated by default
* Objects encrypted with SSE-C - custmer procuided are never replicated
* For objects encrypted with SSE-KMS, you need to enable the option
	* Specify which KMS Key to encrypt the object within the target bucket
	* Adapt the KMS Key Policy for the target key
	* An IAM Role with kms:Decrypt for the source KMS Key and kms:Encrypt for the target KMS key

## SSM Parameter Store
* Secure storage configuration and secrets
* Optional Seamless encryption using KMS
* Serverless, scalable, durable, easy SDK
* Version tracking of configurations / secrets
* Security through IAM
* Notifications with Amazon EventBridge
* Integration with CloudFormation
* Standard Tier 
	* Total number of parameter allowed - per AWS region -  10 000
	* Maximum size of parameter value - 4 KB
	* Parameter policies available - no
	* Cost - no additional charge
* Advanced tier
	* Total number of parameter allowed - per AWS region - 100 000
	* Maximum size of parameter value - 8 KB
	* Parameter policies available - yes
	* Cost - charges apply
### Parameters Policies
* Allow to assign a TTL to a parameter to force updating or deleting sensitive data such as apassword
* Can assign multiple policies at a time

## AWS Secrets Manager
* Newer service, meant for storing secrets
* Capability to force rotation of secrets every X days
* Automate generation of secrets on rotation - uses Lambda
* Integration with Amazon RDS - MySQL, PostgresSQL, Aurora
* Secrets are encrypted using KMS
* Mostly meant for RDS integration
### Multi-Region Secrets
* Replicate Secrets across multiple AWS regions
* Secrets Manager keeps read replicas in sync with the primary Secrets
* Use cases: multi-region apps, disaster recovery strategies, multi-region DB

## AWS Certificate Manager - ACM
* Easily provision, manage, and deploy TLS Certificates
* Provide in-flight encryption for websites - HTTPS
* Free of charge for public TLS certificate renewal
* Integrations with
	* Elastic Load Balancers
	* CloudFront Distributions
	* APIs on API Gateway
* Cannot use ACM with EC2
### Requesting Public Certificates
1. List domain names to be included in the certificate
	* Fully Qualified Domain Name: corp.example.com
	* Wildcard Domain \*.example.com
2. Select validation method: DNS Validation or email validation
	* DNS Validation is preferred for automation purposes
	* Email validation will send emails to contact adresses in the WHOIS database
	* DNS Validation will leverage a CNAME record to DNS config
3. It will take a few hours to get verifies
4. The public Certificate will be enrolled for automatic renewal
	* ACM automatically renews ACM-generated certificates 60 days before expoiry
### Importing public certificates
* OPtion to generate the certificate outside of ACM and then import it
* No automatic renewal - must import a new certificate before expiry
* ACM sends daily expiration events starting 45 days prior to expiration
	* The number of days can be configured
	* Events are appearing in EventBridge
* AWS Config has a managed rule named *acm-certificate-expiration-check* to check for expiring certificates

## AWS WAF
* Protects web applications from common web exploits - layer 7
* Layer 7 is HTTP
* Deploy on Application Load Balancer
* API Gateway
* CloudFront
* AppSync  GraphQL
* Cognito User Pool
* Web ACL Rules
	* IP set: up to 10000 IP addresses - use multiple Rules for more IP's
	* HTTP headers, HTTP body or URI strings protects from common attack - SQL injection, cross-site scripting
	* Size constraints, geo-match - block countries
	* Rate-based rules for DDoS protection
* Web ACL are regional except for CloudFront
* A rule group is a reusable set of rules that we can add to a web ACL
* WAF does not support the Network Load Balancer

## AWS Shield
* Protect from DDoS attack
* Distributed Denial of Service - many requests at the same time
* AWS Shield Standard
	* Free service that is activated for every AWS customer
	* Provides protection from attacks such as SYN/UDP floods, reflection attacks and 
	* other layer
* AWS Shield Advanced
	* Optional DDoS mitigation service - 3000 per month per organization
	* Protect against more sophisticated attack on Amazon EC2, ELB, Amazon Cloudfront, AWS Global Accelerator and Route 53
	* 24/7 access to AWS DDoS response team
	* Protect against higher fees furing usage spikes due to DDoS
	* Shield advance automatic application layer DDoS mitigation automatically creates, evaluates adn deploys AWS WAF rils to mitigate layer 7 attacks

## AWS Firewall Manager
* Manage rules in all accounts of an AWS Organization
* Security policy - common set of security rules
	* WAF rules - ALB, API GW, CF
	* AWS Shield Advanced - ALB, CLV, NLB, E IP, CF
	* Security Groups for EC2
	* AWS Network Firewall - vpc level
	* Amazon Route 53 Resolver DNS Firewall
	* Policies are created at the region level
* Rules are applied to new resources as they are created across all and future accounts in organization - good for compliance

## Amazon GuardDuty
* IntelligentThreat discovery to protect AWS account
* Uses Machine Learning algorithms, anomaly detection, 3rd party data
* One click to enable 30 days trial, no need to install software
* Input data includes
	* Cloudtrail Events Logs - unusual API calls, unathorized deployments, create VPC subnet, create trail
	* VPC Flow Logs - unusual internet traffic, unusual IP address
	* DNS Logs - compomised EC2 instances sending encoded data within DNS queries
	* Kubernetes Audit Logs - suspicious activities and potentional EKS cluster compromises
* Can setup EventBridge riles to be notified in case of findings
* EvenBrudge rules can target AWS Lambda or SNS
* Can protect against CryptoCurrency attacks - had a dedicated finding for it

## Amazon Inspector
* Automated Security Assesments
* For EC2 instances
	* Leveraging the AWS System Manager agent
	* Analyze against unintended network accessibility
	* Analyze the running OS against known vulnerabilities
* For container images push to Amazon ECR
	* Assessment of container images as they are pushed
* For Lambda functions
	* Identifies software vulnerabilities in function code and package dependencies
	* Assesment of functions as they are deployed
* Reporting & Integration with AWS Security Hub
* Send findings to Amazon Event Bridge
### What is evaluated
* Only for EC2 Instances, container images, lambda functions
* Countinuous scanning of the infrastructure, only when needed
* Package vulnerability - ec2, ecr & lambda - database of CVE
* Network reachability - ec2
* A risk score is associated with all vulnerabilities for prioritization

## Amazon Macie
* Fully managed data security and data privacy service that uses machine learning and pattern matching to discover and protect sensitive data in AWS
* Macie Helps identify and alert you to sensitive data such as personally identifiable information - PII

## Amazon Rekognition
* Find objects, people, text scenes in images and videos using ML
* Facial analysis and facial search to do user verification, people counting
* Create a database of familiar faces or compare against celebrities
* Use cases
	* Labeling
	* Content moderation
	* Text Detection
	* Face detection and analysis - gender, age range, emotions
	* Face search and verification
	* Celebrity recognition
	* Pathing
### Content moderation
* Detect content that is inappropriate, unwanted or offensive
* Used ion social media, broadcast media, advertising and e-commerce situations to create a safer user experience
* Set a minimum confidence threshold for items that will be flagged
* Flag sensitive content for manual review in Amazon Augmented AI
* Helps to comply with regulations

## Amazon Transcribe
* Automatically convert speech to text
* Uses a deep learning process called automatic speech recognition to convert speech to text quickly and accuretely
* Automatically remove PII using redaction
* Support automatic language identification for multi-lingual audio
* Use cases:
	* transcribe customer service calls
	* Automate closed captioning and subtitling
	* Generate metadata for media assets to create a fully searchable archive

## Amazon Polly
* Turn text into lifelike speech using deep learning
* Allowing you to create applications that talk
### Lexicon & SSML
* Customize the pronunciation of word with pronunciation lexicons
	* Acronym: AWS => Amazon Web Services
* Upload the lexicons and use them in the SynthesizeSpeech operation
* Generate speech from plain text or from documents marked up with speech synthesis markup language - enables more customisation
	* Emphasizing specific words or phrases
	* Using phonetic pronunciation
	* Including breathing sounds, whispering
	* Using the Newcaster speaking style

## Amazon Translate
* Natural and accurate language translation
* Amazon Translate allow to localise content - such as websites and applications - for international users and to easily translate large volumes of text efficiently

## Amazon Lex & Connect
* Amazon Lex - same technology that powers Alexa
	* Automatic speech recognition to convert speech to text
	* Natural language understanding to recognise the intent of the text, callers
	* Helps build chatbots, call centre bots
* Amazon Connect
	* Receive calls, create content flows, cloud-based virtual content center
	* Can integrate with other CRM systems or AWS
	* No upfront payments 80 percent cheaper than traditional contact center solutions


## Amazon Comprehend
* For Natural Language Processing - NLP
* Fully maanged and serverless service
* Uses machine learning to find insights and relationships in text
	* Language of the text
	* Extracts key phrases, places, people, brands or events
	* Understands how positive or negative the text is
	* Analyzes text using tokenizations and parts of speech
	* Automatically organizes a collection of text files by topic
* Example use-cases
	* Analyze customer interactions (emails) to find what leads to positive or negative experience
	* Creating and grouping articles by topics that comprehend will uncover

## Amazon Comprehend Medical
* Detects and returns useful information in unstructured clinical text
	* Physician' notes
	* Discharge summaries
	* Test results
	* Case notes
* Uses NLP to detect protected health information
* Store documents in Amazon S3, analyze real-time data with Kinesis Data Firehose or use Amazon Transcribe patient narratives into text that can be analyzed by Amazon Comprehend Medical

## Amazon SageMaker
* Fully managed service for developers/data scientists to build ML models
* Typically difficult to do all the processes in one place + provision servers
* Machine learning process - predicting exam score
* Steps
	* Input data
	* Label it
	* Build ML model
	* Train and tune over time

## Amazon Forecast
* Fully managed service that uses ML to deliver highly accurate forecasts
* Example: predict the future of sales of raincoat
* 50 percent more accurate than looing at the data itself
* Reduce forecasting time from months to hours

## Amazon Kendra
* Fully managed document search service powered by Machine Learning
* Extract answers from withing a document - text, pdf, HTML, PowerPoint, MS Word, FAQs
* Natural language search capabilities
* Learn from user interactions/feedback to promote preffered results - incremental learning
* Ability to manuall fine-tune search result - importance of data, freshness, custom,...

## Amazon Personalize
* Fully managed ML-service to build apps with real-time personalized recommendations
* Example - personalized product recommendations/re-ranking, customized direct marketing
* Same technology used by Amazon.com
* Integrated into existing websites, applications, SMS, email marketing systems
* Implement in days, not months - no need to build, train and deploy ML solutions
* Use cases: retail stores, media and entertainment

## Amazon Textract
* Automatically extracts text, handwriting, and data from any scanned documents using AI and ML
* Extract data from forms and tables
* Read and process any type of document
* Use cases
	* Financial services
	* Healthcare
	* Public sector

## AWS Config
* Helps with auditing and recording compliance of AWS resources
* Helps record configurations and changes ocer time
* Questions that can be solved by AWS Config
	* Unrestricted SSH access to SG?
	* Does buckets have public access
	* How ALM configuration changed over time
* Alerts can be received for any changes
* Config is per-region service
* Data can be aggregated across regions and accounts
* Possibility of storing configuration data in s3 - and queried by AWS Athena
* AWS Config Rules does not prevent acions from happening - no deny
* Pricing
	* No free tier, 0.003 per configuration item revorded per region
	* 0.001 per config rule evaluation per region
* Config resource - compliance, configuration and cloudtrail API call over time
### Config Rules Notifications
* Use EventBridge to trigger notifications when AWS resources are non-compliant
* Ability to send configuration changed and compliance state notifications to SNS 

## AWS Storage Gateway
* Bridge between on-premises data and cloud data
* Use cases
	* Disaster recovery
	* Backup & restore
	* Tiered storage
	* On-premises cache & low latency files access
	* Types of Storage Gateway
* Types
	* S3 File Gateway
		* Sits in on-premise and can be connected to via NFS or SMB
		* Creates HTTPS requests to s3
		* Most recently used data is cached in the file gateway
		* Trainsition to S3 Glacer using lifecycle policy
		* Bucket access using IAM roles for each Gile Gateway
		* Integration with Active Directory for user authentication
	* FSx File Gateway
		* Native access to Amazon FSx for Windows File Server
		* Local cache for frequently accessed data
		* Windows natvice compatibility
		* Useful for group file shares and home directories
	* Volume Gateway
		* Block Storage using iSCSI protobol backed by S3 
		* Backed by EBS snapshots which can help restore on-premises volumes
		* Cached volumes - low latency access to msot recent data
		* Stored volumens - entire dataset is on premise schedules backups to S3
	* Tape Gateway
		* Some companies have backup processes usign physical tapes
		* With tape gateway, companies use the same processes but in the cloud
		* Virtual Tape Library (VTL) backed by Amazon S3 and Glacier
		* Back up data using existing tape-based processes
		* Works with leadin backup software vendors
* Hardware appliance
	* Using Storage Gateway mean we need on-premises virtualization
	* Otherwise we can use Storage Gateway Hardware Appliance
	* We can buy it amazon.com
	* Works with File Gateway, Volume Gatewa, Tape Gateway
	* Has required CPU, memory, network, SSD cache resources
	* Helpful for daily NFS backups in small data centers

## AWS Transfer Family
* Fully managed service for file transfers into and out of Amazon S3 or Amazon EFS using the FTP protocol
* Supported Protocols
	* AWS Transfer for FTP
	* AWS Transfer for FTPS
	* AWS Transfer for SFTP
* Managed infrastructure, scalable, reliable, highly available
* Pay per provisioned endpoint per hour + data transfers in GB
* Store and manager users credentials within the service
* Integrate with existing authentication systems/

## AWS DataSync
* Move large amount of data to and from
	* On-premises / other cloud to AWS - NFS, SB, S3 API - needs agent
	* AWS to AWS - different sotrage services - no agent needed
* Can synchronie to
	* Amazon S3
	* Amazon EFS
	* Amazon FSx - Windows, Lustre, NetApp
* Replication tasks can be scheduled hourly, daily, weekly
* File permissions and metadata are preserved - NFS, POSIX, SMB
* One agent can use 10 Gbps, can setup bandwidth
* AWS Snowcone comes with agent pre-installed

## NACL
* Are like firewall which control traffic from and to subnets
* One NACL per subnet, new subnetts are assigned the Default NACL
* We define NACL rules
	* Rules have number 1 - 32766, higher precedence with a lower number
	* First rule match will drive the decision
	* The last rule is an asterisk and denies a request in case of no rule match
* Newly created NACLs will deny everything
* NACL are great way of blocking a specific IP address at the subnet level
### Default NACL
* Accepts everything inbound/outbund with the subnet it's associated with
* DO NOT modify the default NACL, instead create custom NACLs
### Ephermal Ports
* For any two endpoints to establish a connection, the must use ports
* Clients connect to a defined port, and expect a response on an ephemeral port
* Different operating systems use different port ranges
	* MS Windows 10 - 49152 - 65535
	* Many Linux Kernels - 32768 - 60999
* Rules are evaulated in order when deciding whether to allow traffic, first level match wins

## VPC Peering
* Pribvately connect two VPCs using AWS network
* Make them behave as if they were in the same network
* Must not have overlapping CIDRs
* VPC Peering connection is NOT transitive - must be established for each VPC that need to communicate with one another
* We can create VPC peering connection between VPCs in different AWS accounts/regions
* You can reference a security group in a peered VPC - works cross accounts - same region

## VPC Endpoints
* Every AWS Service is publicly exposed - public URL
* VPC Endpoints allows to connect to AWS service using ptivate network insted of using the public internet
* They are redundant and scale horizontally
* They remove the need of IGW, NATGW to access AWS Services
* In case of issues
	* Check DN Setting resolution in VPC
	* Check route tables
### Types
* Interface Endpoints - powered by PrivateLink
	* Provision an ENI as an entry point
	* Supports most AWS services
	* $ per hour + $ per GB of data processed
* Gateway Endpoints
	* Provisions a fateway and must be used as a target ina route table - does not use security groups
	* Supports S3 and DynamoDB
	* Free

## VPC Flow Logs
* Capture information about IP traffic going into interfaces
	* VPC Flow Logs
	* Subnet Flow Logs
	* Elastic Netowrk Interface Flow Logs
* Helps to monitor & troubleshoot connectivity issues
* Flow logs data can go to S3 / CloudWatch Logs
* Captures netowrkin information from AWS managed interfaces - ELB, RDS, ElastiCache, Redshift, NAT GW

## AWS Site-to-Site VPN
* Virtual Private Gateway
	* VPN concentrator on the AWS side of the VPN connection
	* VGW is created and attached to teh VPC from which we want to create the Site-to-SIte VPN connections
	* Possibility to customize the ASN
* Customer Gateway
	* Software application or physical device on sutomer side of the VPN connection
* Route Propagation for Virtual Private Gateway in the route table that is associated with subnets
* If we need to ping EC2 instances instances from on-premises, make sure we add the ICMP protocolin the inbound of the security groups
### AWS VPN CloudHub
* Provide secure communication between multiple sites, if we have multiple VPN connections

## Direct Connect
* Provides a dedicated private connection from a remote network of VPC
* Dedicated connection must be setup between our DC and AWS Direct Connect location
* We need to setup a Virtual Private Gateway on our VPC
* Access public resources and private on same connection
* Use cases
	* Increase bandwidth rhoughput - working with large data sets - lower cost
	* More consistent network experience - applications using real-time data feeds
	* Hybrid environments - on prem + cloud
* Support ipv4 and ipv6
### Connection Types
* Dedicated Connections
	* Physical ethernet port dedicated to a customer
	* Request made to AWS first, then completed by AWS Direct Connect Partners
* Hosted Conenctions
	* Connection request are made via AWS Direct Connect Partners
	* Capacity can be added or removed on demand
* Lead time are often longer than 1 month to establish a new connection
### Ecryption
* Data in transit is not encrypted but is private
* AWS Direct Connect + VPN provides and IPsec-encrypted private connection
* Good for an extra level of security, but slightly more complex to put in place

## Transit Gateway
* Transitive peering connection between thousand of VPC and on-premises, hub-and-spoke star connection
* Regional resource, can work cross-regions
* Share cross-account using Resource Access Manager - RAM
* You can peer Transit Gateways across regions
* Route Tables - limit which can talk with other VPC
* Works with Direct Connect Gateway, VPN Connections
* Support IP multicast - not supported by a ny other AWS service
### Site-to-Site VPN ECMP
* ECMP - Equal-cost multi-path routing
* Routing strategy to allow to forward a packet over mutliple best path
* Use case: create multiple Site-to-Site VPN connections to increase the bandwidth of out connections to AWS

## Disaster Recovery Overview
* Any event that has a negative impact on company's business continuity or finances is a disaster
* Disaster Recovery is about preparing for and recovering from disaster
* Kinds
	* On-prmeise => On-premise - traditional DR - very expensive
	* On-premise => AWS Cloud - hybrid recovery
	* AWS Cloud Region A => AWS Cloud Region B
* Need to define two terms
	* RPO - Recovery Point Objective - how back in time we can recover data
	* RTO - Recovery Time Objective - how long does it take to recover the systems
### Strategies
* Backup and Restore
	* High RPO
	* High RTO
	* Cheap
* Pilot Light
	* Lower RPO
	* Lower RTO
	* Small version of the app is always running in the cloud
	* Faster than backup and restore as critical systems are already up
* Warm standby
	* Decreased RPO
	* Decreased RTO
	* More costly
	* Full systems is up and runninr but at minimum size
	* Upon disaster we can scale to production load
* Active-Active
	* Very low RPO
	* Very low RTO
	* Very expensive
	* Full production scale is running AWS on on-premise
### Disaster Recovery Tips
* Backup
	* EBS Snapshots, RDS, automated backups/snapshots
	* Regular pushes to S3 / S3 IA / Glacier, Lifecycle Policy, Cross Region Replication
	* From On-Premise - Snowball or Storage Gateway
* High Availability
	* Use Route53 to migrate DNS over from Region to Region
	* RDS Multi-AZ, ElastiCache Multi-AZ, EFS, S3
	* Site to SiteVPN as a recovery from Direct Connect
* Replication
	* RDS replication, AWS Aurora + Global Databases
	* Database replication from on-premise to RDS
	* Storage Gateway
* Automation
	* Cloudformation / Elastic Beanstalk to re-create a whole new environment
	* Recover / Reboot EC2 instances with CloudWatch if alarms fil
	* AWS Lambda functions for customized automation
* Chaos
	* Netflix has a simian-army - randomly terminating EC2

## AWS DMS
* Database Migration Service
* Quickly and securely migrate databases to AWS, resilient, self-healing
* The Source database remains available during the migration
* Supports
	* Homogeneous migration - Oracle to Oracle
	* Heterogenous migration - Microsoft SQL Server to Aurora
* Continuous Data Replication using CDC - Change Data Capture
* We must create an EC2 instance to perform the replication tasks
* Sources
	* On-premise and ec2 instances - Oracle, MS SQL, MySQL
	* Azure - Azure SQL Database
	* Amazon RDS - all including Aurora
	* Amazon S3
* Targets
	* On-premise and ec2 instances - Oracle, MS SQL, MySQL
	* Amazon RDS
	* Amazon Redshift
	* Amazon DynamoDB
	* Amazon S3
	* ElastiCache Service
	* Kinesis Data Streams
	* DocumentDB
### AWS Schema Conversion Tool
* SCT
* Convert Database schema from one engine to another
* Example - OLTP (SQL Server or Oracle) to MySQL, Aurora
* Example - OLAP (Teradata or Oracle) to Amazon Redshift
* There is no need to use SCT if DB with the same engine is migrated

## RDS & Aurora MySQL Migrations
* RDS MySQL to Aurora MySQL
	* Option 1: DB Snapshots from RDS MySQL restored as MySQL restored as MySQL Aurora DB
	* Option 2: Create an Aurora Read Replica from RDS MySQL and when the replication lag is 0, promote it as its own DB cluster
* External MySQL to Aurora MySQL
	* Option 1: Use Percona XtraBackup to create a file backup in Amazon S3
		* Create an Aurora MySQL DB Amazon S3
	* Option 2: Create an Aurora MySQL DB
	* Use the mysqldump utility to migrate MySQL into Aurora
* Use DMS if both databases are up and running

## AWS Backup
* Fully managed service
* Centrally manage and automate backups across AWS services
* No need to create custom scripts and manual processes
* Supported services
	* Amazon EC2 / Amazon EBS
	* Amazon S3
	* Amazon RDS / Amazon Aurora / Amazon DynamoDB
	* Amazon DocumentDB / Amazon Neptune
	* Amazon NFS / Amazon FSx
	* AWS Storage Gateway - Volume Gateway
* Support cross-region backups
* Support cross-account backups
* Support PITR for supported services (e.g. Amazon Aurora)
* On-Demand and Scheduled backups
* Tag-based backup policies
* We create backup policies - known as Backup plans
* Backup Frequency - every 12 hours, daily, weekly, monthly
* Backup window
* Transition to Cold Storage - Never, Days, Weeks, Months, Years
* Retention Perion - Always, Days, Weeks, Months, Years
* Data is backed-up to Amazon S3
### Backup Vault Lock
* Enforce WORM - Write Once Read Many state for all backups that we store in our AWS Backup Vault
* Additional layer of defense to protect our backup against
	* Inadvertent or malicious delete operation
	* Updates that shorten or alter retention period
* Even the root user cannot delete backups when enabled

## AWS Application Discovery Service
* Plan migration project by gathering information about on-premises data centers
* Server utilization data and dependency mapping are important for migrations
* Agentless Discover - AWS Agentless Discovery Connector - VM inventory, configruation, and performance history such as CPU, memory and disk usage
* Agent-based Disvoery - AWS Application Discovery Agent - System configuration, system performance, running processes, and details of the network connections between systems
* Resulting data can be viewed within AWS Migration Hub

## AWS Application Migration Service
* The evolution of CloudEndure Migration replacing AWS Server Migration Service
* Lift-and-shift - rehost - solution which simplify applications to AWS
* Converts on-premise virtual and physicals servers to run natively on AWS
* Minimal downtime, reduced costs

## Transferring Large Amount of Data to AWS
* Example - transfer 200TB of data in the cloud - we have 100 Mbps internet connections
* Over the internet / Site-to-Site VPN
	* Immediate to setup
	* Will take ~185 days
* Over direct connect - 1 Gbps
	* Long for the one-time setup - over a month
	* Will take ~18,5 days
* Over Snowball
	* It will take 2 to 3 snowballs in parallel
	* Takes about 1 week for an end-to-end transfer
	* Can be combined with DMS
* For on-going replication/transfers: Site-to-Site VPN or DX with DMS or DataSync