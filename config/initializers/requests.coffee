allMap = -> emit doc.name, doc

Contact.defineRequest "all", allMap, (err) ->
	if err
		railway.logger.write "cant create request"
		railway.logger.write err