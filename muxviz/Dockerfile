FROM r-base:3.4.0
RUN apt-get update
RUN apt-get install -y \
  libgdal-dev \
  libproj-dev \
  libssl-dev \
  r-cran-rgl \
  openbox
RUN DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y xorg \
    && rm -rf /var/lib/apt/lists/*
RUN wget https://github.com/manlius/muxViz/archive/master.zip && \
  unzip master.zip
RUN R -e "options('repos'='http://cran.us.r-project.org'); install.packages('devtools'); install.packages('stringi'); install.packages('XML'); install.packages('shiny'); devtools::install_github('trestletech/ShinyDash');"
WORKDIR /muxViz-master
RUN sed -i.bu 's/runApp(getwd())/runApp(getwd(),8080)/' muxVizGUI.R
CMD R -e "options('repos'='http://cran.us.r-project.org'); source('/muxViz-master/muxVizGUI.R')"
