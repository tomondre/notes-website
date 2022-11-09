---
hide:
  - navigation
---


# Infrastructure as Code

* Problems with manual configuration
      - Allows easily starts 
      - Easy to misconfigure a service though human error
      - Hard to manage expected state
      - Hard to transfer configuration knowledge to other team members

* Infrastructure as Code
    * Write a configuration script to automate creating, updating or destroying cloud infrastructure
    * IaC is a blueprint of the infrastructure
    * IaC allow to easily share, version or inventory the cloud infrastructure
     
* Tools
    * Declarative
        * What you see, is what you get
        * More verbose but zero change of mis-configuration
        * User scripting languages - JSON, YAML, XML
        * Azure Blueprints
        * CloudFormation
        * Terraform
    * Imperative
        * You say what you want, the rest if filled in - implicit
        * Less verbose, could end up with misconfiguration
        * Does more declarative
        * Uses programming language
           * Python, Ruby, JavaScript
        * AWS Cloud Development Kit
        * Pulumi
        
* Terraform - Declarative + Imperative
    * Loops
    * Dynamic blocks
    * Locals
    * Complex Data Structure - Maps, Collections

## Configuration Drift

* When a provisioned infrastructure has an unexpected configuration change
    * Team members manually adjusting configuration options
    * Malicious actors
    * Side-affect from APIs, SDK or CLIs
* Unnoticed could be loss or breach of cloud services and residing data or result in interruption of services or unexpected downtime

* How to detect
    * Compliance tools
        * AWS Config
        * Azure Policies
    * Built-in support for drift detection - AWS CloudFormation Drift Detection
    * Storing the expected state Terraform state files

* How to correct
    * Compliance tool can remediate misconfiguration - AWS Config
    * Terraform refresh and plan commands
    * Manually correcting the configuration - not recommended
    * Tearing down and setting up infrastructure again

* How to prevent
    * Immutable infrastructure
        * Always create and destroy, never reuse, Blue Green deployment strategy
        * Servers are never modifies after they are deployed
        * Using GitOps to version version control IaC, and peer review every single via Pull Requests change to infrastructure
        

## Infrastructure Lifecycle

* Number of clearly defined and distinct phases which are used by DevOps Engineers to plan, design, build, test, deliver, maintain and retire
* Days
    * Not 24 hours a day - these are just phases
    * Day 0 - Plan and Design
    * Day 1 - Develop and Iterate
    * Day 2 - Go Live and maintain
    * 
Infrastructure as Code
    * Idempotent - can be run many times, the same state is expected
    * Consistent
    * Repeatable
    * Predictable
    * Manageability
        * Enable mutation via code
        * Revised with minimal changes
    * Sensibility
        * Avoid financial and reputational losses to even loss of life when considering government and military dependencies infrastructure


## Provisioning
* Prepare a server with systems, data and software and make it ready for network operation
* Example 
    * Puppet
    * Ansible
    * Chef
    * Bash
    * PowerShell
## Deployment
* Act of delivering a version of application to run on provisioned server
* Example 
    * AWS CodePipeline
    * Jenkins
    * CircleCI
    * GitHub Actions
## Orchestration
* Act of coordinating multiple systems or services
* Example
* Kubernetes

## GitOps

* Take IaC and use git repository to introduce a formal process to review and accept changed to infrastructure code.
* Once accepted, automatically trigger a deploy.

## Immutable

* Terraform encourages architects towards immutable infrastructure
* Guarantees
    * Cloud Resource Failure
        * What if an EC2 Instance fails a status check
    * Application failure
           * What if post installation script fails?
    * Time to Deploy - what if the deployment is needed in hurray
    * Worst Case Scenario
        * Accidental Deletion
        * Compromised by malicious actor
        * Need to Change Regions - region outage

## Hashicorp

* Company specializing in managed open-source tools used to support the development and deployment of large-scale service-oriented software installation
* Hashicorp cloud platform
    * Unified platform to access HashiCorp various product
    * Services are cloud agnostic - support for the main service providers
    * Highly suited for multi-cloud workloads

* Products
    * Boundary -Secure remote access to systems based on trusted entity
    * Consul - Service discovery platform
    * Nomad - Scheduling and deployment of tasks across worker nodes
    * Packer - Tool for building virtual-machine images for later deployment
    * Terraform - Infrastructure as code software which enables provisioning and adapting infrastructure across CSPs
    * Vagrant - Building and maintenance of reproductible software development environment using VM
    * Vault - Secrets management, identity based access
    * Waypoint - modern workflow to build, deploy and release across platforms

## Terraform


* Open Source
* Cloud Agnostic
* Infrastructure as Code tool
* Uses declarative configuration files
* Features
    * Installable modules
    * Plan and predict changes
    * Dependency graphing
    * State management
    * Provision infrastructure in familiar languages
    * Terraform registry with 1000+ providers
* Terraform Cloud
    * Software as Service
    * Used for
        * Remote state storage
        * Version Control Integrations
        * Flexible workflows
        * Collaborate on Infrastructure changes in a single unifies web portal

* Use Cases
    * Exotic providers
        * Supports a variety of providers outside of GCP, AWS, Azure
        * Sometimes is the only provider
        * Open-Source, extendable so any API can be used to create IaC tooling
    * Multi-Tier applications
        * Makes it easy to divide large and complex apps into modules
    * Disposable Environments
        * Easily stand up an environment for software demo or temporary development environment
    * Resource schedulers 
        * Terraform is not just defined to infrastructure of cloud resource, but can be used to schedule dynamic Docker containers, Hadoop, Spark, …
    * Multi-Cloud Deployment
        * Terraform is cloud agnostic and allows a single configuration to be used to manage multiple providers
* Logical split
    * Terraform Core
        * Uses RPC calls to communicate with Terraform plugins
    * Terraform Plugins
        * Expose an implementation for specific service or provisioner

## Lifecycle

1. Code - Write or update Terraform configuration file
2. Init - Initialize project, pull latest providers
3. Plan - Speculate what will change
4. Validate - Ensure types and values are valid
5. Apply - Execute Terraform plan and provision the infrastructure
6. Destroy / Go to 1.

## Handle Change

* Change Management
    * Standard approach to apply change and resolving conflicts brough by change
    * In the context of IaC, Change management is procedure that will be followed when resources are modifies a and applied via configuration script
* Change Automation
    * Way of automatically creating consistent systematic and predictable way of managing change requests
    * Terraform uses this to apply and review complex change sets in the form of
        * Execution Plans
        * Resource Graphs
        
* Execution Plan
    * Manual review of what will add, change or destroy before the apply
* Visualizing Execution Plans
    * Terraform graph command will output a GrapViz file that can be viewed
    * This graph represents the execution plan and the relationships between resources


## Commands

* Main commands
    * terraform init
    * terraform validate
    * terraform plan
    * terraform apply
    * terraform destroy
* Other commands
    * terraform console
    * terraform fmt
    * terraform force-unlock
    * terraform get
    * terraform graph
    * terraform import
    * terraform login
    * terraform logout
    * terraform output
    * terraform providers
    * terraform refresh
    * terraform show
    * terraform state
    * terraform taint
    * terraform test
    * terraform untaint
    * terraform version    
    * terraform workspace

## Provisioners

