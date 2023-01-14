---
hide:
 - navigation
---

# AWS Solutions Architect

## S3

### Lifecycle rules

Transition between storage classes

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