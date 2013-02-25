
action 'all', ->
  Contact.all (err, contacts) =>
    if err 
      send error: 'something went wrong', 500
    else 
      send contacts

action 'create', ->

  railway.logger.write req
  railway.logger.write req.body
  Contact.create req.body, (err, contact) =>
    if err 
      send error: 'something went wrong', 500
    else
      send contact, 201

action 'update', ->
  new Contact(req.body).save (err) =>
    if err 
      send error: 'something went wrong', 500
    else
      send success: 'contact updated', 201

action 'delete', ->
  Contact.find req.params.id, (err, contact) =>
      contact.destroy ->
      send success: 'Contact deleted', 201

action 'setPicture', ->
  file = req.files["qqfile"]
  file = req.files["file"] unless file?
  if file?
    Contact.find req.params.id, (err, contact) ->
      contact.attachFile file.path, {name: 'picture'}, (err) ->
        if err
          send error: "error occured while saving file", 500
        else
          send success: true, msg:"Upload succeeds", 200
  else
    send error: "no files", 400

action 'deletePicture', ->
  Contact.find req.params.id, (err, contact) ->
    contact.removeFile 'picture', (err) ->
        if err
          send error: "error occured while deleting file", 500
        else
          send success: "Picture deleted", 200

action 'showPicture', ->
    contact.getFile 'picture', (err, res, body) ->
        if err or not res?
            send 500
        else if res.statusCode is 404
            send 'File not found', 404
        else if res.statusCode != 200
            send 500
        else
            send 200
    .pipe(response)

action 'deleteAll', ->
  Contact.all (err, contacts) =>
    L = contacts.length
    contacts.forEach (contact) -> 
      contact.destroy -> 
        if(--L == 0) 
          send( success: 'finished', 201 )