* Installs software, edit files and provision machines created with Terraform
* Terraform allows to work with two different provisioners
    * Cloud-init
        * Industry standard for cross-platform cloud instance initialization
        * When a VM is launched, we need provide a YAML or Bash Script
    * Packer
        * Automated image-builder service
        * Similar to EC2 Image builder
        * We provide a configuration file to create and provision the machine image and the image is delivered to repo
        * Cloud Agnostic
        * Provisioners should be used as a last resort
        * Most common situation there are better alternatives

* Local-exec
    * Allows to execute local commands after a resource is provisioned
    * The machine that is executing Terraform - terraform apply - is where the command will execute
    * A local environment can be
        * Local Machine
        * Build Server
        * Terraform Cloud Run Environment
    * Example usage
        * After the VM is provisioned, there is a need to supply Public IP to a third-party security service to add the VM IP address
* Remote-exec
    * Allows to execute commands on a target resource, after a resource is provisioned
    * Useful for provisioning a Virtual Machine with a simple set of commands
    * For more complex tasks, it is recommended to use Cloud-init
    * It is strongly recommended in all cases to bake Golden Images via Packer or EC2 Image Builder
    * Three modes
        * Inline - List of command strings
        * Script - Relative or absolute local script that will be copied to the remote resource and then executes
        * Scripts - Relative or absolute local scripts that will be copied to the remote resource and then executed in order
* File
    * Used to copy files or directories from local machine to the newly created resource
    * Structure
        * Source - Local file we want to upload to the remote machine
        * Content - Direct content that can be used instead of the source
        * Destination - Where the file/content should be uploaded on the remote machine
    * You may require a connection block

* Connection block
    * Tells a provisioner or resource how to establish a connection
    * With SSH, we can connect through a Bastion Host 
    * We can also connect via Windows Remote Management - winrm
* Null resources
    * Placeholder for resources that have no specific association to provider resources
    * Often used with triggers
        * Trigger - map of values which should cause the set of provisioners to re-run
    * Values are meant to be interpolated references to variables or attributes of other resources

## Providers

* Terraform plugins
* Is a plugin that is a mapping to a Cloud Service Provider API
* Always has documentation and code sample
* Allows to interact with
    * Cloud Service Providers, AWS, Azure, GCP
    * Software Service (SaaS) - GitHub, Stripe
    * Other APIs - Kubernetes Postgres
* Providers block is required for the module to work
* Tiers
    * Official
        * Published by the company that owns the provider technology or service
    * Verified
        * Actively maintained, up-to-date 
        * Compatible with both Terraform and Provider
    * Community
        * Published by community member
        * No guarantee of maintenance, up-to-date or compatibility

* terraform init
    * Providers are distributed separately from Terraform and the plugins must be downloaded before use using this command
    * Will download provider plugins listed in a Terraform configuration files
     
* Terraform Provider Configuration
    * Alias
        * Can be used for an alternative provider
        * In the resource, can be referenced via 'provider' attribute
        * In the parents module, can be reference using 'configuration_aliases' attribute
        * In the child module, can be referenced using  'providers' attrbibute
## Registry

* Website portal
* Contain module code samples
* Allows to brows, download or publish available Providers or Modules
* Everything published to Terraform Registry is public-facing
* Private Registry
    * Allows to publish private modules for organization within the Terraform Cloud Private Registry
    * When creating a module, a Version Control System (VCS) and repository needs to be chosen 

## Modules

* Group of configuration files that provide common configuration functionality
* Benefits
    * Enforces best practises
    * Reduce amount of code
    * Reduce time to develop scripts
* Uses shorthand Domain Specific Language (DSL)
* Reduces the amount of work

## Fine Line

* Understanding of granularities of responsibility between Infrastructure as Code and Third-Part Configuration Management
* Who should automate what?
    * Terraform
        * Providers
           * Create Postgres Database
        * Modules
           * Create a Postgres User
        * Provisioners
           * Stage seed Data - one time
    * Ansible
        * Backup tables to Datawarehouse
        * Truncate daily tables

## Files
* Contain configuration infromation about providers and resources
* Any file with extension .tf or .tf.json
* Terraform files are written in Terraform Language
* Basic elements
    * Block
        * Containers for other content, represent an object
        * Structure
           * Block Type - "resource"
           * Block Label - "aws_vpc"
           * Block Name - "main"
    * Argument
        * Assign a value to name
        * Appear within blocks
    * Expression
        * Represent values, either literally or by referencing and combining other values
        * They appear as values for arguments or within other expressions


* JSON
    * Terraform supports alternative syntax that is JSON-compatible
    * Syntax useful when generating portions of a configuration programmatically, since existing JSON libraries can be used to prepare the generated configuration files
     
* HCL
    * Open-source toolkit for creating structured configuration languages that are both human readable and machine friendly
    * Terraform Language
    * Can be extended with functionalities - .tf contains dynamic blocks

## Settings

* Terraform configuration block type
* Used to configure some behaviours of Terraform itself
* We can specify
    * required_version - expected version of terraform
    * required_providers - providers that will be pull during an terraform init
    * experiments - experimental language feature that the community can try to provide feedback 
    * provider_meta - module specific information for providers


## Variables

* Input Variables
    * Parameters to Terraform Modules
    * Can be declared in
        * Root module
        * Child modules
    * Properties
        * Default - default value
        * Type - what types are accepted for the variable
        * Description - specifies input variable documentation
        * Validation - block to define validation rules
        * Sensitive - limit Terraform UI output when the variable is used in configuration
* Variable Definition Files
    * Allows to set values for multiple variables at once
    * Variable definition files are named .tfvars of tfvars.json
    * By default, terraform.tfvars will be autoloaded when included in the root of the project directory
     
* Environment Variables
    * A variable value can be defined by Environment Variables
    * Variable starting with TF_VAR_<name> will be read and loaded

* Load Input Variables
    * Default Autoloaded Variables File
        * terraform.tfvars
        * Automatically loaded when running terraform apply
    * Additional Variables Files
        * <name>.tfvars
        * Not autoloaded - needs to ne specified via command line
        * We can create additional  variables files - dev.tfvars, prod.tfvars
    * Additional Variables Files
        * Autoloaded
        * If the name of the file is auto.tfvars, then it will be always auto-loaded
    * Specify a Variables file via CLI
        * -var-file <name>.tfvars
        * Can specify variables file inline via the command line
    * Specify individual overrides via CLI
        * -var ec2_type="t2.medium"
        * Can override specific variables  individually via the CLI
    * Environment Variables
        * TF_VAR_my_variable_name
        * Terraform will watcg for environment variables that begin with TF_VAR_ and apply those variables
* Variable Definition Precedence
    * 1. Environment variables
    * 2. terraform.tfvars
    * 3. terraform.tfvars.json
    * 4. * .auto.tfvats or * .auto.tfvars.json
    * 5. -var and -var-file cli command
## Outputs
* Computed values after a Terraform apply is performed
* Allows to
    * Obtain information after resource provisioning - public IP address
    * Output a file of values for programmatic integration
    * Cross-reference stack via outputs in a state file via terraform_remote_state
* Sensitive
    * Output values can be marked sensitive so that the values does not show in the terminal
    * ! Sensitive outputs are visible in the state file
* Terminal CLI
    * terraform outputs - prints all outputs for a state file
    * Terraform outputs <name> print a specific output
    * -json - flag that will create output data in the json format
    * -raw - flag to preserve quotes for strings

