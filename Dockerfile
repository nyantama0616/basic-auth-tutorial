FROM ruby:3.2.1
ENV ROOT="/app"
ENV LANG=C.UTF-8
ENV TZ=Asia/Tokyo

RUN apt-get update -qq
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - && apt-get install -y nodejs default-mysql-client
RUN npm install --global yarn

WORKDIR ${ROOT}

COPY . ${ROOT}

RUN gem install bundler
RUN bundle install --jobs 4

COPY start.sh /usr/bin/
RUN chmod +x /usr/bin/start.sh
ENTRYPOINT ["start.sh"]
EXPOSE 3000

CMD ["bin/start"]
