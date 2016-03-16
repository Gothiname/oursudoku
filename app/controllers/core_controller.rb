class CoreController < ApplicationController
  def index
  	lol = Test.new(first_name: 'thomas')
  	lol.save
  end
end