## Local Values

* Assigns a name to an expression
* Enables to use local value multiple times within a module without repeating
* These values are set using locals block
* Multiple local blocks can be defined
* Locals can be referenced withing locals
* Can be references using local.<name>

## Data Source
* Allows Terraform to use information defined
    * Outside of Terraform
    * Defined by another separate Terraform configuration
    * Modified by functions
* Can be referenced via data keyword


## References

* Built-in expressions to reference various values 

* Resources - <Resource Type>.<Name> - aws_instance.my_server
* Input Variables - var.<Name> - var.my_var
* Local Values - local.<Name> - local.my_local
* Child Module Outputs - module.<Name> - module.public_ip
* Data Sources - data.<Data Type>.<Name> - data.aws_vpc.cidr
* Filesystem and workspace info
* path.module - path of the module where the expression is places
* path.root - path of the root module of the configuration
* path.cwd - path of the current working directory
* terraform.workspace

* Block-local values
    * count.index - when count meta as argument is used
    * each.key / each.value - when for_each meta argument is used
    * self.<attribute> - self regerence information within the block - provisioners and connections 

## Resource arguments

* Terraform languages defines several meta-arguments
* These can be used with any resource type to change behaviour of resources

* Arguments
       * depends_on
        * For specifying explicit dependencies between resources
        * Terraform implicitly can determine the order of provision for resources but there may be some cases where it cannot determine the correct order
           * count
        * For creating multiple resource instances according to a count
        * Used when managing pool of objects
        * Example - fleet of EC2 Virtual Machines
        * Get the current count value via count.index
        * Can accept numeric expressions
    * for_each - used to create multiple instances according to
        * A map
        * Set of Strings
    * provider - for selecting a non-default provider configuration
    * lifecycle - for lifecycle customizations
    * provisioner and connection - used for taking extra actions after resource creation 
* Resource Behaviour
    * When the terraform apply is executed, it will perform one of the following to a resource:
        * Create
           * Resources that exist in the configuration but are not associated with a real infrastructure
        * Destroy
           * Resources that exist in the state but no longer exist in the configuration
        * Update in-place
                * Resources whose arguments have changed
        * Destroy and re-create
           * Resources whose arguments have changed but which cannot be updated in-place due to remote API limitations

## Lifecycle block

* Allows to change what happens to resource - create, update, delete
* Lifecycle blocks are nested within resources

* create_before_destroy
    * When replacing a resource, first create the new resource before deleting it
* prevent_destroy
    * Ensures a resource is not destroyed
* ignore_changes
    * Don't change the resource if a change occurs for  the listed attributes

## Provider Alias

* If you need to override the default provider for a resource, you can create alternative provider with alias
* You reference the alias under in the attribute provider for a resource

## Expressions
* Used to refer to or compute values within configuration 
* Large topic
    * Types and Values
    * Strings and Templates
    * References to Values
    * Operators
    * Function Calls
    * Conditional Expressions
    * For Expressions
    * Splat Expressions
    * Dynamic Blocks
    * Type Constraints
    * Version Constraints

## Types and values

* Primitive Values
    * string
    * number
    * bool

* No Type
    * null
     
* Complex/structural/collection types
    * list(tuple)
    * map(object) 

## String
* Double quotes need to be used
* Double quotes can interpret escape sequences
    * \n
    * \t
    * \r
    * \"

* Special Escape Sequences
    * $${}
    * %%{}
* Heredoc can be used
    * UNIX style multi-line string needs to be used

* String templates
    * String Interpolation
        * Allows to evaluate an expression between markers - ${}
    * String directive
        * Allows to evaluate an conditional logic between the markers - %{}
    * Stripe White Spacing
        * White Spacing that is left by directive blocks can be striped away by providing a trailing tilde ~

## Operators

* Mathematical operations that can be performed to numbers within expressions
* Terraform supports
    * Multiplication
    * Division
    * Modulus
    * Addition
    * Subtraction
    * Flip to Negative -a
    * Equals
    * Does not Equal
    * Less then
    * Less then or Equal

## Conditinal Expressions

* Terraform support ternary if else conditions
* condition ? true_val : false_val
* Return type of the if else statement must be the same types

## For expressions

* Expression - not a for each loop in block 
* Expressions that allows to iterate over a complex type and apply transformations
* A for expression can accept as input a list, a set, a tuple, a map or an object
* Examples
    * Uppercase each string - [for s in var.list : upper(s)]
    * For map you can get Key and Value - [for k, v in var.map: length(k) + length(v)]
    * For a list you can get index - [for I, v in var.list: "${i} is ${v}"]
* Return types
    * Square braces [ ] returns a tuple - array
    * Curly braces { } returns an  object
* For can be used to filter / reduce the amount of elements returned
    * [for s in var.list: upper(s) of s!= ""]

* Splat Expression 
    * Represented by asterisk
    * It originates from the ruby language
    * Splats in Terraform are used to rollup or soak up a bunch of iterations in a for expressions
    * [for o in var.list: o.id] => var.list[* ].id
    * [for o in var.list: o.interfaces[0].name] => var.list[* ].interfaces[0].name
    * Splat expressions have a special behaviour when applying them to lists
        * If the value not null, the splat will transform it into a single-
        * element list
        * If value is null, the splat will return an empty tuple

## Dynamic blocks

* Allows to dynamically construct repeatable nested blocks

## Versions constraints

* Terraform utilizes Semantic Versioning for specifying Terraform, Providers and Modules versions
* Semantic versioning is open-standard on how to define versioning for software management - MAJOR.MINOR.PATCH
    * 1. MAJOR - version when you make incompatible API changes
    * 2. MINOR - version when you add functionality in backwards compatible manner
    * 3. PATCH - version when you make backwards compatible bug fixes
    * 4. Additional labels for pre-release and build metadata are available as extension to the MAJOR.MINOR.PATCH format
     
* A version constraints - string containing one or more conditions, separated by commas
    * = or no operator - Match exact version number - "1.0.0", "=1.0.0"
    * != - Excludes an exact version number - "!=1.0.0"
    * >>= <<= - Compare against specific version - ">=1.0.0"
    * ~> Allow only the rightmost version to increment - "~>1.0.0"
     
* Progressive Versioning
    * Practice of using the latest version to keep a proactive stance of security, modernity and development agility
    * By being up to date we are pushing left things we will need to stay compatible
    * We will have to deal with smaller problems instead of dealing with a big problem later on
    * Run nightly build of golden images or terraform plan as a warning signal to budget the time to improve for outage
    * A nightly build is an automated workflow that occurs at night when developers are asleep
    * If the build break because a change is required for the code, developers will see this upon arrival in the morning and be able to budget accordingly
     
## State

* Terraform state is a particular condition of cloud resources at a specific time
* We expect there to be a VM running CentOS on AWS with compute type of t2.micro

* How does Terraform preserve state
* When the infrastructure is provisioned via Terraform, it will create a state file name terraform.tfstate
* State file is a JSON structure with one-to-one mapping from resource instance or remote objects

* Commands
    * terraform state list - list resources in the state
    * terraform state mv - Move an item in the state
    * terraform state pull - Pull current remote state and output to stdout
    * terraform state push - Update remote state from a local state
    * terraform state replace-provider - Replace the provider in the state
    * terraform state rm - Remove instances from the state
    * terraform state show - Show a resource in the state

