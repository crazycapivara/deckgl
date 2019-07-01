FROM rocker/tidyverse:3.5.3

LABEL maintainer="Stefan Kuethe <crazycapivara@gmail.com>"

RUN apt-get install -y --no-install-recommends \
  libudunits2-dev \
  libgdal-dev

RUN install2.r --error \
  sf \
  spData

COPY . /deckgl

RUN cd deckgl \
  && R -q -e 'devtools::install()' \
  && cd .. \
  && rm -rf deckgl

# h3-r
RUN apt-get install -y --no-install-recommends cmake \
  && git clone https://github.com/crazycapivara/h3-r.git h3-r \
  && cd h3-r \
  && chmod +x install-h3c.sh \
  && bash ./install-h3c.sh \
  && R -q -e 'devtools::install()' \
  && cd .. \
  && rm -rf h3-r

COPY ./docker-entrypoint.sh /docker-entrypoint.sh

RUN chmod +x docker-entrypoint.sh

ENTRYPOINT [ "/docker-entrypoint.sh" ]

CMD [ "/init" ]

