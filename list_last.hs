
-- Problem 1
-- The last element of a list
lastElementSimple :: [a] -> a
lastElementSimple = last

lastElement :: [a] -> a
lastElement [] = error "Empty list"
lastElement [x] = x
lastElement (_:xs) = lastElement xs

lastWithLambda :: [a] -> a
lastWithLambda = foldr1 (\ _ x -> x )
-- lastWithLambda [1,2,5]
-- foldr1 (\ _ x -> x ) [1,2,5]
-- acc = (\ _ x -> x ) 2 5 = 5
-- acc = (\ _ x -> x ) 1 5 = 5


lastWithFold :: [a] -> a
lastWithFold = foldr1 (const id)
-- lastWithFold [1,2,5]
-- foldr1 (const id) [1,2,5]
-- acc = const id 2 5
-- acc = 5
-- acc = const id 1 5
-- acc - 5

lastByHead :: [a] -> a
lastByHead = head . reverse

lastByCurry :: [a] -> a
lastByCurry = foldr1 (curry snd)
-- foldr1 (curry snd) [1,2,5]
-- acc = (curry snd) 2 5 = 5
-- acc = (curry snd) 1 5 = 5

lastByIndex :: [a] -> a
lastByIndex [] = error "Empty List"
lastByIndex x = x !! (length x - 1)

main :: IO ()
main = do
  print $ lastByCurry "hippo"
