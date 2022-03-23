file=out/niid_pmf/douban_niid_lambd.txt
d=(0.1 1 10 100)
DEVICE_NUMS=4
for i in ${!d[@]};do
    CUDA_VISIBLE_DEVICES=1 python run.py -d data/douban -p protocol_head_data.TVT -a algorithm.niid_pmf_long_tail.MF_NIID -r "{n_itr:1000,lr:0.001,d:8,lambd:${d[$i]},batch_size:100,beta:0.1,normalization:"ItemNormalized_log",fixed:50,distance:3}"  >> $file &
done
wait
echo "train end"