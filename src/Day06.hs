module Day06 (main) where

import Data.List.Split (splitOn)
import Data.List (nub)
import Data.Char (isLetter)

questionsYesAny :: String -> Int
questionsYesAny = length . nub . filter isLetter

part1 :: String -> String
part1 = show . sum . map questionsYesAny . splitOn "\n\n"

questionsYesAll :: String -> Int
questionsYesAll group = length $ filter (\c -> all (elem c) people) ['a'..'z']
    where people = lines group

part2 :: String -> String
part2 = show . sum . map questionsYesAll . splitOn "\n\n"

solve :: String -> String
solve input = "Part 1: " ++ part1 input ++ "\nPart 2: " ++ part2 input

main :: IO ()
main = interact solve
