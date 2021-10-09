module Chapter1 where

product :: Num a => [a] -> a
product [] = 1
product [a] = a
product (a:as) = a * (Chapter1.product as)

qsort :: Ord a => [a] -> [a]
qsort [] = []
qsort [a] = [a]
qsort (a:as) =
  qsort smaller ++ [a] ++ qsort greater
    where
      smaller = [ x | x <- as, x <= a ]
      greater = [ y | y <- as, y > a ]

qsortWithError :: Ord a => [a] -> [a]
qsortWithError [] = []
qsortWithError [a] = [a]
qsortWithError (a:as) =
  qsortWithError smaller ++ [a] ++ qsortWithError greater
    where
      smaller = [ x | x <- as, x < a ]  -- Equality sign omitted here => if the list contains multiple members of the same value, they will be left out. So it's deduplication you could say.
      greater = [ y | y <- as, y > a ]


qsortUniq :: Ord a => [a] -> [a]
qsortUniq = qsortWithError

qsortReverse :: Ord a => [a] -> [a]
qsortReverse [] = []
qsortReverse [a] = [a]
qsortReverse (a:as) =
  qsortReverse greater ++ [a] ++ qsortReverse smaller
    where
      smaller = [ x | x <- as, x <= a ]
      greater = [ y | y <- as, y > a ]
