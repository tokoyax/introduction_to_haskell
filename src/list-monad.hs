import           Control.Monad (guard)

orderdPoints :: [(Integer, Integer)]
orderdPoints = do
    x <- [1..3]
    y <- [1..3]
    guard (x < y)
    return (x, y)

points :: [(Integer, Integer)]
points = do
    x <- [1..3]
    y <- [1..3]
    return (x, y)
