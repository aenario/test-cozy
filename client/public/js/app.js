'use strict';

var App;

App = angular.module('app', ['ngCookies', 'ngResource', 'app.controllers', 'app.directives', 'app.filters', 'app.services']);
'use strict';

/* Controllers
*/

angular.module('app.controllers', []).controller('AppCtrl', [
  '$scope', 'Contact', function($scope, Contact) {
    $scope.Contact = Contact;
    return $scope.makeNewContact = function() {
      return new Contact({
        "name": "New Contact"
      }).select();
    };
  }
]);
'use strict';

/* Directives
*/

angular.module('app.directives', ['app.services']);
'use strict';

/* Filters
*/

angular.module('app.filters', []);
'use strict';

/* Sevices
*/

angular.module('app.services', ['ngResource']).factory('Contact', function($resource) {
  var Contact;
  Contact = $resource('contacts/:id', {
    'id': '@id'
  });
  Contact.selected = null;
  Contact.list = [];
  Contact.prototype.prepareDatas = function() {
    contact.datas.map(function(dataEntry) {
      return new ContactDataEntry(dataEntry);
    });
    return this.phones = contact.datas.filter;
  };
  Contact.load = function() {
    return Contact.list = Contact.query(function() {
      return Contact.list.forEach(function(contact) {
        return contact.prepareDatas;
      });
    });
  };
  Contact.prototype.save = function() {
    return Contact.prototype.$save(function() {
      return Contact.load();
    });
  };
  Contact.prototype["delete"] = function() {
    return Contact.prototype.$delete(function() {
      return Contact.load();
    });
  };
  Contact.prototype.select = function() {
    return Contact.selected = this;
  };
  Contact.prototype.haveMail = function() {
    return Contact.datas.some(function(data) {
      return data.isMail();
    });
  };
  Contact.prototype.havePhone = function() {
    return Contact.datas.some(function(data) {
      return data.isPhone();
    });
  };
  Contact.load();
  return Contact;
});
