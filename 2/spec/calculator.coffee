class Calculator
  @Calc = (number) ->
    new Calculator number



  @addCommand = (command, method) ->
    Calculator::[command] = (number) ->
      @states.push method(@number, number)
      @



  constructor: (@number) ->
    @states = [@number]
    @redoStates = []



  toInt: ->
    @states[@states.length - 1]



  Undo: ->
    @redoStates.push @states.pop() if @states.length
    @



  Redo: ->
    @states.push @redoStates.pop() if @redoStates.length
    @



  Save: ->
    new Calculator @toInt()




describe 'Calculator', ->

  beforeEach ->
    @calc = Calculator.Calc(10)

    Calculator.addCommand 'Plus', (previous, number) -> previous + number
    Calculator.addCommand 'Minus', (previous, number) -> previous - number
    Calculator.addCommand 'Multiply', (previous, number) -> previous * number
    Calculator.addCommand 'Power', (previous, number) -> Math.pow previous, number



  describe '.Calc', ->
    it 'sets initial number', ->
      expect(@calc.toInt()).toEqual 10



  describe '.Plus', ->
    it 'increases the initial number', ->
      expect(@calc.Plus(5).toInt()).toEqual 15



  describe '.Minus', ->
    it 'decreases the initial number', ->
      expect(@calc.Minus(5).toInt()).toEqual 5



  describe '.Multiply', ->
    it 'multiplies the initial number', ->
      expect(@calc.Multiply(3).toInt()).toEqual 30



  describe '.Power', ->
    it 'powers the initial number', ->
      expect(@calc.Power(3).toInt()).toEqual 1000



  describe '.Undo', ->
    it 'undos the previous operation', ->
      expect(@calc.Minus(5).Undo().toInt()).toEqual 10



  describe '.Redo', ->
    it 'redos the previous undo', ->
      expect(@calc.Minus(5).Undo().Redo().toInt()).toEqual 5



  describe '.Save', ->
    it 'saves the current value, cannot redo earlier states', ->
      expect(@calc.Minus(5).Undo().Save().Redo().toInt()).toEqual 10

