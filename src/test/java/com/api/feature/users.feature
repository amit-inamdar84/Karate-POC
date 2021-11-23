Feature: Check list of users and their details

    Background:
        * url 'https://reqres.in/api/users'
        * header Accept = 'application/json'
        * def expectedOutput = read('classpath:Karate/api/data/EResult.json')

    Scenario: Get list of all the users

        Given param page = 2
        When method GET
        Then status 200
        And match $ == expectedOutput
        And match response.data[0].first_name != null
        And match response.data[0] == {"id": 7, "email": '#ignore', "first_name": "Michael", "last_name": "Lawson", "avatar": '#ignore'}
        And match response.data[*].id contains [7, 8, 9, 10, 11, 12]
        And match response.data[*].id contains [12, 9, 8, 11, 10, 7]
        And match response.data[*].id contains [7, 9, 8, ]
        And match response.data[*].email contains 'lindsay.ferguson@reqres.in'
        And match response.data[*].first_name contains ['Lindsay', 'Tobias', 'Byron']
        And match response.data[*].id !contains [1, 2, 3]
        And match response.data[*].id !contains [null, 1]
        And match response.data[*].id contains only [7, 8, 9, 10, 11, 12]
        And match response.data[*].id contains only [12, 9, 8, 11, 10, 7]
        