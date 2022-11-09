---
hide:
 - navigation
---

# AWS Cloud Practicioner
 
## Cloud Computing
 
* Properties
    * On demand - delivery of compute power, database storage, applications and other it resources
    * Pay as you go pricing - pay only for what you requested, when you requested, as you are using it - no cost after done using
    * Great fit - provision exactly the right type and size of computing resources
    * Instant access - accessing many resources almost instantly - no prior notice
    * Simple access - Simple way to access servers, storage, databases and set of application services
    * AWS - owns and maintains the network connected hardware required for application services while we provision and use what we need via web application 
 
* Cloud Services examples
    * Gmail
        * Cloud service
        * We don't need to provision infrastructure
        * We pay only for emails stored
    * Dropbox
        * Cloud storage service
        * Originally on AWS
    * Netflix
        * Built on AWS
        * Video on demand
 
* Deployment models
    * Private cloud
        * Example: Rackspace
        * Cloud services used by an organization not exposed to public
        * Complete control
        * Security for sensitive applications
        * Meet specific business needs
    * Public cloud
        * Example: Microsoft Azure, Google Cloud, AWS
        * Six Advantages of Cloud Computing
    * Hybrid
        * Keep the servers on premise and extend some capabilities to the cloud
        * Control over sensitive assets in private infrastructure
        * Flexibility and cost-effectiveness of the public cloud
         
* Five characteristics of cloud services
    * On-demand self service
        * Users can provision resources and use them without human interaction from the service provider
    * Broad network access
        * Resources available over thee network and can be accessed by diverse client platforms
    * Multi-tenancy and resource pooling
        * Multiple customers can share the same infrastructure and applications with security and privacy
        * Multiple customers are serviced from the same physical resources
    * Rapid elasticity and scalability
        *    Automatically and quickly acquire and dispose resources when needed
        * Quickly and easily scale based on demand
    * Measured service
        * Usage is measured, users pay correctly for what they have used
 
* Six advantages
    * Trade capital expense CAPEX for operational expense OPEX
        * Pay on demand - don't own hardware
        * Reduced Total Cost Of Ownership (TCO) & Operational expenses (OPEX)
    * Massive economies of scale
        * Prices are reduced as AWS is more efficient due to large scale
    * Stop guessing capacity
        * Scale based on actual usage
    * Increase speed and agility
    * Stop spending money running and maintaining data centres
    * Go global in minutes
        * Leverage AWS global infrastructure
         
* Problems solved by the cloud
    * Flexibility
        * Change resources when needed
    * Cost effectiveness
        * Pay as you go
    * Scalability 
        * Accommodate larger loads by making hardware stronger or adding additional nodes
    * Elasticity
        * Ability to scale out and scale-in when needed
    * High availability and fault tolerance
        * Build across data centres
    * Agility
        * Rapidly develop, test and launch software applications
 
* Pricing - Three pricing fundamentals
    * Compute
        * Pay for compute time
    * Storage
        * Pay for data stored in the cloud
    * Data Transfer OUT
        * Data Transfer in is free
 
* Types of cloud computing
    * Infrastructure as Service (IaaS)
        * Provide building blocks for cloud IT
        * Provides networking, computers, data storage space
        * Highest level of flexibility
        * Easy parallel with traditional on-premises IT
        * Example
            * Google Cloud Provider
            * Azure
        * AWS Example
            * EC2
    * Platform as Service (PaaS)
        * Remove the need for your organization to manage the underlying infrastructure
        * Focus on deployment and management of your applications
        * Example
            * Heroku
            * Google App Engine
        * AWS Example
            * Elastic Beanstalk
    * Software as Service (Saas)
        * Completed products that is run and manage by service provider
        * Example
            * Google Apps (Gmail)
            * Zoom
            * Dropbox
        * AWS Example
            * Rekoginition for Machine Learning
     
* Cloud Composed of
    * Compute: CPU
    * Memory: RAM
    * Storage: Data
    * Database Storage: Structured data in structured way 
    * Network: Routers, switch, DNS server
    
 
* IT Infrastructure
    * Network
        * Cables, routers and servers connected with each other
    * Router
        * Networking device that forwards data packets betweek computer networks
        * They know where to send your packets on the internet
    * Switch
        * Takes packets and sends them to correct server    * / client on the network
       
## AWS
 
* Number Facts
    * In 2019 - AWS had 35 bilion $ in revenue
    * AWS accounts to 47% of the market in 2019 (Microsoft is 2nd with 22%)
    * Pioneer and Leader of the AWS Cloud Market for 9th consecutive years
    * Over 1 000 000 active users
