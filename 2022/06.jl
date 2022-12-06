### A Pluto.jl notebook ###
# v0.19.16

using Markdown
using InteractiveUtils

# ╔═╡ d955534c-52b4-11ec-10b7-bf7961e70d1d
md"### Advent of Code 2021 - Day 06"

# ╔═╡ 6a1dab04-f860-4a26-8c59-3f0298bf4ddb
md"# Part A - Stop Codon"

# ╔═╡ c429ec4a-c105-465c-bba7-d67f1305fe76
function partA(s)
	for i in 4:length(s)
		if length(unique(s[i-3:i]))==4
			return i
		end
	end
end

# ╔═╡ baa6eaa1-f0ee-44e5-8ac0-8507162c9d9b
partA("bvwbjplbgvbhsrlpgdmjqwftvncz")==5

# ╔═╡ edf61e55-3e0d-45af-b535-bb5cbcd31bc2
partA("bvwbjplbgvbhsrlpgdmjqwftvncz")

# ╔═╡ f4552e18-40c0-4124-b8db-a5502850e893
partA("nppdvjthqldpwncqszvftbrmjlhg")

# ╔═╡ 303c43ab-e1c4-4920-99b6-e2587e9e54c0
md"# Part B - Long stop message"

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

Really trivial - took about 2 minutes! 

I guess the difficult bit of most AoCs is passing the input (and for me, dealing with slightly unusual Julia types, and mangling strings <-> Ints), and then dealing with edge cases. As this is just a simple string, parsing was non-existent, and the problem was very well defined. 

