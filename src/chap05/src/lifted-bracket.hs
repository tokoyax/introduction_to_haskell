import           Control.Exception.Lifted (bracket)
import           Control.Monad.Reader     (ask, runReaderT)
import           Control.Monad.Trans      (lift)
import           System.IO                (IOMode (ReadMode), hClose,
                                           hGetContents, openFile)

path :: FilePath
path = "chap05/src/lifted-bracket.hs" -- ファイルを保存しておく

main :: IO ()
main = (`runReaderT` path) $ do
    bracket open close $ \h -> do
        content <- lift (hGetContents h)
        lift $ print (length content)
    where
        open = do
            p <- ask
            lift $ openFile p ReadMode
        close = lift . hClose

