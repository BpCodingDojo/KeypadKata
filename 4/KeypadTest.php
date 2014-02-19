<?php

require_once("Keypad.php");

class KeypadTest extends PHPUnit_Framework_TestCase
{
    /**
     * @test
     */
    public function testEmptyInput()
    {
        $dictionary = array();
        $keypad = new Keypad($dictionary);
        $this->assertEquals(array(), $keypad->getWords(''));
    }



    /**
     * @test
     * @dataProvider getOneButtonPressCases
     */
    public function testOneNumberInputs($input, $output)
    {
        $dictionary = array('A', 'D', 'G', 'J', 'M', 'P', 'T', 'W');
        $keypad = new Keypad($dictionary);
        $this->assertEquals(array($output), $keypad->getWords($input));
    }



    public function getOneButtonPressCases()
    {
        return array(
            array('2', 'A'),
            array('3', 'D'),
            array('4', 'G'),
            array('5', 'J'),
            array('6', 'M'),
            array('7', 'P'),
            array('8', 'T'),
            array('9', 'W'),
        );
    }



    /**
     * @test
     * @dataProvider getTwoButtonPressCases
     */
    public function testTwoNumberInputs($input, $output)
    {
        $dictionary = array('B', 'E', 'H', 'K', 'N', 'Q', 'U', 'X');
        $keypad = new Keypad($dictionary);
        $this->assertEquals(array($output), $keypad->getWords($input));
    }



    public function getTwoButtonPressCases()
    {
        return array(
            array('22', 'B'),
            array('33', 'E'),
            array('44', 'H'),
            array('55', 'K'),
            array('66', 'N'),
            array('77', 'Q'),
            array('88', 'U'),
            array('99', 'X'),
        );
    }



    /**
     * @test
     * @dataProvider getMultipleLetterCases
     */
    public function testTwoNumberSequenceGiven($input, $output)
    {
        $dictionary = array('BI', 'DJ', 'SOLD');
        $keypad = new Keypad($dictionary);
        $this->assertEquals(array($output), $keypad->getWords($input));
    }



    public function getMultipleLetterCases()
    {
        return array(
            array('22 444', 'BI'),
            array('3 5', 'DJ'),
            array('7777 666 555 3', 'SOLD'),
        );
    }



} 