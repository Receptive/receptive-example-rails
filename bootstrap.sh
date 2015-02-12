#!/bin/bash

yum -y install yum-plugin-fastestmirror
yum -y update
yum -y install rubygems ruby-devel gcc sqlite-devel nodejs
gem install rails -v '4.1.7' --no-rdoc --no-ri
cd receptive-rails-example
bundle install