* terraform state mv 
    * Allows to
        * rename existing resources
        * move a resource into a module
        * move a module into a module
    * Without destroying and creating the resource
    * Rename resource
        * terraform state mv packet_device.worker packet_device.helper
    * Move resource into module
        * terraform state mv packet_device.worker module.worker.packet_device.worker
    * Move module into a module
        * terraform state mv module.app module.parent.module.app
        
* State backups
    * All terraform state subcommands that modify state will write a backup file
    * Read only commands will not modify state - list/show
    * Terraform will take the current state and store it in a file called terraform.tfstate.backup
    * Backups cannot be disabled - this is by design to enforce best-practise for recovery
    * To get rid of them, the backup file needs to be deleted manually

## Init

* terraform init - initialized your terraform project by
    * Downloading plugin dependencies - providers, modules
    * Create a .terraform directory
    * Create a dependency lock file to enforce expected versions for plugins and terraform itself 
* If the dependency are modified or changed, terraform init needs to be run to apply the changed 

* Flags
    * terraform init -upgrade
        * Upgrade all plugins to the latest version that complies with the configuration's version constraint
    * terraform init -get-plugins-false
        * Skip plugin installation
    * terraform init -plugin-dir=PATH
        * Force plugin installation to read plugins from target directory
    * terraform init -lockfile=MODE
        * Set a dependency lockfile mode

* There are two different lock files
    * Dependency lock file - .terraform.lock.hcl
    * State lock file - .terraform.state.lock.hcl
     

## Get

* Command used to download and update modules in the root module
* Is a lightweight way that can update modules without initializing state or pulling new provider binaries

## Terraform code refactor

* Terraform has three commands that improve debugging configuration scripts
* terraform fmt
    * Rewrites Terraform configuration files to a standard format and style
    * Applies a subset of the Terraform language style conventions
    * The command adjust spacing indent
    * Syntax errors
    * terraform fmt --diff shows what changes will be made
* terraform validate - validates the syntax and arguments of the Terraform configuration files in a directory
    * Runs checks to verify whether a configuration is syntactically valid and internally consistent, regardless of any provided variables or existing state
    * terraform plan and apply automatically performs terraform validate
     
* terraform console - interactive shell for evaluating Terraform expressions
    * Interactive shell to evaluate expressions
    * E.g. try out min functions

## Plan

* terraform plan
* Creates an execution plan
* A plan consist of
    * Reading current state to remote objects to make sure that the terraform state is up-to-date
    * Comparing the current configuration to the prior state and noting any differences
    * Proposing a set of change actions that should make the object match the configuration
* It does not carry out proposed changed
* Terraform Plan file is binary file - only machine code

* Speculative Plans
    * Terraform will output the description of the effect of the plan but without any intent to actually apply it
* Saved Plans
    * terraform apply -out=FILE
    * Generates a saved plan file that can be passed to terraform apply
    * The apply won't prompt user to confirm the changes

## Apply
* Executes the action proposed in an execution plan

* Automatic Plan Mode
    * Called when terraform apply is run
    * Executes plan, validate and then apply
    * Required used to manually approve the plan by writing "yes"
    * Manual approve can be omitted by using  -auto-approve flag
* Saved Plan Mode
    * When a filename is provided to saved plan file
    * terraform apply FILE
    * Performs exactly the steps specified by that plan - without approval
    * To inspect a plan before applying, terraform show can be used 

## Drift

* Drift - Configuration or infrastructure is when the expected resources are in different state then the expected state
* We can resolve the drift in three ways in Terraform
    * Replacing Resources
        * When a resource has become damaged or degraded that cannot be detected by Terraform, we can use -replace flag
    * Importing Resources
        * When an approved manual addition of resource needs to be added to state file, use import command
    * Refresh State
        * When an approved manual configuration of a resource has changed or removed, --refresh-only flag will reflect the changed in the state
        
* terraform taint DEPRECATED - used to mark a resource for replacement, the next time apply is run

* It is recommended in 0.152+ to use -replace flag and providing resource address
* Replace flag is available on plan and apply

* Resource Addressing
    * String that identifies zero or more resource instance in the configuration
    * Address is composed of two parts
        * [module path][resource spec]
* Replacing Resources
    * terraform taint DEPRECATED - used to mark a resource for replacement, the next time apply is run
    * It is recommended in 0.152+ to use -replace flag and providing resource address
    * Replace flag is available on plan and apply

## Import

* Used to import existing resources into Terraform
* Define a placeholder for the imported resource in configuration file
* The body can be left blank and filled in after importing, it will not be auto filled
* Example
    * terraform import aws_instance.example i-abcd1234
* Command can import one resource at a time 

## Refresh

* terraform refresh command reads current settings from all managed remote objects and updated the Terraform state to match
* Terraform refresh command is an alias for the refresh only and auto-approve
* terraform refresh
* terraform apply -refresh-only -auto-approve

* -refresh-only flag for terraform plan or apply allows to refresh and update the state file without making changed to remote infrastructure

* Scenario
    * Image a created terraform script to provision VM on AWS
    * The VM gets deleted through AWS console instead of Terraform
    * terraform apply will propose to create new VM
    * terraform refresh will delete the VM from the state file

## Troubleshooting

* Language Errors
* State Errors
* Core Errors
* Provider Errors
* Debugging
    * Detailed logs which can be enabled by setting the TF_LOG environment variable to
        * TRACE
        * DEBUG
        * INFO
        * WARN
        * ERROR
        * JSON
    * Logging can be enabled separately
        * TF_LOG_CORE
        * TF_LOG_PROVIDER
        * Takes the same options as TF_LOG
    * Choose where we want to log with TF_LOG_PATH
* Crash Log
    * If Terraform crashes, it saves a log file with the debug logs from the session as well as the panic message and backtrace t crash.log

## Modules

* Public Modules
    * Terraform Registry is integrated directly into Terraform
    * The syntax for specifiying a registry module is <NAMESPACE>/<NAME>/<PROVIDER>
    * terraform init will download and cache any modules referenced by a configuration 
    * module "consul" {
        * source = "hashicorp/consul/aws"
        * version = "0.1.0"
    * }
     
* Private Modules
    * Modules have a source strings of the form <HOSTNAME>/<NAMESPACE>/<NAME>/<PROVIDER>
    * To configure private module access, the Terraform needs to be authenticated using terraform login 
    * Alternatively, the user API token can be created in the Terraform account and configured in the CLI config file
    * module "vpc" {
        * source = "app.terraform.io/example_corp/vpc/aws"
        * version = "0.9. 3"
    * }
* Publishing Modules
    * Anyone can publish and share modules on the Terraform Registry
    * Published modules support
        * Versioning
        * Automatically generate documentation
        * Allow browsing version histories
        * Show examples
        * READMEs
    * GitHub
        * Public modules are managed via public git repo on GitHub
        * Once a module is registered, a properly formed Git Tags needs to be pushed to create new versions
        * Repos names must be in the format of terraform-<PROVIDER>-<NAME>
     
* Verified Modules
    * Reviewed by HashiCorp and actively maintained by contributors to stay up-to-date and compatible with both Terraform and their respective providers
    * Verifies badge appears next to the module in the Terraform Registry Website
    * Verifies modules are expected to be actively maintained by HashiCorp partners
    * Verified badge isn't indicative of flexibility or feature support
    * Very simple modules can be verified just because they are great examples of modules
    * Unverified
        * Module could be extremely high quality and actively maintained
        * Module shouldn't be assumed to be poor quality
        * Means it hasn't been created by a HashiCorp partner

