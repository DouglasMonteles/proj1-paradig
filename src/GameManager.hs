module GameManager
    ( initGame
    ) where

import Input(
    readString
    )

import System.Exit (exitWith, ExitCode(..))

import Validators (
    isLengthCorrect,
    isSameString,
    isAnyWordInRightPlace,
    isAnyWordInWrongPlace,
    obtainIndexesOfSameLetter,
    obtainLettersInWrongPlace
    )

initGame :: String -> Int -> IO ()
initGame answer attempts = 
    do 
        putStrLn $ "Tentativa: [" ++ (show attempts) ++ "]"
        putStrLn "Digite seu palpite (com 6 letras):"
        word <- readString
        putStrLn "A palavra digitada foi:"
        putStrLn word
        putStrLn "A palavra digitada tem o mesmo tamanho da palavra correta?"
        
        if isLengthCorrect word answer 
            then do
                putStrLn "Sim!"
            else do
                putStrLn "A palavra digitada não possui o mesmo tamanho da palavra a ser adivinhada! Tente novamente."
                initGame answer (attempts + 1)

        if isSameString word answer
            then do
                putStrLn "Acertou mizeravi!"
            else do
                if isAnyWordInRightPlace word answer
                    then do
                        putStrLn "Alguma letra está no lugar correto!"
                        putStrLn $ "As letras iguais estão nas posições: " ++ show (obtainIndexesOfSameLetter word answer)
                        displayAnswerSituation answer (obtainIndexesOfSameLetter word answer)
                    else do
                        putStrLn "Palpite incorreto :("
                        -- initGame answer (attempts + 1)
                
                if isAnyWordInWrongPlace word answer
                    then do
                        putStrLn "Alguma letra está no lugar errado!"
                        putStrLn $ "As letras que estão no lugar errado são: " ++ (obtainLettersInWrongPlace word answer)
                    else do
                        putStrLn "Não há letras no lugar errado!"

        putStrLn "A resposta correta é:"
        putStrLn answer
        exitWith ExitSuccess

displayAnswerSituation :: String -> [Int] -> IO ()
displayAnswerSituation answer indexes =
  do 
    let chars = zip [0..] answer in
        mapM_ (printIndexedChar indexes) chars;
    putStrLn ""

printIndexedChar :: [Int] -> (Int, Char) -> IO ()
printIndexedChar indexes (i, c) =
  if i `elem` indexes
    then putChar c
    else putChar '_'