exports.routes = (map) ->

	map.get '/contacts', 'contacts#all'
	map.post '/contacts', 'contacts#create'
	map.post '/contacts/:id', 'contacts#update'
	map.del '/contacts/:id', 'contacts#delete'
	
	map.get '/contacts/:id/picture', 'contacts#showPicture'
	map.post '/contacts/:id/picture', 'contacts#setPicture'
	map.del '/contacts/:id/', 'contacts#deletePicture'
	
	map.get '/contacts/empty', 'contacts#deleteAll'
