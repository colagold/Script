#!/bin/bash
file=out/douban_niid_ui/b1.txt
CUDA_VISIBLE_DEVICES=1 python run.py -d data/douban -p protocol_head_data.TVT -a algorithm.niid_pmf.MF_NIID -r "{n_itr:1000,lr:0.001,d:8,lambd:1,batch_size:100,beta:0,normalization:"ItemNormalized_log",fixed:32}"  >> $file