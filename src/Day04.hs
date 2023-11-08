module Day04 (main) where

import Data.Char ( isLetter, isDigit, isHexDigit )
import Data.List.Split (splitOn)
import Control.Arrow ((&&&))

keyValues :: String -> [(String, String)]
keyValues = map keyValue . words
  where
    keyValue = (tail <$>) . break (== ':')

byrValid :: String -> Bool
byrValid byr = length byr == 4 && byr >= "1920" && byr <= "2002"

iyrValid :: String -> Bool
iyrValid iyr = length iyr == 4 && iyr >= "2010" && iyr <= "2020"

eyrValid :: String -> Bool
eyrValid eyr = length eyr == 4 && eyr >= "2020" && eyr <= "2030"

hgtValid :: String -> Bool
hgtValid hgt = case unit of
  "cm" -> value' >= 150 && value' <= 193
  "in" -> value' >= 59 && value' <= 76
  _ -> False
  where
    (value, unit) = break isLetter hgt
    value' = read value :: Int

hclValid :: String -> Bool
hclValid hcl = length hcl == 7 && head hcl == '#' && all isHexDigit (tail hcl)

eclValid :: String -> Bool
eclValid ecl = ecl `elem` ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"]

pidValid :: String -> Bool
pidValid pid = length pid == 9 && all isDigit pid

passportValid :: [(String, String)] -> Bool
passportValid passport = all (`elem` map fst passport) ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]

part1 :: String -> String
part1 = show . length . filter passportValid . map keyValues . splitOn "\n\n"

fieldsValid :: [(String, String)] -> Bool
fieldsValid = all
    ( \(key, value) -> case key of
        "byr" -> byrValid value
        "iyr" -> iyrValid value
        "eyr" -> eyrValid value
        "hgt" -> hgtValid value
        "hcl" -> hclValid value
        "ecl" -> eclValid value
        "pid" -> pidValid value
        _ -> True
    )

part2 :: String -> String
part2 = show . length . filter valid . map keyValues . splitOn "\n\n"
    where valid = uncurry (&&) . (fieldsValid &&& passportValid)

solve :: String -> String
solve input = "Part 1: " ++ part1 input ++ "\nPart 2: " ++ part2 input

main :: IO ()
main = interact solve
