file=out/lr.txt
lr=(0.01 1e-3 1e-4 1e-5)
DEVICES=(0 1 2 3)
for i in ${lr[@]};do
    CUDA_VISIBLE_DEVICES=0 python run.py -d data/douban -p protocol_head_data.TVT -a algorithm.autodebias.adapter.Autodebias -r "{base_model_emb_dim:8,base_model_imputaion_lambda:0.0001,base_model_learning_rate:$i,weight1_model_learning_rate:$i,weight2_model_learning_rate:$i,imputation_model_learning_rate:$i}"  >> $file &
done
wait
echo "train end"