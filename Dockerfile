FROM ubuntu:14.04
RUN apt-get update && apt-get install -y \
  wget \
  unzip \
  libgdal1-dev \
  libproj-dev
RUN apt-get build-dep -y r-base-core
RUN wget http://cran.es.r-project.org/src/base/R-3/R-3.2.0.tar.gz
RUN tar xvf R-3.2.0.tar.gz
WORKDIR /R-3.2.0
RUN ./configure
RUN make
RUN make install
WORKDIR /
RUN wget https://github.com/manlius/muxViz/archive/master.zip && \
  unzip master.zip
RUN R -e "options('repos'='http://cran.us.r-project.org'); source('/muxViz-master/muxVizGUI.R')"
CMD sh
