module.exports = function anonymous(locals, attrs, escape, rethrow, merge) {
attrs = attrs || jade.attrs; escape = escape || jade.escape; rethrow = rethrow || jade.rethrow; merge = merge || jade.merge;
var buf = [];
with (locals || {}) {
var interp;
var __indent = [];
buf.push('<!DOCTYPE html>\n<html lang="en" ng-app="app">\n  <head>\n    <meta charset="utf-8">\n    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">\n    <meta name="viewport" content="width=device-width" initial-scale="1.0">\n    <meta name="description" content="">\n    <meta name="author" content="">\n    <title ng-bind-template="{{pageTitle}}"></title>\n    <link rel="stylesheet" href="/css/app.css"><!--[if lte IE 7]>\n    <script src="http://cdnjs.cloudflare.com/ajax/libs/json2/20110223/json2.js"></script><![endif]--><!--[if lte IE 8]>\n    <script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->\n    <!--script-->\n    <!--  window.brunch = window.brunch || {};-->\n    <!--  window.brunch[\'auto-reload\'] = {-->\n    <!--    enabled: true-->\n    <!--  };-->\n    <script src="/js/vendor.js"></script>\n    <script src="/js/app.js"></script>\n  </head>\n  <body ng-controller="AppCtrl">\n    <div class="container-fluid">\n      <div class="row-fluid">\n        <div id="left-col" class="span6">\n          <div class="navbar">\n            <form class="navbar-search pull-right">\n              <input type="text" placeholder="Search" ng-model="query" class="search-query">\n            </form>\n          </div>\n          <ng-include src="\'partials/contacts-list.html\'"></ng-include>\n        </div>\n        <div ng-hide="Contact.selected==null" class="span6">\n          <ng-include src="\'partials/contact-form.html\'"></ng-include>\n        </div>\n      </div>\n    </div>\n  </body>\n</html>');
}
return buf.join("");
};module.exports = function anonymous(locals, attrs, escape, rethrow, merge) {
attrs = attrs || jade.attrs; escape = escape || jade.escape; rethrow = rethrow || jade.rethrow; merge = merge || jade.merge;
var buf = [];
with (locals || {}) {
var interp;
var __indent = [];
buf.push('\n<div class="page-header">\n  <h1>{{Contact.selected.name}}</h1>\n</div>\n<form id="contact-details" class="form-horizontal"> \n  <div ng-repeat="data in Contact.selected.datas" class="control-group">\n    <label class="control-label"> {{data.name}}</label>\n    <input type="text" ng-model="data.value"/>\n  </div>\n</form>');
}
return buf.join("");
};module.exports = function anonymous(locals, attrs, escape, rethrow, merge) {
attrs = attrs || jade.attrs; escape = escape || jade.escape; rethrow = rethrow || jade.rethrow; merge = merge || jade.merge;
var buf = [];
with (locals || {}) {
var interp;
var __indent = [];
buf.push('\n<ul id="contact-list" class="thumbnails">\n  <li ng-repeat="contact in Contact.list | filter:query" class="span2">\n    <div ng-click="contact.select()" class="thumbnail">\n      <h4>{{contact.name}}</h4><img src="http://placehold.it/200"/>\n    </div>\n  </li>\n  <li class="span2">\n    <div ng-click="makeNewContact()" class="thumbnail"><img src="http://placehold.it/200/55FF55/000000&amp;text=new"/>\n      <h4>Create</h4>\n    </div>\n  </li>\n</ul>');
}
return buf.join("");
};