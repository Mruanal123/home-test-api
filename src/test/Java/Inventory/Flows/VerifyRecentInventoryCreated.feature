
@Regression
Feature: Retrieve the details for recently created item

Background: 
    * url baseUrl

    # Call the feature to create a new item and store the item ID
    * configure headers = { 'accept': 'application/json', 'Content-Type': 'application/json' }
    * def inventoryData = read('classpath:utils/inventory.csv')
    * def randomIndex = Math.floor(Math.random() * inventoryData.length)
    # Fetch the first record (index 0) or any other index
    * def inventoryData = inventoryData[1]
    * print inventoryData

     # Generate a unique integer ID
    * def uniqueId = Math.floor(Math.random() * 10000).toString();
    * def createNewInventory = call read('classpath:Inventory/CommonFeatures/Inventory.feature'){'id': '#(uniqueId)','name': '#(inventoryData.name)','image': '#(inventoryData.image)','price': '#(inventoryData.price)'}
    * def inventoryId = uniqueId
    * karate.log('Item ID created:', inventoryId)
    * json inventorySchema = read('classpath:./resources/InventorySchema.json')

Scenario: Verify the recent created item in the inventory
    Given path '/api/inventory/filter'
    And param id = inventoryId
    When method Get
    Then status 200
    * karate.log(response)
    And match response == '#object'
    # Ensure each item has a valid ID
    And match response == inventorySchema
    And match response.id == inventoryId