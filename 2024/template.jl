### A Pluto.jl notebook ###
# v0.19.46

using Markdown
using InteractiveUtils

# ╔═╡ d955534c-52b4-11ec-10b7-bf7961e70d1d
md"### Advent of Code 2024 - Day XX"

# ╔═╡ 6a1dab04-f860-4a26-8c59-3f0298bf4ddb
md"# Part A - (((puzzle desc)))"

# ╔═╡ 355dceae-c7b7-4ad5-8bc5-851bba617752
function partA(d)
	ls=d |> IOBuffer |> readlines
	vecs=[parse.(Int,split(i,"")) for i in ls]
	grid = permutedims(hcat(vecs...))
	
	vis=fill(false,size(grid))
	
end

# ╔═╡ 303c43ab-e1c4-4920-99b6-e2587e9e54c0
md"# Part B - (((puzzle desc)))"

# ╔═╡ 0e181a12-fcaa-418e-9925-5ba128851976
function partB(s)
	for i in 14:length(s)
		if length(unique(s[i-13:i]))==14
			return i
		end
	end
end

# ╔═╡ c36f4493-a5ad-4eef-8837-b8adbfd10d2a
partB("mjqjpqmgbljsphdztnvjfqwrcgsmlb")

# ╔═╡ adfc7059-e20b-433d-8507-fc0f9a802d10
md"""
## Notes

(((Notes on solution)))
"""

# ╔═╡ 91996ec5-55ce-4b2c-a4df-4e5b0b89f5f0
test="""
30373
25512
65332
33549
35390
"""

# ╔═╡ baa6eaa1-f0ee-44e5-8ac0-8507162c9d9b
partA(test)==21

# ╔═╡ 926042ad-215f-4585-8fa3-b0bcdf5f427e
input="""
(((input)))
"""

# ╔═╡ edf61e55-3e0d-45af-b535-bb5cbcd31bc2
partA(input)

# ╔═╡ Cell order:
# ╠═d955534c-52b4-11ec-10b7-bf7961e70d1d
# ╠═6a1dab04-f860-4a26-8c59-3f0298bf4ddb
# ╠═baa6eaa1-f0ee-44e5-8ac0-8507162c9d9b
# ╠═edf61e55-3e0d-45af-b535-bb5cbcd31bc2
# ╠═355dceae-c7b7-4ad5-8bc5-851bba617752
# ╠═303c43ab-e1c4-4920-99b6-e2587e9e54c0
# ╠═c36f4493-a5ad-4eef-8837-b8adbfd10d2a
# ╠═0e181a12-fcaa-418e-9925-5ba128851976
# ╠═adfc7059-e20b-433d-8507-fc0f9a802d10
# ╠═91996ec5-55ce-4b2c-a4df-4e5b0b89f5f0
# ╠═926042ad-215f-4585-8fa3-b0bcdf5f427e
