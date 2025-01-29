Feature: Inventory creation

Background: 
    * url baseUrl
    * configure headers = { 'accept': 'application/json', 'Content-Type': 'application/json' }
    * def inventoryRequest =
    """
    {
        "id": '#(id)',
        "name": '#(name)',
        "image": '#(image)',
        "price": '#(price)'
    }
    """

Scenario: Create new item
    Given path '/api/inventory/add'
    And request inventoryRequest
    When method Post
    Then status 200
    * def itemId = response.itemid