* Standard Module Structure
    * File and directory layout recommended for module development
    * Root Module
        * Primary entry point
        * These are required files in the root directory
            * Main.tf - entry point to the module
            * Variables.tf - variable that can be passed in
            * Outputs.tf - Output values
            * README - Describes how the module works
            * LICENSE - License under which this module is available
    * Nested Modules
        * Optional
        * Must be contained in the modules/ directory
        * A submodule that contains a ERADME is considered usable my external users
        * A submodule that does not contain a README is considered internal use only
        * Avoid using relative paths when sourcing module blocks
        * 
## Workflows

* Write - Author infrastructure code
* Plan - Preview changes before applying
* Apply - Provision reproductible infrastructure
  
* Workflows can be different for
    * Individual Practitioner
    * Teams using OSS - Open Source Software
    * Teams using Terraform Cloud
     
* Individual Practitioner
    * Write
        * Write Terraform configuration in editor of choice
        * Store the Terraform code in VCS, e.g. GItHub
        * Repeatedly run terraform plan and validate to find syntax errors
        * Tight feedback loop between editing code and running test commands
    * Plan
        * Commit their work to the local repository
        * They may be using a single branch - main
        * Once their commit is written, they'll proceed to apply
    * Apply
        * They will run terraform apply on local machine and be prompted to review their plan
        * Approve changes and await provisioning
        * After successful provision they will push their local commits to their repository

* Team
    * Write
        * Each team member writes code locally on their machine in their editor of choice
        * Team member will store their code to a branch in their code repository
            * Branches help avoid conflicts while a member is working on their code
            * Branches will allow an opportunity to resolve conflict during a merge into main
        * Terraform plan can be used as quick feedback loop for small teams
        * For larger teams managing a sensitive credentials become a concern
            * A CI/CD process may be implemented so the burden of credentials is abstracted away
    * Plan
        * When a branch is ready to be incorporated on Pull Request, an Execution Plan can be generated and displayed within the Pull Request for Review
    * Apply
        * To apply the changes, the merge request needs to be approved and merged, which will kick of a code build server that will run terraform apply
     
    * Problems
        * DevOps teams has to setup and maintain their own CI/CD Pipeline
        * DevOps teams has to figure out how to store the state file - Standard Backend remote state
        * DevOps teams is limited in their access controls - they can't be granular about what actions are allowed to be performed by certain members - apply, destroy
        * DevOps teams has figure out a way to safely store and inject secrets into their build server's runtime environment
        * DevOps teams has to manage multiple environments - for each environment, different pipeline may be created
        
* Terraform Cloud
    * Write
        * A team will use Terraform cloud as their remote backend
        * Inputs variables will be stored on Terraform Cloud instead of the local machine
        * Terraform Cloud integrates with the VCS to quickly setup CI/CD pipeline
        * A team member writes code to branch and commits per usual
    * Plan
        * A pull request is created by a team member and Terraform cloud will generate speculative plan to review the VCS, the team member can also review and comment on the plan in Terraform Cloud
    * Apply
        * After the Pull Request is merged, the Terraform Cloud runtime environment will perform a Terraform apply, a team member can confirm and apply the changes
     
    * Benefits
        * Streamlines a lot of the CI/CD effort, storing and securing sensitive credentials and makes it easier to go back and audit multiple runs
         
## Backends

* Each Terraform configuration can specify a backend, which defines where and how operations are performed, where state snapshots are stored
* Terraform backends are divided into two types
    * Standard backends
        * Only store state
        * Does not perform terraform operations - e.g. terraform apply
            * To perform operations, we need to use CLI on the local machine
        * Third party backends - standard backends - e.g. AWS S3
        * Examples with locking
            * AWS Simple Storage Service S3 - locking via DynamoDB
            * AzureRM
            * Google Cloud Storage - Object Storage
            * Alibaba Cloud Object Storage Service
            * HTTP Protocol - REST API to setup custom remote backend
            * Kubernetes Secret with locking
            * PostgresSQL database
    * Enhanced backends
        * Can both store state
        * Can perform terraform operations
        * Divided into
            * Local
                * Files and data are stored on the local machine executing terraform commands
                * Store state on the local filesystem
                * May be local build server - not a Terraform Cloud
                * Locks the state using system APIs
                * Perform operations locally
                * Default - when the backend is not specified in the Terraform module
                * Can be specified by using local in the backend, can also specify path to the state
                * Terraform {
                    * backend "local" {
                        * Path = ""
                    * }
                * }

            * Remote - Files and data are stored in the cloud - e.g. Terraform cloud
                * Uses Terraform platform
                    * Terraform Cloud - Terraform on-cloud
                    * Terraform Enterprise - Terraform on-premise offering
                *  When the terraform apply is performed via the CLI
                * Terraform Cloud Environment is responsible for executing the operation
                * Terraform Cloud Workspaces needs to be set up in order to use remote backend - this can be set up via
                    * workspaces {
                        * name = "my-app-prod"
                    * }
                    * Or - cannot set both
                    * workspaces {
                        * prefix = "my-app-"
                    * } ## This will prompt the user to select the workspaces when running Terraform Cloud
                    * 
* Backend Initialization
    * -backend-config for terraform init can be used for partial backend configuration
    * In situation where the backend settings are dynamic or sensitive and cannot be statically specific in the configuration file
    * e.g. terraform init -backend-config=backend.hcl

* terraform_remote_state
    * Retrieves the root module output values from another Terraform configuration, using the latest state snapshot from the remote backend
    * Only the output values from the root module are exposed
    * In order to have access to the output values of another state, the user must have an access to the entire state snapshot, that can include sensitive information - therefore it is recommended to explicitly publish data for external consumption to a separate location instead of accessing it via remote state
     
* Protecting Sensitive Data
    * State file can contain sensitive data
    * Is possible attack vector for malicious actors
    * Local State
        * When using local backend, state is stored in plain-text JSON files
        * Developers need to be careful to not share the state file with anyone
        * Developers need to be careful to not commit the file to the git repository
    * Remote State with Terraform Cloud
        * State file is held in memory and is not persisted to disk
        * State file is encrypted-at-rest
        * State file is encrypted-at-transit
        * Terraform Enterprise can have detailed audit logging for tamper evidence
    * Remote State with Third-Party Storage
        * You can store state with various third party backends
        * The backends needs to be reviewed in order to meet security and compliance requirements
        * By default, now all backends are secured as they should be - S3 has disabled encryption-at-rest by default
     

## State locking
* Terraform will lock state for all operations that could write state
* This prevents from acquiring the lock and potentially corrupting the state
* State locking happens automatically, on all operations that could write state
* You won't see any message that it is happening - only if the state locking fails
* Disabling Locking
    * The state locking can be disabled for most commands with the -lock flag, but it is not recommended
* Force Unlock
    * Terraform has force-unlock command to manually unlock the state if unlocking failed
    * If the unlocking happens when someone else is holding the lock, it could cause multiple writers
    * Force unlock should only be used to unlock your own lock in the situation where automatic unlocking failed
    * To protect the developer, the force-unlock command required a unique lock ID
        * Terraform output this lock ID if unlocking fails
    * Example - terraform force-unlock 1941a539b-ff25-76ef-92d -force

