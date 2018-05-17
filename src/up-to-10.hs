import           Control.Monad    (forM_)
import           Control.Monad.ST (runST)
import           Data.STRef       (modifySTRef, newSTRef, readSTRef)

procCount :: Integer
procCount = runST $ do
    n <- newSTRef 0
    forM_ [1..10] $ \i -> do
        modifySTRef n (+ i)
    readSTRef n
