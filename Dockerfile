ARG BASE_IMG=${BASE_IMG}
FROM ${BASE_IMG} 

ENV PATH="/opt/ml/code:/usr/local/cuda/bin/:${PATH}"
ENV LD_LIBRARY_PATH="/usr/local/cuda/lib64/:$LD_LIBRARY_PATH"
## install cmake 3.17 && opencv


RUN python -m pip install cython
RUN apt-get update && apt-get install libyaml-dev locales -y 
RUN export LANG=C.UTF-8
RUN git clone https://github.com/catwhiskers/AlphaPose.git  && cd AlphaPose && python setup.py build develop   
RUN pip install pycocotools==2.0.2a1; exit 0 
COPY yolov3-spp.weights /AlphaPose/detector/yolo/data/

WORKDIR /AlphaPose
#ENTRYPOINT ["/bin/bash","./scripts/train.sh","./configs/coco/resnet/256x192_res50_lr1e-3_1x.yaml", "exp_fastpose" ]
