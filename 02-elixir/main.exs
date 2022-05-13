input_file_path = "../input/day02.input"

defmodule Solution do
  def parse_line(line) do
    [range, char, password] = String.split(line, " ")
    [low, high] = String.split(range, "-") |> Enum.map(fn x -> String.to_integer(x) end)
    char = String.at(char, 0)

    [low, high, char, password]
  end

  def is_valid1(pass) do
    [low, high, char, password] = pass
    count = String.graphemes(password) |> Enum.count(fn c -> c == char end)
    low <= count && count <= high
  end

  def is_valid2(pass) do
    [low, high, char, password] = pass
    lowChar = (String.at(password, low - 1) == char)
    highChar = (String.at(password, high - 1) == char)

    (lowChar || highChar) && !(lowChar && highChar)
  end

  def part1(passwords) do
    passwords
    |> Enum.map(fn line -> Solution.parse_line(line) end)
    |> Enum.filter(fn pass -> Solution.is_valid1(pass) end)
    |> Enum.count()
  end

  def part2(passwords) do
    passwords
    |> Enum.map(fn line -> Solution.parse_line(line) end)
    |> Enum.filter(fn pass -> Solution.is_valid2(pass) end)
    |> Enum.count()
  end
end

with {:ok, input} = File.read(input_file_path) do
  passwords = String.split(String.trim(input), "\n")

  result1 = Solution.part1(passwords)
  result2 = Solution.part2(passwords)

  IO.puts("Day02")
  IO.puts("Part 1: #{result1}")
  IO.puts("Part 2: #{result2}")
end