* Cloud Use Cases
    * Enables to build sophisticated, scalable applications
    * Applicable to diverse set of industries
    * Includes:
        * Enterprise IT, Backup and storage, Big Data Analytics
        * Website hosting, Mobile and Social Apps
        * Gaming servers hosting
    * Companies using AWS
        * McDonald's
        * 21st century fox
        * Activision
        * Netflix
 
* Global Infrastructure
    * Regions
        * Cluster of data centers
        * Most AWS services are region scoped
    * Availability Zones (AZ)
        * Each region has
            * Usual is 3 AZ
            * Minimal is 2 AZ
            * Maximal 6 AZ
        * Each AZ
            * Has one or more discrete data centres with same power, networking and connectivity
            * Is separate from each other so that they are isolated from disasters
            * Is connected in region with high bandwidth, ultra-low latency networking
        * Letter after the region name represents AZ
    * Points of presence (Edge Locations)
        * Ensures low latency content delivery
        * 400+ around the globe
         
* Shared responsibility
 
     
* Acceptable Policy
    * No Illegal, Harmful or Offensive Use or Content
    * No Security Violations
    * No Network Abuse
    * No E-mail or Other Message Abuse
 
 
## IAM
 
* Identity and Access Management
* Global Service
* Root Account created by default, shouldn't be used or shared
* Users and Groups
    * Users are people in the organization, can be grouped (For example developers, operations)
    * Group only contains users, not other groups
    * User don't have to belong to group, and user can belong to multiple groups 
* Permission
    * Users or Groups can be assigned JSON document policies
    * Least permission principle - Don't give user more permissions then a user needs 
* Policy Structure
    * Version - policy language version
    * Id - optional identifier for policy
    * Statement
        * Required one or more individual statements
        * Consist of
            * Sid - optional identifier for statement
            * Effect - whether the statement "Allow" or "Deny the access"
            * Principal - account / user / role to which policy applied to
            * Action - list of actions this policy allows or denies
            * Resource - list of resources to which the actions applied to
            * Condition - optional condition for when the policy is in affect 
             
* Inline policy - policy that is embedded in IAM identity (User / Group / Role)
 
* Password Policy
    * Strong passwords - higher security for the account
    * AWS allows following password policies
        * Minimum password length
        * Require specific characters
            * Uppercase
            * Lowercase
            * Numbers
            * Non-alphabetic characters
        * Allow IAM users to change their own passwords
        * Require users to change their passwords after some time - password expiration
        * Prevent password re-use
         
* MFA - Multi Factor Authentication
    * MFA = password you know + security device you own
    * Main benefit - if a password is hacked or stolen, the account is not compromised
    * Options
        * Virtual MFA device
            * Support for multiple tokens on single device
            * Example
                 * Google Authenticator
                 * Authy
        * Universal 2nd Factor (U2F) Security key
            * Supports multiple root and IAM users using single security key
            * Example
                 * YubiKey by Yubico (3rd party)
        * Hardware Key Fob MFA Device
            * Example
                 * Gemalto (3rd party)
        * Hardware Key FOB MFA Device for AWS GovCloud
            * Example - SurePassID (3rd party)
 
## AWS Access
 
* Three options:
    * AWS Management Console    - Web user interface
    * AWS Command Line Interface - (CLI) - protected by access keys
    * AWS Software Development Kit - (SDK) - for code - protected by access keys
* Access Keys are generated from AWS console
* Users manage their own access keys

## Clouwatch / Cloudtrail
 
* Cloudwatch
    * AWS monitoring service for applications
    * Other features to collect, monitor and analyze application health
    * Features
        * Collect
            * Application Logs
            * AWS Service Logs - Maintenance, errors
        * Monitor 
            * Metric graphs (CPU, Memory)
            * Alarms
            * Traces
        * Analyse
            * Log insights - SQL style queries on log information
        * Other
            * Rules (CRON jobs)
            * EventBridge (App events)
 
* Cloudtrail
    * Auditing service for AWS account
    * Analyze who performed what actions and when on your resources - events
    * Events
        * Management
            * Administration events - creation, update, delete
            * Sign in, Sign Out
        * Data events
            * Queries on dynamodb
            * Invocations of lambda function
        * Insights
            * Tool for checking unordinary behaviour in terms of access or usage of application
 
## EC2
 
* AMI
    * Amazon Machine Image
    * Customization of EC2 instance
        * We add own software, configuration, operating system, monitoring
    * AMI are built for specific region and can be copied across regions
    * EC2 can be launched from
        * Public AMI - AWS provided 
        * Self-owned custom AMI - make and maintain yourself
        * AWS Marketplace AMI - made by someone else
