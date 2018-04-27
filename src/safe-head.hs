data AppErr = NewAppErr deriving Show
type AppResult a = Either AppErr a

safeHead :: [a] -> AppResult a
safeHead [] = Left NewAppErr
safeHead xs = Right (head xs)
