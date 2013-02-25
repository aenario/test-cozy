'use strict'

### Controllers ###

angular.module('app.controllers', [])

.controller('AppCtrl', [
  '$scope'
  'Contact'

($scope, Contact) ->

  $scope.Contact = Contact

  $scope.makeNewContact = ->
    new Contact(
      "name":"New Contact"
      ).select()

])