* Image Builder
    * Used to automate creation of VM or container images
    * Automate creation, maintain, validate and test EC2 AMIs
    * Free service - only pay for underlying resources
    
     
* Shared Responsibility
    * AWS Customer
    * Infrastructure (global network security)    * Security Group rules
    * Isolation on physical hosts Operating-system patched and updates
    * Replacing faulty hardware Software and utilities installed on the 
        * EC2 instance
    * Compliance and validation IAM Roles assigned to EC2 & IAM user 
        * access management
    * Compliance validation Data security on the instance
 

## EC2 Storage
 
* EBS (Elastic Block Store) Volume
    * Network drive
    * Allows to persist data even after EC2 termination
    * Bound to specific AZ zone
    * Can be mounted to one instance at a time
    * Free tier - 30 GB
    * Snapshot can be moved across AZ
    * Have provisioned capacity
    * "Delete on termination" - Should the EBS be removed after EC2 termination?
    * Snapshot
        * Allows EBS to move data between AZ zones and regions
        * Types
            * EBS Snapshot Archive
                 * Similar to Glacier tier is S3
                 * 75% cheaper
                 * Takes 24 to 72 hours for restoring the archives
            * Recycle Bin for EBS Snapshots
                 * Rules to retain deleted snapshots so you can recover them after accidental deletion
                 * Specify retention (from day to year)
 
* Instance Store
    * Physically connected to EC2 instance
    * Better I/O performance - Input / Output
    * Will lose their storage when instance is stopped
    * Good for buffer / cache / scratch data
    * Risk of data loss when hardware fails
    * Backups and Replication is customer responsibility
 
* EFS (Elastic File System)
    * Shared Network File System
    * Can be mounted on 100s of EC2 instances
    * Works in multi AZ
    * Highly available, scalable
    * Storage class
        * Standard
        * Infrequent Access
            * Cost optimized for files not accessed every day
            * Savings up to 92% lower cost
            * EFS will automatically move your files to this class based lifecycle policy
            * Default policy
                 * Move files to EFS-IA after 30 days of not being used
                 * Move files from EFS-IA after the first use
 
* EBS vs EFS
* EBS EFS
* Network Drive Shared Network System
* Single AZ Multi AZ
* Capacity planning Pay per use
* Max 1 EC2 attachments Max 100 EX2 attachments
 
* Shared Responsibility
* AWS Customer
* Infrastructure    * Setting up backup/snapshot
* Replication for data for EBS    * Setting up data encryption
* volumes and EFS drive
* Replacing faulty hardware Responsibility of any data on the drives
* Ensuring employees cannot    *    Understand risks of using EC2 
* access your data    * Instance Store
 
* Amazon FSx
    * Launch 3rd party high performance file systems on AWS
    * Fully managed service
    * Types
        * Windows File Server
            * Highly reliable and scalable Windows native shared file system
            * Built on Windows File Server
            * Supports SMB protocol and Windows NTFS
            * Integrated with Microsoft Active Directory
            * Can be access from AWS or on-premise infrastructure
        * Lustre
            * High performance scalable file storage
            * Name derived from Linux and Cluster
            * Use Case
                 * Machine Learning
                 * Analytics
                 * Video Processing
                 * Financial Modeling

## EC2 Billing
 
* On-Demand
    * Short workload, predictable pricing, pay by second
    * No-long term commitment
    * Highest cost but no upfront payment
    * Recommended for
        * Short-term un-interrupted workloads, where you can't predict how the app will behave
         
* Reserved
    * Discount up to 72% compared to On-Demand
    * You specify
        * Instance attributes - Instance Type, Region, Tenancy, OS
        * Payment Options - No Upfront, Partial upfront, All upfront
        * Reserved Instance scope - Regional or Zonal 
    * Reserved Instances can be bought and sold on AWS Marketplace
    * Convertible Reserved Instance
        * Up to 66% discount
        * Can change: EC2 instance type, instance family, OS, scope and tenancy
    * Recommended for
        * Steady state usage applications - database
         
* Spot
    * Discount up to 90% compared to On-demand
    * Most cost-efficient instances in AWS
    * Recommended for
        * Workloads resilient to failure
        * Batch jobs
        * Data analysis
        * Image processing
        * Distributed workloads
        * Workloads with flexible start and end time
    * Not suitable for critical jobs or databases
     
* Dedicated Host
    * Physical server
    * Is ALWAYS the same physical machine also after restarting dedicated to only one customer
    * Most expensive
    * Purchasing options
        * On-demand - pay per second for active Dedicated Host
        * Reserved - 1 or 3 years - no upfront, partial upfront, all upfront
    * Recommended for
        * Servers that need software licenses
        * Companies that has string regulatory or compliance needs
         
