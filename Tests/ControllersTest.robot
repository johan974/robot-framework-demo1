*** Settings ***

Library  REST  http://localhost:8080

*** Variables ***

${json4a}=      {"id":4,"name":"name-4","birthDate":"12-22-2017"}
${json4b}=      {"id":4,"name":"name-4-changed","birthDate":"12-22-2017"}

*** Test Cases ***
Get all stuff
  GET         /list

Create a new user
  POST        /add      ${json4a}
  GET         /get/4
  Output      schema response body
  Object      response body
  Integer     response body id          4
  String      response body name        name-4
  DELETE      /delete/4

Update a user
  POST        /add      ${json4a}
  PUT         /update   ${json4b}
  Output      schema response body
  Object      response body
  Integer     response body id          4
  String      response body name        name-4-changed
  DELETE      /delete/4