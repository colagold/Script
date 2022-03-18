file=out/lr.txt
lr=(0.01 0.001 0.0001 0.00001)
DEVICE_NUMS=4
for i in ${!lr[@]};do
    CUDA_VISIBLE_DEVICES=$(($i%$DEVICE_NUMS)) python run.py -d data/small_data -p protocol_head_data.TVT -a algorithm.autodebias.adapter.Autodebias -r "{base_model_emb_dim:8,base_model_imputaion_lambda:0.0001,base_model_learning_rate:${lr[$i]},weight1_model_learning_rate:${lr[$i]},weight2_model_learning_rate:${lr[$i]},imputation_model_learning_rate:${lr[$i]}"  >> $file &
done
wait
echo "train end"