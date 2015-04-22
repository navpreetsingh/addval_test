# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->	
	$("#form_data").submit (e) ->
		$("#submit_button").attr('disabled', true);
		$("#loader").css("display", "inline-block")		
		$("#encrypted_data").css("display", "none").text("")
		$("#error").css("display", "none") 		
		data = $(this)
		content_length = $("#content").val().replace(" ", "").length
		key_length = $("#key").val()		
		if key_length < content_length				
			$.ajax(type:"POST", url: data.attr("action"),	data: data.serialize()).done ->		
				if encrypted_data == ""		
					$("#error").css("display", "inline-block")
				else
					$("#encrypted_data").css("display", "inline-block").append("Encrypted Content: " +encrypted_data)			
		else			
			$("#error").css("display", "inline-block")
		$("#submit_button").attr('disabled', false);
		$("#loader").css("display", "none")
		e.preventDefault()
		false