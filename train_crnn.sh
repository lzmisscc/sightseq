python -m ipdb -m sightseq.train ./ \
    --task text_recognition --arch decoder_transformer \
    --batch-size 3 --dropout 0.1  --max-epoch 200 \
    --criterion cross_entropy \
    --num-workers 4 --optimizer adam --decoder-layers 2 \
    --adam-eps 1e-04 --lr 0.001 --min-lr 1e-09 \
    --adam-betas '(0.9, 0.98)' --clip-norm 0.1 \
    --weight-decay 0.0 --no-token-crf --no-token-rnn \
    --save-interval 1 --encoder-normalize-before --skip-invalid-size-inputs-valid-test
# python -m sightseq.train ./ \
#     --task text_recognition --arch decoder_transformer \
#     --batch-size 16 --dropout 0.1 --max-epoch 100 \
#     --criterion cross_entropy \
#     --num-workers 4 --optimizer adam --decoder-layers 2\
#     --adam-eps 1e-04 --lr 0.001 --min-lr 1e-09 \
#     --adam-betas '(0.9, 0.98)' --clip-norm 0.0 \
#     --weight-decay 0.0 --no-token-crf --no-token-rnn \
#     --save-interval 1 --encoder-normalize-before 
# python -m sightseq.train ./ \
#     --task text_recognition --arch decoder_attention \
#     --decoder-layers 2 --batch-size 16 --dropout 0.0 \
#     --max-epoch 100 --criterion cross_entropy --num-workers 4 \
#     --optimizer adam --adam-eps 1e-04 --lr 0.001 --min-lr 1e-09 \
#     --adam-betas '(0.9, 0.98)' --clip-norm 0.1 --weight-decay 0.0 \
#     --no-token-crf --save-interval 1
# python -m sightseq.train ./ \
#     --task text_recognition --arch decoder_crnn \
#     --decoder-layers 2 --batch-size 4 \
#     --max-epoch 50 --criterion ctc_loss --num-workers 4 \
#     --optimizer adam --adam-eps 1e-04 --lr 0.001 --min-lr 1e-09 \
#     --adam-betas '(0.9, 0.98)' --clip-norm 0.0 --weight-decay 0.0 \
#     --save-interval 1
# python ./main.py --dataset-root table_dataset --arch densenet121 \
#     --alphabet table_dataset/dict.txt \
#     --lr 5e-5 --optimizer rmsprop --gpu-id 2 \
#     --not-pretrained
