{-# LANGUAGE OverloadedStrings #-}
import           Data.Attoparsec.Text hiding (take)
import qualified Data.Text            as T

main :: IO ()
main = do
    print $ parse decimal "1000" `feed` ""
