#!/bin/bash
file=out/douban_niid_ui/d8.txt
CUDA_VISIBLE_DEVICES=1 python run.py -d data/douban -p protocol_head_data.TVT -a algorithm.niid_pmf.MF_NIID -r '{n_itr:1000,lr:0.001,d:8,lambd:0.0001,batch_size:100,beta:0.1,normalization:"ItemNormalized_log",fixed:32}'  >> $file

-d
data/douban
-p
protocol_head_data.TVT
-a
algorithm.niid_pmf.MF_NIID
-r
{n_itr:1000,lr:0.001,d:16,batch_size:100,lambd:1,normalization:"ItemNormalized_log",beta:0.0001,fixed:32}
