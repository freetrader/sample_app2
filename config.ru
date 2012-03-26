# This file is used by Rack-based servers to start the application.

 require ::File.expand_path('../config/environment',  __FILE__)

#require ::File.expand_path('../SampleApp2',  __FILE__)
run SampleApp2::Application
