
@Regression
Feature: New Item Creation API Tests

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
    * def uniqueId = Math.floor(new Date().getTime() / 1000)
    * def inventoryFields = {'id': '#(uniqueId)','name': '#(data.name)','image': '#(data.image)','price': '#(data.price)'}
    * def createInventory = karate.merge(inventorySchema,inventoryFields)

Scenario: Verify response when required fields are sent
    * def requestBody = createInventory
    # Log the request payload for debugging
    * karate.log('Request Body for inventory creation:', requestBody)
    Given path '/api/inventory/add'
    And request requestBody
    When method Post
    Then status 200
    # Validate the item details in the response
    And match response == 'OK'
    And assert responseTime < 3000

Scenario: Verify response when required fields are sent for existing id
    * def requestBody = createInventory
    * set requestBody.id = 9001
    * eval requestBody.id = requestBody.id.toString()
    # Log the request payload for debugging
    * karate.log('Request Body for inventory creation:', requestBody)
    Given path '/api/inventory/add'
    And request requestBody
    When method Post
    Then status 400
    # Validate the item details in the response
    And match response == 'Bad Request'