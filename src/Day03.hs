module Day03 (main) where

slope :: (Int, Int) -> (Int, Int) -> [[Char]] -> Int -> Int
slope (x, y) (dx, dy) matrix count
  | y >= length matrix = count
  | otherwise = slope (x + dx, y + dy) (dx, dy) matrix (count + (if (matrix !! y) !! (x `mod` length (matrix !! y)) == '#' then 1 else 0))

part1 :: String -> String
part1 input = show $ slope (0, 0) (3, 1) matrix 0
  where
    matrix = lines input

part2 :: String -> String
part2 input = show $ product $ map go [(1, 1), (3, 1), (5, 1), (7, 1), (1, 2)]
  where
    matrix = lines input
    go (dx, dy) = slope (0, 0) (dx, dy) matrix 0

solve :: String -> String
solve input = "Part 1: " ++ part1 input ++ "\nPart 2: " ++ part2 input

main :: IO ()
main = interact solve
