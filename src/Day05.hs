module Day05 (main) where

range :: (Int, Int) -> Char -> (Int, Int)
range (low, high) 'F' = (low, low + (high - low) `div` 2)
range (low, high) 'B' = (low + (high - low) `div` 2 + 1, high)
range (low, high) 'L' = (low, low + (high - low) `div` 2)
range (low, high) 'R' = (low + (high - low) `div` 2 + 1, high)
range _ _ = error "Invalid input"

seatId :: String -> Int
seatId seat = row * 8 + col
  where
    (row, _) = foldl range (0, 127) $ take 7 seat
    (col, _) = foldl range (0, 7) $ drop 7 seat

part1 :: String -> String
part1 = show . maximum . map seatId . lines

part2 :: String -> String
part2 = show . missing . map seatId . lines
    where missing seats = head [x | x <- [minimum seats..maximum seats], x `notElem` seats]

solve :: String -> String
solve input = "Part 1: " ++ part1 input ++ "\nPart 2: " ++ part2 input

main :: IO ()
main = interact solve
