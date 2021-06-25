connst :: a -> b -> a
connst x _ = x

numbers = map (const 1) [1..5]
-- [1,1,1,1,1]

length1 :: [a] -> Int 
length1 = foldr (\ _ ac -> ac + 1) 0
-- foldr (\ _ ac -> ac + 1) 0 [1,4,8]
-- ac = (\ _ ac -> ac + 1) 8 0 = (\ _ 0 -> 0 + 1) = 1
-- ac = (\ _ ac -> ac + 1) 4 1 = (\ _ 1 -> 1 + 1) = 2

length3 :: [a] -> Int 
length3 = foldr (connst (1+)) 0
-- foldr const (+1) 0 [1,4,8]
-- acc = const (+1) 8 0 = (+1) 0 = 1
-- acc = const (+1) 4 1 = (+1) 1 = 2


length2 :: [a] -> Int 
length2 = foldl (\ ac _ -> ac + 1) 0


main :: IO ()
main = do
  print $ length2 "hello worlded"
