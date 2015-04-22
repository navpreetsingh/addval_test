require "data.rb"

class InformationController < ApplicationController
  def piece
  	content = params[:content]
  	key = params[:key].to_i  	
  	@new_content = Data.encrypt(content, key) unless content.nil? or key.nil? 

  	respond_to do |format|
  		format.js if request.xhr?
  		format.html  		
  	end
  end
end
