### A Pluto.jl notebook ###
# v0.19.16

using Markdown
using InteractiveUtils

# ╔═╡ d955534c-52b4-11ec-10b7-bf7961e70d1d
md"### Advent of Code 2021 - Day 03"

# ╔═╡ 6a1dab04-f860-4a26-8c59-3f0298bf4ddb
md"# Part A - Union of knapsack"

# ╔═╡ 642bf488-1296-40d4-b3f6-fbf3960be1da
d="vJrwpWtwJgWrhcsFMMfFFhFp"

# ╔═╡ 6bfbd01e-6e69-4bb4-ad2c-a4368684bb18
# was trying to do this with ASCII arithmatic, but forgot about the gap between 'z' and 'A', and they were in the wrong order, so this is more simple to understand
function scorechar(c) 
	if c >= 'a'
		s=c-'a'+1
	else
		s=c-'A'+27
	end
	s
end

# ╔═╡ 6d1e5b81-9946-4b56-b50a-afc19a7e1a67
scorechar.(['a','z','A','Z'])

# ╔═╡ ab64fcaf-7ab8-492a-86e5-aca8bbc662d8
k=[c-'a' for c in d]

# ╔═╡ 9a7ec5e4-dfda-404a-b0a3-4ee82101f943
L=length(k)

# ╔═╡ 29f87b09-660d-48fb-abb7-763d808e83b3
union(k[1:L÷2],k[1+L÷2:end])

# ╔═╡ 10e74b06-56a0-43e6-bfdf-9844bbc2e4d9
function scoreknapsack(k)
	L=length(k)
	k[1:L÷2] ∩ k[1+L÷2:end] .|> scorechar |> sum
end

# ╔═╡ ff13d17c-2c06-4e7f-a426-1c28fb6d055c
scoreknapsack("vJrwpWtwJgWrhcsFMMfFFhFp")

# ╔═╡ baa6eaa1-f0ee-44e5-8ac0-8507162c9d9b
function partA(data)
	d=data |> IOBuffer |> readlines
	sum(scoreknapsack.(d))
end

# ╔═╡ 303c43ab-e1c4-4920-99b6-e2587e9e54c0
md"# Part B - union of 3 elves"

# ╔═╡ 09d0df60-7e2f-4a14-9d29-0dc2f314ce23
function partB(data)
	d=data |> IOBuffer |> readlines
	[ (d[i] ∩ d[i+1] ∩ d[i+2])[1][1]  for i in 1:3:length(d) ] .|> scorechar |> sum
end

# ╔═╡ adfc7059-e20b-433d-8507-fc0f9a802d10
md"""
## Notes

Very easy generalisation to Part B. (Code a bit spaghetti though!)

Got quite stuck on remembering ASCII arithmetic, should have written the simple function first, rather than tried to be clever with direct ASCII Integer arithmetic, 1980s C styleeeee!

"""

# ╔═╡ e9ccc9db-1e46-4430-985b-963f76dd30c6


# ╔═╡ 2365d986-c3df-4e48-9dd1-dab9a7338431
test="""
vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw
"""

# ╔═╡ d912290d-0e47-45f7-9ab7-568673670a03
partA(test)==157 # test info

# ╔═╡ c1fdbc17-3e20-4ab1-afe2-4f3814981988
partA(test)

# ╔═╡ dba9dbba-0fbf-4cbc-8b14-28a6c8b9cf39
partB(test)

# ╔═╡ c0069a2a-7ebf-4a25-ae52-52125118fe80


