module Validators
    ( isLengthCorrect,
      isSameString
    ) where

isSameString :: String -> String -> Bool
isSameString str1 str2 
    | isLengthCorrect str1 str2  == False   = False
    | otherwise                             = str1 == str2

isLengthCorrect :: String -> String -> Bool
isLengthCorrect word answer = strLength word == strLength answer

strLength :: [Char] -> Int
strLength [] = 0
strLength (_:xs) = 1 + strLength xs
