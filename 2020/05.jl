### A Pluto.jl notebook ###
# v0.12.15

using Markdown
using InteractiveUtils

# ╔═╡ d123b2d4-3705-11eb-3160-9b61fce56ea7
md" # Advent of Code 2020 Day 05 
## Binary seat location"

# ╔═╡ 36784aa2-3706-11eb-0a20-3ddbc4998bd8
test="""
BFFFBBFRRR
FFFBBBFRRR
BBFFBBFRLL
"""

# ╔═╡ 4c848700-3706-11eb-0a58-85888e12d848
testanswer=(567, 119, 820)

# ╔═╡ 3a20c20e-3706-11eb-3457-21865ab4b1a8
input="""
BFFBFBFLRL
BFBFBBBLRR
BFBFBFBLRR
BFBFFFFRLR
BBFFBBFRRR
FBBBFFFRLL
FFBFBFFLLL
BBFBFFFRLL
FBBBFFBLRR
FFFFBFFRRL
BFBFBFBRLL
FFBFFBBLLL
BFFBBFFRLR
FBBFFFFLRR
FBFBFFBRRR
FFBFFBBRRR
FBBBFFFRRL
FFBBBBFRRL
BFFBBBBLLL
BFBBFBBLLR
FBBFBFFLLR
FBBFBFFLRR
BFFFFBFLLL
FBBBBBBRRR
FBFFBBFLLR
BBFBFFBRLR
FFFFFBBLLR
FBBFBBBRLL
FFFFBBFRRR
FFFFBFBLRL
FFFBFBFLLR
FFBFBBBLRR
BFFBBBFRLR
FFFBFBBLLL
FBFBBBFLRR
BBFFFBFLLL
FFFFFBBLRR
FFBFBFFRLL
BFFFBBFRLR
BFBBBFBLLR
FFFBBFFLRL
BFBBBFBLLL
FBFBBFBRLR
BBFFBFFRRR
BFFFFBBLRR
FBBBBBFLRL
FBFBBBBRRR
FBFBBFFLLL
BFBBBFBRLL
FFBBFBBLRR
FFBFBBBRRR
FFFFFBFLRL
BFFBBBFLRR
BFBBFBFLLR
FFBFBBBLRL
FBBBBFBLLL
BFBBBFFLRR
FBBFFBBLRR
BFFBBFBLRR
FBBBBBFLLL
FFFFBBBRLR
FBFBBBFLLR
BFBFFBFRLR
BFFBFFBRRR
FBBFFFFLRL
BFBFBBFLRL
BBFBFFFRLR
FBFFFFBLRR
BFFFBFFRLL
FBFFBFBLLR
FFFBFFFRLR
FFFBFFFRLL
BFFBFBBLLL
FFBBFBBLRL
BFBBBBFLRL
BFBBBBFLRR
BFBFFFFRRL
BFBBBFBRLR
BBFFBBBLLR
FBBFBBFRLR
FBFBFBFLLR
BFBFFBBRRR
FFFFBBFLLR
FBFFBFFLLL
BFFFFFBRLR
FBFBBBFLRL
BFFFBBFLLR
FBFBFBBRRR
FBFFBFBLRL
BBFFFBBLLL
FBFFFBFRRL
BBFFFFBRLR
BBFFBFBRRL
BFFBBBBRLR
FBFFFBBLRL
FBBFBBFLLR
FFBBBBBLLL
FBBBBBFLLR
FFBFFBFRLR
BFFBBFBLRL
FFBBBBFRLR
BFFBFBBRRL
FBFBBBFLLL
BBFBFFBRRR
FBFBBFFLLR
BFFFFFBRLL
FBBBBFBLLR
FFBBBFBLRR
FBBBBFBRLR
FBBBBBBRRL
FBBFFFBRRL
FBFBFFFLRR
FBBFFFBRLR
BFFBFBFRRL
FFBFBBFRLL
FBFBFFFRRR
BFFFFBFRRR
FFFFFBFRRL
BBFFBFFLRL
FBBBBBBLLR
BFFFBFFRRR
FFFFFBFRLL
FBBFBFBLLL
FFFFBBFLRR
BFBBFFFRLR
FFBFFBBLRR
FBFFBFBLRR
FFBBBFBLRL
FFFBBFBRLR
BFBFFBBLLR
FFFBBFBLLL
BBFFFBBLRL
FBFBFFFRLR
BBFFBFFRLR
FFFBFBFRLR
FFBBBBFLLR
BBFFBFFLRR
FFFFFBFRLR
BFBFBBFRRR
BBFFFBFRRL
BFFBFBFLLR
FFFBBBBLLL
BFFFBBFLLL
BBFFFBBRRL
BFFFFBFRLL
BFBFBBBLLR
BBFBFFBRRL
FBFFBBFLLL
FBFBFFFRRL
FBBFBBBLRR
BFBBFFBRLL
FBFBBBBRLR
FFFBBFFLRR
FBBFFBFRRL
BFFBBBBLRR
FFFFBBFRLR
FBFBBBFRRR
BFFBFFFRLL
BFFFFFFRRL
FBFFFFBRLR
BFFFFBBRRL
FBBBBBFRLR
FBBBBFBLRR
FFFBBFBRLL
FBBFBBFRRL
FFFBBBBRRL
FBBFFBBRRL
BFFBBFFLLR
FFFBFFBRRL
FBFFBFFLLR
FFFFFFBRLL
FFBBFBBRLR
FFBBFBFLRR
FFFBFFBRRR
FFBFFBBLLR
BFBFBFBLLR
FFBBBBFRRR
BFBBBFBLRL
BFFFBBFRRL
FBFBBBFRLL
BBFFFFBRRR
FBBFBFBRLR
BFBBBFFRRL
FBBBBFBRRL
FBBBFFBLRL
FBFFFBBRRL
BFBBFFBRRL
FBFBBFFLRL
FBFBBBBLRL
FFBBBFBRRL
FBBBBBBLRL
FFFFBBFRLL
FBFBBFBRLL
BFBFBBFLLR
FBFFFBBRLR
BFBFBBBRRR
FBBBBBBLRR
BFFBFFBRRL
FFBBBBBRLR
BFFFBBFLRL
FBFBBBBRLL
FFFFFBFRRR
BFBBBBFRLR
FFBFFBFRRL
FBBBBBBRLR
FBFFFBBLRR
FFFBFFBRLR
BFBFFBFLLR
FFFFFBBRRL
FBBBBBFRRL
FFFFBBBRRR
BFBBFFFRLL
BBFFBFBLLR
FFFFBFFLRR
FBFFFBFLLL
FBBFFBFRLR
BBFBFFBLLR
BBFBFFFLRL
BFFFBBBRLR
BFFBFFBLRL
BFBFBFFLRL
FBBFFBBRLR
FBFBFBBRLL
FFBFFFFLLL
FFFFBFBLLL
FBBFFBBLLR
FFFFBBBLRR
FFFFFBBRRR
BBFFFFFRLL
FBFBBFBRRR
FBBFFFFRRR
FFFFBFBRLR
BFFFFBBLLR
FFFBBBFRLL
BFFBBBBRRR
FBFFBBFRLL
BFBBFBFLRL
FBFBFBBLLL
FFBFFFFRRL
FBFBBBFRRL
FBBBBBBRLL
BFFFBFBRRR
BFBFBFBRRR
FBFFFBBRLL
BFFFFBBLLL
FFFBFFFRRL
FBBBBFFRRL
BFFFFFFLRR
BFBFBFFLRR
BFFFFBBRLL
FBBFFFFRRL
BFBBFBBRRR
FFFBFFBLLR
BFFBFFFRLR
FFBFFFBLLR
BFBFBFBLLL
BFFBFFFLRR
FFBBFFBLRR
FBBFFBFRLL
FFBFBFBRRL
FBFFFFFLLR
FBFFBBFRLR
FBFBBBFRLR
FFBBFFFLRR
FBBFFFFLLL
FFFBFFFLRL
BFFBBFBLLR
BFFFFFBLLL
BBFBFFBLLL
BFFBFBBLRR
BBFFFFBRLL
FBFFBFFLRL
FBBFFFFLLR
FFFBBFFRLR
FFFBBFBLRL
BFFBBBBLLR
BFBBBFBRRL
FFBBBFFLRR
FBBFFBBRLL
FFFBFBBRRR
BFFBFFFLRL
BFFFBFFLLR
FFFBFBFLLL
FFBFBFFRRL
FFFBFFFRRR
BFBFFFFLRL
BFFFFFBRRL
FFFBFBBLRL
FBFFBFFRRL
FFFFBFFLLR
FFBBBBFRLL
FBBBBFFLRR
FFFFBFFLLL
BFBBBBFRRL
FBFBBFFLRR
FFBBFBFRLL
FFFBFBBRLL
BFFFFFFLRL
BBFFFFBLRL
BFFFFFFRLR
FBFFFBFRLR
FBFFFFFLRL
BFBFBFFRLL
FFBBFBFLRL
FFFBBBFLLR
FBBFFFBRRR
FFFFFBFLRR
FBFFFBBLLR
FFFFBFBLRR
FBBFBBBLLR
FBBBFFBLLL
BBFFBFFRRL
BFBBFBBLLL
FBFFBFFRRR
FBFFFFBRLL
FFBBBFBRRR
FBBFFBBLLL
BBFFBBBRLL
FBFFFBFLRR
FBBBFFBRLR
FFBBBBBLLR
FBFFFFBLRL
BFFFBFBRLL
FFFFFBBLRL
BFBBFFBLLL
BBFFBBFLRR
BBFFBFFLLL
FBFBFFBRRL
BFFBBFFRRL
BFFBBFBRRR
FFBBBFBRLL
FBBFBFBRRL
FBFBBFBLLL
BFFFBBBLLL
FFFBBBFLRL
BFBBFFFLRL
FFFBFFBLLL
FFBBFBBRRR
FBBBBFFLLL
BBFBFFFRRR
FFBFFBFLRR
BFFBBFBLLL
BFFFBFBLLR
FFBBFBFRRR
BBFFFBBLRR
FFFFBFFRLL
BFBBBFFRLL
BFBFBFFRRL
BFBFFBBLRR
FBBFFFFRLL
FFFBFBBLLR
BBFFBBBLRR
FFBFBFBRLR
BBFFBBFLRL
BBFFFBBLLR
BFFFBBFLRR
FBBBBFFRLL
FBBFFFBLRR
BFBFBFBRLR
FBFBBFFRLR
FFFFBFFLRL
FBBBFBBLLR
FBFFFFFRLR
FBBFBBFLRR
BFBFBFFRLR
FFBFFBFLLR
FFFFBBBRLL
FBBBFBBRLL
FFFBFBFLRL
BFBBFFFLLR
BFFBFFBLRR
BFFFBFFRLR
FBBFFBFLLL
FBFBBBBRRL
FBBBBBFRLL
FBFFBBBRLR
FFBFFFBRRL
FFBFFBFLLL
BFBFBBFRLR
BFFFBFFLRL
FFBBBBBRRL
FBBFFBBLRL
FBFFFBBRRR
FBBFBFFLRL
BFFBFBFLRR
FFBBBFFRRR
BFBFFBBRLR
FBFBFBFRRL
FFBFBBBLLL
FBBFFFBLLL
FFFBBFBRRL
FFFFBBBRRL
FBBBFBFLLR
FBBBBBFRRR
FBFBBBBLLL
FFFBFBBLRR
FFBBFBBLLL
FBBFBBFLLL
FBFFFFBRRR
FBBBFFFLRR
FFFBFBBRLR
FBFFFFFRRR
BFBBFBFLLL
BFFFBBFRRR
BFFFBFBLRR
FBFFBFBRLR
BFBFFFBRLR
BFBBBBBLRL
BBFFBFBRRR
FFBFFFFRLL
FFFFFBFLLR
FBBBFBFRRR
BFBFFFBRRR
FBFBFFBLRL
FBFFBFBLLL
FBBFFFBLRL
BFFBFBBRLL
FFFBFFBLRR
BFBBFBFLRR
FBBFBBFRLL
FFBFBFFLLR
FFBBFBFRLR
FBFBFBBLRR
FFFBFBBRRL
FBFBFFFLLR
BFFBBFFLRR
FFBFFBBLRL
FFFFBFBRLL
BFBBBFFRRR
BFBFFFFRRR
FBFBBFBRRL
BFBBFFFLRR
BFBBFFBLRR
BFBFFFFLRR
FBFBFFFLLL
FFFBBBBRRR
FBBBBFFLRL
FBFBFFBLLL
BBFBFFBLRL
FFBFFBBRRL
BBFFFFBRRL
FBFFBBBLRR
FBFBFFFRLL
BFBBBFFLLL
FBBBFFBRRL
BBFFBFFLLR
FBFFFFFRRL
BFFBFFBRLR
BFBFBBFLRR
FFBFFFBLRL
FFBFBBBLLR
FFFBBBBLLR
FFBBFBFRRL
FFBFFFFRLR
FFBFFFBRRR
FBBFFBFLRR
BBFBFFFLRR
FFBFBFBLLL
BFBBFFFRRR
FBBBFFFLLR
FBFFBFFLRR
BBFFFFBLLR
FBFFFBFLRL
FFFBBFBLRR
FBBBBFBLRL
FFFFFFBRRR
BFBBFBFRLR
FFFBFBFRRL
FFBBFFFLRL
FFFFBBBLLL
FBBFBFFRRR
BFFBFBFLLL
BFFFFFFRLL
BFBBBBBRLR
FBBBFBFLRR
BFBBBFFLLR
BFBBBBBRRL
FFBBBFFLLL
BFBFBFFLLR
FBFBFBFRLR
FBBFBBFRRR
BFFBBFFRRR
FFFFFFBRLR
FBBFBFBLRL
FFBFFBFRRR
FFBFFFBLLL
FBBFBBBRLR
BFBFBBBRLR
BBFBFFBLRR
FBFFBFBRRL
FBFBFBBLRL
FFBBBFBRLR
BFBFFBBRRL
FFBBFFBRRL
FBFFFFFRLL
BFBBBBFRLL
BBFFFFBLRR
FBBBFBFRRL
FBFBFFBRLR
FFFFBFBRRR
FBFFBBFLRR
BFFFBFBRLR
BFBBFBFRLL
FBBBFFFRRR
FFBFBBFRRL
FBBBFFFLLL
FBBFBFBLLR
FFFFBFFRRR
FFFFBBFLLL
BFFBFBFRLL
FFBFBFBLLR
BFFBFFFRRR
BBFBFFFLLL
FBFFFFFLLL
FFFBBBBRLL
FFBBFBBLLR
FBFFFFBLLL
BFBBBBFLLR
FFFBBFBRRR
BBFBFBFLLL
BFBBFFFRRL
BFBFFBBLRL
FBFBBFFRRL
FFFBBBBRLR
FBFFFFBLLR
FFFBBBFLLL
BFBBFFBRLR
FFBFBBFLLR
BBFBFFBRLL
FBFBBFBLLR
BFBFFFBLRL
FFFFBBFLRL
BBFFFBFRLL
FBBBFFBRLL
BFFFBFFRRL
BFBFBBFRRL
FBFBFBBRLR
FFFFFBBRLL
BFBFFFBRRL
BFFFFBBRLR
FBFFBBBRLL
FFBFFBBRLR
BFFBFBBRRR
BBFFFBFLRL
FBFFFBFLLR
FBBFFFFRLR
BFFFBFBLRL
FFBFBBFLLL
BFFFFFBLLR
FFBBFBBRRL
FBFBBBBLLR
BFFBBFBRLL
BBFFBBFLLL
FFBFFBBRLL
FFBBBFBLLR
BBFBFBFLRL
BFFFBBBLRL
FBBFBBBLRL
FBBFBFFRRL
BFBFFBBRLL
FFBBBBBLRL
FFBBBBFLLL
BFBBBFBLRR
FFFBFBFRRR
BFBBBBBLLR
FFBBFFBLLL
BFBBBBFLLL
FBBBFBFRLR
FFBFFFFLLR
BBFFBBBRRL
BFFBBFFRLL
BFFBBBBLRL
BFBFBFFRRR
FFBFBBFRLR
BBFFBBFRLR
BFFFBBBLLR
BFBFFBFRRL
FFFFFBFLLL
FBFFBBBRRL
BFBFBBFLLL
BFFFFFBLRL
FBBBFBBLLL
FFBBFFBRRR
FFFBBFFLLR
BFBFFBFLRL
FFBFFFBRLR
FBFFFBFRLL
BFFFFFFLLR
BFFBBBFRRR
FFBFBFFRLR
BBFFBFBRLL
FFFBFBFRLL
BBFFFBFRLR
BFFBFFBLLL
FFBFBBFRRR
BFBFFBFRLL
FBBBBFFRLR
FFBFBFBRLL
BFFBFBBLLR
FBFFBFFRLL
FFBFBBBRRL
FBFBBFBLRR
FBBFFBFRRR
FFBFBFFRRR
BBFFFFFLRL
FBBBFFBLLR
FBFBFBFRLL
BBFFFFFRLR
FBBBBFBRRR
BBFFFFFRRR
FFFBFFFLLR
BFBFBBBLRL
FBFBBBBLRR
BBFFFBFLLR
BFBBFBBLRL
BFFBFBFRLR
BFFBBFBRRL
BFFBFFBRLL
FFBFFFBRLL
FFBBFFFRLL
FBFBFFFLRL
FBBFBBBLLL
BFFBFFFLLL
FBFFFFFLRR
BFBFBBBRLL
FBFFBBBLLL
FFFBBFFRLL
FFBFFFFRRR
FFBBBBFLRL
FFBFFBFRLL
FFBBFFFRRR
BFBBBBBLLL
FFFBBFFLLL
BFBBBFFRLR
FBFFBBBLRL
BFBBFFBLRL
FBBFBFFLLL
FFFBFFFLLL
FBBBFBBRRL
FFFBFBFLRR
BFBBFFBLLR
FFBFBFBRRR
BFBFBBBLLL
FBFBFBBRRL
BFFFBBBRLL
FBFBFFBRLL
FBFFBBFRRL
BFFFBBBRRR
FFFFBFFRLR
BFBBFBFRRR
BFBBBBBRLL
FBBBFBBRLR
FFBFFFBLRR
BBFFFFFLLL
FFBFBFFLRL
BFBFFBFRRR
BBFFBBFRLL
FFBBBFBLLL
BFFFFFBLRR
FBBBBBBLLL
BFFBFFFLLR
FFBFBFFLRR
BFBBBBBLRR
FBBFBFBRLL
BFBBBBFRRR
BBFFFFBLLL
BFFBFFBLLR
FBFBFBBLLR
BFFFFFBRRR
FBBFBFFRLR
FBFFBBFLRL
FBFFBBBLLR
FFBBFFBRLR
FFBFFFFLRL
FBBBFBBRRR
FFBFBBBRLL
BFBFFFBLLR
BFBFFBFLLL
FFFBBFFRRL
FBBFFBBRRR
FFFFBBBLLR
BFBFFFBRLL
BFBFFFFLLL
BFFBFFFRRL
FBBFFBFLLR
FBFFBBBRRR
FFFFBFBRRL
BFFFFBFLLR
FFFBFFFLRR
BFBBFBFRRL
FFFFBFBLLR
FBBFBFBLRR
FFFBBBFRRR
FFFBBBBLRL
FBFFFFBRRL
BFBBFFBRRR
FFBFFFFLRR
FFBBFFFRLR
BFBFFFBLRR
FFBBFBFLLR
FFBBFFFLLL
BFFFBFBRRL
FFBBBFFRLR
FBFBFBFRRR
FFFFFBBLLL
BBFFBBFLLR
FBFBFBFLRR
BBFFFFFRRL
BFBBFBBLRR
FBBBBBFLRR
BFFBBFFLRL
BBFBFFFRRL
FBFFBFFRLR
FBFBFFBLRR
FBBBFBFLRL
FFFBBBBLRR
BBFFFBBRRR
FFBBBBFLRR
BBFFBBBRRR
FBFBFBFLRL
BBFFBBBLRL
BFBBFBBRLR
FBBBFBFLLL
BFFBFBBLRL
BFFFFFFRRR
BFFBBBFLLL
FFBFBBFLRR
FFFBFFBRLL
FBBFFFBLLR
FFBBBFFLRL
BFBFBFBLRL
BFBFFFBLLL
FFBBBFFRRL
BBFFBBBRLR
BFBFFFFLLR
BFFFBBBRRL
BBFFBFBRLR
BFFFBFBLLL
BFFFBFFLLL
BFBFFBFLRR
BFFBBFBRLR
BBFFBBFRRL
BFBBFBBRLL
FFBBBBBRRR
BFBBBFBRRR
FBFFBBFRRR
BBFFBFBLLL
BFFFFBBRRR
FBBFBBBRRL
BFFBBBFLLR
BFBFBFBRRL
FFBBFFFRRL
BFFBBFFLLL
FBBBBFFRRR
BBFFFBFLRR
BBFFFFFLRR
FBFFFBBLLL
FBBBFFFRLR
FBBBFFFLRL
BFFBBBFLRL
FFBFBBBRLR
FFBFFBFLRL
FBFBFBFLLL
FBBBBFFLLR
BFFFFFFLLL
FFFBBBFLRR
FBBBFBBLRL
FBBBBFBRLL
BFBBBFFLRL
BBFFBFFRLL
BBFFFFFLLR
FBBFBFBRRR
FBFBBFFRRR
BFFBBBFRLL
BFFFFBFRLR
FFBFBFBLRL
FFFFBBFRRL
FFFFFFBRRL
FFFBFFBLRL
BFFBBBBRLL
FBFBBFBLRL
BBFFFBBRLL
FBFFBFBRLL
FFBBBBBRLL
FFBFBBFLRL
FFFFFBBRLR
FFBBFBFLLL
FFFFFFBLRR
BBFFFBFRRR
FBBFFFBRLL
FFFFBBBLRL
BFFFFBFLRR
BBFBFBFLLR
BFFFFBFRRL
BFBBFFFLLL
FBFFBFBRRR
BFFFBBFRLL
BFFFFBBLRL
FFFBBBFRRL
FBFFFBFRRR
FFBBBFFRLL
BFBFFBBLLL
BFBFBBBRRL
BFFFFBFLRL
FBBFBBBRRR
FBBFBBFLRL
FBBBFBBLRR
FBBBFFBRRR
BBFFBFBLRR
FFBBBFFLLR
BFBFBFFLLL
FFBBFFBLLR
FBFBBFFRLL
FBBFFBFLRL
FFBFBFBLRR
FFFBBFBLLR
FFBBFFBLRL
BFBBBBBRRR
BFBFBBFRLL
FFBBFFFLLR
FFBBFFBRLL
FFFBBBFRLR
BFFFBFFLRR
BFFBFBBRLR
BBFFBBBLLL
FBFBFFBLLR
FFFBBFFRRR
BBFBFFFLLR
FBBFBFFRLL
FFBBFBBRLL
FBBBFBFRLL
BFBBFBBRRL
BFBFFFFRLL
BFFFBBBLRR
FFBBBBBLRR
BBFFFBBRLR
BFFBBBFRRL
BBFFBFBLRL
BFFBBBBRRL
"""

