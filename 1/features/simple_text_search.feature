Feature: Simple text search

  Scenario:
    Given the input "7777 666 555 3"
    When I execute a search
    Then the output should be "sold solder soldered soldering solders soldier soldiered soldiering soldierly soldiers soldiery"
