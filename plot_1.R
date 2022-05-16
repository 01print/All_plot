#############
# Pancheng Wu 
# 2022-05-16
# the code for plot pictures
# 104,2#, YanTaXiLU. Xi'An
# xjtu
#
##############

## ConsensusClusterPlus // 一致性聚类
## 列为样本，行为特征
BiocManager::install("ConsensusClusterPlus")
library(ConsensusClusterPlus)

library(ALL)
data(ALL)
d=exprs(ALL) #提取表达数据
d[1:5,1:5]
