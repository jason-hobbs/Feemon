#! /usr/bin/env bash

# Loading the RVM Environment files.
source /home/ubuntu/.rvm/environments/ruby-2.1.3

cd /feemon/devops

ruby feeds.rb
ruby feeds_user.rb