## Ignore file
* When executing a remote plan or apply in a CLI-driven run, an archive of the configuration directory is uploaded to Terraform Cloud
* The upload can be ignore via .terraformignore file at the root of the configuration directory
* If the file is not present, the archive will exclude the following by default
    * .git directories
    * .terraform directories

## Resources & Complex Types

* Resources
    * Represent infrastructure objects
    * A resource type determines the kind of infrastructure object
        * E.g. aws_instance is AWS EC2 instance
        * Resource "aws_instance" "web" {
            * ami = "ami-1234566"
            * Instance_type = "t2.micro"
        * }

* Complex Types
    * Type that groups multiple values into a single value
    * Complex types are represented by type constructors, but several of them also have shorthand keyword versions
    * Two Categories
        * Collection Types
            * For grouping similar values
            * List, Map, Set
        * Structural Types
            * For Grouping potentially dissimilar values
            * Tuple, Object

* Collection Types
    * Allow multiple values of one type to be grouped together as a single values
    * Type of value within a collection is called its element type
    * Three kinds of types
        * List
            * Default = ["mars", "earth", "moon"]
            * var.users[0]
        * Map
            * default = {
                * "PlanA" = "10 USD"
                * "PlanB" = "50 USD"
                * "PlanC" = "20 USD"
            * }
            * var.plans["PlanB"]
        * Set
            * Similar to list but has no secondary index or ordering
            * All values must be of the same type and will be cast to match based on the first element

* Structural Types
    * Object
    * Allows multiple values of several distinct types to be grouped together as single value
    * Structural types requires a schema as an argument to specify which types are allowed for which elements
    * Object({name = string, age = number})
    * tuple([string, number, bool])
     

##Functions

* Terraform language includes a number of built-in functions that can be called within expressions to transform combine values
* Types

    * Numeric Functions
        * abs() - returns the absolute value of the given value
        * floor() - returns the closest whole number that is less then or equal to the given value
        * log() - returns a logarithm of a given number in a given base
        * ceil() - returns the closest number that is greater than or equal to the given value
        * min() - returns one or more numbers and returns the smallest number from the set
        * parseint() - parses the given string as a representation of an integer in the specified base and return resulting number
        * pow() - calculates an exponent by rising first argument to the second one
        * 
    * String Functions
        * chomp() - removes newline characters at the end of a string
        * format() - produces a string by formatting a number of other values according to a specification string
        * formatlist() - produces a list of strings by formatting a number of other values according to a specification string
        * indent() - adds a given number of spaces to the beginnings of all but the first line in a given multi-line string
        * join() - produces a string by concatenating together all elements of a given list of strings with the given delimiter
        * lower() - applies a regular expression to a string and returns the matching substrings
        * regexall() - applies a regular expression to a string and returns a list of all matches
        * 
    * Collection Functions
        * alltrue() - returns true if all elements ina. Given collection are true or "true", it also return true if collection is empty
        * anytrue() - returns true if any element in a given collection is true or "true". It also returns false if the collection is empty
        * chunklist() - splits a list into fixed-size chunks returning a list of lists
        * coalesce() - takes any number of arguments and returns the first one that isn't null or empty string
        * compact() - tales a list of strings and returns a new list with any empty string elements removed
        * concat() - takes two or more lists and combines them into a single list
        * contains() - determines whether a given list or set contains a given single value of its elements
        * 
    * Encoding and Decoding Functions
        * Functions that will encode and decode for various formats
        * base64encode()
        * base64decode()
        * jsonencode()
        * urlencode()
        * base64gzip()
        * yamldecode()
        * 
    * Filesystem Functions
        * abspath() - takes a string conaining a filesystem path and converts it to an absolute path
        * dirname() - takes a string containing filesystem path and removes the last portion from it
        * pathexpand() - takes a filesystem path that might begin with ~ segment and replaces it with the current user's home directory
        * file() - reads the contents of a file at the given path and returns them as a string
        * fileexist() - determines whether a file exist at a given path
        * fileset() - enumerates a set of regular file names given a path and pattern
        * templatefile() - reads a file at the given path and renders its content as a template using a supplied set of template variables
        * 
    * Date and Time Functions
        * formatdate() - convert a timestamp into a different time format
        * timeadd() - adds a duration to a timestamp, returning a new timestamp
        * timestamp() - returns a UTC timestamp string in RFC format
        * 
    * Hash and Crypto Functions
        * Generate Hashes and cryptographic strings
        * bcrypt()
        * base64sha256()
        * filebase64sha256()
        * filemd5()
        * sha1()
        * uuid()
        * 
    * IP Network Functions
        * cidrhost() - calculates a full host IP address for a given host number withing a given IP network address prefix
        * cidrnetmask() - convertws an IPv4 address prefix given in CIDR notation into a subnet mask address  
        * cidrsubnet() - calculates a subnet address within given IP network address prefix
        * cidrsubnets() - calculates a sequence of consecutive IP address ranges within a particular CIDR prefix

    * Type Conversion Functions
        * can() - evaluates the given expression and returns a boolean values indicating whether the expression produced a result without any errors
        * defaults() - a specialized function intended for use with input variables whose type are object types or collections object types that include optional attributes
        * nonsensitive() - takes a sensitive value and returns a copy of that value with sensitive   marking removed, thereby exposing the sensitive value
        * sensitive() - takes any value and returns a copy of it marked so that Terraform will treat it as sensitive, with the same meaning and behavior as for sensitive input values
        * tabool() - converts its argument to a boolean value
        * tomap() - converts its argument to a set value
        * tolist() - converts its argument to a list value

* 
## Cloud

* Application that helps teams use Terraform together

* Features
    * Manage state files
    * History or previous run
    * History or previous states
    * Easy and secure variable inject
    * Tagging
    * Run Triggers
    * Global state sharing
    * Commenting on Rms

* Terms
    * Organization
        * Collection of workspaces
    * Workspace
        * Belongs to an organization
        * Represents a unique environment or stack
    * Teams
        * Composed of multiple members - users
        * Can be assigned to workspace
    * Runs
        * Represents a single-run of the terraform run environment that is operating on execution plan
        * Can be UI/VCS driven, API driven or CLI driven

* Workflow
    * Run Workflow
        * UI/VCS - User Interface and Version Control System
            * Integrated with a specific branch in VCS - Github via webhooks
            * Whenever a pull request are submitted for the branch, speculative plans are generated
            * Whenever a merge occurs to that branch, than a run is triggered on Terraform Cloud
        * API-Driven - Application Programming Interface
            * Workspaces are not directly associated with VCS repo, and runs are not driven by webhooks on the VCS provider
            * A third-party tool or system will trigger runs via upload configuration file via the Terraform Cloud API
        * CLI-Driven - Command Line Interface
            * Runs are triggered by the user running terraform CLI command - terraform apply and plan locally on their own machine
    * Options
        * Any version of Terraform can be chosen for Workspace
        * You can choose to share state globally across organization
        * You can choose to auto approve runs - skip manual approval

* Private Registry
    * Allows to publish private modules for Organization withing the Terraform Cloud Private Registry
    * Terraform Cloud's private registry helps to share Terraform modules across the organization
    * Includes support for
        * Module versioning
        * Searchable and filterable list of available modules
        * Configuration designer 
    * All users in organization can view private module registry
    * Authentication
        * Either a user token or team token can be used for authentication
        * The different tokens chooses may grant different permissions