* Dedicated Instance
    * Hardware that's dedicated to you
    * Can be different physical machine after restarting dedicated to only one customer
    * May share hardware with other instances in same account
    * No control about instance placement
 
* Savings Plan
    * Discount based on long-term usage - up to 72%
    * Commit to usage
        * Dollars per used hour - $10/hour
        * Long term commitment - 1 or 3 years
    * Locked to specific instance family & AWS region
    * Flexible across
        * Instance size - m5.xlarge, m2.micro
        * OS - Linux, Windows
        * Tenancy - Host, Dedicated
 
* Capacity Reservation
    * On-Demand instances capacity in specific AZ for any duration
    * Always access to EC2 when needed
    * No time commitment, no billing discounts
    * Combine with Regional Reserved Instances and Savings Plan
    * Charged On-Demand rate whether the instances are run or not
    * Recommended for
        * Short-term uninterrupted workloads that needs to be in specific AZ

## Availabilty, Scalability, Elasticity
 
* Scalability
    * Application can handle ngreated loads by adapting
    * Scalability is linked but different to High Availability
    * Two kinds
        * Vertical Scalability
            * Increasing size fo the instance
            * Common for distributed systems - database
            * There is a hardware limit on how much you can scale
            * Example
                 * Application runs on t2.micro
                 * Scale is vertically to t2.large instance 
        * Horizontal Scalabiity = elasticity
            * Increase number of instances
            * Horizontal scaling implies distributed systems
            * It is easy to horizontally scale thanks to AWS EC2 and auto-scaling groups
            * Use Load Balancer to distribute the load
            * Multi AZ
                 * Auto Scaling Group multi AZ
                 * Load Balancer multi AZ
            * Example
                 * Application runs on 2.micro
                 * New t2.micro instance is created that handles the app requests
             
* High Availability
    * Means running the application in at least 2 Availability Zones
    * Goal of it is to survive data center loss (disaster)
     
* Agility
    * Distractor
    * New IT resources are just click away
    * Means that time to make new resources is reduced from weeks to just minutes

## Elastic Load Balancer
 
* Spread load across multiple downstream instances
* Expose single point of access (DNS) to the application
* Seamlessly handle failures of downstream instances
* Regular health checks on the instances
* Provide SSL termination for the websites
* High availability across zones
 
* Managed load balancer by AWS
* Kinds
    * Application Load Balancer (HTTP, HTTPS) - Layer 7
    * Network Load Balancer (ultra-high performance, allows for TCP) - Layer 4
    * Classic Load Balancer (slowly retiring) Layer 4 & 6
 
* Auto-scaling group (ASG)
    * Load on websites can change
    * In cloud, creating and getting rid of servers is very quick
    * Cost savings - run at an optimal capacity
    * Responsibility
        * Scale out    * (add EC2 instances) to match increased load
        * Scale in (remove EC2 instances) to match a decreased load
        * Minimum and maximum number of machines running
        * Automatically register new instances to a load balancer
        * Replace unhealthy instances
    * Scaling Strategies
        * Manual Scaling
            * Update the size of ASG manually
        * Dynamic Scaling
            * Respond to changing demand
            * Example
                 * When CloudWatch alarm is triggered (CPU > 70%), add 2 units
                 * When CloudWatch alarm is triggered (CPU < 30%), remove 2 units
        * Target tracking Scaling
            * Example
                 * Average SG CPU to stay around 40%
        * Scheduled Scaling
            * Anticipate a scaling based on know usage patterns
            * Example
                 * Increase the min capacity to 10 at 5 pm on Fridays
        * Predictive Scaling
            * Uses Machine Learning to predict future traffic ahead of time 
            * Automatically provision the right number of EC2 instances
            * Useful when the load balancer has predictable time-based patterns

    
## S3
 
* Simple Storage Service
* Infinitely scaling storage
* Many websites use S3 as backbone and integration
* Use cases
    * Backup and storage
    * Disaster Recovery
    * Archive
    * Hybrid Cloud Storage
    * Application hosting
    * Data lakes
    * Static website
* Allows to store objects (files) in buckets (directories)
* Must have globally unique name - across all regions all accounts
* Buckets are defined at the region level
* Key is the full path - prefix + object name
* Max object size is 5TB
* Metadata (list of text / key value pairs)
* Tags
* Version ID if versioning is enabled
 
