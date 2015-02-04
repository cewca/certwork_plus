$ ->
	$('form').validate()
	hash=$(location).attr('hash')
	if hash
		$("[href="+hash+"]").tab('show')
	