* 
     
## Cloud Permissions & tokens

* Organization Level Permissions
    * Manage certain resources or settings across organization
    * Manage
        * Policies - create, edit and delete the organization's sentinel policies
        * Policy Overrides - override soft-mandatory policy checks
        * Workspaces - create and administrate all workspaces within the organization
        * VCS Settings - set of VCS providers and SSH keys available within the organization
    * Organization Owners
        * Every organization has organization owner(s)
        * Special role that has every available permission and some actions only available to owners
            * Publish private modules
            * Invite users to organization
            * View all secret teams
            * Manage organization settings
            * Manage organization billing
            * Delete organization
            * Manage agent

* Workspace Level Permissions
    * General Workspace Permissions
        * Granular permissions that can be applied to user via custom workspace permissions
        * Read runs
        * Queue Plans
        * Ally runs
        * Lock and Unlock Workspaces
        * Download sentinel mocks
        * Read variable
    * Fixed Permissions for quick assignments
        * Read
            * Read runs
            * Read variables
            * Read state versions
        * Plan
            * Plan queues
            * Read variables
            * Read state versions
        * Write
            * Apply runs
            * Lock and unlock workspaces
            * Download sentinel mocks
            * Read and write variables
            * Read and write state versions

* API Tokens
    * Terraform Cloud supports three types of API tokens - User, Team and Organization Tokens
    * Organization API Tokens
        * Permissions across the entire organization
        * Each organization can have one valid API token at a time
        * Only organization owners can generate or revoke an organization's token
        * Organization API tokens are designed for creating and configuring workspaces and teams
            * Not recommended as an all-purpose interface to Terraform Cloud
            * Should be used only for setting up the organization for the first time
    * Team API Tokens
        * Allow access to the workspaces that the team has access to, without being tied to any specific user
        * Each team can have one valid API token at a time
        * Any members of a team can generate or revoke that team's token
        * When a token is regenerated, the previous token immediately becomes valid 
        * Designed toe perform API operations on workspaces
        * Same access level to the workspaces the team has access to
    * User API Tokens
        * Most flexible token type because they inherit permissions from the user they are associated with
        * Could be for a real user or machine user

* API Token Access Level
     

## Cloud other

* Cost Estimation
    * Monthly cost of resources display along side the runs
    * Available with Teams and Governance plan and above
    * Is only available for specific cloud resources for AWS, Azure and GCP
    * Mainly available for core cloud services

* Migrating Default Local State to Terraform Cloud
    * To migrate a local Terraform project that only uses default workspace to Terraform Cloud
    * Create a workspace in Terraform Cloud
    * Replace the Terraform Configuration with a Remote Backend - from terraform {} to terraform {
        * backend "remote" {
            * hostname = "app.terraform.io"
            * organization = "my-org"
            * workspaces {
                * name = "my-workspace"
            * }
            * 
        * }
    * }
     
* VCS Integration
    * GitHub
    * GitHub (OAuth)
    * GitHub Enterprise
    * GitLab
    * GitLab EE and CE
    * Bitbucket Cloud
    * Bitbucket Server and Data Center
    * Azure DevOps Service
    * Azure DevOps Server
     
* Run Environment
    * When Terraform Cloud executes the terraform plan, it runs it in its own Run Environment
    * Run Environment - VM or container intended for the execution of code for specific runtime environment - Code Build Server
    * Terraform Code Build Server - Single-use Linux machine running on the x86_64 architecture and the details of its internal implementation is not known
    * Terraform Cloud injects the following environment variables on each run
        * TFC_RUN_ID - unique identifier for this run
        * TFC_WORKSPACE_NAME - Name of the workspace
        * TFC_WORKSPACE_SLUG - full slug of the configuration used in the run 
        * TFC_CONFIGURATION_VERSION_GIT_BRANCH - name of the branch used - e.g. main
        * TFC_CONFIGURATION_VERSION_GIT_COMMIT_SHA - full commit hash of the commit used
        * TFC_CONFIGURATION_VERSION_GIT_TAG - name of the git tag used
        * 
        * The variables can be accessed by defining a variable - variable "TFC_RUN_ID" {}
        
* Terraform Cloud Agent
    * Paid feature of the Business plan to allow Terraform Cloud to communicate with isolated, private or on-premise infrastructure
    * The agent architecture is pull-based, so no inbound connectivity is required
    * Agent will poll Terraform Cloud for work and carry out execution of the work locally
    * Only supports x86_64 bit Linux operating systems
    * Can be run using the official Terraform Docker container
    * Needs to access outbound requests on HTTPS 
     

* 
## Enterprise

* Terraform Enterprise is a self-hosted distribution of Terraform Platform
* Offers private instance of the Terraform Platform application with benefits such as
    * No resource limits
    * Enterprise-grade architectural features
        * Audit logging
        * SAML - single sign on - SSO
* The platform consist of
    * Linux Debian Machine - here is the Terraform Platform installed
    * TLS Certificate
    * Cloud Storage or Cloud Disk
    * Postgres Database
    * Terraform License
* Requirements
    * Operational mode - how data should be stored
        * External services
            * Postgres
            * AWS S3 Bucket, GCP
        * Mounted Disk
            * Stores data in a separate directory on a host intended for an external disk
        * Demo - Stores all data on the instance, data can be backed up with snapshots
    * Credentials
        * Ensure to have credentials to use Enterprise and have Secure Connection
        * Terraform Enterprise License - Obtain from HashiCorp
        * TLS Certificate and Private Key  - To prove that we own the TLS Certificate
    * Linux instance
        * Terraform Enterprise is designed to run on Linux
            * Supported OS
                * Debian
                * Ubuntu
                * Red Hat
                * CentOS
                * Amazon Linux
            * Hardware Requirements
                * 10GB of disk space on the root volume
                * 40GB of disk space for the Docker data dir
                * At least 8GB of system memory
                * At least 4 CPU cores

* Air Gapped Networks
    * Air Gap or disconnected network is a network security measure employed on one or more computers to ensure that a secure computer network is physically isolated from unsecure networks - public internet
    * Often used by Public Sector or Large Enterprise
    * Terraform Enterprise supports and installation type for Air Gapped Environments
    * Air Gap bundle needs to be installed, the bundle is an archive of Terraform Enterprise release version

## Workspaces

* Allows to manage multiple environment or alternate state files - Development, Production
* Two variants of workspaces
    * CLI Workspaces - a way of managing alternate state files - locally or via remote backends
    * Terraform Cloud Workspaces - acts like completely separate working directories
* Workspaces are similar to having different branches in git repository
* Are equivalent of renaming the state file
* By default, the terraform uses a single workspace called default

* Internals
    * The storing of the state file depends on whether you use local or remote backend
    * Local State
        * Terraform stores the workspace states in a folder called terrafrom.tfstate.d
        * In practice, individuals or very small teams will have been known to commit these files to their repositories
        * Using a remote backend instead is recommended
    * Remote state
        * Workspace files are stored directly in the configured backend

* Current Workspace Interpolation
    * You can reference the current workspace name via terrafrom.workspace
    * tags = {
        * Name = "web - ${terraform.workspace}"
    * }
     
