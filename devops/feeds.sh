#! /usr/bin/env bash

# Loading the RVM Environment files.
source /home/grimmstede/.rvm/environments/ruby-2.1.2

cd /feemon/devops

ruby feeds.rb
ruby feeds_user.rb
