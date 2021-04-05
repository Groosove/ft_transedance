# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#    By: flavon                                       +:+ +:+         +:+      #
#    By: welease        							+#+  +:+       +#+         #
#    By: sjakku                                   +#+#+#+#+#+   +#+            #
#    Created: 2021/03/15 12:10:28 by flavon            #+#    #+#              #
#    Updated: 2021/03/15 12:12:12 by flavon           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM ruby:3.0.0
EXPOSE 3000

RUN apt-get update && apt-get install -y yarn nodejs postgresql

# Project directory
RUN mkdir transcendence_app
COPY . /transcendence_app
WORKDIR /transcendence_app

# Library install
# RUN gem update --system
# RUN gem install rails bundler:1.17.3
# RUN gem install rails

# Copy GemFile
COPY ./transcendence_app/Gemfile /Gemfile
COPY ./transcendence_app/Gemfile.lock /Gemfile.lock

# RUN bundle update --bundler
RUN bundle install

# Start server
COPY start.sh .
RUN chmod +x start.sh

ENTRYPOINT ["/bin/bash", "start.sh"]