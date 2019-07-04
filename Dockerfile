FROM rocker/tidyverse:3.5.3

LABEL maintainer="Stefan Kuethe <crazycapivara@gmail.com>"

RUN apt-get update && apt-get install -y --no-install-recommends \
  cmake \
  libudunits2-dev \
  libgdal-dev

RUN install2.r --error \
  sf \
  spData

# h3-r
RUN git clone https://github.com/crazycapivara/h3-r.git h3-r \
  && cd h3-r \
  && chmod +x install-h3c.sh \
  && bash ./install-h3c.sh \
  && R -q -e 'devtools::install()' \
  && cd .. \
  && rm -rf h3-r

COPY . /deckgl

RUN cd deckgl \
  && R -q -e 'devtools::install()' \
  && cp inst/examples/h3-hexagon-layer-greater-manchester.R /home/rstudio \
  && cp inst/examples/deckgl-examples/polygon-layer-vancouver-blocks.R /home/rstudio \
  && cd .. \
  && rm -rf deckgl

COPY ./docker-entrypoint.sh /docker-entrypoint.sh

RUN chmod +x docker-entrypoint.sh

ENTRYPOINT [ "/docker-entrypoint.sh" ]

CMD [ "/init" ]

