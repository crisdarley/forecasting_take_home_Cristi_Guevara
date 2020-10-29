FROM python:3.8.1

RUN echo 'Updating Ubuntu packages.'
RUN apt-get update

RUN echo 'Installing Python packages.'
ADD requirements.txt /
RUN pip install -r /requirements.txt



# Install Numpy
RUN pip install numpy

# Install Pandas
RUN pip install pandas

# Install Statsmodel
RUN pip install statsmodels

# Matplotlib
RUN pip install matplotlib

# Install Plotly
RUN pip install plotly

# Install Seaborn
RUN pip install seaborn

# Install pystan with pip before using pip to install fbprophet
RUN pip install pystan


# Install fbprophet
RUN pip install fbprophet

# Install sklearn
RUN pip install sklearn

# Install excel
RUN pip install xlrd

# Install satsmodels
RUN pip install statsmodels


RUN echo 'Adding notebooks and scripts directories and docker-entrypoint.sh.'
ADD notebooks/ /workspace/notebooks
ADD scripts/ /workspace/scripts
ADD docker-entrypoint.sh /workspace/docker-entrypoint.sh
RUN chmod +x /workspace/docker-entrypoint.sh

RUN echo 'Declaring workspace to be the working directory.'
WORKDIR /workspace

RUN echo 'Exposing port 8888.'
EXPOSE 8888

RUN echo 'Setting /workspace/docker-entrypoint.sh as the entrypoint.'
ENTRYPOINT ["/workspace/docker-entrypoint.sh"]
