'use strict';

exports.global = window.document;
exports.createTextNode = document.createTextNode;
exports._createElement = function(doc, tag) { return doc.createElement(tag); };
