import qualified Control.Monad.Trans.Except as EX

safeDIv :: Integer -> Integer -> EX.Except String Integer
safeDIv k n | n == 0    = EX.throwE $ "Illegal division by zero. k:" ++ show k
            | otherwise = return (k `div` n)

calc :: Integer -> Either String Integer
calc n = EX.runExcept $ do
    EX.catchE (do x <- 100 `safeDIv` n
                  y <- 100 `safeDIv` (x - 1)
                  return y)
              (\_ -> return 0)
