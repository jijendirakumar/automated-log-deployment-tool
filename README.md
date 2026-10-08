# Automated Log Monitoring & Deployment Utility

A Bash-based DevOps mini project for system health monitoring, log analysis, application validation, deployment, backup, and rollback using Linux shell scripting.

## Features

- System health monitoring for CPU, memory, and disk usage
- Configurable health thresholds
- Timestamped log generation
- Log analysis using grep and awk
- Automated application backups
- Backup retention management
- Pre-deployment application validation
- Python syntax and startup checks
- SHA-256 checksum verification
- Application deployment
- Deployment integrity verification
- Post-deployment health check
- Application rollback
- Interactive Bash CLI menu
- Failure detection and recovery testing

## Technologies Used

- Bash / Shell Scripting
- Linux / Ubuntu
- Git & GitHub
- Python
- grep
- awk
- tar
- sha256sum
- df
- free
- top

## Project Structure

```text
automated-log-deployment-tool/
├── app/
│   ├── app.py
│   └── app.py.sha256
├── deployment/
│   └── app.py
├── scripts/
│   ├── health_check.sh
│   ├── validate.sh
│   ├── deploy.sh
│   ├── rollback.sh
│   └── menu.sh
├── .gitignore
└── README.md
```

## How to Run

Clone the repository:

git clone https://github.com/jijendirakumar/automated-log-deployment-tool.git

Move into the scripts directory:

cd automated-log-deployment-tool/scripts

Make the scripts executable:

chmod +x *.sh

Start the interactive menu:

./menu.sh

## Menu Options

1. System Health Check
2. Analyze Logs
3. Create Backup
4. Validate Application
5. Deploy Application
6. Rollback Application
7. Exit

## System Health Monitoring

The health monitoring script checks:

- Disk usage
- Memory usage
- CPU usage

The script compares resource usage against a configured threshold and records the results with a timestamp in the log file.

## Log Analysis

The project analyzes generated logs using Linux commands such as:

- grep
- awk
- tail

It can identify warning entries, count warnings, and display the latest warning.

## Application Validation

Before deployment, the application is validated for:

- File existence
- File readability
- File content
- Python syntax
- Required Python module
- SHA-256 checksum
- Application startup

The deployment is considered valid only when the required validation checks pass.

## Deployment

The deployment script:

1. Copies the application to the deployment directory.
2. Verifies deployment integrity.
3. Starts the deployed application.
4. Checks deployment health.
5. Reports deployment success or failure.

## Backup and Rollback

The project creates timestamped application backups before deployment.

Rollback can restore a previous application version from the backup archive and verify that the restored application starts successfully.

## Error Handling and Testing

The project was tested using multiple failure scenarios, including:

- Checksum mismatch
- Missing application file
- Invalid Python syntax
- Failed deployment health
- Broken deployment followed by rollback

The validation and deployment scripts correctly detect failures and return failure status instead of reporting false success.

## Learning Outcomes

Through this project, I practiced:

- Linux command-line operations
- Bash scripting
- Conditional statements
- Loops and case statements
- File and directory operations
- Process and system monitoring
- Log analysis
- Backup and recovery
- Checksum verification
- Application deployment
- Rollback strategies
- Error handling
- Git and GitHub

## Project Status

Completed and tested successfully.

GitHub Repository:

[View the project on GitHub](https://github.com/jijendirakumar/automated-log-deployment-tool)
