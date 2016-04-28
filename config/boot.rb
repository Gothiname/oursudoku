ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' # Set up gems listed in the Gemfile.

# [ONLY Windows] Patch to make JSX transformation possible with NodeJS
host_os = RbConfig::CONFIG['host_os']
if /mswin|msys|mingw|cygwin|bccwin|wince|emc/ === host_os
	ENV['EXECJS_RUNTIME'] = 'Node'
end
