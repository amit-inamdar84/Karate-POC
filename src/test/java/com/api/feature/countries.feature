Feature: Check list of posts
   Background:
      * url 'https://jsonplaceholder.typicode.com'
      * header Accept = 'application/json'
   Scenario: Get list of all posts
      Given path '/posts'
      When method GET
      Then status 200
      And print response
      And match response.[*].id contains [6]
      And match response.[*].title contains ["qui est esse"]
      And match response.[*].body contains ["doloremque ex facilis sit sint culpa\nsoluta assumenda eligendi non ut eius\nsequi ducimus vel quasi\nveritatis est dolores"]