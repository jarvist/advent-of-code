### A Pluto.jl notebook ###
# v0.19.16

using Markdown
using InteractiveUtils

# ╔═╡ d955534c-52b4-11ec-10b7-bf7961e70d1d
md"### Advent of Code 2021 - Day 05"

# ╔═╡ b02e578c-5e37-4f46-ac7b-37ffb900127a


# ╔═╡ 6a1dab04-f860-4a26-8c59-3f0298bf4ddb
md"# Part A - Cargo crane done dirty cheap"

# ╔═╡ 04cc0203-f506-450f-af99-f7de88c2d03b
C=fill(Char[],9)

# ╔═╡ 85102254-4bac-45aa-8d52-aba97c89eefd
function moveA(l)
	s=split(l)
	count=parse(Int,s[2])
	from=parse(Int,s[4])
	to=parse(Int,s[6])
	
	for i in 1:count
		push!(C[to],pop!(C[from]))
	end
end

# ╔═╡ 61a9ecee-d12b-4aba-b3b7-365c24c04248
begin
	C[1]=['Z','N']
	C[2]=['M','C','D']
	C[3]=['P'] 
end

# ╔═╡ 35cbf764-9d66-4618-a971-a18db1dc484c
"""
[N]     [C]                 [Q]    
[W]     [J] [L]             [J] [V]
[F]     [N] [D]     [L]     [S] [W]
[R] [S] [F] [G]     [R]     [V] [Z]
[Z] [G] [Q] [C]     [W] [C] [F] [G]
[S] [Q] [V] [P] [S] [F] [D] [R] [S]
[M] [P] [R] [Z] [P] [D] [N] [N] [M]
[D] [W] [W] [F] [T] [H] [Z] [W] [R]
 1   2   3   4   5   6   7   8   9 
"""

# ╔═╡ 251d527d-5e0a-404a-9477-f4bf44c62343
# OK, I feel a bit dirty.

# ╔═╡ 303c43ab-e1c4-4920-99b6-e2587e9e54c0
md"# Part B - Cargo crane done dirty cheap"

# ╔═╡ e6f8aeca-c484-45c7-855f-3ba320bcdd10
C

# ╔═╡ 09d0df60-7e2f-4a14-9d29-0dc2f314ce23
function moveB(l)
	s=split(l)
	c=parse(Int,s[2])
	from=parse(Int,s[4])
	to=parse(Int,s[6])
	scut=splice!(C[from],(lastindex(C[from])-c+1):lastindex(C[from]))
    lastindex(C[from])-c+1,lastindex(C[from]),C[from],C[to], scut
	push!(C[to],scut...) #do you like spaghetti
end

# ╔═╡ adfc7059-e20b-433d-8507-fc0f9a802d10
md"""
## Notes

I feel kinda terrible, but also I regret not not writing a parser. So in many ways I win?
"""

# ╔═╡ e9ccc9db-1e46-4430-985b-963f76dd30c6


# ╔═╡ 2365d986-c3df-4e48-9dd1-dab9a7338431
#     [D]    
# [N] [C]    
# [Z] [M] [P]
#  1   2   3 

test="""
move 1 from 2 to 1
move 3 from 1 to 3
move 2 from 2 to 1
move 1 from 1 to 2
"""

# ╔═╡ 99b6cb72-bb79-4c34-b2cb-ff537c2d189f
begin
	C[1]=['Z','N']
	C[2]=['M','C','D']
	C[3]=['P'] 
test |> IOBuffer |> readlines .|>moveB

[last(C[n]) for n in 1:3] |> String
end

