#!/usr/bin/env coffee

express = require 'express'
Schema = require('jugglingdb').Schema

app = express()
app.use express.static(__dirname + '/client/public', maxAge: 86400000)
app.use express.bodyParser()

## MODEL

schema = new Schema 'memory'
schema.settings = {}
require("jugglingdb-cozy-adapter").initialize schema, ->

Contact = schema.define 'Contact', ->
    property 'name', String
    property 'phonetic', String
    property 'birthday', Date
    property 'Job', String
    property 'Company', String
    property 'Notes', String
    property 'datas', [Object]
    property '_attachments', Object

ContactAllMap = -> emit(doc.name, doc)
Contact.defineRequest "all", ContactAllMap, (err) ->
    if err
        console.log "cant create request"
        console.log err

Contact.all = (callback) -> Contact.request "all", callback


## helpers

_handleErrorOr = (err, cb) ->
    if err 
        res.send 500, 'something went wrong'
    else 
        cb()


## controller

ContactController = 

    findContact: (req, res, next, contactId) =>
        Contact.find contactId, (err, contact) =>
            if err 
                next(err)
            else
                req.contact = contact
                next()

    all: (req,res) =>
      Contact.all (err, contacts) =>
        _handleErrorOr err, =>
          res.json contacts

    create: (req,res) =>
      Contact.create req.body, (err, contact) =>
        _handleErrorOr err, =>
          res.json 201, contact

    update: (req, res) =>
      new Contact(req.body).save (err) =>
        _handleErrorOr err, =>
          res.json 201, success: 'contact updated'

    delete: (req, res) =>
       req.contact.destroy (err) =>
        _handleErrorOr =>
            res.json 201, success: 'Contact deleted'

    setPicture: (req, res) =>
        file = req.files["qqfile"]
        file = req.files["file"] unless file?
        if file?
            req.contact.attachFile file.path, {name: 'picture'}, (err) =>
                _handleErrorOr err, ->
                    res.json 200, success: true, msg:"Upload succeeds"
        else
            res.json 400, error: "no files"

    deletePicture: (req, res) =>
        req.contact.removeFile 'picture', (err) =>
            _handleErrorOr err, =>
                res.json 200, success: "Picture deleted", 200

    showPicture: (req, response) ->
        req.contact.getFile 'picture', (err, res, body) ->
            if err or not res?
                res.send 500
            else if res.statusCode is 404
                res.send 'File not found', 404
            else if res.statusCode != 200
                res.send 500
            else
                res.send 200
        .pipe(response)

# routes

app.param 'id',                   ContactController.findContact

app.get  '/contacts',             ContactController.all
app.post '/contacts',             ContactController.create
app.post '/contacts/:id',         ContactController.update
app.del  '/contacts/:id',         ContactController.delete

app.get  '/contacts/:id/picture', ContactController.showPicture
app.post '/contacts/:id/picture', ContactController.setPicture
app.del  '/contacts/:id/',        ContactController.deletePicture


app.listen 9250
console.log 'server started'