# ╔═╡ 93d54d5d-6aa6-4796-b850-769685bf277e
input="""LdHVLDLDdHdtLMhcqCqGWcWg
ZZQZSZnnJrQrJQJbfzfnWGWPWMcChMMPcqMnhFcF
ZrzpWzfbpQpWbzvZWZpdtVtDNmRHNVptNDHt
gzCjffWZCtCfZZVdqVSqJdvJndSt
hMHLcmGLMLhHmsRMsSvsQSqrsrlJTTdV
NPNGRGHGHNLczNzzZFWSFFCC
VSBpcvNNbNWWSfGRwtJnRtrzzGzGGn
jZlhTlQLHFLLZbwrzQQsttDtbs
hmmPFlhLmhLMgFMFLbMBBgcNVcfNCcfSVSSNBq
jRDSzjCjjMRMrHzMRCDHMDjBnlQbbnQwLwrNLPwnTPQrlc
sZBqdZqsWgFBpgppGJqllPllwnbQwTwsswQPwN
gJgtJJBtqJqWBGzjRCHDDzRmDtVV
GRBWbbWnGNhbwSsfPfmrlslWsS
HLVCgCLpMgcLVDcDCgmlvstSlsstPtSSSlscvl
LzQDQzMMzJzFQVDJgCzJHJZRZBNbqGFhNFwBGhbhBhBm
JNsHhdPZSdZJjSHzzNwvwGgBFmBmvptJbFvm
WrDrwqqqQWVMCvMvGbGbbFFbFp
rqqLncqnlCncwQWCwWlLfSZPsZddfzzNNdhdPlZz
rwfrwHqSdRcgwdZrDcrqDDdgNzjNjPzPJNJPtbNPbGsHNGHv
hllLMTLLQMCzJssPsTvtFG
QtQnpWVVMVWnVQpRZSSwZDggrcSq
FDlqPMBdmbqMrdDqqFdFDwjHZChHHZfZWZNBsZjhfhHf
VQJVgncpTQRJfsssGhsNWC
NtpLLSpcLVRzzRRtpgVcLgglMwwlPlzdmDlFmFPDmqqwlF
PqwwSqNWPqwSWqjNBwpTPpffhJfZfstRtZJRRdJsdR
VFLFzQVgVnDVjhdJHsvhZjfg
VVFVDDnmnzLFCzVmznFzrFlrjSCPNMBCSGSGwwwGBjPNWPwC
zzbCGrfgbzfzCtvqdjSrvSjnvS
cNVTLnJZRNNmQmhJNptvBlBtVjlljqqldtlB
ZhpcJHLQhRcLZLmNQJzfFwDzzgHPFngDPPnP
ttntdMMBZzbZZtjPfwjwTwBvvVmh
llSllRRNsGCrCDTPfgVgTfgvsjPH
CFclcCWGrJNDSnnWMbQTnWtLQd
bccfdSfwFsswcbbdJFGQVGnCJLnBLnDnQLDj
ThvHZNhZmqNWMNqvDVjcjjBQVhQBBVLB
vWMZZNRmNMWqtWqmqHclfFgdlwRwrzzSfwbFRd
WNzRWWZNmtNZnssNRPtCJFQJCffVJVffCvlF
cBqBLgHHBcgqBbCJjrvrVQJfsHlr
DhDShwchBSbdwBsqgGcbgTTRmzdNWmMRMmTdNpTMmW
FHWZDbbPZDFHgGGPdPbJNLpJSlNjcjSphcJjFN
ZCCrBBRwwCjcNwcljppN
CmTTsrMfBCRsTMnnCRTmVZbgdbdGfWHPDVvdbbPV
cgSNBScMgjBBPtBCNLVvVVvhhJJhvsMhVfWq
TFlDrHPZHTTFmwTQHZDZTrqvvzqlJppVJvpffhqqVfJp
DbPwrTZDQDRQQwQZrDrbbQwRRnNSBtCjtcNGjSgSLjLccC
pdcVCpdZnZgcZgdcDWBDNcNwvBWJwc
RRmHspRmmQfLwwJJbFBFFJNR
rGlpfrQrqGhGqdGP
THhNsHhdFjcDthDcjDhLBqWcLLQQJvvBbvBJbl
GfrCSZGCzfVMrVCCzGVfSMQBBFlJlJBFFZqvWBqbbQWl
rSrFwCwzMMzRfGrGMwPfGCVdgHDttthNPssHjmNNdDjgdD
shmhggDsZCZWBDmsQTcTqrLPTbNbwQQrrN
lzpFVfdjfFFGnVVHpjJGJVlprNMPNtPctTNwLtcTbwctwTnN
jVFfzVlFSpzpFCshWmgSRgmBRb
zZGFNPmdPdszdWddGWZlpLMLpbQbLDpblzQbtv
wTwgwSSCHhhCSghJbpcpDglbbQbMVMpV
BHnBRrJCHmRNfGDmfm
CffgvfCRGngRrvGvgdnRVpPQQPSqbVZZDPDVPzFSSQ
cMlWJTMlcTLTLtHHJlpqDLwqSzSSDDqDZDDS
tmHTtlMmWpmsMJsCRdCNsrRGfrnffN
lNrzNHNwzZlHmwNBpMqqnqGDZSpMTGnb
ddjgFjjsRvGvQhQvvFjqbVTFpbVpFDJSbJVpTS
cjsQhsjvRvGcgNtzczmtmwCCcr
NJMJvBmBJPtMtRDnDDwDMFFWDWHG
hZsrzshpSdjZZqSSfgpDwnwFnGCCLHDbjnGCWG
zfgSpScsrdpmllttGvJGcm
GLsnLVLZGZmcGVpgZLmTjTsDDTlDTHPPHWlHwD
dNJhCCdtNJSvdDzwPlvTlQ
BCbBrPPfRMfMJSffrMCMChrSqVcmLLFpqLFFcggLVnqgmbgc
hMdjMndZLRnRnjclszLclQlzGwcr
FPCCSCSpCwStJVGzsPQGslGzPbsQ
TSSJTtfTFTwtmTFFVFDTWRvdgndjjRhnjnvHjdfR
ZwgsnsWsWvWQHqJhGhJVCJHhCJ
cdjlMWRRMhJLCpLL
jjSRmRmNRNWBmdmcWjlDWFPswsPtnZQsnBsnZvvTTnvT
vvbjLTPbQzrQQjpLzLbflfjfRDDsDlRfgDnnVD
ZGCtHHFGzFHhMlCnDqwlgggsqf
FJHMhHZGmNHtJhMhBJZZtZdrbSbSzbmWLLQrQTbPdbrS
ZClGVCvLZzCLBVbdGGzVVBvVrqQMDWMHrgmgQLWrWmTgqqHH
tNpNspcQPfHmqfgHmHHg
nNttnwPRjFtPcccsFptPlllQGlQZbvGzVVVFzhCd
lflmVWpDVsMmmVPlHVbbGSSbGnSHJcncnLZn
NvTFzNwzTQvhFGSZnvgrbgJCgr
jtRwTQFzjBNGGQQBdDsDqqlsVqRflMlPsP
rCSJPCrBwwMdBJRCrwMTGWTWNbcjGZNGGZTb
qzgqfgFghsHzfgHgmmfWGNGGWcNNFClbWlcCNW
DqsnzsHLhddBDwCRJR
sZpHjZrVQmcrbhbthzhFHzhH
QDPMDMndqqQGqQfCDDbhFtzzLtbWzlBLLPBW
TDMDqfGnJSnfnfvgjsjNgJvsjVQv
bDZQbZHdQQggZfttJjGnplSnldsG
FTrFCvWBWzTNSPNvRBGJsGjpsJjstmCLtjCt
rhBvzRVRBBSVHDHcHMHq
FSbSNZbZbzGzGGbNzGgcZPwlDPvlNmLLLwLLlLvvvl
pqnqpVCrpshqmChsQnnRpRCldDHvDHLjDlvPwddlwPtwDV
rRTCnnpCWCChTrWsrBTfbcFFmFSSmfBBGg
QdhdWDsHhHWzPrLPSCPGvs
gpZZmNmtjZwpBZBZgSnvFcGPrrvmncnvmC
RVVRjZJfJVfVBZVtBNBVppZVDqMHhqTbMGlWHQhhWldRMHWd
BPWQrRRNNMhrHhLqqGgjDJjH
TzVmmpmtCNwscTzszcNzDCfCHJqDfGjDJJgfGCDq
wdwmspTsVdlTcpbmVMPWBbBWRPNnFnBWMr
VZTnVnsgrjjsqPzPwWgWPghz
mcFdQGPMBdMSBdWbhRzzWqwLwcWt
GQPBvpfvNvFPBvTnfjnZDHDDjsrr
CZssCNFJBmBNFmFBNwBFCJFTtthGrrSThtSgSRtSfRTGtRrg
LDpDbnjjDGpggGrvGg
PLMWnWQgbQWnWbnbjqDbszHwwzwmNsFZMBmwJFZF
hQSjFLhFLLMSSFgdWTMdGgNbNbWv
JmPlltJBJqmzpbrrwTwrvvGqww
HBzztRBRplzlmHmRmmsplRJZcfFcLFfHSLjSZTcfVVcLVH
nBSQMnVQqJBGnfVfDgCrjbVbtC
FNcPPHdTdhmBdHBvwlZjbClClfcZgjclgj
vFdHWhTLHvnBRRqBsWSR
TRsNNTTHRRZRRsRzJQddSpJLcQdpjs
DMVPVVGmMGWMGtMgGtDlmMWwLLLpJfSfpjzpdQddLSmSSJdc
tVMgGMDwMgMWDBWMttjRBZNnvNCNZrZZRbZNvZ
wlJPVMJPPBShSlhgfTvgNNzzgNMCTg
FLtRnDDSrvdNdrng
FcSmpFZFFmmjWqPWJbmhGqqm
hlBqqTlSfvNhpbfb
fRVsVDDRtnRVfbDNCCNCNQGwNZ
nrrRPPnHzntRrPsRVrtJVBMjlzWfFWdMjjWMqdBBlT
zDNcnRsNNfRFFNNzRzLbRWgMZMMZcdhcBdMrBpZmmZ
PVHHVlPDGPPtjDmmdrrGBBMpWGWd
VVqTTlQtDCqFNzsnbLbCSJ
ndSGSZZGwSZTBdwnwdwmWCzPQCQLffZzRgMZRggMzf
mvqVmqrmcDqllNNtbcNcMCQMRCMCCMQfHLgvRgMg
FhNNcrrVljFcqmTJhwnsmGdJsT
wlmLmZLwzvVmVWVmQWzZSFJFDSqFHSSFJHhDqZ
RsgpMNcMdRgjDcRFqCSrHSHBCFJr
jdncssDNPsbmmwvvlPLw
wQGHMrHGgwgVTQrrMGgGQrTtWzzPJhsfhZztWssQWbZCWh
FjvBFSqqDbljFvSbnvFltszfWPPfWzJZBCsPtJft
qLlDbpjFRbpdGTgLGLGTTV
hrVJsBrpwbsMZtTLlwnqtqdc
QDDmHWmffHCQWHjRQjCWczTTjtlzdldqVtTnTqLt
HmfGfRNWfNWmQCRsgbsMFMhMGvpBVs
CRzzVCZhvGQqNmcWrgpgwQFSmF
BJsttjDtjbdLMHHsBTqBbBHMrprDSrFnFnSgrnnrpDSmWWnw
TbMBMPPdLTbHTjHMtPzZGvzlvqCPGNlNVRVP
QcmcrCVcdTCGRRLT
zzgWFWVBTSWLPdMP
JbhnBVzzfVhgztVDvqcqHwncZHNqnsnccQ
JJVBFfJjNNNsJTwVfZJNffFRpRzRzRptRWtCtSSHWsWzCD
rmrnhgclhQGcGnhrPjqgGMHbWRHRbRCWbzRbMSSpHWCD
mhhjQGGjQgggqnmQnmghdQdJFZBNvZBBLNTvvTNNTLfZ
DrBgwMCMRvMrvDgPCzdpdNtzqqlHNNtp
jWSSZGgfGjcLfdNjFzqqFFzzFF
nGZhTmZLLZhGPVVTgQgMRrrb
ppqZvppdJmSLHdSfZRrrtbscgRVVgwVrHt
hFFFzQPhNWzNhnhGVggrcbwVgBnvbwgR
CNQWFMzWWhCflpjvZJMJdj
pfpfmQMWmcBVfMBBmpfVQMbDGGNPDTcSNTTsSNPCCNhC
ZZrZwvvzZrvZlZlwhwswhNSsgbDssC
ttvdtzRzFDqRJWLVLWJJpQ
CZZPTQPTPTJhTQTrHCBbvtLbbbRWtjbDvb
cGfsVSVcLdSgSwBWRNNGwRNRbD
spSffnccsgcdnnJJQlZZqJLhpMJh
TwGGdWwdddtTsbzPzbbnTLnPLP
gqNSMvtvcSDLLfnMnnPzFM
NvDNDqtvRcjQVGZZGZZhwpQB
jtgFmnqjqttQpsphzNllblzlNH
GRMRDMGCVCHzSCbSbNNl
LMTJRTGRLBJBwLRRHmBFQPvqmPBvtgtc
jDjjwRDpPqqsMsDLJbJzVB
lMNMNddvMltNfFVWbVVWJrrVLfgL
NQQtmtFGFlGZPZcMmmcjjn
CgCNjvSCgSQQzVZNWVnTBPTcsTVBnpPs
bFbbLfbfdRBFhLwqFmblBJfRHtWcttcttlDpspcPWDcDptPn
mdbFhfJrmJwfbmmFFFvBZCNCzMGrNjMQjCCZ
TPDNHHSTNNmRfTrRMZSqwwttdbBvBMth
VVnnFGgnQcBvMqvnhNBN
GLzjjzGscssJGJCHljmfmTWPTCDN
BZZNcMQjBNjNtDJgstjgtwqGRQfhGhSvPfThfqvPhfhf
CCndrnmnnWbrnHrFbWbpbbVmGGPqLfTGhvGSPhqRLRdfSGsf
bFssVbbblFHzrmFlMNMtcNgDtJDzZgtw
smjMtSqQQSjtSfmDVVFHFhnHBHmbNPPH
TgvCCJcZdwdgNvbHvPbbvBNq
JLqRWTgLqJLCJcclgCJdWjfsSSpsfRrsQjDtspptQQ
hNwztzgzJnnNTVFwNTNhwVhZlrpLMLZZlpZlQndLPLpQLZ
vRDvqSSqjbqSWDvjbvBdLWspPLddZPQQLMllLp
SfGfRmSGCSfBfjTcNFgzwMFJzwgm
lhVBhZjjPHbThwFGrNrdvNNwFV
DRrDLfMLSgpCdCJcfmcJCm
LQtnprtqSRtZjHzTthlb
GrGsqfbtsWGWWntnrrwWWWGSSDSMDcSSSwTDzPzJSJzPcT
lmQhhVCgmffCNgmNNmCmBNRRPvDzDMhJvSSDJzzcTzvvPvMT
VBllNBpfQgQmpLBpRBtnqWLFFnZZWWGrZrjq
NRJdngMVwfgnwJtvlblcWLlLDHfccDbW
PFJzBmhmjPFpJrFqLcQHLlHGDlHDQbGz
ShJZJmPFpwdMvCCZRd
WQDqSVWqpBCsPqPWWNscfrHfhrhrHhGFGs
MmLRmLTjmTzTzlhGHfprhvfFhHfT
mLZLRdgMRjtdddmdgwmtMwQSCPbnDSSCqBDwpWPQqn
rNHwMMGDrggWwsvWMPMWWwjbCqjCBlZqvfjBqCJhfffj
FbtFmRTpzBBZqCClpJ
ztbzFtnzVNnNNPPDGD
PLPFcwdLdFcbgdfSwFtWhGWGRMWMJMGCblJR
qTpszVVjRlCHtWCT
qzvrDqQrqznzggFZwFwQScdW
LWLjLNjNjTwlwLZVcBVcVVZcBVQcZZ
JhGhFdmBRdGGDnQtbPvVVdnccS
zDrrFGFFRgRHmDNWTpjTBNTHWNjW
fwfBVLhmwfhHsgBstWCWQnDQnlldWW
hZvFTNJrZjZbFvNvttqWWDtcWqCtFDWn
rbjjrjpRzRzgBLzwLgmzLh
ZqqqWVzdSPnwBJBfwJfZTs
FHGgjRLMJFsJTsBw
DHRcDgHvLhDWPSCzwqnq
LZGZLLRLZpRQBtPTjTffrHljjmsB
wNVVwcCgNCCScwggmjHjTPmQPsTHmlSs
gbbwbqhNCQcbqqVchWhtRZDJWJDtZLWL
CmTmvvmvzCCCgzzVQmTQvTjjGRGShwSHwRrRSSSSDNHSFN
PqZqWdqlplsqBJMMsMMnGRJRbbNwNhrrhShGShFD
fBWBWdZppqpqDMBdlfcTCTLtLtLCQfQvcmgv
pntdtdHHWHqnptGpqHqNgMQwPPPnZMZZZZcfgc
LFmLSVBRTSBBRrffTQgMfQMtJZQT
bmRCSSSjRCtSrRChjqqGqpppGhqDGp
dGGhhfNfgRTGLcpL
BmCCwQMQqmQrBCBJLpbVTFbHcgcbLTMc
JrpqJJmqqqqmzqqwmwNlzfvltDPltfshlhNN
VCCbMJfJlgRCnNGVNnvFvVBF
STsgcZdghZsqSttBnsGnBtBtHt
qDcjgDphjhSghZTQgCJWQWWfwfRzWlwJzJ
JHMVMvmvRcdbmrRHQBBGjcjfFQfChSfj
NltNtZllgZtgtnpnqNWpgCrCBQzBGzFhQrGSSBCzWh
pDrwnqLlvDVmPbss
dbrpbSrwBjswsSjCwqllLqFtqLcrGqqFtF
RvfJDQnRpHvvQfRvvQRJFDqzcWltFFlzcLttWltW
ZpnRVZHmvHnTnPZZPHfHmVwdjVghwgVSBgdBBCwgdC
WRCBGWvNgHnMcFwnpC
ltlstrjlJNlfrZZqDJtNLsHnmwwpcHphhFPMFjwhmnFp
TStJssLstJLtqTsNgvvSBNzzvWvGRz
VBjdWdGcqWdBVCFRmHwfCRRV
DLzNpqbDzDNbrJvltMLJLRRmtRFTSRmTmFwfRHRTFf
zvvJNLgNqGcnjgnP
JjdnFfbdbdQMbQzjtRcwcCvbvBqRBCwt
LlNHlWGprPCVVBsVzqNR
hLmgTlrpPPHrLprHrTTGggHWzhZFSJDfhMdnjjZfFfdFMjFz
bDbwRpCSRgqqMfMf
HzzPcPnhzlhsQzHhHnTggBBqTQTgVQqBqjZW
tnsrFccnzsDvGpNGqNtq
GmPsPrsSlswNmcLzMvnpnmMpLBCf
glDTZRDqRTjRCvjvfBpfCzvp
DHlJVhJRDTbqZDqSNVrNwtVrQwSSGs
nNnDwqDwFVgDwDnCgLnLpCVWdBMRpsPdMPPjRHRHHRdBWj
tQtfTtJtJmlTQrTtTlhfzrmdHzMMRMsBPPddjddBPPdWsB
bbhtQTfTTsmmbStnqGFGNDbFDgFVnw
dsVpDPBMHVdHpplpvdHjRjmmjRTMTFFrrTTFQq
LzzWZLGCzCWNjfmRfBhmQjZq
zSSSwJwSBzNtzLBbwbSGLzWVvcvpHdssDllVJgVHVcdDPv
RWfQBDTBLQWpDLNRZjZwHHddjHNhZdtv
ScCCzSszFzJccPHHvmjHvjhpmHsj
FPclgFVCbcngVgnpWQqqRfLBDBrR
cRLLVwcsctwmbVcszztwtRMvNrCpTggqFrTvvhCVpghBqh
PdSDGdnZQfGDfDjWjWWgvCqFhpqvpNZgCTTvrp
dGnDHWnSQdJPDSFLLcJmRzzLLLRRcl
lCSqlcCcBqBCCwGwnNWnnFwBHF
WMZLMPbPhQddRbMpbbLbRLLHDFgjFGDmFNZgNnDGNHGGjD
dTVPPQbPbMdQMzvVrWvczrCJqv
vzscdHcHZzHzCCHlQTTTCcslMGPStmSlpDDSSSgSPDNBmNtl
FWVMFhFMMqWhFVFbDBDDhpmpGtPSDpGG
fRLbFfwWWLnVjMdzzQHQJnnvQs
SmPdRbWZdSqqzSPmbdWFFQgcQnvncgQGQMMT
BfBLmVNjprVVNlVBrpBlHpNrgQFHGCGgvTQTMGFFgMCvgQcQ
BjjJfVLBfNffJbZDqtDsdzzm
NLgtLsSggjqgqpLLDjsjmcJfvpmFmmJmvPpwhBJB
lMnlZMtdCMrRRnRbTddWbVwcmPfFmhJwPfwJmvfwFvPl
MnRrnGWRbgQqtNGDjt
dSdrTbTtLJCcttcFVw
PhsgQQGPZshvpQZGgsrBllVFlHVpFllJJrFH
gqsGPgMZhgvQbzrzTfSzMTLf
pqbDdQWqCgBfbbfFfB
vtjnmzLcmhBdzTFgTsRP
LZGmjvJGGctnLtvcchSjmhcLqNHCwVdQZwDwWDNpCwqHdDwQ
wlMWSSHWShSMbDSwVhCrNjJmcrDmGRRCGCjN
FHZdHftFFQnqsQqsQttjvGrJccmdGGcrNdRNmG
pHpzPpQHpsPzPlzlbSgSSMLwzh
fCQDLlDQTSjbHDqH
ZhrsrZZZhcclwNswGGwbwF
rcWhlhlpMJpMZmgtBCzCttCCRfdp
zLnCMLNTvtGNpNvNjhRHgZhHvZdZHdjD
fSsWWqScTfJJqfJFFJwswhdHhhhdhDdjbjZbhhDj
WsWmfcqBWfTfsrntrLmplCLttm
ljssbqMMPbHPlsbcWZNLLsWJWRFvvZfW
SzgggDDwTzrQmDQgdSSWvdJLFGffRvZG
zCzCDCrznnTTmCbbpvlPHtCPtb
TZSwNPpcgpNPbwbhhbwrwJqh
BlCDtvvgLWGCLffGfLzLrMqnnbDDHbmnnnJrhnVJ
lzBjdCjCGCjfGjjLGBGGjlCSsRppcdpRNdRSPQcRPQZTgT
TsFTrvGmZGfvZfZFzNNZrhClmRcBgCMwQwQPCPMPRP
bpnnVVJtSDgRBwbQRwlR
jpSnqLpqDJDJLDjWDWLWvvzfZZvqvNsGTHGGFfZl
bzbzznqfCpzvhCSMfbCbpCFhtHGHHJdtHJGhFsmshJJG
DLWRLjRrmNPQjZZlQPsFGFggVcWcFddggdsg
rjrZPwwDRlLLBjQlRRlPDpmbqzpqnnCSCfTMwMqSvC
FmcGcjLRPjQwQjMQrwHQ
btJzJbVNdBJJtzTdGBbdBztGrQhhQWhMwHrhrHSHgHQfhMVS
JJDpdDTtCtzNptnTJBznnvLCCvcFqsRqFcvZclLGRR
"""

