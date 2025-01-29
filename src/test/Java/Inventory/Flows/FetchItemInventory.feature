
@Regression
Feature: Retrieve the item of menu by ID

Background: 
    * url baseUrl
    # Call the feature to create a new item and store the item ID
    * configure headers = { 'accept': 'application/json', 'Content-Type': 'application/json' }
    * json inventorySchema = read('classpath:./resources/InventorySchema.json')

Scenario: Verify the successful retrieval of item by ID
    Given path '/api/inventory/filter'
    And param id = 3
    When method Get
    Then status 200
    * karate.log(response)
    And match response == '#object'
    And assert responseTime < 3000
    # Ensure item details is coming for present id
    And match response == inventorySchema
    And match response.id == "3"
    And match response.name == "Baked Rolls x 8"
    And match response.image == "roll.png"
    And match response.price == "$10"

    Scenario: Verify the successful retrieval of item by NonExistingId
        Given path '/api/inventory/filter'
        And param id = 45
        When method Get
        Then status 404
        * karate.log(response)
        And assert responseTime < 3000
    # Ensure correct response is coming or not for NonExistingId
        And match response == 'Not Found'

    Scenario: Verify the successful retrieval of item by invalidIDType
        Given path '/api/inventory/filter'
        And param id = "abcd"
        When method Get
        Then status 404
        * karate.log(response)
        And assert responseTime < 3000
    # Ensure correct response is coming or not for invalidIDType
        And match response == 'Not Found'