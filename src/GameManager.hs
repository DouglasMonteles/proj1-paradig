module GameManager
    ( initGame
    ) where

import Input(
    readString
    )

import System.Exit (exitWith, ExitCode(..))

import Validators (
    isLengthCorrect,
    isSameString
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
                putStrLn "Palpite incorreto :("
                initGame answer (attempts + 1)

        putStrLn "A resposta correta é:"
        putStrLn answer
        exitWith ExitSuccess