# ╔═╡ 5139d421-a06b-48b0-94b6-7a54f7e82b21
partA(input)

# ╔═╡ 86296e4b-56f9-4972-9638-7610536238b9
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
# ╠═6a1dab04-f860-4a26-8c59-3f0298bf4ddb
# ╠═d912290d-0e47-45f7-9ab7-568673670a03
# ╠═642bf488-1296-40d4-b3f6-fbf3960be1da
# ╠═6bfbd01e-6e69-4bb4-ad2c-a4368684bb18
# ╠═6d1e5b81-9946-4b56-b50a-afc19a7e1a67
# ╠═ab64fcaf-7ab8-492a-86e5-aca8bbc662d8
# ╠═9a7ec5e4-dfda-404a-b0a3-4ee82101f943
# ╠═29f87b09-660d-48fb-abb7-763d808e83b3
# ╠═10e74b06-56a0-43e6-bfdf-9844bbc2e4d9
# ╠═ff13d17c-2c06-4e7f-a426-1c28fb6d055c
# ╠═baa6eaa1-f0ee-44e5-8ac0-8507162c9d9b
# ╠═c1fdbc17-3e20-4ab1-afe2-4f3814981988
# ╠═5139d421-a06b-48b0-94b6-7a54f7e82b21
# ╠═303c43ab-e1c4-4920-99b6-e2587e9e54c0
# ╠═09d0df60-7e2f-4a14-9d29-0dc2f314ce23
# ╠═dba9dbba-0fbf-4cbc-8b14-28a6c8b9cf39
# ╠═86296e4b-56f9-4972-9638-7610536238b9
# ╠═adfc7059-e20b-433d-8507-fc0f9a802d10
# ╠═e9ccc9db-1e46-4430-985b-963f76dd30c6
# ╟─2365d986-c3df-4e48-9dd1-dab9a7338431
# ╠═c0069a2a-7ebf-4a25-ae52-52125118fe80
# ╟─93d54d5d-6aa6-4796-b850-769685bf277e
# ╠═91996ec5-55ce-4b2c-a4df-4e5b0b89f5f0
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