Quite glad I went for using `unique` for PartA, as the generalisation to PartB was trivial. I suppose that was to catch you out if you did the obvious / manual thing of using `if` statements for the unique logic with only 4 digits.
"""

# ╔═╡ 93d54d5d-6aa6-4796-b850-769685bf277e
input="""bgdbdsbsbsttldddzzwnzzmpzmmzmqqcgglrglgbbbtmtddrssjtjqqtrtqtqppcvcddswdwbwlblfljfljlhhpchcfcgfcfwfllfccjlcjllbvbgglccznzrnzzvfzvffvzvccnwnnrtrqtttzmmndnqnvvlwvvgcclplccbggcscqscqcnndwdlwlvlffdssrzrtttbvvqttfdfrddhthbblnlmlmqmhhpvpcpwpccmdddbcbcgctggsstwwbcwwqllchlcccfwccvjcjhhvggnvvcssjwjhhdvdhdcdhdqhhwrwcrwcrrjzjccqhhvnnrppsqqplqqcvczzlpprlrqqvpvwwstwwzqqsnqqsrqrlqlggzztzhhvbbcncwnwhwbbqpbqpqdqsqjqrjrddpjpwwvlwlnwwmpwwnmmzgzqqdcdnnqllghhzwhwwggljjwswgwffsbffbggzfzcfzczpptrrnwrrcqqcwqqdttzqzjzqqltlggwlglgwgrgfgnffgqffnlntlnlccjwjfjnfjnffqvfqfcfsslwswfwvfwfvflfhhntngnhggqbbsggchghfggcmgmsggshsmmqffjpjnngwwftwffgqqvmqqslqslqqdzqzhzbhhdzhhllnzzlmzzltlwwsmswwtswtssvqsqhssfdsdtdjdqqqrffqjffrzrppjpgjjpgpmmzbbrcbbprbpbnpbpcpsspqqfggclcpczzngznzvzlvvcwvwcwdwcddhdbdwdhwhllpjllrmmhbmbgmgmpmhpmpqmpprggvsgvsvbsbbqbmmjdjfddsnnqpnnphppsbpsbpsprpjjqhhvrhvvdhdjhdhwdhhdjjrlrbbzhbbjljhllttrccbdbffznnfmnfnvfvrvbblmltlmmlbmmdqmqnmqqmmhchvcvpccnrccqhccshchshzshschcffpwwbdbqbbjhbhmbhmmzzzcscddbsbnnpzpfzzrfrlrmmzzhshbbtjtbtzbbddrwwhchvhtvvmhvmmwssqqzrzdrdqqntnjnrjrbbgqgzgbzgbzgbzgbbqtbbbqjjgvglvlzlqlbbjwjddjtjbjffcsfsnsnpspgpnnglnngrgqgbqgqtgtfggczzmbbvqqrssdqssgrssdzzvjvccbbgcgppgwwtmwwrnwnfwwnnzmzvvvmnnvdddrmrbrtbrbrvrqqcbbgjgfjfcfttgrrjmrmrttbnnsrnsnzsnzztmtgtjgjljdjtjrtrddtbtjbtjbtthhtmmllngnhgnnhthssgffljlnjllfvlvslvsvwvcvfccgqqtsqtqggbjbtjjtjvjtvtvddttqzqczzcvvdtvthvvfrfmrrclrlflbbhhcllfbbcwwgmwmnmpmgpptnpnjpnjjbqjqjddfdfjjpzzjnnvzzwtwpwfppzhphbbmsbmsbmbqqfpfsscttfrtrzzrznrrrbgbdbtdbdjjsmjmttlbtthbttrprpjppsbsjbjcbclchlhhlttntznnzfnfgnncsncnmmdndnlnclnndqnqssbsjbbrzrtzztszzvnznqqpnpbpnpvnpnhpphvpvfvhhrvhrrpttctjcjvcvzcvcscttqptpffscfsccqhchhdcdczcnzcncnhccfrrbprpbpqppdccjhjvjmjpjmpjjvfvrrwppgjgjjdgdmgdggcpccbrrgssbsjbsjsfscfcvvcrvcrcttbtffpqphpchclccwhcwcbwccbzzlvzvffbrbrbjbwjjqvgtcfnhtjvrcwbfjdbvgtqbvmbtscwzrwdfmwtjvswgrvncmftgmppvlcwjpnpffggrmvgtfqgqmhbhpslfwdfvfmbfndrmgfhdbbtdgvnslzpdfvdttqjpcnbzsjcvrprgrhpglwfwtdcbgdsjhnqjntjnsjcgwccjnvvngfpvqwvnclcsvhmwsrccvbjnnrjspwqdvjpfnfvbsslngzpdgjrcsnqfvdlsqdhdllcndshglztgrrjnptqfvllshmhbgdszvmvqdntpgzdvhstgrppwpdtdqvzsfgqfrgmmjqcsjhvrlmnjvfjghlvwbnqcggpqtrjztfzshnqpzznvlqcmnzvrwqlcbnbpwmljpvdzhbvbgtdjlzflsvzlcqdnsgzfjlccvjclqlzdhqzzrscttjmrvjvcqzvtzqlmsssnfcfmvcgmqjjwdnhtvlqrgdvlbbrffmrpnfsmwwwbnwclrgbfnzlbqvjfqjlfvfnfrhdqstddwnwrmsdnvzwfjfgpwcrfqqzbdwwtzprvqtgvtzbttlhcdczlhvlgrbptztswftvnjmgrnbwpfwnztvqmqbznvnllgjmqrwprvwtnptlbfwbblzsblptwpdwgcvwsbmbrtqfvjsbzfvsfvpwfwbnnfcsddhsnwnvvqthjdgvzgjprtqmvhdqjqhgqppqqcpzfcwzcmrslftgrvbvdsdgfzfmvvcqzcszfwdvghdnlwwpddzdsqsdqvvrwhphbqvcbjbtnqgnqqdsqcmrllhmdvpffnqmrgfddjbrjwflshzswvjtmqgqmzvcnlctvdpjhzzlgpzgprjncrscnlmdhvdqpfllsqgstmssvlzmrtjmgwppfqjsrfmlnszdnhngzhtbbnsnvmtzpfsdcsvsvvjnfnzhrzmvlhrbslrsbgwwcvrzpgcnmjqnvgmzmlvpccrmggtzzhsdtbbcdnpdlnbztgjhttmqdhjphcrbgjtctqmgbfmflgqztztcjqvgsscrmwfbvnrnbgbjgqmwdzhwwnddwgrprhvlgftcbnwjqmcgczpbhfqcqzdbdwhmzfmgvcjdsfzdbrzjjvfrvftdblnlhpbqvdprnsjdpznbbgqpgnnjmcnsbszfwblthtwlwrdphjltclmqnbpcgngdnfpltttsrvdmhrcvlqfplqmqvslwgcbrwrmchscczrfgspwjtdqtlbddbsclrlbmhdzqdrgjfsgldfjmgcglbgjhmghntndqcbgqwmdvczbwgcctzvcrsqqctwwddfhhfhwlsrsljpnrlqtbdzprjbfrjgztwbpnfqnlftzcgrpmpcnljhscfbsqzbsgwqcgbvctnhswhrsmwjgcccdsnbscwllmpstpnrccjspnjqmtgcsgbjzpfvzjrhlvnfblqmcmgcrvnpchwhlsqsbhzhsgdvwmdcwphwccvzmmqqjrvqwphbnmddzcmggmbsqrhbcqmdlgvccbhhmhwdjhhhcwnffthmgfhpltqbhnvdqfrzjdvlppqhzfdgbzbrtfllsbvjjcgbwsbcmfrbjtvzqsntzdzprnpmfpfpgmfprlbcdqbdzjsfjbtczdpdnhlwdhmwsjtvmztbhdbbdgvrtbqsqbsnwjjhlslzcblrwlfpzqlvdvmgqhrpjmbjbntmjsjvgsmdsnctlgtnlqgfvhwqbjbrczpfzmzwgvrphfmnnhrlzwzgthzqnzzmptppzdszlcpjjvbpjbtjfrqtbnpnwsdglbbjftvngcghjlnsqwspmmfdpslsmqtpngbtvvrvbqqdsphfhvsnmhprfclnjmfrtqnlqcbmfrggbstwdbwsvtpvflvfgqltmqjpnfclbwtlwhmqrmzcrbztstgpjrdsnwpqrcnvvnnnszlrtpqjtsnbjrdcthrzrtccgcvnnlzfjlcdnzzqclvtncjbznrlpnzhvcwmrfrzpcldfmfzfpchlmddgvcfdqdhzzdtwhsfcvsthtmqgvhzdpjcgwsmrvwsnqmhdnfqdrrnmjwcpjjftfdhvwrwwtvptzfrmgffdcrhvcmccfqctswzzmlsjvdjzgjgndhmmrwvwmmtrnpgsnmtcqdbdpqjmcddcrbcfmmccnvsfhwtvfhsjfmlfttspfghpfggrffnrwjggqwggrmpzscprvdzmzhwjjcsmpsltzwgchttwpngrlptprqnjzzpbpbcvrclggtqwlcwdpjpnjrhtgqwsvhsswwqtlnglnqnvffrgmlbzthvnhrzvsvclgdmmjzrpfv
"""

# ╔═╡ b02e578c-5e37-4f46-ac7b-37ffb900127a
#n = test |> IOBuffer |> readlines
#|> DelimitedFiles.readdlm #.|> Int64 |> vec 
d=replace.(split(input,r"\n\n"),"\n"=>"+")


# ╔═╡ 3894efe8-027a-4fd8-bb14-29be0fddb1d1
partA(input)

# ╔═╡ 72aa8009-42dc-449e-b42c-579debfcf420
partB(input)

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
# ╠═baa6eaa1-f0ee-44e5-8ac0-8507162c9d9b
# ╠═edf61e55-3e0d-45af-b535-bb5cbcd31bc2
# ╠═f4552e18-40c0-4124-b8db-a5502850e893
# ╠═c429ec4a-c105-465c-bba7-d67f1305fe76
# ╠═3894efe8-027a-4fd8-bb14-29be0fddb1d1
# ╠═303c43ab-e1c4-4920-99b6-e2587e9e54c0
# ╠═c36f4493-a5ad-4eef-8837-b8adbfd10d2a
# ╠═0e181a12-fcaa-418e-9925-5ba128851976
# ╠═72aa8009-42dc-449e-b42c-579debfcf420
# ╠═adfc7059-e20b-433d-8507-fc0f9a802d10
# ╟─93d54d5d-6aa6-4796-b850-769685bf277e
# ╠═91996ec5-55ce-4b2c-a4df-4e5b0b89f5f0
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
