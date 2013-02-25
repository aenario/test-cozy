'use strict'

### Sevices ###

angular.module('app.services', ['ngResource'])

.factory 'Contact', ($resource) ->

  MANAGED_TYPES = 
  	'email':'Email', 
  	'phone':'Phone Number'


  Contact = $resource 'contacts/:id', 'id':'@id'
  Contact.MANAGED_TYPES = MANAGED_TYPES

  Contact.selected = null
  Contact.list = []

  Contact.prototype.prepareDatas = ->
    contact.datas.map (dataEntry) ->
      new ContactDataEntry(dataEntry)
    @phones = contact.datas.filter
    @mails 
    @others

  Contact.load = ->
    Contact.list = Contact.query ->
      Contact.list.forEach (contact) -> contact.prepareDatas

  Contact.prototype.save = ->
    Contact.prototype.$save ->
      Contact.load()

  Contact.prototype.delete = ->
    Contact.prototype.$delete ->
      Contact.load()

  Contact.prototype.select = ->
    Contact.selected = @

  Contact.prototype.haveMail = ->
    Contact.datas.some (data) -> data.isMail()
  
  Contact.prototype.havePhone = ->
    Contact.datas.some (data) -> data.isPhone()


  Contact.load()

  return Contact