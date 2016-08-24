# create lmdf files for training and test images
python code/create_lmdb.py


#!/usr/bin/env sh
# Compute the mean image from the training lmdb

EXAMPLE=$CAFFE_ROOT/../deeplearning-cats-dogs-tutorial
TOOLS=$CAFFE_ROOT/build/tools

$TOOLS/compute_image_mean $EXAMPLE/input/train_lmdb \
  $EXAMPLE/input/mean.binaryproto


# create a png graphic of the convnet
python /home/kaushik/code/caffe/python/draw_net.py /home/kaushik/code/deeplearning-cats-dogs-tutorial/caffe_models/caffe_model_1/caffenet_train_val_1.prototxt /home/kaushik/code/deeplearning-cats-dogs-tutorial/caffe_models/caffe_model_1/caffe_model_1.png


# train the model
$CAFFE_ROOT/build/tools/caffe train --solver /home/kaushik/code/deeplearning-cats-dogs-tutorial/caffe_models/caffe_model_1/solver_1.prototxt 2>&1 | tee /home/kaushik/code/deeplearning-cats-dogs-tutorial/caffe_models/caffe_model_1/model_1_train.log


# plot learning curve
python /home/kaushik/code/deeplearning-cats-dogs-tutorial/code/plot_learning_curve.py /home/kaushik/code/deeplearning-cats-dogs-tutorial/caffe_models/caffe_model_1/model_1_train.log /home/kaushik/code/deeplearning-cats-dogs-tutorial/caffe_models/caffe_model_1/caffe_curve1.png

# predict on test set
cd /home/ubuntu/deeplearning-cats-dogs-tutorial/code
python make_predictions_1.py

