set -x

CONFIG=$1
EXPID=${2:-"alphapose"}

python ./scripts/train.py \
    --exp-id ${EXPID} \
    --cfg ${CONFIG} \
    --nThreads 1 

cp -r ./exp /opt/ml/model