# ╔═╡ fab68e24-ad74-4511-be94-a4b05ca8b27a
input="""
move 1 from 3 to 9
move 3 from 5 to 3
move 4 from 2 to 5
move 4 from 1 to 2
move 3 from 5 to 7
move 3 from 1 to 2
move 4 from 8 to 7
move 4 from 9 to 7
move 4 from 2 to 7
move 2 from 3 to 6
move 3 from 6 to 2
move 5 from 4 to 7
move 7 from 3 to 7
move 5 from 6 to 9
move 2 from 4 to 8
move 1 from 3 to 2
move 4 from 2 to 7
move 2 from 2 to 8
move 8 from 8 to 5
move 1 from 2 to 4
move 1 from 2 to 9
move 7 from 5 to 4
move 31 from 7 to 1
move 9 from 9 to 3
move 12 from 1 to 9
move 15 from 1 to 7
move 4 from 3 to 8
move 2 from 5 to 1
move 12 from 7 to 5
move 2 from 8 to 2
move 12 from 5 to 4
move 1 from 3 to 5
move 6 from 1 to 3
move 1 from 1 to 5
move 1 from 8 to 7
move 1 from 8 to 5
move 7 from 7 to 8
move 5 from 8 to 2
move 11 from 4 to 2
move 10 from 3 to 1
move 1 from 7 to 5
move 10 from 1 to 3
move 5 from 4 to 2
move 1 from 4 to 6
move 7 from 2 to 3
move 9 from 9 to 5
move 15 from 2 to 3
move 1 from 9 to 1
move 7 from 5 to 3
move 1 from 2 to 4
move 2 from 9 to 2
move 1 from 8 to 9
move 5 from 5 to 3
move 1 from 8 to 7
move 1 from 2 to 4
move 1 from 7 to 6
move 1 from 1 to 6
move 1 from 6 to 9
move 1 from 5 to 4
move 1 from 6 to 4
move 1 from 6 to 8
move 2 from 9 to 4
move 12 from 3 to 1
move 8 from 4 to 8
move 1 from 9 to 8
move 10 from 8 to 6
move 1 from 6 to 7
move 6 from 6 to 9
move 1 from 2 to 7
move 1 from 4 to 7
move 2 from 7 to 3
move 1 from 1 to 3
move 6 from 9 to 1
move 2 from 6 to 7
move 12 from 1 to 3
move 5 from 1 to 9
move 1 from 7 to 3
move 38 from 3 to 7
move 19 from 7 to 8
move 19 from 8 to 2
move 1 from 9 to 6
move 5 from 3 to 7
move 2 from 6 to 7
move 1 from 3 to 9
move 2 from 3 to 6
move 4 from 2 to 6
move 6 from 2 to 4
move 14 from 7 to 9
move 8 from 2 to 5
move 19 from 9 to 3
move 6 from 4 to 1
move 6 from 1 to 4
move 4 from 4 to 3
move 10 from 7 to 6
move 1 from 6 to 4
move 22 from 3 to 1
move 5 from 1 to 6
move 5 from 5 to 8
move 1 from 7 to 4
move 1 from 2 to 3
move 15 from 6 to 9
move 3 from 8 to 4
move 2 from 3 to 1
move 6 from 9 to 1
move 1 from 3 to 9
move 1 from 3 to 1
move 1 from 5 to 9
move 1 from 7 to 1
move 1 from 8 to 2
move 6 from 9 to 2
move 2 from 9 to 1
move 3 from 6 to 3
move 2 from 9 to 5
move 1 from 6 to 7
move 2 from 2 to 7
move 3 from 3 to 5
move 1 from 8 to 9
move 7 from 4 to 7
move 1 from 6 to 3
move 2 from 9 to 5
move 10 from 1 to 5
move 19 from 1 to 8
move 9 from 7 to 1
move 1 from 3 to 5
move 2 from 2 to 4
move 2 from 2 to 6
move 2 from 6 to 4
move 7 from 1 to 7
move 3 from 7 to 3
move 2 from 4 to 1
move 3 from 3 to 4
move 1 from 2 to 4
move 2 from 4 to 1
move 2 from 4 to 8
move 20 from 8 to 2
move 1 from 8 to 3
move 4 from 7 to 8
move 14 from 2 to 6
move 3 from 1 to 2
move 2 from 1 to 7
move 1 from 4 to 6
move 1 from 1 to 5
move 4 from 2 to 8
move 3 from 7 to 6
move 1 from 4 to 6
move 2 from 7 to 9
move 1 from 2 to 6
move 1 from 3 to 1
move 3 from 5 to 8
move 1 from 1 to 4
move 2 from 9 to 5
move 4 from 6 to 7
move 1 from 4 to 1
move 1 from 8 to 5
move 1 from 7 to 6
move 1 from 2 to 9
move 2 from 7 to 1
move 1 from 1 to 3
move 1 from 7 to 2
move 4 from 2 to 7
move 1 from 1 to 3
move 2 from 3 to 2
move 9 from 8 to 3
move 1 from 8 to 6
move 2 from 7 to 3
move 1 from 7 to 4
move 1 from 9 to 7
move 1 from 7 to 2
move 2 from 2 to 8
move 6 from 5 to 2
move 5 from 3 to 7
move 1 from 4 to 7
move 3 from 7 to 1
move 11 from 5 to 8
move 2 from 1 to 6
move 2 from 1 to 8
move 2 from 5 to 9
move 1 from 7 to 2
move 2 from 5 to 4
move 17 from 6 to 7
move 1 from 4 to 1
move 1 from 1 to 7
move 1 from 6 to 5
move 1 from 6 to 2
move 9 from 2 to 5
move 1 from 6 to 7
move 9 from 7 to 4
move 3 from 7 to 8
move 3 from 3 to 4
move 8 from 7 to 9
move 11 from 8 to 1
move 1 from 4 to 3
move 1 from 7 to 4
move 9 from 9 to 4
move 5 from 1 to 7
move 8 from 5 to 1
move 3 from 3 to 4
move 6 from 7 to 9
move 3 from 8 to 5
move 1 from 3 to 8
move 1 from 5 to 8
move 2 from 9 to 1
move 3 from 9 to 7
move 2 from 7 to 9
move 3 from 9 to 8
move 1 from 7 to 3
move 1 from 3 to 9
move 7 from 4 to 3
move 18 from 4 to 2
move 8 from 1 to 6
move 1 from 6 to 7
move 2 from 3 to 1
move 14 from 2 to 6
move 5 from 1 to 6
move 5 from 3 to 2
move 2 from 9 to 5
move 3 from 1 to 8
move 1 from 7 to 9
move 3 from 5 to 1
move 4 from 8 to 4
move 1 from 2 to 7
move 6 from 2 to 5
move 2 from 1 to 6
move 14 from 6 to 1
move 2 from 4 to 7
move 2 from 4 to 6
move 12 from 1 to 6
move 8 from 8 to 3
move 11 from 6 to 1
move 1 from 1 to 6
move 15 from 6 to 9
move 3 from 7 to 3
move 11 from 1 to 4
move 3 from 5 to 3
move 10 from 9 to 5
move 2 from 6 to 9
move 2 from 2 to 5
move 6 from 3 to 7
move 7 from 9 to 3
move 2 from 1 to 8
move 1 from 9 to 6
move 12 from 3 to 4
move 13 from 5 to 6
move 2 from 7 to 4
move 3 from 7 to 5
move 2 from 8 to 4
move 15 from 6 to 5
move 22 from 4 to 5
move 2 from 3 to 6
move 1 from 7 to 8
move 2 from 1 to 2
move 13 from 5 to 3
move 1 from 8 to 6
move 1 from 6 to 4
move 1 from 2 to 7
move 7 from 5 to 2
move 4 from 4 to 8
move 1 from 6 to 3
move 3 from 5 to 6
move 2 from 8 to 9
move 4 from 5 to 1
move 1 from 9 to 8
move 4 from 2 to 5
move 1 from 7 to 6
move 4 from 6 to 3
move 1 from 6 to 9
move 1 from 9 to 6
move 4 from 1 to 6
move 1 from 9 to 4
move 4 from 6 to 3
move 1 from 6 to 4
move 14 from 5 to 6
move 23 from 3 to 1
move 2 from 5 to 6
move 1 from 4 to 2
move 6 from 5 to 7
move 16 from 6 to 5
move 2 from 2 to 6
move 2 from 6 to 1
move 2 from 2 to 4
move 1 from 2 to 8
move 15 from 1 to 3
move 4 from 8 to 2
move 9 from 1 to 8
move 12 from 5 to 7
move 2 from 5 to 1
move 1 from 4 to 6
move 1 from 5 to 6
move 3 from 7 to 3
move 2 from 8 to 6
move 1 from 2 to 3
move 2 from 3 to 5
move 3 from 1 to 9
move 12 from 3 to 9
move 4 from 9 to 7
move 2 from 9 to 5
move 4 from 8 to 5
move 8 from 7 to 2
move 6 from 5 to 8
move 2 from 5 to 7
move 12 from 7 to 1
move 2 from 6 to 7
move 11 from 2 to 4
move 1 from 6 to 5
move 1 from 5 to 8
move 10 from 8 to 6
move 7 from 1 to 9
move 3 from 3 to 8
move 2 from 7 to 4
move 1 from 5 to 3
move 9 from 4 to 7
move 16 from 9 to 6
move 2 from 1 to 6
move 1 from 7 to 8
move 2 from 4 to 1
move 1 from 1 to 5
move 1 from 5 to 7
move 2 from 3 to 9
move 5 from 4 to 6
move 1 from 3 to 6
move 1 from 4 to 5
move 1 from 5 to 8
move 16 from 6 to 5
move 2 from 7 to 6
move 21 from 6 to 2
move 3 from 8 to 7
move 1 from 9 to 1
move 7 from 7 to 1
move 14 from 2 to 5
move 1 from 9 to 3
move 1 from 3 to 1
move 1 from 8 to 3
move 2 from 2 to 6
move 15 from 5 to 1
move 20 from 1 to 8
move 1 from 3 to 5
move 4 from 2 to 8
move 2 from 1 to 2
move 2 from 6 to 8
move 3 from 7 to 6
move 2 from 6 to 7
move 1 from 7 to 2
move 6 from 5 to 6
move 3 from 5 to 9
move 2 from 9 to 6
move 1 from 9 to 4
move 2 from 2 to 3
move 1 from 3 to 2
move 2 from 1 to 4
move 1 from 3 to 9
move 2 from 4 to 7
move 4 from 8 to 4
move 8 from 8 to 6
move 5 from 6 to 9
move 6 from 6 to 7
move 6 from 6 to 3
move 5 from 3 to 2
move 2 from 2 to 3
move 10 from 7 to 1
move 2 from 5 to 2
move 2 from 4 to 1
move 5 from 5 to 9
move 2 from 3 to 5
move 2 from 9 to 4
move 5 from 4 to 8
move 8 from 9 to 6
move 16 from 1 to 9
move 7 from 2 to 7
move 10 from 9 to 4
move 10 from 4 to 8
move 1 from 7 to 3
move 1 from 2 to 5
move 3 from 5 to 7
move 2 from 3 to 6
move 5 from 7 to 4
move 4 from 4 to 5
move 17 from 8 to 3
move 9 from 6 to 2
move 17 from 3 to 9
move 9 from 8 to 3
move 2 from 5 to 6
move 1 from 5 to 8
move 5 from 2 to 4
move 1 from 6 to 9
move 3 from 9 to 5
move 3 from 7 to 4
move 13 from 9 to 3
move 3 from 9 to 2
move 1 from 9 to 8
move 2 from 6 to 4
move 9 from 3 to 4
move 3 from 9 to 3
move 1 from 8 to 1
move 2 from 5 to 2
move 5 from 4 to 7
move 1 from 9 to 2
move 6 from 7 to 2
move 1 from 9 to 6
move 9 from 2 to 4
move 1 from 1 to 7
move 1 from 6 to 5
move 1 from 7 to 4
move 4 from 4 to 2
move 12 from 3 to 6
move 7 from 2 to 5
move 1 from 2 to 1
move 1 from 1 to 9
move 2 from 2 to 6
move 5 from 8 to 2
move 8 from 6 to 3
move 1 from 9 to 3
move 4 from 2 to 7
move 1 from 3 to 2
move 2 from 2 to 7
move 1 from 2 to 5
move 3 from 6 to 3
move 10 from 5 to 8
move 1 from 5 to 3
move 1 from 6 to 5
move 5 from 8 to 7
move 1 from 5 to 8
move 2 from 6 to 3
move 5 from 7 to 4
move 3 from 3 to 6
move 2 from 8 to 6
move 3 from 8 to 2
move 1 from 3 to 7
move 15 from 4 to 5
move 10 from 4 to 1
move 7 from 3 to 5
move 1 from 2 to 9
move 5 from 5 to 7
move 8 from 5 to 9
move 4 from 3 to 6
move 3 from 9 to 6
move 3 from 1 to 4
move 10 from 7 to 4
move 2 from 2 to 4
move 2 from 3 to 5
move 1 from 7 to 2
move 1 from 7 to 6
move 6 from 6 to 5
move 7 from 5 to 3
move 1 from 8 to 3
move 5 from 1 to 6
move 9 from 5 to 3
move 14 from 4 to 7
move 1 from 2 to 8
move 1 from 8 to 2
move 1 from 6 to 4
move 2 from 4 to 7
move 1 from 2 to 9
move 1 from 4 to 8
move 2 from 1 to 4
move 8 from 6 to 1
move 1 from 4 to 3
move 1 from 5 to 8
move 12 from 7 to 3
move 1 from 4 to 8
move 7 from 9 to 1
move 3 from 6 to 2
move 3 from 8 to 7
move 1 from 2 to 9
move 4 from 7 to 1
move 6 from 1 to 7
move 2 from 2 to 8
move 7 from 7 to 3
move 10 from 1 to 6
move 20 from 3 to 1
move 2 from 6 to 7
move 1 from 9 to 1
move 8 from 6 to 8
move 6 from 8 to 9
move 5 from 3 to 7
move 2 from 7 to 3
move 2 from 9 to 2
move 5 from 1 to 3
move 2 from 9 to 8
move 8 from 3 to 7
move 6 from 8 to 3
move 1 from 9 to 8
move 19 from 1 to 6
move 17 from 3 to 6
move 2 from 2 to 4
move 1 from 3 to 5
move 1 from 4 to 1
move 1 from 4 to 8
move 2 from 8 to 5
move 1 from 5 to 1
move 1 from 5 to 4
move 1 from 5 to 7
move 2 from 1 to 3
move 15 from 7 to 4
move 1 from 9 to 7
move 2 from 7 to 6
move 21 from 6 to 4
move 17 from 6 to 8
move 2 from 3 to 5
move 29 from 4 to 9
move 15 from 9 to 7
move 1 from 5 to 1
move 9 from 8 to 2
move 10 from 9 to 3
move 8 from 2 to 6
"""

