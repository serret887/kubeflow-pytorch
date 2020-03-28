
FROM continuumio/miniconda3

RUN conda install -y jupyter notebook nomkl &&\
    conda install -y -c conda-forge jupyter_contrib_nbextensions &&\
    conda install -y pytorch torchvision cpuonly -c pytorch &&\
    conda install -y  -c fastai fastai
RUN conda clean -afy

ENV NB_PREFIX /
CMD ["sh","-c", "jupyter notebook --notebook-dir=/home/jovyan --ip=0.0.0.0 --no-browser --allow-root --port=8888 --NotebookApp.token='' --NotebookApp.password='' --NotebookApp.allow_origin='*' --NotebookApp.base_url=${NB_PREFIX}"]
