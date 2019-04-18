'use strict';

function get(prop) { return function(i) { return i[prop]; }; }
function set(prop) { return function(i,v) { i[prop] = v; }; }
function call(prop) { return function(i) { return i[prop](); }; }
function spread(prop) {
  return function(i) {
    return i[prop].apply(i, Array.prototype.slice.call(prop, 1));
  };
}
function apply(prop) {
  return function(i, items) {
    return i[prop].apply(i, items);
  };
}
exports.nodeName = get('nodeName');
exports.prevSibling = get('previousSibling');
exports.nextSibling = get('nextSibling');
exports.ownerDocument = get('ownerDocument');
exports.parentNode = get('parentNode');
exports.parentElement = get('parentElement');
exports.textContent = get('textContent');
exports._setTextContent = set('textContent');
exports._appendChild = spread('appendChild');
exports._cloneNode = spread('cloneNode');
// compareDocumentPosition
// getRootNode
// hasChildNodes
// insertBefore
// isDefaultNamespace
// isEqualNode
// isSameNode
// lookupPrefix
// lookupNamespaceURI
exports.normalize = call('normalize');
// removeChild = spread(
// replaceChild
