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

## 可以调整为待研究的基因集，
mads=apply(d,1,mad) #MAD测度
d=d[rev(order(mads))[1:5000],] #提取前5000个基因


d = sweep(d,1, apply(d,1,median,na.rm=T))
#sweep是一个循环函数
#这里首先用apply计算每列的中值
#然后用每个基因在样本中的表达值减中值，是一个标准化方法
d[1:5,1:5]

title="D://Rstudy//All_plot"  #设置输出文件的保存位置
results = ConsensusClusterPlus(
  d,maxK=10, #聚类的最大类数，所以会评估聚2类、3类...6类
  reps=80, #50个重采样
  pItem=0.8,  #重采样样本为80%  
  pFeature=1, #重采样基因为80%  
  title=title, #输出文件的保存位置
  clusterAlg="hc", #聚合层次聚类算法
  distance="pearson", #Pearson 相关距离
  seed=1262118388.71279,
  #设置特定的随机种子，使例子是可重复的
  plot="png")

##生成类和样本一致性
##（1）计算cluster-consensus and item-consensus

icl = calcICL(results,title=title,plot="png")
#icl是两元素的列表，分别是cluster-consensus和item-consensus测度
icl[["clusterConsensus"]]

icl[["itemConsensus"]][1:5,]


