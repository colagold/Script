file=out/niid_pmf/u_douban_niid_beta.txt
d=(0.01 1 10 100)
DEVICE_NUMS=4
for i in ${!d[@]};do
    CUDA_VISIBLE_DEVICES=0 python run.py -d data/douban -p protocol_head_data.TVT -a algorithm.niid_pmf_long_tail_u.MF_NIID -r "{n_itr:1000,lr:0.001,d:8,lambd:1,batch_size:100,beta:${d[$i]},normalization:"ItemNormalized_log",fixed:50,distance:3}"  >> $file &
done
wait
echo "train end"