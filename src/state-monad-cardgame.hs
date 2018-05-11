import           Control.Monad.Trans.State
import           Data.List
import           System.Random.Shuffle     (shuffleM)

type Card = Int -- カード
type Score = Int -- 得点
type Hand = [Card] -- 手札
type Stock = [Card] -- 山札
type Player = String -- プレイヤー

-- 山札から指定した枚数のカードを引く
drawCards :: Int -> State Stock Hand -- 状態は山札、返り値は手札
drawCards n = do
    -- 状態である山札を取得する
    deck <- get
    -- 引いた残りをあらたに山札に設定
    put $ drop n deck
    -- 引いたカードを返す
    return $ take n deck

gameWithState :: State Stock [(Score, Hand, Player)]
-- 状態は山札、返り値は(得点, 手札, プレイヤー名)のリスト
gameWithState = do
    -- 4人分のカードを配る
    taroHand <- drawCards 5
    hanakoHand <- drawCards 5
    takashiHand <- drawCards 5
    yumiHand <- drawCards 5
    return . reverse . sort $
        [(sum taroHand, taroHand, "Taro")
        ,(sum hanakoHand, hanakoHand, "Hanako")
        ,(sum takashiHand, takashiHand, "Takashi")
        ,(sum yumiHand, yumiHand, "Yumi")
        ]

-- シャッフルされた山札でgameWithStateを実行する例
runGame :: IO ()
runGame = do
    -- random-shuffleパッケージに定義されているshuffleM関数でシャッフル
    -- 初期のシード値を無作為に選ぶ必要があるためI/Oアクションになっている
    deck <- shuffleM [1..50]
    print $ runState gameWithState deck

-- ランダムな並び順のカード一式 deck :: [Card] があるとする
-- 太郎、花子、たかし、ゆみの4人に5枚づつカードを配り、合計点が多い人が価値
-- 返却値は合計点の多い順でソートされた(合計得点, 手札, プレイヤー名)のリスト
-- game :: [Card] -> [(Score, Hand, Player)]
-- game deck = let
--     (taroHand, deck2) = (take 5 deck, drop 5 deck)
--     (hanakoHand, deck3) = (take 5 deck2, drop 5 deck2)
--     (takashiHand, deck4) = (take 5 deck3, drop 5 deck3)
--     (yumiHand, deck5) = (take 5 deck4, drop 5 deck4)
--     in reverse . sort $
--         [(sum taroHand, taroHand, "Taro")
--         ,(sum hanakoHand, hanakoHand, "Hanako")
--         ,(sum takashiHand, takashiHand, "Takashi")
--         ,(sum yumiHand, yumiHand, "Yumi")
--         ]
