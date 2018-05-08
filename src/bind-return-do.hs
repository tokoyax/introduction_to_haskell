-- main :: IO ()
-- main =
--     getLine >>= \x ->
--     getLine >>= \y ->
--     putStrLn ("1つ目の入力 : " ++ x) >>
--     putStrLn ("2つ目の入力 : " ++ y)

-- do式を使うとこうなる
-- main :: IO ()
-- main = do
--     x <- getLine
--     y <- getLine
--     putStrLn $ "1つ目の入力 : " ++ x
--     putStrLn $ "2つ目の入力 : " ++ y

-- do式の中で >>= や >> を使っても大丈夫
-- getLine で標準出力から読み込んで、
-- ++ を適用し、
-- return で IOアクションにして、putStrLn している
main :: IO ()
main = do
    x <- getLine
    putStrLn $ "1つ目の入力 : " ++ x
    getLine >>= return . ("2つ目の入力 : " ++) >>= putStrLn

