file=out/douban_niid_ui/beta.txt
d=(0.01 0.1 1 10 100)
DEVICE_NUMS=4
for i in ${!d[@]};do
    CUDA_VISIBLE_DEVICES=2 python run.py -d data/douban -p protocol_head_data.TVT -a algorithm.niid_pmf.MF_NIID -r "{n_itr:1000,lr:0.001,d:8,lambd:0.1,batch_size:100,beta:${d[$i]},normalization:"ItemNormalized_log",fixed:50,distance:4}"  >> $file &
done
wait
echo "train end"