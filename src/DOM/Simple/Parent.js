'use strict';

function prop(prop) { return function(i) { return i[prop]; }; }
function apply(prop) {
  return function(i, items) {
    return i[prop].apply(i, items);
  };
}
exports._childCount = prop('childElementCount');
exports._children = function (i) { return Array.from(i.children); };
exports._firstElementChild = prop('firstElementChild');
exports._lastElementChild = prop('lastElementChild');

exports._querySelector = function(n, q) { return n.querySelector(q); };
exports._querySelectorAll = function(n, q) { return Array.from(n.querySelectorAll(q)); };
exports._append = apply('append');
exports._prepend = apply('prepend');