# ╔═╡ 5dc6a57a-3706-11eb-0e5f-a348d306acc5
d= input |> IOBuffer |> readlines

# ╔═╡ 6a53c462-3706-11eb-3b2c-976e34e83f72
function binaryencode(s) # this could be more efficient!
	f=replace(s,r"B|R"=>"1")
	g=replace(f,r"F|L"=>"0")
	
	return parse(Int,g,base=2)
end 
# I'm quite impressed this worked on first try, as I didn't look at the puzzle words other than having earlier read that some chars were 1 and some were 0.

# ╔═╡ c9f15c04-3706-11eb-083a-2573077bd59d
maximum(binaryencode.(d)) # Part A answer

# ╔═╡ 0d0d6a0c-3708-11eb-0717-e5dd3c7ad682
md"## Part B - locate the actual seat"

# ╔═╡ 1361f99a-3708-11eb-3e0f-1bd4784f1601
s=binaryencode.(d) # have a look at the data

# ╔═╡ 1d857354-3708-11eb-1e56-7151b8039001
minimum(s) # can we access the lowest value some how?
# yes! 

# ╔═╡ 2f988a9a-3708-11eb-1739-9bb5248cdc40
setdiff(minimum(s):maximum(s), s) # Part B answer
# This works bnecause the answer is just the difference in sets between all the filled seats, and the range min-max. (So you don't consider the seats which don't exist.)

# ╔═╡ Cell order:
# ╠═d123b2d4-3705-11eb-3160-9b61fce56ea7
# ╟─36784aa2-3706-11eb-0a20-3ddbc4998bd8
# ╠═4c848700-3706-11eb-0a58-85888e12d848
# ╟─3a20c20e-3706-11eb-3457-21865ab4b1a8
# ╠═5dc6a57a-3706-11eb-0e5f-a348d306acc5
# ╠═6a53c462-3706-11eb-3b2c-976e34e83f72
# ╠═c9f15c04-3706-11eb-083a-2573077bd59d
# ╠═0d0d6a0c-3708-11eb-0717-e5dd3c7ad682
# ╠═1361f99a-3708-11eb-3e0f-1bd4784f1601
# ╠═1d857354-3708-11eb-1e56-7151b8039001
# ╠═2f988a9a-3708-11eb-1739-9bb5248cdc40
