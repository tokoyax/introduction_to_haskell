-- 型が少しややこしくなるので別名を付けておく
type Category = String -- 商品のカテゴリ
type Name = String -- 商品名
type Price = Integer -- 金額
type Menu = [(Category, [(Name, Price)])] -- メニュー
type Item = (Category, Name, Price) -- 商品

-- メニューデータの例
menu :: Menu
menu =
    [("Foods", -- 食事
        [("Hamburger", 120) -- ハンバーガー
        ,("FrenchFries", 100) -- ポテト
        ])
    ,("Drinks", -- 飲み物
        [("Cola", 80) -- コーラ
        ,("Tea", 100) -- お茶
        ])
    ]

getItemWithoutMonad :: Menu -> Category -> Name -> Maybe Item
getItemWithoutMonad menu category name
    -- パターンマッチするたびにネストが増えてしまう
    = case lookup category menu of
        Just subMenu ->
            case lookup name subMenu of
                Just price -> Just (category, name, price)
                -- マッチしなかった場合はNothing
                Nothing    -> Nothing
        Nothing -> Nothing

getItemWithMonad :: Menu -> Category -> Name -> Maybe Item
getItemWithMonad menu category name = do
    -- IOでgetLineしたときのように、lookup関数が使える
    subMenu <- lookup category menu
    price <- lookup name subMenu
    -- どこかのアクションがNothingを返せば、計算全体がNothingとなる
    -- 最終的にほしい結果を組み立ててreturnで返す
    return (category, name, price)
