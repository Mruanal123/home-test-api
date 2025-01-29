For API
# APIProject

## Overview
This project is a Java-based application designed for API testing.

## Features
- Karate-based testing framework for APIs
- Pre-defined test scenarios in `.feature` files
- Configurable test setup using `karate-config.js`
- Maven for dependency management
- Reports generated in `target/karate-reports`

## Prerequisites
- **Java**: Ensure Java 8 or higher is installed.
- **Maven**: Install Maven for managing dependencies and building the project.
- **IDE**: Any Java IDE such as IntelliJ IDEA, Eclipse, or VS Code can be used.

## Project Structure

APIProject
├── pom.xml                          # Maven configuration file
├── src
│   ├── main
│   │   └── resources                # Application resources
│   └── test
│       ├── Java
│       │   ├── Inventory            # Test files for inventory APIs
│       │   │   ├── CommonFeatures
│       │   │   │   └── Inventory.feature
│       │   │   └── Flows
│       │   │       ├── InventoryCreation.feature
│       │   │       ├── VerifyRecentInventoryCreated.feature
│       │   │       ├── FetchItemInventory.feature
│       │   │       ├── FetchInventoryList.feature
│       │   │       └── InventoryCreationWithInvalidFields.feature
│       │   └── karate-config.js     # Karate configuration
│       └── resources
│           └── InventorySchema.json # JSON schema for validation
├── target                           # Generated outputs
│   └── karate-reports               # Test reports
└── .gitignore                       # Git ignore file


## Setup Instructions
1. Clone the repository:
   bash
   git clone <repository-url>
   cd APIProject


2. Install dependencies using Maven:
   bash
   mvn clean install


## Running Tests
Execute the tests using the following command:
bash
mvn test


### Test Report
After running the tests, reports will be generated in the `target/karate-reports` directory. Open `karate-summary.html` in a browser to view detailed results.

## Configuration
The `karate-config.js` file contains environment-specific configurations. Update it to set base URLs, authentication details, and other parameters.

## Key Files
- `pom.xml`: Maven dependencies and build configurations.
- `karate-config.js`: Configuration file for the Karate test framework.
- `*.feature`: Test scenarios for inventory APIs.
- `InventorySchema.json`: JSON schema used for validation during tests.

