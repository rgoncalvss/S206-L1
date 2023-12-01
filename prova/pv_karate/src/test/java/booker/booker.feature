Feature: RESTful Booker API Tests

Background:
  * def url_base = 'https://restful-booker.herokuapp.com'

Scenario: Pega a lista de reservas
  Given url url_base
  And path 'booking'
  When method get
  Then status 200
  And match $[*].bookingid != null

Scenario: Deve retornar um status 418 já que o site não permite testes automatizados em criação de reservas
  Given url url_base
  And path 'booking'
  And request { "firstname": "Jim", "lastname": "Brown", "totalprice": 111, "depositpaid": true, "bookingdates": { "checkin": "2018-01-01", "checkout": "2019-01-01" }, "additionalneeds": "Breakfast" }
  When method post
  Then status 418

Scenario: Não deveria criar um token por infos erradas
  Given url url_base
  And path 'auth'
  And request { "firstName": "admin", "password": "password123" }
  When method post
  And match $.reason == 'Bad credentials'

Scenario: Cria um token
  Given url url_base
  And path 'auth'
  And request { "username": "admin", "password": "password123" }
  When method post
  Then status 200
  And match $.token != null

Scenario: Criar uma reserva
  Given url url_base
  And path 'booking'
  And request { "firstname": "Jane", "totalprice": 150 }
  When method post
  Then status 500