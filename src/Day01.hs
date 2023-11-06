module Day01 (main) where

part1 :: String -> String
part1 input = show $ head [x * y | x <- nums, y <- nums, x + y == 2020]
  where
    nums = map read $ lines input :: [Int]

part2 :: String -> String
part2 input = show $ head [x * y * z | x <- nums, y <- nums, z <- nums, x + y + z == 2020]
  where
    nums = map read $ lines input :: [Int]

solve :: String -> String
solve input = "Part 1: " ++ part1 input ++ "\nPart 2: " ++ part2 input

main :: IO ()
main = interact solve
