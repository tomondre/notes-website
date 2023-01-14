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