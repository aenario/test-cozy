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
  var Contact, ContactDataEntry;
  Contact = $resource('contacts/:id', {
    'id': '@id'
  });
  ContactDataEntry = (function() {

    function ContactDataEntry(type, name, value, _default) {
      this.type = type;
      this.name = name;
      this.value = value;
      this["default"] = _default;
    }

    ContactDataEntry.prototype.isMail = function() {
      return this.type === 'email';
    };

    ContactDataEntry.prototype.isPhone = function() {
      return this.type === 'phone';
    };

    ContactDataEntry.prototype.isOther = function() {
      return !this.isMail() && !this.isPhone();
    };

    return ContactDataEntry;

  })();
  Contact.selected = null;
  Contact.list = [];
  Contact.prototype.datas = [];
  Contact.prototype.prepareDatas = function() {
    contact.datas.map(function(dataEntry) {
      return new ContactDataEntry(dataEntry);
    });
    this.phones = contact.datas.filter;
    this.mails;
    return this.others;
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