* Multiple Workspaces
    *  Terraform configuration has a backend that
        * Defines how operations are executed
        * Where persistent data is stored - Terraform State
    * Are supported by
        * AzureRM
        * Consul
        * COS
        * GCS
        * Kubernetes
        * Local
        * Manta
        * S3

* Run Triggers
    * Provides a way to connect workspace to one or more workspaces within an organization
    * Allows runs to queue automatically in workspaces on successful apply of runs of the source workspaces
    * Run triggers are designed for workspaces that rely on information or infrastructure provided by other workspaces
     
* CLI Commands
    * terraform workspace list - list all workspaces
    * terraform workspace show - show the current workspace
    * terraform workspace select - switch to target workspace
    * terraform workspace new - create and switch to workspace
    * terraform workspace delete - delete target workspace

* Workspaces Differences
    * Component * Local Terraform   * Terraform Cloud
    * Terraform config  * On Disk   * In linked VCS repository
    * Variable Values   * As .tfvars files, as CLI arguments or in shell env    * In Workspace
    * State * On disk or in remote backend  * In Workspace
    * Credentials and Secrets   * In shell env or entered at prompts    * In workspace, stored as sensitive values
     

## Sentinel

* Embedded policy-as-code framework
* Integrated with Terraform Platform
* Write code to automate regulatory or governance policies
* Features
    * Embedded - enable policy enforcement in the data path in the data 
    * Fine-grained, condition based policy
    * Multiple Enforcement Levels
    * External Information
    * Multi-Cloud Compatible
* Paid service and is part of Team & Government upgrade package

* Example
    * AWS
        * Restrict owners of the aws_ami data source
        * Enforce mandatory tags on taggable AWS resources
        * Restrit availability zones used by ec2 instance
        * Require S3 buckets to be private and encrypted by KMS keys
    * Cloud Agnostic
        * Allowed providers
        * Prohibited providers
        * Limit proposed monthly costs
        * Prevent providers in non-root modules
        
* With Terraform
    * Sentinel can be integrated with Terraform via Terraform Cloud as part of the IaC provisioning pipeline
    * Within Terraform Cloud, you can create a policy set and apply these to a Terraform Cloud Workspace
     
    * 
## Packer

* Developer tool to provision a build image that will be stored in a repository
* Using a build image before you deploy provides
    * Immutable infrastructure
    * The VMs in the fleet are all one-to-one in configuration
    * Faster deploys for multiple servers after each build
    * Earlier detection and intervention of package changes or deprecation of old technology
* Packer configures a machine via Packer Template
    * Packer Template use the HashiCorp Configuration Language (HCL)

* Packer Template File
    * Packer configures a machine container via Packer Template
    * Source says where and what kind of image to build
    * Build block allows us to provide configuration scripts
    * Packer supports a wide range of provisioners
        * Chef
        * Puppet
        * Ansible
        * PowerShell
        * Bash
    * Post-provisioners run after the image is built
        * They can be used to upload artifacts or re-package
    * In the following case
        * Packer will create EBS backed AMI
        * Image is stored directly in AWS under EC2 Images
     
    * 

* Terraform and Packer integration
    * Two steps
        * Building the Image
            * Packer is not a service but a development tool, so we need to manually run packer or automate building of images with a build server running packer
        * Referencing the Image
            * Once an image is build, you can reference the image as a Data Source in Terraform Configuration
     

* 

## Consul

* Service networking platform
* Provides
    * Service discovery
        * Central registry for service in the network
    * Service mesh
        * Managing network traffic between services
        * A communication layer on top of the container application
        * Middleware
    * Application Configuration Capabilities
* Useful for micro-service or service-oriented architecture with hundred or thousands of services - containerized apps or workloads
* Terraform integration
    * Remote backend
        * Consul has a key value Store to store configuration
    * Consul Provider
        * 
     
## Vault

* Securely accessing secrets from multiple secrets data stores
* Vault is deployed to a server where
    * Vault admins can directly manage secrets
    * Operators can access secrets via an API
* Vault provides a unified interface
    * To any secret
        * AWS Secrets
        * Consul Key Value
        * Google Cloud KMS
    * Providing tight access control
        * Just in Time
        * Just Enough Privilege - reducing service attack by provisioning least-permissive permissions
    * Recording a detailed audit log - tamper evidence
* Vault is deployed to VM in a cluster
* Can be backed up via snapshots

* Terraform Integration
    * Case
        * When a developer is working with Terraform and they need to deploy to a provider
        * AWS Credentials are long-lived, meaning a user generates a key and secret and they are usable until they are deleted
        * AWS Credentials reside on the developer's local machine and so that machine is at risk of being compromised by malicious actor
    * Goal is to
        * Provide credentials Just-In-Time (JIT)
        * Expire the credentials after a short amount of time - short-lived
        * We can reduce the attack surface area of the local machine
    * Vault can be used to inject short-lived secrets at the time of terraform apply
    * Steps
        * Vault server is provisioned
        * Vault engine is configured - AWS Secret Engine
        * Vault will create a machine user for AWS
        * Vault will generate short-lived AWS Credentials from the machine user
        * Vault will manage and apply the AWS policy
    * When Terraform Apply is run, it will pull short lived credentials to be used scope for the duration of the current run
    * Everytime you run apply, you will get new short-lived credentials
    * data "vault_aws_access_credentials" "cred" {
        * backend = data.terraform_remote_state.admin.outputs.backend
        * role = data.terraform_remote_state.admin.outputs.role
    * }

## Atlantis

* Open Source developer tool to automate Terraform Pull Requests
* Used for GitOps
* After the pull request, Atlantis automatically performs terraform apply
* HashiCorp maintaines this product

## Other Services

* CDK for Terraform
    * AWS CDK - imperative IaC tool with SDKs for favorite language
    * Standalone project by HashiCorp that allows to use CDK but instead of CFN templates, it generates Terraform templates
    * Anything Terraform can do, you can do through CDK
    * Use CDK to provision Azure resource
     
* Gruntwork
    * Software company that build DevOps tools that extends or leverages Terraform
    * Products
        * Infrastructure as Code Library - 300 000 lines of reusable, battle-tested, production-ready infrastructure code for AWS, GCP and Azure
        * Terragrunt - thin wrapper that provides extra tools for keeping configurations DRY, working with Terraform modules and managing remote state
        * TerraTest - testing framework for Infrastructure provisioned with Terraform
        * ….

* Terragrunt
    * Thin wrapper for Terraform that provides extra tools for
        * Keeping configuration DRY
        * Working with multiple Terraform modules
        * Managing remote state
    * Supports better granularity for modules by reducing lots of biolerplate
    * It is important when there is a need for writing UnitTest for infrastructure

* TerraTest
    * Allows to perform Unit Test and Integration Tests on the infrastructure
    * It tests infrastructure by
        * Temporarily deploying it
        * Validating results
        * Tearing down the test environment 
    * Tests are written in GoLand

* Testing in Terraform
    * E2E Tests
        * Setup persistent test environment
        * Environment - Gruntwork Reference Architecture
    * Integration Tests
        * Multiple IaC modules working together
        * E.g. Check if Lambda function works in conjunction with SQS queue
    * Unit Tests
        * Single module testing - this means that the modules needs to be divided into small units of work
        * TerraTest, Kitchen-terraform
    * Static Analysis
        * Test code without deploying
        * Tflint, terraform validate, terraform plan