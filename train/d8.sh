file=out/d8.txt
CUDA_VISIBLE_DEVICES=0 python run.py -d data/douban -p protocol_head_data.TVT -a algorithm.autodebias.adapter.Autodebias -r "{base_model_emb_dim:8,base_model_imputaion_lambda:0.0001,base_model_learning_rate:0.00001,weight1_model_learning_rate:0.00001,weight2_model_learning_rate:0.00001,imputation_model_learning_rate:0.00001}"  >> $file
