'use strict';

exports._event = function(event, node) {
  return node[event].call(node);
};
