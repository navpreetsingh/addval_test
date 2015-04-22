require 'rails_helper'
require 'data.rb'

describe Data do
	
	describe "encryption" do
		content = "lets meet at five"
		it "should fail and return false on empty content or key" do			
      new_content = Data.encrypt(nil, nil)
      new_content == false
      new_content = Data.encrypt(content, nil)
      new_content == false      
      new_content = Data.encrypt(nil, 3)
      new_content == false
    end

    it "should fail and return error message on content length less than key value or when key value is 0 or 1" do
    	message = "Encryption cannot be done. Please select key less than content length."    	 
    	new_content = Data.encrypt("aaa", 5)
    	new_content == message
    	new_content = Data.encrypt(content, 0)
    	new_content == message
    	new_content = Data.encrypt(content, 1)
    	new_content == message
    end

    it "should encrypt content when content and key are acceptable for encryption" do
    	new_content = Data.encrypt(content, 3)
    	new_content == "lmavesettietef"
    	new_content = Data.encrypt(content, 4)
    	new_content == "leveetietmafst"
    end
    
	end

end