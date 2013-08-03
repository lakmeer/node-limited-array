module.exports = function(n, s){
  s == null && (s = 0);
  return Object.defineProperties(repeatArray$([s], n), {
    push: {
      value: function(){
        Array.prototype.push.apply(this, arguments);
        this.shift();
        return this;
      },
      writable: false
    },
    last: {
      get: function(){
        return this[this.length - 1];
      },
      enumerable: false
    }
  });
};
function repeatArray$(arr, n){
  for (var r = []; n > 0; (n >>= 1) && (arr = arr.concat(arr)))
    if (n & 1) r.push.apply(r, arr);
  return r;
}
