
@Regression
Feature: Item Creation API tests with Invalid and missing data

Background: 
    * url baseUrl
    * configure headers = { 'accept': 'application/json', 'Content-Type': 'application/json' }

    # Fetch the item schema
    * json inventorySchema = read('classpath:./resources/InventorySchema.json')

    # Call the feature to create a new item and store the item ID
    * def inventoryData = read('classpath:utils/inventory.csv')
    * def randomIndex = Math.floor(Math.random() * inventoryData.length)
    * def data = inventoryData[0]

     # Generate a unique integer ID
    * def uniqueId = Math.floor(Math.random() * 10000)
    * def inventoryFields = {'id': '#(uniqueId)','name': '#(data.name)','image': '#(data.image)','price': '#(data.price)'}
    * def createInventory = karate.merge(inventorySchema,inventoryFields)

Scenario: Verify item creation with missing fields
    * def requestBody = createInventory
    # Remove additional needs to test optional field handling
    * remove requestBody.id
    * karate.log('Request Body without additional needs:', requestBody)

    Given path '/api/inventory/add'
    And request requestBody
    When method Post
    Then status 400
    And match response == "Not all requirements are met"

Scenario: Verify response when invalid data types are provided
    * def requestBody = createInventory
    # Set total price to an invalid type (string)
    * set requestBody.id = 9001
    * eval requestBody.id = requestBody.id.toString()
    * set requestBody.price = 10
    * karate.log('Request Body with invalid totalprice:', requestBody)

    Given path '/api/inventory/add'
    And request requestBody
    When method Post
    Then status 400
    And match response == "Bad Request"