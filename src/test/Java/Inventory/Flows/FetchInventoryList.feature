@Regression
Feature: Get all menu details

Background: 
    * url baseUrl
    # Call the feature to create a new item and store the item ID
    * configure headers = { 'accept': 'application/json', 'Content-Type': 'application/json' }
    * json inventorySchema = read('classpath:./resources/InventorySchema.json')

Scenario: Verify successful retrieval of all the menu items
    # Fetch item details using the item ID
    Given path 'api/inventory'
    When method Get
    Then status 200
    * karate.log(response)
    And match response == '#object'
    And assert responseTime < 3000
    And match response.data == '#array'
    And assert response.data.length >= 9
    And match each response.data[*].id == '#present'
    And match each response.data[*].name == '#present'
    And match each response.data[*].image == '#present'
    And match each response.data[*].price == '#present'


