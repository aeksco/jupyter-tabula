# Create image based on the offical tensorflow container image from dockerhub
FROM tensorflow/tensorflow:latest

# Add Java PPA repository
RUN add-apt-repository ppa:webupd8team/java
RUN apt-get update
RUN apt-get install wget

# Install Java (Tabula dependency)
# https://www.reddit.com/r/docker/comments/59uahu/how_to_accept_a_license_agreement_while_building/
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections &&   apt-get update &&   apt-get install -y software-properties-common &&  add-apt-repository -y ppa:webupd8team/java &&   apt-get update &&   apt-get install -y oracle-java8-installer
RUN apt-get install libjai-core-java

# Install Python dependencies
RUN pip install pyPdf
RUN pip install pypdf
RUN pip install pypdf2
RUN pip install pandas
RUN pip install requests
RUN pip install distro
RUN pip install tabula-py

# Install Tabula
RUN mkdir /tabula
WORKDIR /tabula
RUN wget https://github.com/tabulapdf/tabula/releases/download/v1.2.1/tabula-jar-1.2.1.zip
RUN unzip tabula-jar-1.2.1.zip

# Removes Tensorflow files & example notebooks
RUN rm /notebooks/1_hello_tensorflow.ipynb
RUN rm /notebooks/2_getting_started.ipynb
RUN rm /notebooks/3_mnist_from_scratch.ipynb
RUN rm /notebooks/BUILD
RUN rm /notebooks/LICENSE

# Copies README.md, example notebooks, and sample PDFs
COPY notebooks/ /notebooks
COPY README.md /notebooks

# Set workdir back to tensorflow default
WORKDIR /notebooks
