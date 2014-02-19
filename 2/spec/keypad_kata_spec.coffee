{dictionary} = require './dictionary'



describe 'Dictionary', ->

  describe "getPredictions", ->

    [
      ["sold", "sold solder soldered soldering solders soldier soldiered soldiering soldierly soldiers soldiery"]
    ].forEach (items) ->
      [input, output] = items

      it "returns the prediction(s) '#{output}' for the word '#{input}'", ->
        dictionary = new Dictionary(dictionary)

        word = dictionary.getPredictions input

        expect(word).toEqual output


class Dictionary

  constructor: (db) ->
    @db = db.split("\n")


  getPredictions: (word) ->
    word






describe 'KeyPad', ->

  describe "convertKeyCodes", ->

    [
      ["", ""]
      ["2", "a"]
      ["22", "b"]
      ["222", "c"]
      ["3", "d"]
      ["7777", "s"]
      ["7777 666", "so"]
      ["7777 666 555 3", "sold"]
    ].forEach (items) ->
      [input, output] = items

      it "returns '#{output}' for the following keypresses '#{input}'", ->
        keypad = new KeyPad
        word = keypad.convertKeyCodes input

        expect(word).toEqual output


class KeyPad
  codes: ["abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"]


  convertKeyCodes: (input) ->
    return "" unless input

    @mapInputToCodes(input).join("")


  getCode: (input) ->
    codeGroup = @getCodeGroup(input)
    codeGroup[input.length - 1]


  getCodeGroup: (keys) ->
    @codes[parseInt(keys[0]) - 2]


  splitInput: (input) ->
    input.split(" ")


  mapInputToCodes: (input) ->
    @splitInput(input).map(@getCode.bind @)



