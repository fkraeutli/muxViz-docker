FROM r-base:3.4.0
RUN apt-get update && apt-get install -y libgdal-dev \
  libproj-dev \
  libssl-dev \
  r-cran-rgl \
  xorg \
  openbox
RUN wget https://github.com/manlius/muxViz/archive/master.zip && \
  unzip master.zip
RUN R -e "options('repos'='http://cran.us.r-project.org'); install.packages('devtools'); install.packages('stringi'); install.packages('XML'); install.packages('shiny'); devtools::install_github('trestletech/ShinyDash');"
WORKDIR /muxViz-master
CMD R -e "options('repos'='http://cran.us.r-project.org'); source('/muxViz-master/muxVizGUI.R')"
