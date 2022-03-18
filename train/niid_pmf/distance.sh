file=out/douban_niid_ui/distance.txt
d=(0 1 2 3 4)
DEVICE_NUMS=4
for i in ${!d[@]};do
    CUDA_VISIBLE_DEVICES=2 python run.py -d data/douban -p protocol_head_data.TVT -a algorithm.niid_pmf.MF_NIID -r "{n_itr:1000,lr:0.001,d:8,lambd:1,batch_size:100,beta:0.1,normalization:"ItemNormalized_log",fixed:50,distance:${d[$i]}}"  >> $file &
done
wait
echo "train end"