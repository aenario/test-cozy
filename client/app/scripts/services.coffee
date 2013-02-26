'use strict'

### Sevices ###

angular.module('app.services', ['ngResource'])

.factory 'Contact', ($resource) ->

  #MANAGED_TYPES =
  #  'email':'Email'
  #  'phone':'Phone Number'

  Contact = $resource 'contacts/:id', 'id':'@id'
  #Contact.MANAGED_TYPES = MANAGED_TYPES

  Contact.selected = null
  Contact.list = []

  thenUpdate = ->
    Contact.list = Contact.query ->
      Contact.list.forEach (contact) -> contact.prepareDatas

  Contact.prototype.prepareDatas = ->
    contact.datas.map (dataEntry) ->
      new ContactDataEntry(dataEntry)
    @phones = contact.datas.filter

  Contact.prototype.save = ->
    Contact.prototype.$save thenUpdate

  Contact.prototype.delete = ->
    Contact.prototype.$delete thenUpdate

  Contact.prototype.select = ->
    Contact.selected = @

  Contact.prototype.haveMail = ->
    Contact.datas.some (data) -> data.type == 'email'
  
  Contact.prototype.havePhone = ->
    Contact.datas.some (data) -> data.type == 'phone'

  thenUpdate()

  return Contact