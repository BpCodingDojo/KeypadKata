<?php

class Keypad
{

    private $keyMap = array(
        '2' => 'ABC',
        '3' => 'DEF',
        '4' => 'GHI',
        '5' => 'JKL',
        '6' => 'MNO',
        '7' => 'PQRS',
        '8' => 'TUV',
        '9' => 'WXYZ'
    );



    public function getWords($input)
    {
        $words = array();
        if (strlen($input))
        {
            $letterDefinitions = explode(' ', $input);
            $word = '';
            foreach ($letterDefinitions as $letter)
            {
                $word .= $this->getLetterFromNumberSequence($letter);
            }
            $words[] = $word;
        }
        return $words;
    }



    private function getLetterFromNumberSequence($input)
    {
        $baseLetters = $this->keyMap[$input[0]];
        return $baseLetters[strlen($input) - 1];
    }

}