* Classes
    * Standard
        * Access in milliseconds 
        * Actively accessed data
    * Standard Infrequent Access
        * Access in milliseconds
        * Up to 40% savings
        * Infrequently accessed data
    * Glacier
        * Access in minutes to hours
        * Up to 60% savings
        * Archive data
    * Glacier Deep Archive
        * Access in hours
        * Up to 90% savings
        * Long Term Archive data
    * Intelligent-Tiering
        * Small monthly monitoring and auto-tiering fee
        * Moves objects automatically across access tiers based on usage
        * No retrieval charges
        * Access tiers
            * Frequent - default tier
            * Infrequent - objects not accessed for 30 days
            * Archive instant - objects not accessed for 90 days 
            * Archive - optional, configurable from 90 days to 700+ days
            * Deep Archive - optional, from 180 days to 700+ days

             
* All classes has the same
    * Durability (3AZ's)
    * Security Controls
    * Encryption available
* Lifecycle policies
    
## AWS Organization
 
* Global service
* Allows to manage multiple AWS accounts
* Benefits
    * Consolidated Billing across all accounts - single payment method
    * Pricing benefits from aggregated usage (volume discount for EC2, S3)
    *    Pooling of Reserved EC2 instances for optimal savings
* API is available to automate AWS account creation
* Restrict account privileges using SCP (Service Control Policies)
* Multi account Strategies
    * Per department
    * Per cost centre
    * Per dev / test / prod
    * Isolated account for logging
* Multi account vs one account multi VPC
* Use tagging standards for billing purposes
* Enable CloudTrail on all account, send logs to central S3 account
* Send CloudWatch logs to central account
* OU - Organization Unit
 
* Service Control Policies
    * Whitelist or blacklist IAM action
    * Applied at the OU or Account Level
    * Does not apply to the master account
    * SCP is applied to all the users and roles of the account including root
    *    Use cases
        * Restrict access to certain services
        * Enforce PCI compliance by explicitly disabling services
 

## AWS Control Tower
 
* Easy way to setup and govern a secure and compliant multi-account AWS environment based on best practises
* Benefits
    * Automate the set up of your environment in clicks
    * Automate ongoing policy management using guardrails
    * Detect policy violations and remediate them
    * Monitor compliance through an interactive dashboard
* AWS Control Tower runs on top of AWS Organizations
    * Automatically sets up AWS Organizations to organize accounts and implement SCPs 
 
## Pricing Models
 
* AWS has 4 pricing models
    * Pay as you go
    * Save when you reserve
    * Pay less by using more
    * Pay less as AWS grows - economics by scale
 
* Free services
    * IAM
    * VPC
    * Consolidated Billing
    * Elastic Beanstalk - you pay only for underlying resources
    * CloudFormation - you pay only for underlying resources
    * Auto Scaling Groups - you pay only for underlying resources
 
* Savings Plan
    * Commit a certain $ amound per hour for 1 or 3 years
    * Easiest way to setup long-term commitments on AWS
    * Types
        * EC2 Savings Plan
            * Up to 72% discount compared to On-Demand
            * Commit usage of individual instance families in region
            * Regardless of AZ, size, OS, or tenancy
            * All upfront, partial upfront, no upfront
        * Compute Savings Plan
            * Up to 66% discount compared to On-Demand
            * Regardless of Family, Region, Size, OS, tenancy compute options
            * Compute Options: EC2, Fargate, Lambda
 
* AWS Compute Optimizer
    * Reduces costs and improve performance by recommending optimal AWS resources for your workloads
    * Helps you choose optimal configurations and right-size your workloads
    * Uses Machine Learning to analyze your resources' configurations and their utilizations CloudWatch metrics
     
*    Billing and Costing Tools
    * Estimating costs in the cloud
        * Pricing Calculator
    * Tracking costs in the cloud
        * Billing Dashboard
        * Cost Allocation Tags
        * Cost and Usage Reports
        * Cost Explorer
    * Monitoring against costs plans
        * Billing Alarms
        * Budgets
## Disaster Recovery Plan
 
* CloudEndure Disaster Recovery
    * Continously replicates your machines into a low-cost staging area in yout target AWS account and preffered region
    * Fast and reliable recovery in case of IT data centres failures
     
* Business Continuity Plan - BCP
    * Document that outlines how a business will continue operating during an unplanned disruption in services
     
* Options
    * Backup and restore 
        * Backup data and restore to new infrastructure
        * RPO/RTO - Hours
         
    * Pilot light
        * Data is replicated to another region with the minimal services running
        * RPO/RTO - 10 minutes
         
    * Warm standby
        * Scaled down copy of the infrastructure, ready to scale up
        * RPO/RTO - minutes
    
    * Multi-site Active-active
        * Scaled up copy of your infrastructure in another region
        * RPO/RTO - RealTime

## AWS Deployment
 
* AWS Code Deploy
    * Deploy out application automatically
    * Works with 
        * EC2 Instances
        * On-Premises Server
 
* AWS CodeCommit
    * Store code in AWS in version control repository
    * Source-control service that hosts Git-based repositories
    * AWS Alternative to GitHub
     
* AWS CodeBuild
    * Code Building service in the cloud
    * Compiles source code, run tests and produces packages that are ready to be deployed
    * Benefits
        * Fully managed, serverless
        * Continuously scalable and highly available
        * Secure
        * Pay as you go pricing - only pay for build time
 
* AWS CodePipeline
    * Orchestrate different steps to have code automatically pushed to production
    * Basis for CICD (Continuous Integration and Continuous Delivery)

* AWS CodeArtifact
    * Artifact management system
    * Software packaged depend on each other to be built - code dependencies
    * Secure, scalable and cost-effective artifact management for software development
    * Developer and CodeBuild can then retrieve dependencies straight from CodeArtifact
     
* AWS CodeStar
    * Unified UI
    * To easily manage software development activities in one place
    * "Code generator" for the software development activities
 
* AWS Cloud9
    * Cloud IDE
    * Used for writing, running and debugging code
    * Can be accessed through internet
    * Allows code collaboration in real-time

## Security Services
 
* AWS Inspector
    * How do we prove an EC2 Instance is Harden?
    * Hardening - act of eliminating as many security risks as possible
    
    * Runs a security benchmark against specific EC2 instances
    * We can run a variety of security benchmarks
    * Can perform both Network and Host assessments
    * Used only for EC2 and ECR
    * Continuous scanning for
        * Package Vulnerability
        * Network reachability
 
* AWS WAF
    * Web Application Firewall 
    * Protect your web application from common web exploits
    * Write your own rules to ALLOW or Deny traffic based on the contents of an HTTP requests
    * Use ruleset from a trusted AWS Security Partner in AWS WAF Rules Marketplace
    * Can be attached to either CloudFront or an Application Load Balancer
    * Protect Web application from attacks covered in the OWASP Top 10 most dangerous attacks
        * 1. Injection
        * 2. Broken Authentication
        * 3. Sensitive Data Exposure
        * 4. CML External Entities
        * 5. Broken Access Control
        * 6. Security misconfiguration
        * 7. Cross Site Scripting
        * 8. Insecure Deserialization
        * 9. Using Components with known vulnerabilities
        * 10. Insufficient logging and monitoring
 
* AWS Shield
    * Managed DDoS protection
    * DDoS - Malicious attempt to disrupt normal traffic by flooding a website with large amount of fake traffic
    * All AWS customers benefits from the automatic protections of AWS Shield Standard - no additional charge
    * AWS Shield Standard is automatically turned on for Route53 routing and CloudFront
     
* Amazon Guard Duty
    * Is IDS and IPS
    * IDS/IPS - Intrusion Detection System and Intrusion Protection System
    * Is a thread detection service that continuously monitors for malicious, suspicious and unauthorized behaviors
    * Uses ML learning and data gathered from
        * CloudTrail Logs
        * VPC Flow Logs
        * DNS logs
 
* AWS Config
    * Helps with auditing and recording compliance of AWS resources
    * Questions solved by AWS Config
        * Is there unrestricted SSH access    * to security groups?
        * Does bucket has public access?
        * How does ALB configuration change over time?
     
* Amazon KMS
    * AWS manages keys for customer
    * Managed service that makes it easy to create and control the encryption keys used to encrypt data
    * KMS is a multi tenant HSM - Hardware Security Model
    * Many AWS services are integrated to use KMS
    * Uses Envelope encryption - encrypting the key for data
     
* Amazon CloudHSM
    * CloudHSM - AWS provisions encryption hardware
    * Dedicated hardware 
    * Customer manage his own encryption keys
 
* Types of Customer Master Keys - CMK
    * Customer Managed CMK
        * Created, managed and used by the customer, can enable or disable
        * Possibility of rotation policy
    
    * AWS Managed CMK
        * Created, managed and used on the customer's behalf by AWS
        * Used by AWS services
    
    * AWS Owner CMK
        * Collection of CMKs that an AWS service owns and manages to use in multiple accounts
        * AWS can use those to protect resources in customer account
    
    * CloudHSM Keys (custom keystore)
        * Keys generated from your own CloudHSM hardware device
        * Cryptographic operation are performed within the CloudHSM cluster
 
* Amazon Macie
    * Fully managed service
    * S3 data access monitoring service for anomalies and generated detailed alerts when Detects risk of unauthorized access
    * Uses ML to analyze CloudTrail logs
    * Example alerts
        * Anonymized access
        * Config compliance
        * Credential Loss
        * Data compliance
        * File Hosting
        * Information Loss
     
* AWS Certificate Manager - ACM
    * Alternative to CertManager in Kubernetes
    * Easy provision, manage and deploy SSL/TLS Certificates
    * Free of charge for public TLS certs
 
* Secrets Manager
    * Meant for storing secrets
    * Capability to force rotation of secrets every X days
    * Paid service
    * Mostly Meant for RDS integration     
 
## Support plans
 
* Guidance
* General Guidance
* 24 h
* Developer, Business, Enterprise
 
* System Impaired
* 12 h
* Developer, Business, Enterprise 
 
* Production system impaired
* 4 h
* Business, Enterprise
 
* Production system down
* 1 h
* Business, Enterprise
 
* Business Critical system down
* 15 min
* Enterprise
 
 
* Response times for guidance
* 24 h - General guidance
* 12 h - System impaired
* 4 h - Production system impaired
* 1 h - Production system down
* 15 min - Business Critical System Down
 
* Prices
* 0$ - Basic
* 20$ - Developer
* 100$ - Business
* 15000$ - Enterprise
 
* Plans
* Basic
* 0$
* 7 advisors checks
* Email support only for billing and account
 
* Developer
* 20$
* 7 advisor checks
* Email support 24h
* General Guidance
* System impaired
 
* Business
* 100$
* Unlimited advisor checks
* Email support 24h
* 24/7 chat and phone support
* General Guidance
* System impaired
* Production system impaired
* Production System down
 
* Enterprise
* 15000$
* Unlimited advisor checks
* Email support 24h
* 24/7 chat and phone support
* General Guidance
* System impaired
* Production system impaired
* Production system down
* Business critical system down
* TAM
* Personal Concierge
 
* Support
* Email support
* 24 h
* Developer, Business, Enterprise
 
* Phone & support
* 24/7
* Business, Enterprise
 
* TAM
* Enterprise
 
* Personal concierge
* Enterprise
 
* Trusted Advisor checks
 
* 7
* Basic, Developer
 
* Unlimited
* Business, Enterprise
 
* Advisors checks
    * Basic, Developer - 7 checks
    * Business, Enterprise - all checks
* Email support
    * Developer, Business, Enterprise - 24 hours response time
    * Basic - none
* Phone, Chat support
    * 24/7
    * Business, Enterprise
* General Guidance
* Developer, Business, Enterprise 
* System impaired
* Developer, Business, Enterprise
* Production system impaired
* Business, Enterprise
* Production system down
* Business, Enterprise
* Business Critical system down
* Enterprise
* Personal Concierge
* Enterprise
* TAM
* Enterprise
 
* Waiting times
* 24 h General help
* 12 h System is impaired
* 4 h Production system is impaired
* 1 h Production system is down
* 15 m Business critical system is down
 
## AWS Billing Services
 
* AWS Cost Explorer
    * Let's you visualize, understand and manage AWS costs over time
    * Multiple account AWS organizations will contain information in master account
    * Contains Forecasting 
 
## Global Infrastructure
 
* AWS Outposts
    * Hybrid Cloud
    * Server racks that offers the same AWS infrastructure, services, APIs and tools to build your own application on-premises just as in the cloud
    * AWS will setup and manage "Outposts Racks" within on-premises infrastructure for ton start leveraging
    * Customer is responsible for the outposts rack physical security
    * Benefits
        * Low latency    * access to on-premises system
        * Local data processing
        * Easier migration from on-premises to the cloud
        * Fully managed service
    * Works with: EC2, EBS, S3, EKS, ECS, RDS, EMR
     
* S3 Transfer Acceleration
    * Increase speed by transferring to an AWS edge location which will forward the data to the S3 bucket in the target region
     
* AWS Global Accelerator
    * Improve global application availability and performance using AWS global network
    * Uses nearest edge location from the caller to reroute traffic to the application
    * Leverage the AWS internal network to optimize the route to your application
    * 2 Anycast IP are created for the application and traffic is sent through Edge Locations
     
* AWS Global Accelerator vs CloudFront
    * Both use AWS global network and its edge location around the world
    * Both services integrate with AWS Shield for DDoS protection
    * CloudFront - Content Delivery Network
        * Improves performance for your cacheable content - images, videos
        * Content is served at the edge location
    * Global Accelerator
        * No caching, proxying packets at the edge to applications running in one or more AWS Regions     
        * Improve performance for a wide range of applications over TCP or UDP
         
* AWS WaveLength
    * Infrastructure deployment embedded withing the telecommunications providers' datacentres at the edge of the 5G network
    * Used for ultra-low latency applications
    * No additional charges or service agreements
    * Traffic does not leave Service Provider's (CSP) network for (ex.: Telecom)
     
* AWS LocalZone
    * Places AWS compute, storage, database and other selected AWS services closed to end users to run latency sensitive applications
    * Extend your VPC to more locations
    * Compatible with EC2, RDS, ECS, EBS, ElastiCache, Direct Connect
    * Example
        * AWS Region - N. Virginia
        * AWS Local Zones - Boston, Chicago, Dallas, Houston, Miam 
    
## Architecting
 
* Well architected framework
    * Stop guessing your capacity needs
    * Test systems at production scale
    * Automate to make architectural experimentation easier
    * Allow for evolutionary architecture
    * Drive architectures using data
    * Simulate through game days
* Design principles
    * Scalability
    * Disposable Resources
    * Automation
    * Loose Coupling
    * Services not Servers
* Well Architected Framework
    * 1. Operational Excellence
    * 2. Security
    * 3. Reliability
    * 4. Performance Efficiency
 
* 1. Operational Excellence
    * Principles
        * Perform operations as code
        * Annotate documentation
        * Frequent and small reversible changes
        * Refine operations procedures frequently
        * Anticipate failure
        * Learn from all operational failures
    * AWS services
        * Prepare
            * AWS CloudFormation
            * AWS Config
        * Operate
            * AWS CloudFormation
            * AWS Config
            * AWS CloudTrail
            * Amazon CloudWatch
            * AWS X-Ray
        * Evolve 
            * AWS CloudFormation
            * AWS CodeBuild
            * AWS CodeCommit
            * AWS CodeDeploy
            * AWS CodePipeline
* 2. Security
    * Includes ability to protect information, systems and assets delivering business value
    * Principles
        * Implement a strong identity foundation
        * Enable traceability
        * Apply security at all layers
        * Automate security best practises
        * Protect data in transit and at rest
        * Keep people away from data
        * Prepare for security events
    * AWS Services
        * Identity and Access Management
            * IAM
            * AWS-STS
            * MFA token
            * AWS Organizations
        * Detective Controls
            * AWS Config
            * AWS CloudTrail
            * Amazon CloudWatch
        * Infrastructure Protection
            * Amazon CloudFront
            * AWS Shield
            * AWS WAF
            * Amazon Inspector
        * Data Protection
            * AWS KMS 
            * AWS S3
            * AWS ELB
            * Amazon EBS
* Amazon RDS
        * Incident response
            * IAM
            * AWS CloudFormation
            * Amazon CloudWatch Events
* Reliability
    * Ability of system to recover from infrastructure or service disruptions
    * Principles
        * Test recovery procedures
        * Automatically recover from failure
        * Scale horizontally
        * Stop guessing capacity
        * Manage change in automation
    * AWS Services
        * Foundation
            * IAM
            * Amazon VPC
            * Service Quotas
            * Trusted Advisor
        * Change Management
            * AWS Auto Scaling
            * Amazon CloudWatch
            * AWS CloudTrail
            * AWS Config
        * Failure Management
            * Backups
            * AWS CloudFormation
            * Amazon S3
            * Amazon Route 53
* Performance Efficiency
    * Includes ability to use computing resources to meet system requirements
    * Design principles
        * Democratize advanced technologies
        * Go global in minutes
        * Use serverless architectures
        * Experiment more often
        * Mechanical sympathy
    * AWS Services
        * Selection
            * Auto Scaling
            * AWS Lambda
            * EBS
* RDS
        * Review
            * AWS CloudFormation
            * AWS News Blog
        * Monitoring
            * Amazon CloudWatch
            * AWS Lambda
        * Tradeoffs
            * AWS RDS
            * AWS ElastiCache
            * AWS Snowball
            * Amazon CloudFront
* Cost Optimization
    * Includes to run systems to deliver business value at lowest price point
    * Design principles
        * Adopt consumption mode
        * Measure overall efficiency
        * Stop spending money on data centre operations
        * Analyse and attribute expenditure
        * Use managed and application level services to reduce cost of ownership
    * AWS Services
        * Expenditure Awareness
            * AWS Budgets
            * AWS Cost and Usage Report
            * AWS Cost Explorer
            * Reserved Instance Reporting
        * Cost-Effective Resources
            * Spot instance
            * Reserved Instance
        * Matching supply and demand
            * AWS Auto Scaling
            * AWS Lambda
        * Optimizing Over Time
            * AWS Trusted Advisor
            * AWS Cost and Usage Report
