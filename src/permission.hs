import           System.Directory

main :: IO ()
main =
    getPermissions "src/sample.txt"
        >>= setPermissions "src/sample.txt" . toReadAndWritable

toReadAndWritable :: Permissions -> Permissions
toReadAndWritable p = p { readable = True, writable = True }
