import Debug.Trace

lastBut1 :: [a] -> a
lastBut1 = last . init

lastBut2 :: [a] -> a
lastBut2 lst = reverse lst !! 1

lastBut3 :: [a] -> a
lastBut3 [x, _] = x --(x:(_:[]))
lastBut3 (_:xs) = lastBut3 xs

lastBut4 :: [a] -> a
lastBut4 = head . tail . reverse

lastBut5 :: [a] -> a
lastBut5 = head . reverse . init

lastBut6 :: Show a => [a] -> a
lastBut6 (x:(_:[])) = x
lastBut6 (_:xs) = lastBut6 (trace (show xs) xs)

lastBut7 :: (Foldable f) => f a -> a
lastBut7 = fst . foldl (\(a,b) x -> (b, x)) (err1,err2)
  where
    err1 = error "Empty list"
    err2 = error "Singleton"

-- acc = (\(a,b) x -> (b, x)) (err1,err2) "1" = (err2, "1")
-- acc = (\(a,b) x -> (b, x)) (err2, "1") "3" = ("1", "3")
-- acc = (\(a,b) x -> (b, x)) ("1", "3") "5" = ("3", "5")
-- acc = (\(a,b) x -> (b, x)) ("3", "5") "7" = ("5", "7")
-- acc = (\(a,b) x -> (b, x)) ("5", "7") "9" = ("7", "9")


lastbut1safe :: Foldable f => f a -> Maybe a
lastbut1safe = fst . foldl (\(a,b) x -> (b,Just x)) (Nothing,Nothing)

lastBut8 [] = error "Empty list"
lastBut8 [x] = error "Too few elements"
lastBut8 (x:xs) = 
        if length xs == 1 then x
        else lastBut8 xs


main :: IO()
main = do
    print $ lastBut7 [1,3,5,7,9]


    
