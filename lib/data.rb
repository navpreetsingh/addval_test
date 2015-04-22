class Data
	class << self

		def encrypt(content, key)
			return false if content.nil? or key.nil?			
			content = content.gsub(" ","")
			num = key - 1
	    length = content.length - 1
	    return "Encryption cannot be done. Please select key less than content length." if num >= length or key <= 1 
	    hash = {}	          
	    (0..num).each{|n| hash["array#{n}"] = ""}      
	    (0..length).step(num).each_with_index do |pos, index|
	      (0..num-1).each {|down| hash["array#{down}"] += content[down + pos] unless (down + pos) > length } if index.even?
	      (1..num).to_a.reverse.each_with_index {|up,ind| hash["array#{up}"] += content[pos + ind] unless up + pos > length} unless index.even?              
	    end
	    new_content = ""
	    (0..num).each{|n| new_content += hash["array#{n}"] } 
	    new_content	    
		end

	end
end