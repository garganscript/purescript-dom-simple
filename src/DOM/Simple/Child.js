'use strict';

function call(prop) { return function(c) { return c[prop](); }; }
function apply(prop) {
  return function(c, items) { return c[prop].apply(c, items); };
}
exports._remove = call('remove');
exports._before = apply('before');
exports._after = apply('after');
exports._replaceWith = apply('replaceWith');
