{-# LANGUAGE ScopedTypeVariables #-}
import           Control.Exception

main :: IO ()
main =
    someOperation
        `catches`
    [ Handler $ \(e :: ArithException) ->
        putStrLn $ "Catch ArithException: " ++ displayException e
    , Handler $ \(e :: SomeException) ->
        putStrLn $ "Catch SomeException: " ++ displayException e
    ]

someOperation = undefined
