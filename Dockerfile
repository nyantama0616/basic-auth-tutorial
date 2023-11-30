FROM ruby:3.2.1
ENV ROOT="/app"
ENV LANG=C.UTF-8
ENV TZ=Asia/Tokyo

RUN apt-get update -qq
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - && apt-get install -y nodejs default-mysql-client
RUN npm install --global yarn

RUN mkdir ${ROOT}
COPY . ${ROOT}
COPY ./.env.production ${ROOT}/.env

WORKDIR ${ROOT}
RUN gem install bundler
RUN bundle install --jobs 4 --without test development

RUN chmod +x bin/start.sh
ENTRYPOINT [ "bin/start.sh" ]

EXPOSE 3000 3306
