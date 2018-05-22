module MyModule where

data Paper = Paper
    { paperId     :: String
    , title       :: String
    , author      :: String
    , erdosNumber :: Int
    }
    deriving Show

-- インスタンスとしてのPaperの実装
instance Eq Paper where
    p1 == p2 = erdosNumber p1 <= erdosNumber p2

instance Ord Paper where
    p1 <= p2 = erdosNumber p1 <= erdosNumber p2