# ╔═╡ 4148bad1-611c-4d6f-8a60-38ceeec3da1e
begin
	C[1]=[i for i in "DMSZRFWN"]
	C[2]=[i for i in "WPQGS"]
	C[3]=[i for i in "WRVQFNJC"]
	C[4]=[i for i in "FZPCGDL"]
	C[5]=[i for i in "TPS"]
	C[6]=[i for i in "HDFWRL"]
	C[7]=[i for i in "ZNDC"]
	C[8]=[i for i in "WNRFVSJQ"]
	C[9]=[i for i in "RMSGZWV"]

	input |> IOBuffer |> readlines .|>moveA

	[last(C[n]) for n in 1:9] |> String
end

# ╔═╡ 3181ab13-598c-4c4d-9446-b4e6493b9817
begin
		C[1]=[i for i in "DMSZRFWN"]
	C[2]=[i for i in "WPQGS"]
	C[3]=[i for i in "WRVQFNJC"]
	C[4]=[i for i in "FZPCGDL"]
	C[5]=[i for i in "TPS"]
	C[6]=[i for i in "HDFWRL"]
	C[7]=[i for i in "ZNDC"]
	C[8]=[i for i in "WNRFVSJQ"]
	C[9]=[i for i in "RMSGZWV"]
input |> IOBuffer |> readlines .|>moveB

