'use strict';

function prop(p) { return function(i) { return i[prop]; }; }
exports._prevElement = prop('previousElementSibling');
exports._nextElement = prop('nextElementSibling');
