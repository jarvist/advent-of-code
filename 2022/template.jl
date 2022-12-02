### A Pluto.jl notebook ###
# v0.19.16

using Markdown
using InteractiveUtils

# ╔═╡ d955534c-52b4-11ec-10b7-bf7961e70d1d
md"### Advent of Code 2021 - Day 01"

# ╔═╡ 6a1dab04-f860-4a26-8c59-3f0298bf4ddb
md"# Part A - Most calories carried by an Elf"

# ╔═╡ 303c43ab-e1c4-4920-99b6-e2587e9e54c0
md"# Part B - total calories by top 3 elves"

# ╔═╡ adfc7059-e20b-433d-8507-fc0f9a802d10
md"""
## Notes


"""

# ╔═╡ e9ccc9db-1e46-4430-985b-963f76dd30c6


# ╔═╡ 2365d986-c3df-4e48-9dd1-dab9a7338431
test="""
"""

# ╔═╡ c0069a2a-7ebf-4a25-ae52-52125118fe80


# ╔═╡ 93d54d5d-6aa6-4796-b850-769685bf277e
input="""
"""

# ╔═╡ b02e578c-5e37-4f46-ac7b-37ffb900127a
#n = test |> IOBuffer |> readlines
#|> DelimitedFiles.readdlm #.|> Int64 |> vec 
d=replace.(split(input,r"\n\n"),"\n"=>"+")


# ╔═╡ baa6eaa1-f0ee-44e5-8ac0-8507162c9d9b
eval(Meta.parse(d[1]))

# ╔═╡ a1a6f115-ab35-461f-a059-3dc789b227cf
eval(Meta.parse(d[2]))

# ╔═╡ e13d0e28-3c93-4278-9d12-25eab560d21a
eval.(Meta.parse.(d)) |> maximum

# ╔═╡ 09d0df60-7e2f-4a14-9d29-0dc2f314ce23
# evaluate the total calories, sort this list of numbers in reverse order, sum the first 3 terms
sort(eval.(Meta.parse.(d)), rev=true)[1:3] |> sum

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
# ╟─d955534c-52b4-11ec-10b7-bf7961e70d1d
# ╠═b02e578c-5e37-4f46-ac7b-37ffb900127a
# ╠═6a1dab04-f860-4a26-8c59-3f0298bf4ddb
# ╠═baa6eaa1-f0ee-44e5-8ac0-8507162c9d9b
# ╠═a1a6f115-ab35-461f-a059-3dc789b227cf
# ╠═e13d0e28-3c93-4278-9d12-25eab560d21a
# ╠═303c43ab-e1c4-4920-99b6-e2587e9e54c0
# ╠═09d0df60-7e2f-4a14-9d29-0dc2f314ce23
# ╠═adfc7059-e20b-433d-8507-fc0f9a802d10
# ╠═e9ccc9db-1e46-4430-985b-963f76dd30c6
# ╠═2365d986-c3df-4e48-9dd1-dab9a7338431
# ╠═c0069a2a-7ebf-4a25-ae52-52125118fe80
# ╠═93d54d5d-6aa6-4796-b850-769685bf277e
# ╠═91996ec5-55ce-4b2c-a4df-4e5b0b89f5f0
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
