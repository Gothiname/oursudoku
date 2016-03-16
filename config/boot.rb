ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

ENV['MONGO_URI'] = 'mongodb://Oursno:test1234@ds013599.mlab.com:13599/heroku_ldjxtn42'

require 'bundler/setup' # Set up gems listed in the Gemfile.