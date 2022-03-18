file=out/douban_niid_u/fixed.txt
d=(20 40 60 80 100)
DEVICE_NUMS=4
for i in ${!d[@]};do
    CUDA_VISIBLE_DEVICES=2 python run.py -d data/douban -p protocol_head_data.TVT -a algorithm.niid_pmf_u.MF_NIID -r "{n_itr:1000,lr:0.001,d:8,lambd:0.1,batch_size:100,beta:0.1,normalization:"ItemNormalized_log",fixed:${d[$i]},distance:1}"  >> $file &
done
wait
echo "train end"