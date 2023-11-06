module Day02 (main) where

valid1 :: String -> Bool
valid1 password =
    let (min', rest) = break (== '-') password in
    let (max', rest') = break (== ' ') $ tail rest in
    let (letter, rest'') = break (== ':') $ tail rest' in
    let password' = tail $ tail rest'' in
    let count = length $ filter (== head letter) password' in
    count >= read min' && count <= read max'

part1 :: String -> String
part1 = show . length . filter valid1 . lines

valid2 :: String -> Bool
valid2 password =
    let (pos1', rest) = break (== '-') password in
    let (pos2', rest') = break (== ' ') $ tail rest in
    let (letter, rest'') = break (== ':') $ tail rest' in
    let password' = tail $ tail rest'' in
    let pos1 = read pos1' - 1 in
    let pos2 = read pos2' - 1 in
    let letter' = head letter in
    (password' !! pos1 == letter') /= (password' !! pos2 == letter')

part2 :: String -> String
part2 = show . length . filter valid2 . lines

solve :: String -> String
solve input = "Part 1: " ++ part1 input ++ "\nPart 2: " ++ part2 input

main :: IO ()
main = interact solve
