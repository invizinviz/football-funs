#Project 3 WDI Football for Fans

FROM phusion/passenger-ruby21
MAINTAINER Andres Vara "<"andres.vara@examle.com"

ENV HOME /root
ENV RAILS_ENV production

CMD ["/sbin/my_init"]

RUN rm -f /etc/service/nginx/down
RUN rm /etc/nginx/sites-enabled/default
ADD nginx.conf /etc/nginx/sites-enabled/football_fans.conf

ADD . /home/app/football_fans
WORKDIR /home/app/football_fans
RUN chown -R app:app /home/app/football_fans
RUN sudo -u app bundle install --deployment
RUN sudo -u app RAILS_ENV=production rake assets:precompile

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

export SECRET_KEY_BASE=3a7239956a9c0d6c2efab8be0810a89ea231b53b6c9ee25d2e25512ac7070bc50fdce7dd5a55595b7a2b4c815b8b6bdd317fa234d0f1835616bd1bf6f5466c40

#RAILS_ENV=production rake assets:clean assets:precompile