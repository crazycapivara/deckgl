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

COPY ./docker-entrypoint.sh /docker-entrypoint.sh

RUN chmod +x docker-entrypoint.sh

ENTRYPOINT [ "/docker-entrypoint.sh" ]

CMD [ "/init" ]

