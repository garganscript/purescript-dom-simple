'use strict';

function prop(prop) {
  return function(i) {
    const ret = i[prop];
    if (typeof ret === 'undefined') return null;
    return ret;
  };
}
function set(prop) { return function(i,v) { i[prop] = v; }; }
function call(prop) { return function(i) { return i[prop](); }; }
function apply(prop) {
  return function(i, items) {
    return i[prop].apply(i, items);
  };
}
function spread(prop) {
  return function(i) {
    return i[prop].apply(i, Array.prototype.slice.call(arguments, 1));
  };
}

// attributes
exports._className = prop('className');
exports._setClassName = set('className');
exports._clientHeight = prop('clientHeight');
exports._clientWidth = prop('clientWidth');
exports._clientLeft = prop('clientLeft');
exports._clientTop = prop('clientTop');
exports._computedName = prop('computedName');
exports._computedRole = prop('computedRole');
exports._id = prop('id');
exports._setId = set('id');
exports._innerHTML = prop('innerHTML');
exports._setInnerHTML = set('innerHTML');
exports._localName = prop('localName');
exports._namespaceURI = prop('namespaceURI');
exports._outerHTML = prop('outerHTML');
exports._setOuterHTML = set('outerHTML');
exports._prefix = prop('prefix');
exports._scrollHeight = prop('scrollHeight');
exports._scrollLeft = prop('scrollLeft');
exports._setScrollLeft = set('scrollLeft');
exports._scrollLeftMax = prop('scrollLeftMax');
exports._scrollTop = prop('scrollTop');
exports._setScrollTop = set('scrollTop');
exports._scrollTopMax = prop('scrollTopMax');
exports._scrollWidth = prop('scrollWidth');
exports._shadowRoot = prop('shadowRoot');
exports._slot = prop('slot');
exports._setSlot = set('slot');
exports._tabStop = prop('tabStop');
exports._setTabStop = set('tabStop');
exports._tagName = prop('tagName');
exports._undoManager = prop('undoManager');
exports._undoScope = prop('undoScope');
exports._setUndoScope = set('undoScope');

// onfullscreenchange
// onfullscreenerror

// attachShadow
// _animate
// _closest
// _computedStyleMap
// _getAnimations
exports._hasAttribute = spread('hasAttribute');
exports._getAttribute = spread('getAttribute');
exports._getAttributeNames = spread('getAttributeNames');
exports._setAttribute = spread('setAttribute');
// getAttributeNS
// getAttributeNode
// getAttributeNodeNS