[last(C[n]) for n in 1:9] |> String
end

# ╔═╡ 91996ec5-55ce-4b2c-a4df-4e5b0b89f5f0


# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.8.2"
manifest_format = "2.0"
project_hash = "da39a3ee5e6b4b0d3255bfef95601890afd80709"

[deps]
"""

# ╔═╡ Cell order:
# ╠═d955534c-52b4-11ec-10b7-bf7961e70d1d
# ╠═b02e578c-5e37-4f46-ac7b-37ffb900127a
# ╠═6a1dab04-f860-4a26-8c59-3f0298bf4ddb
# ╠═85102254-4bac-45aa-8d52-aba97c89eefd
# ╠═61a9ecee-d12b-4aba-b3b7-365c24c04248
# ╠═04cc0203-f506-450f-af99-f7de88c2d03b
# ╠═35cbf764-9d66-4618-a971-a18db1dc484c
# ╠═4148bad1-611c-4d6f-8a60-38ceeec3da1e
# ╠═251d527d-5e0a-404a-9477-f4bf44c62343
# ╠═303c43ab-e1c4-4920-99b6-e2587e9e54c0
# ╠═e6f8aeca-c484-45c7-855f-3ba320bcdd10
# ╠═09d0df60-7e2f-4a14-9d29-0dc2f314ce23
# ╠═99b6cb72-bb79-4c34-b2cb-ff537c2d189f
# ╠═3181ab13-598c-4c4d-9446-b4e6493b9817
# ╠═adfc7059-e20b-433d-8507-fc0f9a802d10
# ╠═e9ccc9db-1e46-4430-985b-963f76dd30c6
# ╠═2365d986-c3df-4e48-9dd1-dab9a7338431
# ╟─fab68e24-ad74-4511-be94-a4b05ca8b27a
# ╠═91996ec5-55ce-4b2c-a4df-4e5b0b89f5f0
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
