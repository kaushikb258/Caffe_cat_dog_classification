# Download trained bvlc_reference_caffenet model
# cd /home/ubuntu/caffe/models/bvlc_reference_caffenet
# wget http://dl.caffe.berkeleyvision.org/bvlc_reference_caffenet.caffemodel

# Model Training with Transfer Learning
/home/kaushik/code/caffe/build/tools/caffe train --solver=/home/kaushik/code/deeplearning-cats-dogs-tutorial/caffe_models/caffe_model_2/solver_2.prototxt --weights /home/kaushik/code/caffe/models/bvlc_reference_caffenet/bvlc_reference_caffenet.caffemodel 2>&1 | tee /home/kaushik/code/deeplearning-cats-dogs-tutorial/caffe_models/caffe_model_2/model_2_train.log

# plot learning curve
python /home/kaushik/code/deeplearning-cats-dogs-tutorial/code/plot_learning_curve.py /home/kaushik/code/deeplearning-cats-dogs-tutorial/caffe_models/caffe_model_2/model_2_train.log /home/kaushik/code/deeplearning-cats-dogs-tutorial/caffe_models/caffe_model_2/caffe_curve2.png
