(function() {

  // Baseline setup
  // --------------

  // Establish the root object, `window` in the browser, or `global` on the server.
  var root = this;

  // Save the previous value of the `_` variable.
  var previousUnderscore = root._;

  // Establish the object that gets returned to break out of a loop iteration.
  var breaker = {};

  // Save bytes in the minified (but not gzipped) version:
  var ArrayProto = Array.prototype, ObjProto = Object.prototype, FuncProto = Function.prototype;

  // Create quick reference variables for speed access to core prototypes.
  var push             = ArrayProto.push,
      slice            = ArrayProto.slice,
      concat           = ArrayProto.concat,
      unshift          = ArrayProto.unshift,
      toString         = ObjProto.toString,
      hasOwnProperty   = ObjProto.hasOwnProperty;

  // All **ECMAScript 5** native function implementations that we hope to use
  // are declared here.
  var
    nativeForEach      = ArrayProto.forEach,
    nativeMap          = ArrayProto.map,
    nativeReduce       = ArrayProto.reduce,
    nativeReduceRight  = ArrayProto.reduceRight,
    nativeFilter       = ArrayProto.filter,
    nativeEvery        = ArrayProto.every,
    nativeSome         = ArrayProto.some,
    nativeIndexOf      = ArrayProto.indexOf,
    nativeLastIndexOf  = ArrayProto.lastIndexOf,
    nativeIsArray      = Array.isArray,
    nativeKeys         = Object.keys,
    nativeBind         = FuncProto.bind;

  // Create a safe reference to the Underscore object for use below.
  var _ = function(obj) {
    if (obj instanceof _) return obj;
    if (!(this instanceof _)) return new _(obj);
    this._wrapped = obj;
  };

  // Export the Underscore object for **Node.js**, with
  // backwards-compatibility for the old `require()` API. If we're in
  // the browser, add `_` as a global object via a string identifier,
  // for Closure Compiler "advanced" mode.
  if (typeof exports !== 'undefined') {
    if (typeof module !== 'undefined' && module.exports) {
      exports = module.exports = _;
    }
    exports._ = _;
  } else {
    root['_'] = _;
  }

  // Current version.
  _.VERSION = '1.4.2';

  // Collection Functions
  // --------------------

  // The cornerstone, an `each` implementation, aka `forEach`.
  // Handles objects with the built-in `forEach`, arrays, and raw objects.
  // Delegates to **ECMAScript 5**'s native `forEach` if available.
  var each = _.each = _.forEach = function(obj, iterator, context) {
    if (obj == null) return;
    if (nativeForEach && obj.forEach === nativeForEach) {
      obj.forEach(iterator, context);
    } else if (obj.length === +obj.length) {
      for (var i = 0, l = obj.length; i < l; i++) {
        if (iterator.call(context, obj[i], i, obj) === breaker) return;
      }
    } else {
      for (var key in obj) {
        if (_.has(obj, key)) {
          if (iterator.call(context, obj[key], key, obj) === breaker) return;
        }
      }
    }
  };

  // Return the results of applying the iterator to each element.
  // Delegates to **ECMAScript 5**'s native `map` if available.
  _.map = _.collect = function(obj, iterator, context) {
    var results = [];
    if (obj == null) return results;
    if (nativeMap && obj.map === nativeMap) return obj.map(iterator, context);
    each(obj, function(value, index, list) {
      results[results.length] = iterator.call(context, value, index, list);
    });
    return results;
  };

  // **Reduce** builds up a single result from a list of values, aka `inject`,
  // or `foldl`. Delegates to **ECMAScript 5**'s native `reduce` if available.
  _.reduce = _.foldl = _.inject = function(obj, iterator, memo, context) {
    var initial = arguments.length > 2;
    if (obj == null) obj = [];
    if (nativeReduce && obj.reduce === nativeReduce) {
      if (context) iterator = _.bind(iterator, context);
      return initial ? obj.reduce(iterator, memo) : obj.reduce(iterator);
    }
    each(obj, function(value, index, list) {
      if (!initial) {
        memo = value;
        initial = true;
      } else {
        memo = iterator.call(context, memo, value, index, list);
      }
    });
    if (!initial) throw new TypeError('Reduce of empty array with no initial value');
    return memo;
  };

  // The right-associative version of reduce, also known as `foldr`.
  // Delegates to **ECMAScript 5**'s native `reduceRight` if available.
  _.reduceRight = _.foldr = function(obj, iterator, memo, context) {
    var initial = arguments.length > 2;
    if (obj == null) obj = [];
    if (nativeReduceRight && obj.reduceRight === nativeReduceRight) {
      if (context) iterator = _.bind(iterator, context);
      return arguments.length > 2 ? obj.reduceRight(iterator, memo) : obj.reduceRight(iterator);
    }
    var length = obj.length;
    if (length !== +length) {
      var keys = _.keys(obj);
      length = keys.length;
    }
    each(obj, function(value, index, list) {
      index = keys ? keys[--length] : --length;
      if (!initial) {
        memo = obj[index];
        initial = true;
      } else {
        memo = iterator.call(context, memo, obj[index], index, list);
      }
    });
    if (!initial) throw new TypeError('Reduce of empty array with no initial value');
    return memo;
  };

  // Return the first value which passes a truth test. Aliased as `detect`.
  _.find = _.detect = function(obj, iterator, context) {
    var result;
    any(obj, function(value, index, list) {
      if (iterator.call(context, value, index, list)) {
        result = value;
        return true;
      }
    });
    return result;
  };

  // Return all the elements that pass a truth test.
  // Delegates to **ECMAScript 5**'s native `filter` if available.
  // Aliased as `select`.
  _.filter = _.select = function(obj, iterator, context) {
    var results = [];
    if (obj == null) return results;
    if (nativeFilter && obj.filter === nativeFilter) return obj.filter(iterator, context);
    each(obj, function(value, index, list) {
      if (iterator.call(context, value, index, list)) results[results.length] = value;
    });
    return results;
  };

  // Return all the elements for which a truth test fails.
  _.reject = function(obj, iterator, context) {
    var results = [];
    if (obj == null) return results;
    each(obj, function(value, index, list) {
      if (!iterator.call(context, value, index, list)) results[results.length] = value;
    });
    return results;
  };

  // Determine whether all of the elements match a truth test.
  // Delegates to **ECMAScript 5**'s native `every` if available.
  // Aliased as `all`.
  _.every = _.all = function(obj, iterator, context) {
    iterator || (iterator = _.identity);
    var result = true;
    if (obj == null) return result;
    if (nativeEvery && obj.every === nativeEvery) return obj.every(iterator, context);
    each(obj, function(value, index, list) {
      if (!(result = result && iterator.call(context, value, index, list))) return breaker;
    });
    return !!result;
  };

  // Determine if at least one element in the object matches a truth test.
  // Delegates to **ECMAScript 5**'s native `some` if available.
  // Aliased as `any`.
  var any = _.some = _.any = function(obj, iterator, context) {
    iterator || (iterator = _.identity);
    var result = false;
    if (obj == null) return result;
    if (nativeSome && obj.some === nativeSome) return obj.some(iterator, context);
    each(obj, function(value, index, list) {
      if (result || (result = iterator.call(context, value, index, list))) return breaker;
    });
    return !!result;
  };

  // Determine if the array or object contains a given value (using `===`).
  // Aliased as `include`.
  _.contains = _.include = function(obj, target) {
    var found = false;
    if (obj == null) return found;
    if (nativeIndexOf && obj.indexOf === nativeIndexOf) return obj.indexOf(target) != -1;
    found = any(obj, function(value) {
      return value === target;
    });
    return found;
  };

  // Invoke a method (with arguments) on every item in a collection.
  _.invoke = function(obj, method) {
    var args = slice.call(arguments, 2);
    return _.map(obj, function(value) {
      return (_.isFunction(method) ? method : value[method]).apply(value, args);
    });
  };

  // Convenience version of a common use case of `map`: fetching a property.
  _.pluck = function(obj, key) {
    return _.map(obj, function(value){ return value[key]; });
  };

  // Convenience version of a common use case of `filter`: selecting only objects
  // with specific `key:value` pairs.
  _.where = function(obj, attrs) {
    if (_.isEmpty(attrs)) return [];
    return _.filter(obj, function(value) {
      for (var key in attrs) {
        if (attrs[key] !== value[key]) return false;
      }
      return true;
    });
  };

  // Return the maximum element or (element-based computation).
  // Can't optimize arrays of integers longer than 65,535 elements.
  // See: https://bugs.webkit.org/show_bug.cgi?id=80797
  _.max = function(obj, iterator, context) {
    if (!iterator && _.isArray(obj) && obj[0] === +obj[0] && obj.length < 65535) {
      return Math.max.apply(Math, obj);
    }
    if (!iterator && _.isEmpty(obj)) return -Infinity;
    var result = {computed : -Infinity};
    each(obj, function(value, index, list) {
      var computed = iterator ? iterator.call(context, value, index, list) : value;
      computed >= result.computed && (result = {value : value, computed : computed});
    });
    return result.value;
  };

  // Return the minimum element (or element-based computation).
  _.min = function(obj, iterator, context) {
    if (!iterator && _.isArray(obj) && obj[0] === +obj[0] && obj.length < 65535) {
      return Math.min.apply(Math, obj);
    }
    if (!iterator && _.isEmpty(obj)) return Infinity;
    var result = {computed : Infinity};
    each(obj, function(value, index, list) {
      var computed = iterator ? iterator.call(context, value, index, list) : value;
      computed < result.computed && (result = {value : value, computed : computed});
    });
    return result.value;
  };

  // Shuffle an array.
  _.shuffle = function(obj) {
    var rand;
    var index = 0;
    var shuffled = [];
    each(obj, function(value) {
      rand = _.random(index++);
      shuffled[index - 1] = shuffled[rand];
      shuffled[rand] = value;
    });
    return shuffled;
  };

  // An internal function to generate lookup iterators.
  var lookupIterator = function(value) {
    return _.isFunction(value) ? value : function(obj){ return obj[value]; };
  };

  // Sort the object's values by a criterion produced by an iterator.
  _.sortBy = function(obj, value, context) {
    var iterator = lookupIterator(value);
    return _.pluck(_.map(obj, function(value, index, list) {
      return {
        value : value,
        index : index,
        criteria : iterator.call(context, value, index, list)
      };
    }).sort(function(left, right) {
      var a = left.criteria;
      var b = right.criteria;
      if (a !== b) {
        if (a > b || a === void 0) return 1;
        if (a < b || b === void 0) return -1;
      }
      return left.index < right.index ? -1 : 1;
    }), 'value');
  };

  // An internal function used for aggregate "group by" operations.
  var group = function(obj, value, context, behavior) {
    var result = {};
    var iterator = lookupIterator(value);
    each(obj, function(value, index) {
      var key = iterator.call(context, value, index, obj);
      behavior(result, key, value);
    });
    return result;
  };

  // Groups the object's values by a criterion. Pass either a string attribute
  // to group by, or a function that returns the criterion.
  _.groupBy = function(obj, value, context) {
    return group(obj, value, context, function(result, key, value) {
      (_.has(result, key) ? result[key] : (result[key] = [])).push(value);
    });
  };

  // Counts instances of an object that group by a certain criterion. Pass
  // either a string attribute to count by, or a function that returns the
  // criterion.
  _.countBy = function(obj, value, context) {
    return group(obj, value, context, function(result, key, value) {
      if (!_.has(result, key)) result[key] = 0;
      result[key]++;
    });
  };

  // Use a comparator function to figure out the smallest index at which
  // an object should be inserted so as to maintain order. Uses binary search.
  _.sortedIndex = function(array, obj, iterator, context) {
    iterator = iterator == null ? _.identity : lookupIterator(iterator);
    var value = iterator.call(context, obj);
    var low = 0, high = array.length;
    while (low < high) {
      var mid = (low + high) >>> 1;
      iterator.call(context, array[mid]) < value ? low = mid + 1 : high = mid;
    }
    return low;
  };

  // Safely convert anything iterable into a real, live array.
  _.toArray = function(obj) {
    if (!obj) return [];
    if (obj.length === +obj.length) return slice.call(obj);
    return _.values(obj);
  };

  // Return the number of elements in an object.
  _.size = function(obj) {
    return (obj.length === +obj.length) ? obj.length : _.keys(obj).length;
  };

  // Array Functions
  // ---------------

  // Get the first element of an array. Passing **n** will return the first N
  // values in the array. Aliased as `head` and `take`. The **guard** check
  // allows it to work with `_.map`.
  _.first = _.head = _.take = function(array, n, guard) {
    return (n != null) && !guard ? slice.call(array, 0, n) : array[0];
  };

  // Returns everything but the last entry of the array. Especially useful on
  // the arguments object. Passing **n** will return all the values in
  // the array, excluding the last N. The **guard** check allows it to work with
  // `_.map`.
  _.initial = function(array, n, guard) {
    return slice.call(array, 0, array.length - ((n == null) || guard ? 1 : n));
  };

  // Get the last element of an array. Passing **n** will return the last N
  // values in the array. The **guard** check allows it to work with `_.map`.
  _.last = function(array, n, guard) {
    if ((n != null) && !guard) {
      return slice.call(array, Math.max(array.length - n, 0));
    } else {
      return array[array.length - 1];
    }
  };

  // Returns everything but the first entry of the array. Aliased as `tail` and `drop`.
  // Especially useful on the arguments object. Passing an **n** will return
  // the rest N values in the array. The **guard**
  // check allows it to work with `_.map`.
  _.rest = _.tail = _.drop = function(array, n, guard) {
    return slice.call(array, (n == null) || guard ? 1 : n);
  };

  // Trim out all falsy values from an array.
  _.compact = function(array) {
    return _.filter(array, function(value){ return !!value; });
  };

  // Internal implementation of a recursive `flatten` function.
  var flatten = function(input, shallow, output) {
    each(input, function(value) {
      if (_.isArray(value)) {
        shallow ? push.apply(output, value) : flatten(value, shallow, output);
      } else {
        output.push(value);
      }
    });
    return output;
  };

  // Return a completely flattened version of an array.
  _.flatten = function(array, shallow) {
    return flatten(array, shallow, []);
  };

  // Return a version of the array that does not contain the specified value(s).
  _.without = function(array) {
    return _.difference(array, slice.call(arguments, 1));
  };

  // Produce a duplicate-free version of the array. If the array has already
  // been sorted, you have the option of using a faster algorithm.
  // Aliased as `unique`.
  _.uniq = _.unique = function(array, isSorted, iterator, context) {
    var initial = iterator ? _.map(array, iterator, context) : array;
    var results = [];
    var seen = [];
    each(initial, function(value, index) {
      if (isSorted ? (!index || seen[seen.length - 1] !== value) : !_.contains(seen, value)) {
        seen.push(value);
        results.push(array[index]);
      }
    });
    return results;
  };

  // Produce an array that contains the union: each distinct element from all of
  // the passed-in arrays.
  _.union = function() {
    return _.uniq(concat.apply(ArrayProto, arguments));
  };

  // Produce an array that contains every item shared between all the
  // passed-in arrays.
  _.intersection = function(array) {
    var rest = slice.call(arguments, 1);
    return _.filter(_.uniq(array), function(item) {
      return _.every(rest, function(other) {
        return _.indexOf(other, item) >= 0;
      });
    });
  };

  // Take the difference between one array and a number of other arrays.
  // Only the elements present in just the first array will remain.
  _.difference = function(array) {
    var rest = concat.apply(ArrayProto, slice.call(arguments, 1));
    return _.filter(array, function(value){ return !_.contains(rest, value); });
  };

  // Zip together multiple lists into a single array -- elements that share
  // an index go together.
  _.zip = function() {
    var args = slice.call(arguments);
    var length = _.max(_.pluck(args, 'length'));
    var results = new Array(length);
    for (var i = 0; i < length; i++) {
      results[i] = _.pluck(args, "" + i);
    }
    return results;
  };

  // Converts lists into objects. Pass either a single array of `[key, value]`
  // pairs, or two parallel arrays of the same length -- one of keys, and one of
  // the corresponding values.
  _.object = function(list, values) {
    var result = {};
    for (var i = 0, l = list.length; i < l; i++) {
      if (values) {
        result[list[i]] = values[i];
      } else {
        result[list[i][0]] = list[i][1];
      }
    }
    return result;
  };

  // If the browser doesn't supply us with indexOf (I'm looking at you, **MSIE**),
  // we need this function. Return the position of the first occurrence of an
  // item in an array, or -1 if the item is not included in the array.
  // Delegates to **ECMAScript 5**'s native `indexOf` if available.
  // If the array is large and already in sort order, pass `true`
  // for **isSorted** to use binary search.
  _.indexOf = function(array, item, isSorted) {
    if (array == null) return -1;
    var i = 0, l = array.length;
    if (isSorted) {
      if (typeof isSorted == 'number') {
        i = (isSorted < 0 ? Math.max(0, l + isSorted) : isSorted);
      } else {
        i = _.sortedIndex(array, item);
        return array[i] === item ? i : -1;
      }
    }
    if (nativeIndexOf && array.indexOf === nativeIndexOf) return array.indexOf(item, isSorted);
    for (; i < l; i++) if (array[i] === item) return i;
    return -1;
  };

  // Delegates to **ECMAScript 5**'s native `lastIndexOf` if available.
  _.lastIndexOf = function(array, item, from) {
    if (array == null) return -1;
    var hasIndex = from != null;
    if (nativeLastIndexOf && array.lastIndexOf === nativeLastIndexOf) {
      return hasIndex ? array.lastIndexOf(item, from) : array.lastIndexOf(item);
    }
    var i = (hasIndex ? from : array.length);
    while (i--) if (array[i] === item) return i;
    return -1;
  };

  // Generate an integer Array containing an arithmetic progression. A port of
  // the native Python `range()` function. See
  // [the Python documentation](http://docs.python.org/library/functions.html#range).
  _.range = function(start, stop, step) {
    if (arguments.length <= 1) {
      stop = start || 0;
      start = 0;
    }
    step = arguments[2] || 1;

    var len = Math.max(Math.ceil((stop - start) / step), 0);
    var idx = 0;
    var range = new Array(len);

    while(idx < len) {
      range[idx++] = start;
      start += step;
    }

    return range;
  };

  // Function (ahem) Functions
  // ------------------

  // Reusable constructor function for prototype setting.
  var ctor = function(){};

  // Create a function bound to a given object (assigning `this`, and arguments,
  // optionally). Binding with arguments is also known as `curry`.
  // Delegates to **ECMAScript 5**'s native `Function.bind` if available.
  // We check for `func.bind` first, to fail fast when `func` is undefined.
  _.bind = function bind(func, context) {
    var bound, args;
    if (func.bind === nativeBind && nativeBind) return nativeBind.apply(func, slice.call(arguments, 1));
    if (!_.isFunction(func)) throw new TypeError;
    args = slice.call(arguments, 2);
    return bound = function() {
      if (!(this instanceof bound)) return func.apply(context, args.concat(slice.call(arguments)));
      ctor.prototype = func.prototype;
      var self = new ctor;
      var result = func.apply(self, args.concat(slice.call(arguments)));
      if (Object(result) === result) return result;
      return self;
    };
  };

  // Bind all of an object's methods to that object. Useful for ensuring that
  // all callbacks defined on an object belong to it.
  _.bindAll = function(obj) {
    var funcs = slice.call(arguments, 1);
    if (funcs.length == 0) funcs = _.functions(obj);
    each(funcs, function(f) { obj[f] = _.bind(obj[f], obj); });
    return obj;
  };

  // Memoize an expensive function by storing its results.
  _.memoize = function(func, hasher) {
    var memo = {};
    hasher || (hasher = _.identity);
    return function() {
      var key = hasher.apply(this, arguments);
      return _.has(memo, key) ? memo[key] : (memo[key] = func.apply(this, arguments));
    };
  };

  // Delays a function for the given number of milliseconds, and then calls
  // it with the arguments supplied.
  _.delay = function(func, wait) {
    var args = slice.call(arguments, 2);
    return setTimeout(function(){ return func.apply(null, args); }, wait);
  };

  // Defers a function, scheduling it to run after the current call stack has
  // cleared.
  _.defer = function(func) {
    return _.delay.apply(_, [func, 1].concat(slice.call(arguments, 1)));
  };

  // Returns a function, that, when invoked, will only be triggered at most once
  // during a given window of time.
  _.throttle = function(func, wait) {
    var context, args, timeout, throttling, more, result;
    var whenDone = _.debounce(function(){ more = throttling = false; }, wait);
    return function() {
      context = this; args = arguments;
      var later = function() {
        timeout = null;
        if (more) {
          result = func.apply(context, args);
        }
        whenDone();
      };
      if (!timeout) timeout = setTimeout(later, wait);
      if (throttling) {
        more = true;
      } else {
        throttling = true;
        result = func.apply(context, args);
      }
      whenDone();
      return result;
    };
  };

  // Returns a function, that, as long as it continues to be invoked, will not
  // be triggered. The function will be called after it stops being called for
  // N milliseconds. If `immediate` is passed, trigger the function on the
  // leading edge, instead of the trailing.
  _.debounce = function(func, wait, immediate) {
    var timeout, result;
    return function() {
      var context = this, args = arguments;
      var later = function() {
        timeout = null;
        if (!immediate) result = func.apply(context, args);
      };
      var callNow = immediate && !timeout;
      clearTimeout(timeout);
      timeout = setTimeout(later, wait);
      if (callNow) result = func.apply(context, args);
      return result;
    };
  };

  // Returns a function that will be executed at most one time, no matter how
  // often you call it. Useful for lazy initialization.
  _.once = function(func) {
    var ran = false, memo;
    return function() {
      if (ran) return memo;
      ran = true;
      memo = func.apply(this, arguments);
      func = null;
      return memo;
    };
  };

  // Returns the first function passed as an argument to the second,
  // allowing you to adjust arguments, run code before and after, and
  // conditionally execute the original function.
  _.wrap = function(func, wrapper) {
    return function() {
      var args = [func];
      push.apply(args, arguments);
      return wrapper.apply(this, args);
    };
  };

  // Returns a function that is the composition of a list of functions, each
  // consuming the return value of the function that follows.
  _.compose = function() {
    var funcs = arguments;
    return function() {
      var args = arguments;
      for (var i = funcs.length - 1; i >= 0; i--) {
        args = [funcs[i].apply(this, args)];
      }
      return args[0];
    };
  };

  // Returns a function that will only be executed after being called N times.
  _.after = function(times, func) {
    if (times <= 0) return func();
    return function() {
      if (--times < 1) {
        return func.apply(this, arguments);
      }
    };
  };

  // Object Functions
  // ----------------

  // Retrieve the names of an object's properties.
  // Delegates to **ECMAScript 5**'s native `Object.keys`
  _.keys = nativeKeys || function(obj) {
    if (obj !== Object(obj)) throw new TypeError('Invalid object');
    var keys = [];
    for (var key in obj) if (_.has(obj, key)) keys[keys.length] = key;
    return keys;
  };

  // Retrieve the values of an object's properties.
  _.values = function(obj) {
    var values = [];
    for (var key in obj) if (_.has(obj, key)) values.push(obj[key]);
    return values;
  };

  // Convert an object into a list of `[key, value]` pairs.
  _.pairs = function(obj) {
    var pairs = [];
    for (var key in obj) if (_.has(obj, key)) pairs.push([key, obj[key]]);
    return pairs;
  };

  // Invert the keys and values of an object. The values must be serializable.
  _.invert = function(obj) {
    var result = {};
    for (var key in obj) if (_.has(obj, key)) result[obj[key]] = key;
    return result;
  };

  // Return a sorted list of the function names available on the object.
  // Aliased as `methods`
  _.functions = _.methods = function(obj) {
    var names = [];
    for (var key in obj) {
      if (_.isFunction(obj[key])) names.push(key);
    }
    return names.sort();
  };

  // Extend a given object with all the properties in passed-in object(s).
  _.extend = function(obj) {
    each(slice.call(arguments, 1), function(source) {
      for (var prop in source) {
        obj[prop] = source[prop];
      }
    });
    return obj;
  };

  // Return a copy of the object only containing the whitelisted properties.
  _.pick = function(obj) {
    var copy = {};
    var keys = concat.apply(ArrayProto, slice.call(arguments, 1));
    each(keys, function(key) {
      if (key in obj) copy[key] = obj[key];
    });
    return copy;
  };

   // Return a copy of the object without the blacklisted properties.
  _.omit = function(obj) {
    var copy = {};
    var keys = concat.apply(ArrayProto, slice.call(arguments, 1));
    for (var key in obj) {
      if (!_.contains(keys, key)) copy[key] = obj[key];
    }
    return copy;
  };

  // Fill in a given object with default properties.
  _.defaults = function(obj) {
    each(slice.call(arguments, 1), function(source) {
      for (var prop in source) {
        if (obj[prop] == null) obj[prop] = source[prop];
      }
    });
    return obj;
  };

  // Create a (shallow-cloned) duplicate of an object.
  _.clone = function(obj) {
    if (!_.isObject(obj)) return obj;
    return _.isArray(obj) ? obj.slice() : _.extend({}, obj);
  };

  // Invokes interceptor with the obj, and then returns obj.
  // The primary purpose of this method is to "tap into" a method chain, in
  // order to perform operations on intermediate results within the chain.
  _.tap = function(obj, interceptor) {
    interceptor(obj);
    return obj;
  };

  // Internal recursive comparison function for `isEqual`.
  var eq = function(a, b, aStack, bStack) {
    // Identical objects are equal. `0 === -0`, but they aren't identical.
    // See the Harmony `egal` proposal: http://wiki.ecmascript.org/doku.php?id=harmony:egal.
    if (a === b) return a !== 0 || 1 / a == 1 / b;
    // A strict comparison is necessary because `null == undefined`.
    if (a == null || b == null) return a === b;
    // Unwrap any wrapped objects.
    if (a instanceof _) a = a._wrapped;
    if (b instanceof _) b = b._wrapped;
    // Compare `[[Class]]` names.
    var className = toString.call(a);
    if (className != toString.call(b)) return false;
    switch (className) {
      // Strings, numbers, dates, and booleans are compared by value.
      case '[object String]':
        // Primitives and their corresponding object wrappers are equivalent; thus, `"5"` is
        // equivalent to `new String("5")`.
        return a == String(b);
      case '[object Number]':
        // `NaN`s are equivalent, but non-reflexive. An `egal` comparison is performed for
        // other numeric values.
        return a != +a ? b != +b : (a == 0 ? 1 / a == 1 / b : a == +b);
      case '[object Date]':
      case '[object Boolean]':
        // Coerce dates and booleans to numeric primitive values. Dates are compared by their
        // millisecond representations. Note that invalid dates with millisecond representations
        // of `NaN` are not equivalent.
        return +a == +b;
      // RegExps are compared by their source patterns and flags.
      case '[object RegExp]':
        return a.source == b.source &&
               a.global == b.global &&
               a.multiline == b.multiline &&
               a.ignoreCase == b.ignoreCase;
    }
    if (typeof a != 'object' || typeof b != 'object') return false;
    // Assume equality for cyclic structures. The algorithm for detecting cyclic
    // structures is adapted from ES 5.1 section 15.12.3, abstract operation `JO`.
    var length = aStack.length;
    while (length--) {
      // Linear search. Performance is inversely proportional to the number of
      // unique nested structures.
      if (aStack[length] == a) return bStack[length] == b;
    }
    // Add the first object to the stack of traversed objects.
    aStack.push(a);
    bStack.push(b);
    var size = 0, result = true;
    // Recursively compare objects and arrays.
    if (className == '[object Array]') {
      // Compare array lengths to determine if a deep comparison is necessary.
      size = a.length;
      result = size == b.length;
      if (result) {
        // Deep compare the contents, ignoring non-numeric properties.
        while (size--) {
          if (!(result = eq(a[size], b[size], aStack, bStack))) break;
        }
      }
    } else {
      // Objects with different constructors are not equivalent, but `Object`s
      // from different frames are.
      var aCtor = a.constructor, bCtor = b.constructor;
      if (aCtor !== bCtor && !(_.isFunction(aCtor) && (aCtor instanceof aCtor) &&
                               _.isFunction(bCtor) && (bCtor instanceof bCtor))) {
        return false;
      }
      // Deep compare objects.
      for (var key in a) {
        if (_.has(a, key)) {
          // Count the expected number of properties.
          size++;
          // Deep compare each member.
          if (!(result = _.has(b, key) && eq(a[key], b[key], aStack, bStack))) break;
        }
      }
      // Ensure that both objects contain the same number of properties.
      if (result) {
        for (key in b) {
          if (_.has(b, key) && !(size--)) break;
        }
        result = !size;
      }
    }
    // Remove the first object from the stack of traversed objects.
    aStack.pop();
    bStack.pop();
    return result;
  };

  // Perform a deep comparison to check if two objects are equal.
  _.isEqual = function(a, b) {
    return eq(a, b, [], []);
  };

  // Is a given array, string, or object empty?
  // An "empty" object has no enumerable own-properties.
  _.isEmpty = function(obj) {
    if (obj == null) return true;
    if (_.isArray(obj) || _.isString(obj)) return obj.length === 0;
    for (var key in obj) if (_.has(obj, key)) return false;
    return true;
  };

  // Is a given value a DOM element?
  _.isElement = function(obj) {
    return !!(obj && obj.nodeType === 1);
  };

  // Is a given value an array?
  // Delegates to ECMA5's native Array.isArray
  _.isArray = nativeIsArray || function(obj) {
    return toString.call(obj) == '[object Array]';
  };

  // Is a given variable an object?
  _.isObject = function(obj) {
    return obj === Object(obj);
  };

  // Add some isType methods: isArguments, isFunction, isString, isNumber, isDate, isRegExp.
  each(['Arguments', 'Function', 'String', 'Number', 'Date', 'RegExp'], function(name) {
    _['is' + name] = function(obj) {
      return toString.call(obj) == '[object ' + name + ']';
    };
  });

  // Define a fallback version of the method in browsers (ahem, IE), where
  // there isn't any inspectable "Arguments" type.
  if (!_.isArguments(arguments)) {
    _.isArguments = function(obj) {
      return !!(obj && _.has(obj, 'callee'));
    };
  }

  // Optimize `isFunction` if appropriate.
  if (typeof (/./) !== 'function') {
    _.isFunction = function(obj) {
      return typeof obj === 'function';
    };
  }

  // Is a given object a finite number?
  _.isFinite = function(obj) {
    return _.isNumber(obj) && isFinite(obj);
  };

  // Is the given value `NaN`? (NaN is the only number which does not equal itself).
  _.isNaN = function(obj) {
    return _.isNumber(obj) && obj != +obj;
  };

  // Is a given value a boolean?
  _.isBoolean = function(obj) {
    return obj === true || obj === false || toString.call(obj) == '[object Boolean]';
  };

  // Is a given value equal to null?
  _.isNull = function(obj) {
    return obj === null;
  };

  // Is a given variable undefined?
  _.isUndefined = function(obj) {
    return obj === void 0;
  };

  // Shortcut function for checking if an object has a given property directly
  // on itself (in other words, not on a prototype).
  _.has = function(obj, key) {
    return hasOwnProperty.call(obj, key);
  };

  // Utility Functions
  // -----------------

  // Run Underscore.js in *noConflict* mode, returning the `_` variable to its
  // previous owner. Returns a reference to the Underscore object.
  _.noConflict = function() {
    root._ = previousUnderscore;
    return this;
  };

  // Keep the identity function around for default iterators.
  _.identity = function(value) {
    return value;
  };

  // Run a function **n** times.
  _.times = function(n, iterator, context) {
    for (var i = 0; i < n; i++) iterator.call(context, i);
  };

  // Return a random integer between min and max (inclusive).
  _.random = function(min, max) {
    if (max == null) {
      max = min;
      min = 0;
    }
    return min + (0 | Math.random() * (max - min + 1));
  };

  // List of HTML entities for escaping.
  var entityMap = {
    escape: {
      '&': '&amp;',
      '<': '&lt;',
      '>': '&gt;',
      '"': '&quot;',
      "'": '&#x27;',
      '/': '&#x2F;'
    }
  };
  entityMap.unescape = _.invert(entityMap.escape);

  // Regexes containing the keys and values listed immediately above.
  var entityRegexes = {
    escape:   new RegExp('[' + _.keys(entityMap.escape).join('') + ']', 'g'),
    unescape: new RegExp('(' + _.keys(entityMap.unescape).join('|') + ')', 'g')
  };

  // Functions for escaping and unescaping strings to/from HTML interpolation.
  _.each(['escape', 'unescape'], function(method) {
    _[method] = function(string) {
      if (string == null) return '';
      return ('' + string).replace(entityRegexes[method], function(match) {
        return entityMap[method][match];
      });
    };
  });

  // If the value of the named property is a function then invoke it;
  // otherwise, return it.
  _.result = function(object, property) {
    if (object == null) return null;
    var value = object[property];
    return _.isFunction(value) ? value.call(object) : value;
  };

  // Add your own custom functions to the Underscore object.
  _.mixin = function(obj) {
    each(_.functions(obj), function(name){
      var func = _[name] = obj[name];
      _.prototype[name] = function() {
        var args = [this._wrapped];
        push.apply(args, arguments);
        return result.call(this, func.apply(_, args));
      };
    });
  };

  // Generate a unique integer id (unique within the entire client session).
  // Useful for temporary DOM ids.
  var idCounter = 0;
  _.uniqueId = function(prefix) {
    var id = idCounter++;
    return prefix ? prefix + id : id;
  };

  // By default, Underscore uses ERB-style template delimiters, change the
  // following template settings to use alternative delimiters.
  _.templateSettings = {
    evaluate    : /<%([\s\S]+?)%>/g,
    interpolate : /<%=([\s\S]+?)%>/g,
    escape      : /<%-([\s\S]+?)%>/g
  };

  // When customizing `templateSettings`, if you don't want to define an
  // interpolation, evaluation or escaping regex, we need one that is
  // guaranteed not to match.
  var noMatch = /(.)^/;

  // Certain characters need to be escaped so that they can be put into a
  // string literal.
  var escapes = {
    "'":      "'",
    '\\':     '\\',
    '\r':     'r',
    '\n':     'n',
    '\t':     't',
    '\u2028': 'u2028',
    '\u2029': 'u2029'
  };

  var escaper = /\\|'|\r|\n|\t|\u2028|\u2029/g;

  // JavaScript micro-templating, similar to John Resig's implementation.
  // Underscore templating handles arbitrary delimiters, preserves whitespace,
  // and correctly escapes quotes within interpolated code.
  _.template = function(text, data, settings) {
    settings = _.defaults({}, settings, _.templateSettings);

    // Combine delimiters into one regular expression via alternation.
    var matcher = new RegExp([
      (settings.escape || noMatch).source,
      (settings.interpolate || noMatch).source,
      (settings.evaluate || noMatch).source
    ].join('|') + '|$', 'g');

    // Compile the template source, escaping string literals appropriately.
    var index = 0;
    var source = "__p+='";
    text.replace(matcher, function(match, escape, interpolate, evaluate, offset) {
      source += text.slice(index, offset)
        .replace(escaper, function(match) { return '\\' + escapes[match]; });
      source +=
        escape ? "'+\n((__t=(" + escape + "))==null?'':_.escape(__t))+\n'" :
        interpolate ? "'+\n((__t=(" + interpolate + "))==null?'':__t)+\n'" :
        evaluate ? "';\n" + evaluate + "\n__p+='" : '';
      index = offset + match.length;
    });
    source += "';\n";

    // If a variable is not specified, place data values in local scope.
    if (!settings.variable) source = 'with(obj||{}){\n' + source + '}\n';

    source = "var __t,__p='',__j=Array.prototype.join," +
      "print=function(){__p+=__j.call(arguments,'');};\n" +
      source + "return __p;\n";

    try {
      var render = new Function(settings.variable || 'obj', '_', source);
    } catch (e) {
      e.source = source;
      throw e;
    }

    if (data) return render(data, _);
    var template = function(data) {
      return render.call(this, data, _);
    };

    // Provide the compiled function source as a convenience for precompilation.
    template.source = 'function(' + (settings.variable || 'obj') + '){\n' + source + '}';

    return template;
  };

  // Add a "chain" function, which will delegate to the wrapper.
  _.chain = function(obj) {
    return _(obj).chain();
  };

  // OOP
  // ---------------
  // If Underscore is called as a function, it returns a wrapped object that
  // can be used OO-style. This wrapper holds altered versions of all the
  // underscore functions. Wrapped objects may be chained.

  // Helper function to continue chaining intermediate results.
  var result = function(obj) {
    return this._chain ? _(obj).chain() : obj;
  };

  // Add all of the Underscore functions to the wrapper object.
  _.mixin(_);

  // Add all mutator Array functions to the wrapper.
  each(['pop', 'push', 'reverse', 'shift', 'sort', 'splice', 'unshift'], function(name) {
    var method = ArrayProto[name];
    _.prototype[name] = function() {
      var obj = this._wrapped;
      method.apply(obj, arguments);
      if ((name == 'shift' || name == 'splice') && obj.length === 0) delete obj[0];
      return result.call(this, obj);
    };
  });

  // Add all accessor Array functions to the wrapper.
  each(['concat', 'join', 'slice'], function(name) {
    var method = ArrayProto[name];
    _.prototype[name] = function() {
      return result.call(this, method.apply(this._wrapped, arguments));
    };
  });

  _.extend(_.prototype, {

    // Start chaining a wrapped Underscore object.
    chain: function() {
      this._chain = true;
      return this;
    },

    // Extracts the result from a wrapped and chained object.
    value: function() {
      return this._wrapped;
    }

  });

}).call(this);

// #########################
// ###### PATIENT API #######
// #########################


/**
@namespace scoping into the hquery namespace
 */
var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty,
  indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

this.hQuery || (this.hQuery = {});


/**
Converts a a number in UTC Seconds since the epoch to a date.
@param {number} utcSeconds seconds since the epoch in UTC
@returns {Date}
@function
@exports dateFromUtcSeconds as hQuery.dateFromUtcSeconds
 */

hQuery.dateFromUtcSeconds = function(utcSeconds) {
  return new Date(utcSeconds * 1000);
};


/**
@class Scalar - a representation of a unit and value
@exports Scalar as hQuery.Scalar
 */

hQuery.Scalar = (function() {
  function Scalar(json1) {
    this.json = json1;
  }

  Scalar.prototype.unit = function() {
    return this.json['unit'];
  };

  Scalar.prototype.value = function() {
    return this.json['value'];
  };

  return Scalar;

})();


/**
@class PhysicalQuantity - a representation of a physical quantity
@exports PhysicalQuantity as hQuery.PhysicalQuantity
 */

hQuery.PhysicalQuantity = (function() {
  function PhysicalQuantity(json1) {
    this.json = json1;
  }

  PhysicalQuantity.prototype.units = function() {
    return this.json['units'];
  };

  PhysicalQuantity.prototype.scalar = function() {
    return parseFloat(this.json['scalar']);
  };

  return PhysicalQuantity;

})();


/**
@class A code with its corresponding code system
@exports CodedValue as hQuery.CodedValue
 */

hQuery.CodedValue = (function() {

  /**
  @param {String} c value of the code
  @param {String} csn name of the code system that the code belongs to
  @constructs
   */
  function CodedValue(c, csn) {
    this.c = c;
    this.csn = csn;
  }


  /**
  @returns {String} the code
   */

  CodedValue.prototype.code = function() {
    return this.c;
  };


  /**
  @returns {String} the code system name
   */

  CodedValue.prototype.codeSystemName = function() {
    return this.csn;
  };

  CodedValue.normalize = function(val) {
    return String(val).toLowerCase();
  };


  /**
  Returns true if the contained code and codeSystemName match a code in the supplied codeSet.
  @param {Object} codeSet a hash with code system names as keys and an array of codes as values
  @returns {boolean}
   */

  CodedValue.prototype.includedIn = function(codeSet) {
    var c1, c2, code, codeSystemName, codes, i, len;
    for (codeSystemName in codeSet) {
      codes = codeSet[codeSystemName];
      if (this.csn === codeSystemName) {
        for (i = 0, len = codes.length; i < len; i++) {
          code = codes[i];
          c1 = hQuery.CodedValue.normalize(code);
          c2 = hQuery.CodedValue.normalize(this.c);
          if (c1 === c2) {
            return true;
          }
        }
      }
    }
    return false;
  };

  return CodedValue;

})();


/**
Status as defined by value set 2.16.840.1.113883.5.14,
the ActStatus vocabulary maintained by HL7

@class Status
@augments hQuery.CodedEntry
@exports Status as hQuery.Status
 */

hQuery.Status = (function(superClass) {
  var ABORTED, ACTIVE, CANCELLED, COMPLETED, HELD, NEW, NORMAL, NULLIFIED, OBSOLETE, SUSPENDED;

  extend(Status, superClass);

  function Status() {
    return Status.__super__.constructor.apply(this, arguments);
  }

  NORMAL = "normal";

  ABORTED = "aborted";

  ACTIVE = "active";

  CANCELLED = "cancelled";

  COMPLETED = "completed";

  HELD = "held";

  NEW = "new";

  SUSPENDED = "suspended";

  NULLIFIED = "nullified";

  OBSOLETE = "obsolete";

  Status.prototype.isNormal = function() {
    return this.c === NORMAL;
  };

  Status.prototype.isAborted = function() {
    return this.c === ABORTED;
  };

  Status.prototype.isActive = function() {
    return this.c === ACTIVE;
  };

  Status.prototype.isCancelled = function() {
    return this.c === CANCELLED;
  };

  Status.prototype.isCompleted = function() {
    return this.c === COMPLETED;
  };

  Status.prototype.isHeld = function() {
    return this.c === HELD;
  };

  Status.prototype.isNew = function() {
    return this.c === NEW;
  };

  Status.prototype.isSuspended = function() {
    return this.c === SUSPENDED;
  };

  Status.prototype.isNullified = function() {
    return this.c === NULLIFIED;
  };

  Status.prototype.isObsolete = function() {
    return this.c === OBSOLETE;
  };

  return Status;

})(hQuery.CodedValue);


/**
@class an Address for a person or organization
@exports Address as hQuery.Address
 */

hQuery.Address = (function() {
  function Address(json1) {
    this.json = json1;
  }


  /**
  @returns {Array[String]} the street addresses
   */

  Address.prototype.street = function() {
    return this.json['street'];
  };


  /**
  @returns {String} the city
   */

  Address.prototype.city = function() {
    return this.json['city'];
  };


  /**
  @returns {String} the State
   */

  Address.prototype.state = function() {
    return this.json['state'];
  };


  /**
  @returns {String} the postal code
   */

  Address.prototype.postalCode = function() {
    return this.json['zip'];
  };

  return Address;

})();


/**
@class An object that describes a means to contact an entity.  This is used to represent
phone numbers, email addresses,  instant messaging accounts etc.
@exports Telecom as hQuery.Telecom
 */

hQuery.Telecom = (function() {
  function Telecom(json1) {
    this.json = json1;
  }


  /**
  @returns {String} the type of telecom entry, phone, sms, email ....
   */

  Telecom.prototype.type = function() {
    return this.json['type'];
  };


  /**
  @returns {String} the value of the entry -  the actual phone number , email address , ....
   */

  Telecom.prototype.value = function() {
    return this.json['value'];
  };


  /**
  @returns {String} the use of the entry. Is it a home, office, .... type of contact
   */

  Telecom.prototype.use = function() {
    return this.json['use'];
  };


  /**
  @returns {Boolean} is this a preferred form of contact
   */

  Telecom.prototype.preferred = function() {
    return this.json['preferred'];
  };

  return Telecom;

})();


/**
@class an object that describes a person.  includes a persons name, addresses, and contact information
@exports Person as hQuery.Person
 */

hQuery.Person = (function() {
  function Person(json1) {
    this.json = json1;
  }


  /**
   @returns {String} the given name of the person
   */

  Person.prototype.given = function() {
    return this.json['first'];
  };


  /**
   @returns {String} the last/family name of the person
   */

  Person.prototype.last = function() {
    return this.json['last'];
  };


  /**
   @returns {String} the display name of the person
   */

  Person.prototype.name = function() {
    if (this.json['name']) {
      return this.json['name'];
    } else {
      return this.json['first'] + ' ' + this.json['last'];
    }
  };


  /**
   @returns {Array} an array of {@link hQuery.Address} objects associated with the patient
   */

  Person.prototype.addresses = function() {
    var address, i, len, list, ref;
    list = [];
    if (this.json['addresses']) {
      ref = this.json['addresses'];
      for (i = 0, len = ref.length; i < len; i++) {
        address = ref[i];
        list.push(new hQuery.Address(address));
      }
    }
    return list;
  };


  /**
  @returns {Array} an array of {@link hQuery.Telecom} objects associated with the person
   */

  Person.prototype.telecoms = function() {
    var i, len, ref, results, tel;
    ref = this.json['telecoms'];
    results = [];
    for (i = 0, len = ref.length; i < len; i++) {
      tel = ref[i];
      results.push(new hQuery.Telecom(tel));
    }
    return results;
  };

  return Person;

})();


/**
@class an actor is either a person or an organization
@exports Actor as hQuery.Actor
 */

hQuery.Actor = (function() {
  function Actor(json1) {
    this.json = json1;
  }

  Actor.prototype.person = function() {
    if (this.json['person']) {
      return new hQuery.Person(this.json['person']);
    }
  };

  Actor.prototype.organization = function() {
    if (this.json['organization']) {
      return new hQuery.Organization(this.json['organization']);
    }
  };

  return Actor;

})();


/**
@class an Organization
@exports Organization as hQuery.Organization
 */

hQuery.Organization = (function() {
  function Organization(json1) {
    this.json = json1;
  }


  /**
  @returns {String} the id for the organization
   */

  Organization.prototype.organizationId = function() {
    return this.json['organizationId'];
  };


  /**
  @returns {String} the name of the organization
   */

  Organization.prototype.organizationName = function() {
    return this.json['name'];
  };


  /**
  @returns {Array} an array of {@link hQuery.Address} objects associated with the organization
   */

  Organization.prototype.addresses = function() {
    var address, i, len, list, ref;
    list = [];
    if (this.json['addresses']) {
      ref = this.json['addresses'];
      for (i = 0, len = ref.length; i < len; i++) {
        address = ref[i];
        list.push(new hQuery.Address(address));
      }
    }
    return list;
  };


  /**
  @returns {Array} an array of {@link hQuery.Telecom} objects associated with the organization
   */

  Organization.prototype.telecoms = function() {
    var i, len, ref, results, tel;
    ref = this.json['telecoms'];
    results = [];
    for (i = 0, len = ref.length; i < len; i++) {
      tel = ref[i];
      results.push(new hQuery.Telecom(tel));
    }
    return results;
  };

  return Organization;

})();


/**
@class a Facility
@exports Organization as hQuery.Facility
 */

hQuery.Facility = (function(superClass) {
  extend(Facility, superClass);

  function Facility(json1) {
    this.json = json1;
    if (this.json['code'] != null) {
      Facility.__super__.constructor.call(this, this.json['code']['code'], this.json['code']['code_system']);
    }
    if (this.json['start_time']) {
      this._startDate = hQuery.dateFromUtcSeconds(this.json['start_time']);
    }
    if (this.json['end_time']) {
      this._endDate = hQuery.dateFromUtcSeconds(this.json['end_time']);
    }
  }


  /**
  @returns {String} the name of the facility
   */

  Facility.prototype.name = function() {
    return this.json['name'];
  };


  /**
  Date and time at which the coded entry started
  @returns {Date}
   */

  Facility.prototype.startDate = function() {
    return this._startDate;
  };


  /**
  Date and time at which the coded entry ended
  @returns {Date}
   */

  Facility.prototype.endDate = function() {
    return this._endDate;
  };


  /**
  @returns {Array} an array of {@link hQuery.Address} objects associated with the facility
   */

  Facility.prototype.addresses = function() {
    var address, i, len, list, ref;
    list = [];
    if (this.json['addresses']) {
      ref = this.json['addresses'];
      for (i = 0, len = ref.length; i < len; i++) {
        address = ref[i];
        list.push(new hQuery.Address(address));
      }
    }
    return list;
  };


  /**
  @returns {Array} an array of {@link hQuery.Telecom} objects associated with the facility
   */

  Facility.prototype.telecoms = function() {
    var i, len, ref, results, tel;
    ref = this.json['telecoms'];
    results = [];
    for (i = 0, len = ref.length; i < len; i++) {
      tel = ref[i];
      results.push(new hQuery.Telecom(tel));
    }
    return results;
  };

  return Facility;

})(hQuery.CodedValue);


/**
@class represents a DateRange in the form of hi and low date values.
@exports DateRange as hQuery.DateRange
 */

hQuery.DateRange = (function() {
  function DateRange(json1) {
    this.json = json1;
  }

  DateRange.prototype.hi = function() {
    if (this.json['hi']) {
      return hQuery.dateFromUtcSeconds(this.json['hi']);
    }
  };

  DateRange.prototype.low = function() {
    return hQuery.dateFromUtcSeconds(this.json['low']);
  };

  return DateRange;

})();


/**
@class Class used to describe an entity that is providing some form of information.  This does not mean that they are
providing any treatment just that they are providing information.
@exports Informant as hQuery.Informant
 */

hQuery.Informant = (function() {
  function Informant(json1) {
    this.json = json1;
  }


  /**
  an array of hQuery.Person objects as points of contact
  @returns {Array}
   */

  Informant.prototype.contacts = function() {
    var contact, i, len, ref, results;
    ref = this.json['contacts'];
    results = [];
    for (i = 0, len = ref.length; i < len; i++) {
      contact = ref[i];
      results.push(new hQuery.Person(contact));
    }
    return results;
  };


  /**
   @returns {hQuery.Organization} the organization providing the information
   */

  Informant.prototype.organization = function() {
    return new hQuery.Organization(this.json['organization']);
  };

  return Informant;

})();


/**
@class
@exports CodedEntry as hQuery.CodedEntry
 */

hQuery.CodedEntry = (function() {
  function CodedEntry(json1) {
    this.json = json1;
    if (this.json['time']) {
      this._date = hQuery.dateFromUtcSeconds(this.json['time']);
    }
    if (this.json['start_time']) {
      this._startDate = hQuery.dateFromUtcSeconds(this.json['start_time']);
    }
    if (this.json['end_time']) {
      this._endDate = hQuery.dateFromUtcSeconds(this.json['end_time']);
    }
    this._type = hQuery.createCodedValues(this.json['codes']);
    this._statusCode = this.json['status_code'];
    this.id = "" + this.json['_id'];
    this.source_id = this.json['id'];
    this._freeTextType = this.json['description'];
  }


  /**
  Adjust the start and end times of this event to the supplied timestamp
   */

  CodedEntry.prototype.setTimestamp = function(timestamp) {
    return this._date = this._startDate = this._endDate = timestamp;
  };


  /**
  Date and time at which the coded entry took place
  @returns {Date}
   */

  CodedEntry.prototype.date = function() {
    return this._date;
  };


  /**
  Date and time at which the coded entry started
  @returns {Date}
   */

  CodedEntry.prototype.startDate = function() {
    return this._startDate;
  };


  /**
  Date and time at which the coded entry ended
  @returns {Date}
   */

  CodedEntry.prototype.endDate = function() {
    return this._endDate;
  };


  /**
  Tries to find a single point in time for this entry. Will first return date if it is present,
  then fall back to startDate and finally endDate
  @returns {Date}
   */

  CodedEntry.prototype.timeStamp = function() {
    return this._date || this._startDate || this._endDate;
  };


  /**
  Determines whether the entry specifies a time range or not
  @returns {boolean}
   */

  CodedEntry.prototype.isTimeRange = function() {
    return (this._startDate != null) && (this._endDate != null);
  };


  /**
  Determines whether a coded entry contains sufficient information (code and at least
  one time stamp) to be usable
  @returns {boolean}
   */

  CodedEntry.prototype.isUsable = function() {
    return this._type.length > 0 && (this._date || this._startDate || this._endDate);
  };


  /**
  An Array of CodedValues which describe what kind of coded entry took place
  @returns {Array}
   */

  CodedEntry.prototype.type = function() {
    return this._type;
  };


  /**
  A free text description of the type of coded entry
  @returns {String}
   */

  CodedEntry.prototype.freeTextType = function() {
    return this._freeTextType;
  };


  /**
  Status for this coded entry
  @returns {String}
   */

  CodedEntry.prototype.status = function() {
    if (this._statusCode != null) {
      if (this._statusCode['HL7 ActStatus'] != null) {
        return this._statusCode['HL7 ActStatus'][0];
      } else if (this._statusCode['SNOMED-CT'] != null) {
        switch (this._statusCode['SNOMED-CT'][0]) {
          case '55561003':
            return 'active';
          case '73425007':
            return 'inactive';
          case '413322009':
            return 'resolved';
        }
      }
    }
  };


  /**
  Status for this coded entry
  @returns {Hash} keys are code systems, values are arrays of codes
   */

  CodedEntry.prototype.statusCode = function() {
    return this._statusCode;
  };


  /**
  Returns true if any of this entry codes match a code in the supplied codeSet.
  @param {Object} codeSet a hash with code system names as keys and an array of codes as values
  @returns {boolean}
   */

  CodedEntry.prototype.includesCodeFrom = function(codeSet) {
    var codedValue, i, len, ref;
    ref = this._type;
    for (i = 0, len = ref.length; i < len; i++) {
      codedValue = ref[i];
      if (codedValue.includedIn(codeSet)) {
        return true;
      }
    }
    return false;
  };


  /**
  @returns {Boolean} whether the entry was negated
   */

  CodedEntry.prototype.negationInd = function() {
    return this.json['negationInd'] || false;
  };


  /**
  Returns the values of the result. This will return an array that contains
  PhysicalQuantity or CodedValue objects depending on the result type.
  @returns {Array} containing either PhysicalQuantity and/or CodedValues
   */

  CodedEntry.prototype.values = function() {
    var i, len, ref, value, values;
    values = [];
    if (this.json['values']) {
      ref = this.json['values'];
      for (i = 0, len = ref.length; i < len; i++) {
        value = ref[i];
        if (value['scalar'] != null) {
          values.push(new hQuery.PhysicalQuantity(value));
        } else {
          values = values.concat(hQuery.createCodedValues(value.codes));
        }
      }
    }
    return values;
  };


  /**
  Indicates the reason an entry was negated.
  @returns {hQuery.CodedValue}   Used to indicate reason an immunization was not administered.
   */

  CodedEntry.prototype.negationReason = function() {
    return hQuery.createCodedValue(this.json['negationReason']);
  };


  /**
  Explains the reason for an entry.
  @returns {hQuery.CodedValue}   Used to explain the rationale for a given entry.
   */

  CodedEntry.prototype.reason = function() {
    return hQuery.createCodedValue(this.json['reason']);
  };


  /**
  @returns {CodedEntryList}
   */

  CodedEntry.prototype.providerPreference = function() {
    return new hQuery.CodedEntryList(this.json['providerPreference']);
  };


  /**
  @returns {CodedEntryList}
   */

  CodedEntry.prototype.patientPreference = function() {
    return new hQuery.CodedEntryList(this.json['patientPreference']);
  };


  /**
  The health record field is the location within an electronic record where the data should be found
  @returns {CodedValue}
   */

  CodedEntry.prototype.healthRecordField = function() {
    return hQuery.createCodedValue(this.json['health_record_field']);
  };

  return CodedEntry;

})();


/**
@class Represents a list of hQuery.CodedEntry instances. Offers utility methods for matching
entries based on codes and date ranges
@exports CodedEntryList as hQuery.CodedEntryList
 */

hQuery.CodedEntryList = (function(superClass) {
  extend(CodedEntryList, superClass);

  function CodedEntryList() {
    this.push.apply(this, arguments);
  }


  /**
  Push the supplied entry onto this list if it is usable
  @param {CodedEntry} a coded entry that should be added to the list if it is usable
   */

  CodedEntryList.prototype.pushIfUsable = function(entry) {
    if (entry.isUsable()) {
      return this.push(entry);
    }
  };


  /**
  Return the number of entries that match the
  supplied code set where those entries occur between the supplied time bounds
  @param {Object} codeSet a hash with code system names as keys and an array of codes as values
  @param {Date} start the start of the period during which the entry must occur, a null value will match all times
  @param {Date} end the end of the period during which the entry must occur, a null value will match all times
  @param {boolean} includeNegated whether the returned list of entries should include those that have been negated
  @return {CodedEntryList} the matching entries
   */

  CodedEntryList.prototype.match = function(codeSet, start, end, includeNegated) {
    var afterStart, beforeEnd, cloned, entry, i, len, matchesCode, ref;
    if (includeNegated == null) {
      includeNegated = false;
    }
    cloned = new hQuery.CodedEntryList();
    ref = this;
    for (i = 0, len = ref.length; i < len; i++) {
      entry = ref[i];
      afterStart = !start || entry.timeStamp() >= start;
      beforeEnd = !end || entry.timeStamp() <= end;
      matchesCode = codeSet === null || entry.includesCodeFrom(codeSet);
      if (afterStart && beforeEnd && matchesCode && (includeNegated || !entry.negationInd())) {
        cloned.push(entry);
      }
    }
    return cloned;
  };


  /**
  Return a new list of entries that is the result of concatenating the passed in entries with this list
  @return {CodedEntryList} the set of concatenated entries
   */

  CodedEntryList.prototype.concat = function(otherEntries) {
    var cloned, entry, i, j, len, len1, ref;
    cloned = new hQuery.CodedEntryList();
    ref = this;
    for (i = 0, len = ref.length; i < len; i++) {
      entry = ref[i];
      cloned.push(entry);
    }
    for (j = 0, len1 = otherEntries.length; j < len1; j++) {
      entry = otherEntries[j];
      cloned.push(entry);
    }
    return cloned;
  };


  /**
  Match entries with the specified statuses
  @return {CodedEntryList} the matching entries
   */

  CodedEntryList.prototype.withStatuses = function(statuses, includeUndefined) {
    var cloned, entry, i, len, ref, ref1;
    if (includeUndefined == null) {
      includeUndefined = true;
    }
    if (includeUndefined) {
      statuses = statuses.concat([void 0, null]);
    }
    cloned = new hQuery.CodedEntryList();
    ref = this;
    for (i = 0, len = ref.length; i < len; i++) {
      entry = ref[i];
      if (ref1 = entry.status(), indexOf.call(statuses, ref1) >= 0) {
        cloned.push(entry);
      }
    }
    return cloned;
  };


  /**
  Filter entries based on negation
  @param {Object} codeSet a hash with code system names as keys and an array of codes as values
  @return {CodedEntryList} negated entries
   */

  CodedEntryList.prototype.withNegation = function(codeSet) {
    var cloned, entry, i, len, ref;
    cloned = new hQuery.CodedEntryList();
    ref = this;
    for (i = 0, len = ref.length; i < len; i++) {
      entry = ref[i];
      if (entry.negationInd() && (!codeSet || (entry.negationReason() && entry.negationReason().includedIn(codeSet)))) {
        cloned.push(entry);
      }
    }
    return cloned;
  };


  /**
  Filter entries based on negation
  @return {CodedEntryList} non-negated entries
   */

  CodedEntryList.prototype.withoutNegation = function() {
    var cloned, entry, i, len, ref;
    cloned = new hQuery.CodedEntryList();
    ref = this;
    for (i = 0, len = ref.length; i < len; i++) {
      entry = ref[i];
      if (!entry.negationInd()) {
        cloned.push(entry);
      }
    }
    return cloned;
  };

  return CodedEntryList;

})(Array);


/**
@private
@function
 */

hQuery.createCodedValues = function(jsonCodes) {
  var code, codeSystem, codedValues, codes, i, len;
  codedValues = [];
  for (codeSystem in jsonCodes) {
    codes = jsonCodes[codeSystem];
    for (i = 0, len = codes.length; i < len; i++) {
      code = codes[i];
      codedValues.push(new hQuery.CodedValue(code, codeSystem));
    }
  }
  return codedValues;
};

hQuery.createCodedValue = function(json) {
  if (json != null) {
    return new hQuery.CodedValue(json['code'], json['code_system']);
  }
};

/**
@namespace scoping into the hquery namespace
 */
var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

this.hQuery || (this.hQuery = {});


/**
@class MedicationInformation
@exports MedicationInformation as hQuery.MedicationInformation
 */

hQuery.MedicationInformation = (function() {
  function MedicationInformation(json) {
    this.json = json;
  }


  /**
  An array of hQuery.CodedValue describing the medication
  @returns {Array}
   */

  MedicationInformation.prototype.codedProduct = function() {
    return hQuery.createCodedValues(this.json['codes']);
  };

  MedicationInformation.prototype.freeTextProductName = function() {
    return this.json['description'];
  };

  MedicationInformation.prototype.codedBrandName = function() {
    return this.json['codedBrandName'];
  };

  MedicationInformation.prototype.freeTextBrandName = function() {
    return this.json['brandName'];
  };

  MedicationInformation.prototype.drugManufacturer = function() {
    if (this.json['drugManufacturer']) {
      return new hQuery.Organization(this.json['drugManufacturer']);
    }
  };

  return MedicationInformation;

})();


/**
@class AdministrationTiming - the
@exports AdministrationTiming as hQuery.AdministrationTiming
 */

hQuery.AdministrationTiming = (function() {
  function AdministrationTiming(json) {
    this.json = json;
  }


  /**
  Provides the period of medication administration as a Scalar. An example
  Scalar that would be returned would be with value = 8 and units = hours. This would
  mean that the medication should be taken every 8 hours.
  @returns {hQuery.Scalar}
   */

  AdministrationTiming.prototype.period = function() {
    if (this.json['period']) {
      return new hQuery.Scalar(this.json['period']);
    }
  };


  /**
  Indicates whether it is the interval (time between dosing), or frequency
  (number of doses in a time period) that is important. If instititutionSpecified is not
  present or is set to false, then the time between dosing is important (every 8 hours).
  If true, then the frequency of administration is important (e.g., 3 times per day).
  @returns {Boolean}
   */

  AdministrationTiming.prototype.institutionSpecified = function() {
    return this.json['institutionSpecified'];
  };

  return AdministrationTiming;

})();


/**
@class DoseRestriction -  restrictions on the medications dose, represented by a upper and lower dose
@exports DoseRestriction as hQuery.DoseRestriction
 */

hQuery.DoseRestriction = (function() {
  function DoseRestriction(json) {
    this.json = json;
  }

  DoseRestriction.prototype.numerator = function() {
    if (this.json['numerator']) {
      return new hQuery.Scalar(this.json['numerator']);
    }
  };

  DoseRestriction.prototype.denominator = function() {
    if (this.json['denominator']) {
      return new hQuery.Scalar(this.json['denominator']);
    }
  };

  return DoseRestriction;

})();


/**
@class Fulfillment - information about when and who fulfilled an order for the medication
@exports Fulfillment as hQuery.Fullfilement
 */

hQuery.Fulfillment = (function() {
  function Fulfillment(json) {
    this.json = json;
  }

  Fulfillment.prototype.dispenseDate = function() {
    return hQuery.dateFromUtcSeconds(this.json['dispenseDate']);
  };

  Fulfillment.prototype.dispensingPharmacyLocation = function() {
    if (this.json['dispensingPharmacyLocation']) {
      return new hQuery.Address(this.json['dispensingPharmacyLocation']);
    }
  };

  Fulfillment.prototype.quantityDispensed = function() {
    if (this.json['quantityDispensed']) {
      return new hQuery.Scalar(this.json['quantityDispensed']);
    }
  };

  Fulfillment.prototype.prescriptionNumber = function() {
    return this.json['prescriptionNumber'];
  };

  Fulfillment.prototype.fillNumber = function() {
    return this.json['fillNumber'];
  };

  Fulfillment.prototype.fillStatus = function() {
    if (this.json['fillStatus']) {
      return new hQuery.Status(this.json['fillStatus']);
    }
  };

  return Fulfillment;

})();


/**
@class OrderInformation - information abour an order for a medication
@exports OrderInformation as hQuery.OrderInformation
 */

hQuery.OrderInformation = (function() {
  function OrderInformation(json) {
    this.json = json;
  }

  OrderInformation.prototype.orderNumber = function() {
    return this.json['orderNumber'];
  };

  OrderInformation.prototype.fills = function() {
    return this.json['fills'];
  };

  OrderInformation.prototype.quantityOrdered = function() {
    if (this.json['quantityOrdered']) {
      return new hQuery.Scalar(this.json['quantityOrdered']);
    }
  };

  OrderInformation.prototype.orderExpirationDateTime = function() {
    return hQuery.dateFromUtcSeconds(this.json['orderExpirationDateTime']);
  };

  OrderInformation.prototype.orderDateTime = function() {
    return hQuery.dateFromUtcSeconds(this.json['orderDateTime']);
  };

  return OrderInformation;

})();


/**
TypeOfMedication as defined by value set 2.16.840.1.113883.3.88.12.3221.8.19
which pulls two values from SNOMED to describe whether a medication is
prescription or over the counter

@class TypeOfMedication - describes whether a medication is prescription or
       over the counter
@augments hQuery.CodedEntry
@exports TypeOfMedication as hQuery.TypeOfMedication
 */

hQuery.TypeOfMedication = (function(superClass) {
  var OTC, PRESECRIPTION;

  extend(TypeOfMedication, superClass);

  function TypeOfMedication() {
    return TypeOfMedication.__super__.constructor.apply(this, arguments);
  }

  PRESECRIPTION = "73639000";

  OTC = "329505003";


  /**
  @returns {Boolean}
   */

  TypeOfMedication.prototype.isPrescription = function() {
    return this.c === PRESECRIPTION;
  };


  /**
  @returns {Boolean}
   */

  TypeOfMedication.prototype.isOverTheCounter = function() {
    return this.c === OTC;
  };

  return TypeOfMedication;

})(hQuery.CodedValue);


/**
StatusOfMedication as defined by value set 2.16.840.1.113883.1.11.20.7
The terms come from SNOMED and are managed by HL7

@class StatusOfMedication - describes the status of the medication
@augments hQuery.CodedEntry
@exports StatusOfMedication as hQuery.StatusOfMedication
 */

hQuery.StatusOfMedication = (function(superClass) {
  var ACTIVE, NO_LONGER_ACTIVE, ON_HOLD, PRIOR_HISTORY;

  extend(StatusOfMedication, superClass);

  function StatusOfMedication() {
    return StatusOfMedication.__super__.constructor.apply(this, arguments);
  }

  ON_HOLD = "392521001";

  NO_LONGER_ACTIVE = "421139008";

  ACTIVE = "55561003";

  PRIOR_HISTORY = "73425007";


  /**
  @returns {Boolean}
   */

  StatusOfMedication.prototype.isOnHold = function() {
    return this.c === ON_HOLD;
  };


  /**
  @returns {Boolean}
   */

  StatusOfMedication.prototype.isNoLongerActive = function() {
    return this.c === NO_LONGER_ACTIVE;
  };


  /**
  @returns {Boolean}
   */

  StatusOfMedication.prototype.isActive = function() {
    return this.c === ACTIVE;
  };


  /**
  @returns {Boolean}
   */

  StatusOfMedication.prototype.isPriorHistory = function() {
    return this.c === PRIOR_HISTORY;
  };

  return StatusOfMedication;

})(hQuery.CodedValue);


/**
@class represents a medication entry for a patient.
@augments hQuery.CodedEntry
@exports Medication as hQuery.Medication
 */

hQuery.Medication = (function(superClass) {
  extend(Medication, superClass);

  function Medication(json) {
    this.json = json;
    Medication.__super__.constructor.call(this, this.json);
  }


  /**
  @returns {String}
   */

  Medication.prototype.freeTextSig = function() {
    return this.json['freeTextSig'];
  };


  /**
  The actual or intended start of a medication. Slight deviation from greenCDA for C32 since
  it combines this with medication stop
  @returns {Date}
   */

  Medication.prototype.indicateMedicationStart = function() {
    return hQuery.dateFromUtcSeconds(this.json['start_time']);
  };


  /**
  The actual or intended stop of a medication. Slight deviation from greenCDA for C32 since
  it combines this with medication start
  @returns {Date}
   */

  Medication.prototype.indicateMedicationStop = function() {
    return hQuery.dateFromUtcSeconds(this.json['end_time']);
  };


  /**
  @returns {Date}
   */

  Medication.prototype.activeDateTime = function() {
    if (this.json['active_datetime']) {
      return hQuery.dateFromUtcSeconds(this.json['active_datetime']);
    }
  };


  /**
  @returns {Date}
   */

  Medication.prototype.signedDateTime = function() {
    if (this.json['signed_datetime']) {
      return hQuery.dateFromUtcSeconds(this.json['signed_datetime']);
    }
  };

  Medication.prototype.administrationTiming = function() {
    if (this.json['administrationTiming']) {
      return new hQuery.AdministrationTiming(this.json['administrationTiming']);
    }
  };


  /**
  This is used for Medicaton, Order. It is the total number of times a dose of a particular
  medication can be administered. This, coupled with the administrationTiming will
  give the cumulative medication duration.
  E.g.
    allowedAdministrations = 90 doses
    administrationTiming = 1 dose / 12 hours
    cumulativeMedicationDuration = allowedAdministrations / administrationTiming * (time conversion)
    cumulativeMedicationDuration = (90 doses) * (12 hours)/(1 dose) * (1 day)/(24 hours) = 45 days
  Medication, Order can't use fulfillmentHistory because the fulfillment of the 
  medication has not yet happened.
  This corresponds to 'repeatNumber' in the QRDA representation
  @returns {Integer}
   */

  Medication.prototype.allowedAdministrations = function() {
    return this.json['allowedAdministrations'];
  };


  /**
  @returns {CodedValue}  Contains routeCode or adminstrationUnitCode information.
    Route code shall have a a value drawn from FDA route of administration,
    and indicates how the medication is received by the patient.
    See http://www.fda.gov/Drugs/DevelopmentApprovalProcess/UCM070829
    The administration unit code shall have a value drawn from the FDA
    dosage form, source NCI thesaurus and represents the physical form of the
    product as presented to the patient.
    See http://www.fda.gov/Drugs/InformationOnDrugs/ucm142454.htm
   */

  Medication.prototype.route = function() {
    return hQuery.createCodedValue(this.json['route']);
  };


  /**
  @returns {Hash} with two keys: units and scalar
   */

  Medication.prototype.dose = function() {
    if (this.json.dose) {
      return {
        units: this.json.dose.units || this.json.dose.unit,
        scalar: this.json.dose.scalar || this.json.dose.value
      };
    }
  };


  /**
  @returns {CodedValue}
   */

  Medication.prototype.site = function() {
    if (this.json['site']) {
      return hQuery.createCodedValue(this.json['site']);
    }
  };


  /**
  @returns {CodedValue}
   */

  Medication.prototype.anatomicalApproach = function() {
    if (this.json['anatomicalApproach']) {
      return hQuery.createCodedValue(this.json['anatomicalApproach']);
    } else {
      return this.site();
    }
  };


  /**
  @returns {hQuery.DoseRestriction}
   */

  Medication.prototype.doseRestriction = function() {
    if (this.json['doseRestriction']) {
      return new hQuery.DoseRestriction(this.json['doseRestriction']);
    }
  };


  /**
  @returns {String}
   */

  Medication.prototype.doseIndicator = function() {
    return this.json['doseIndicator'];
  };


  /**
  @returns {String}
   */

  Medication.prototype.fulfillmentInstructions = function() {
    return this.json['fulfillmentInstructions'];
  };


  /**
  @returns {CodedValue}
   */

  Medication.prototype.indication = function() {
    return hQuery.createCodedValue(this.json['indication']);
  };


  /**
  @returns {CodedValue}
   */

  Medication.prototype.productForm = function() {
    return hQuery.createCodedValue(this.json['productForm']);
  };


  /**
  @returns {CodedValue}
   */

  Medication.prototype.vehicle = function() {
    return hQuery.createCodedValue(this.json['vehicle']);
  };


  /**
  @returns {CodedValue}
   */

  Medication.prototype.reaction = function() {
    return hQuery.createCodedValue(this.json['reaction']);
  };


  /**
  @returns {CodedValue}
   */

  Medication.prototype.deliveryMethod = function() {
    return hQuery.createCodedValue(this.json['deliveryMethod']);
  };


  /**
  @returns {CodedValue}
   */

  Medication.prototype.method = function() {
    return hQuery.createCodedValue(this.json['method']);
  };


  /**
  @returns {hQuery.MedicationInformation}
   */

  Medication.prototype.medicationInformation = function() {
    return new hQuery.MedicationInformation(this.json);
  };


  /**
  @returns {hQuery.TypeOfMedication} Indicates whether this is an over the counter or prescription medication
   */

  Medication.prototype.typeOfMedication = function() {
    var ref, ref1;
    return new hQuery.TypeOfMedication((ref = this.json['typeOfMedication']) != null ? ref['code'] : void 0, (ref1 = this.json['typeOfMedication']) != null ? ref1['code_system'] : void 0);
  };


  /**
  Values conform to value set 2.16.840.1.113883.1.11.20.7 - Medication Status
  Values may be: On Hold, No Longer Active, Active, Prior History
  @returns {hQuery.StatusOfMedication}   Used to indicate the status of the medication.
   */

  Medication.prototype.statusOfMedication = function() {
    var ref, ref1;
    return new hQuery.StatusOfMedication((ref = this.json['statusOfMedication']) != null ? ref['code'] : void 0, (ref1 = this.json['statusOfMedication']) != null ? ref1['code_system'] : void 0);
  };


  /**
  @returns {String} free text instructions to the patient
   */

  Medication.prototype.patientInstructions = function() {
    return this.json['patientInstructions'];
  };


  /**
  The duration over which this medication has been active. For example, 5 days.
  @returns {Hash} with two keys: unit and scalar
   */

  Medication.prototype.cumulativeMedicationDuration = function() {
    return this.json['cumulativeMedicationDuration'];
  };

  Medication.prototype.refills = function() {
    return this.json['refills'];
  };


  /**
  @returns {Array} an array of {@link FulFillment} objects
   */

  Medication.prototype.fulfillmentHistory = function() {
    var i, len, order, ref, results;
    ref = this.json['fulfillmentHistory'];
    results = [];
    for (i = 0, len = ref.length; i < len; i++) {
      order = ref[i];
      results.push(new hQuery.Fulfillment(order));
    }
    return results;
  };


  /**
  @returns {Array} an array of {@link OrderInformation} objects
   */

  Medication.prototype.orderInformation = function() {
    var i, len, order, ref, results;
    ref = this.json['orderInformation'];
    results = [];
    for (i = 0, len = ref.length; i < len; i++) {
      order = ref[i];
      results.push(new hQuery.OrderInformation(order));
    }
    return results;
  };

  return Medication;

})(hQuery.CodedEntry);

/**
@namespace scoping into the hquery namespace
 */
var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

this.hQuery || (this.hQuery = {});


/**
@class CauseOfDeath
@exports CauseOfDeath as hQuery.CauseOfDeath
 */

hQuery.CauseOfDeath = (function() {
  function CauseOfDeath(json) {
    this.json = json;
  }


  /**
  @returns {hQuery.Date}
   */

  CauseOfDeath.prototype.timeOfDeath = function() {
    return new hQuery.dateFromUtcSeconds(this.json['timeOfDeath']);
  };


  /**
  @returns {int}
   */

  CauseOfDeath.prototype.ageAtDeath = function() {
    return this.json['ageAtDeath'];
  };

  return CauseOfDeath;

})();


/**
@class hQuery.Condition

This section is used to describe a patients problems/conditions. The types of conditions
described have been constrained to the SNOMED CT Problem Type code set. An unbounded
number of treating providers for the particular condition can be supplied.
@exports Condition as hQuery.Condition
@augments hQuery.CodedEntry
 */

hQuery.Condition = (function(superClass) {
  extend(Condition, superClass);

  function Condition(json) {
    this.json = json;
    Condition.__super__.constructor.call(this, this.json);
  }


  /**
   @returns {Array, hQuery.Provider} an array of providers for the condition
   */

  Condition.prototype.providers = function() {
    var i, len, provider, ref, results;
    ref = this.json['treatingProviders'];
    results = [];
    for (i = 0, len = ref.length; i < len; i++) {
      provider = ref[i];
      results.push(new Provider(provider));
    }
    return results;
  };


  /**
  Diagnosis Priority
  @returns {int}
   */

  Condition.prototype.diagnosisPriority = function() {
    return this.json['priority'];
  };


  /**
  Ordinality
  @returns {CodedValue}
   */

  Condition.prototype.ordinality = function() {
    return hQuery.createCodedValue(this.json['ordinality']);
  };


  /**
  age at onset
  @returns {int}
   */

  Condition.prototype.ageAtOnset = function() {
    return this.json['ageAtOnset'];
  };


  /**
  cause of death
  @returns {hQuery.CauseOfDeath}
   */

  Condition.prototype.causeOfDeath = function() {
    if (this.json['causeOfDeath']) {
      return new hQuery.CauseOfDeath(this.json['causeOfDeath']);
    }
  };


  /**
  problem status
  @returns {hQuery.CodedValue}
   */

  Condition.prototype.problemStatus = function() {
    return hQuery.createCodedValue(this.json['problemStatus']);
  };


  /**
  comment
  @returns {String}
   */

  Condition.prototype.comment = function() {
    return this.json['comment'];
  };


  /**
  This is a description of the level of the severity of the condition.
  @returns {CodedValue}
   */

  Condition.prototype.severity = function() {
    return hQuery.createCodedValue(this.json['severity']);
  };


  /**
  @returns {CodedValue}
   */

  Condition.prototype.reaction = function() {
    return new hQuery.createCodedValue(this.json['reaction']);
  };


  /**
  @returns {CodedValue}
   */

  Condition.prototype.laterality = function() {
    return hQuery.createCodedValue(this.json['laterality']);
  };


  /**
  @returns {CodedValue}
   */

  Condition.prototype.anatomicalLocation = function() {
    return hQuery.createCodedValue(this.json['anatomical_location']);
  };

  return Condition;

})(hQuery.CodedEntry);

/**
@namespace scoping into the hquery namespace
 */
var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

this.hQuery || (this.hQuery = {});


/**
An Encounter is an interaction, regardless of the setting, between a patient and a
practitioner who is vested with primary responsibility for diagnosing, evaluating,
or treating the patients condition. It may include visits, appointments, as well
as non face-to-face interactions. It is also a contact between a patient and a
practitioner who has primary responsibility for assessing and treating the
patient at a given contact, exercising independent judgment.
@class An Encounter is an interaction, regardless of the setting, between a patient and a
practitioner
@augments hQuery.CodedEntry
@exports Encounter as hQuery.Encounter
 */

hQuery.Encounter = (function(superClass) {
  extend(Encounter, superClass);

  function Encounter(json) {
    this.json = json;
    Encounter.__super__.constructor.call(this, this.json);
    if (this.json['admitTime']) {
      this._admitTime = hQuery.dateFromUtcSeconds(this.json['admitTime']);
    }
    if (this.json['dischargeTime']) {
      this._dischargeTime = hQuery.dateFromUtcSeconds(this.json['dischargeTime']);
    }
    if (this.json['facility']) {
      this._facility = new hQuery.Facility(this.json['facility']);
    }
  }


  /**
  @returns {String}
   */

  Encounter.prototype.dischargeDisposition = function() {
    return this.json['dischargeDisposition'];
  };


  /**
  A code indicating the priority of the admission (e.g., Emergency, Urgent, Elective, et cetera) from
  National Uniform Billing Committee (NUBC)
  @returns {CodedValue}
   */

  Encounter.prototype.admitType = function() {
    return hQuery.createCodedValue(this.json['admitType']);
  };


  /**
  Date and time at which the patient was admitted for the encounter
  @returns {Date}
   */

  Encounter.prototype.admitTime = function() {
    return this._admitTime;
  };


  /**
  Date and time at which the patient was discharged for the encounter
  @returns {Date}
   */

  Encounter.prototype.dischargeTime = function() {
    return this._dischargeTime;
  };


  /**
  @returns {hQuery.Actor}
   */

  Encounter.prototype.performer = function() {
    if (this.json['performer']) {
      return new hQuery.Actor(this.json['performer']);
    }
  };


  /**
  @returns {hQuery.Organization}
   */

  Encounter.prototype.facility = function() {
    return this._facility;
  };

  Encounter.prototype.facilityArrival = function() {
    var ref;
    return (ref = this._facility) != null ? ref.startDate() : void 0;
  };

  Encounter.prototype.facilityDeparture = function() {
    var ref;
    return (ref = this._facility) != null ? ref.endDate() : void 0;
  };


  /**
  @returns {hQuery.CodedEntry}
   */

  Encounter.prototype.reasonForVisit = function() {
    if (this.json['reason']) {
      return new hQuery.CodedEntry(this.json['reason']);
    }
  };


  /**
  @returns {Integer}
   */

  Encounter.prototype.lengthOfStay = function() {
    if (!((this.startDate() != null) && (this.endDate() != null))) {
      return 0;
    }
    return Math.floor((this.endDate() - this.startDate()) / (1000 * 60 * 60 * 24));
  };


  /**
  @returns {CodedValue}
   */

  Encounter.prototype.method = function() {
    return new hQuery.createCodedValue(this.json['method']);
  };


  /**
  @returns {CodedValue}
   */

  Encounter.prototype.reaction = function() {
    return new hQuery.createCodedValue(this.json['reaction']);
  };


  /**
  @returns {CodedValue}
   */

  Encounter.prototype.transferTo = function() {
    return hQuery.createCodedValue(this.json['transferTo']);
  };


  /**
  @returns {CodedValue}
   */

  Encounter.prototype.transferFrom = function() {
    return hQuery.createCodedValue(this.json['transferFrom']);
  };


  /**
  @returns {CodedValue|CodedValue[]}
   */

  Encounter.prototype.diagnosis = function() {
    var ref;
    if ((ref = this.json['diagnosis']) != null ? ref['codes'] : void 0) {
      return hQuery.createCodedValues(this.json['diagnosis']['codes']);
    } else {
      return hQuery.createCodedValue(this.json['diagnosis']);
    }
  };


  /**
  @returns {CodedValue|CodedValue[]}
   */

  Encounter.prototype.principalDiagnosis = function() {
    var ref;
    if ((ref = this.json['principalDiagnosis']) != null ? ref['codes'] : void 0) {
      return hQuery.createCodedValues(this.json['principalDiagnosis']['codes']);
    } else {
      return hQuery.createCodedValue(this.json['principalDiagnosis']);
    }
  };

  return Encounter;

})(hQuery.CodedEntry);

/**
@namespace scoping into the hquery namespace
 */
var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

this.hQuery || (this.hQuery = {});


/**
This represents all interventional, surgical, diagnostic, or therapeutic procedures or
treatments pertinent to the patient.
@class
@augments hQuery.CodedEntry
@exports Procedure as hQuery.Procedure
 */

hQuery.Procedure = (function(superClass) {
  extend(Procedure, superClass);

  function Procedure(json) {
    this.json = json;
    Procedure.__super__.constructor.call(this, this.json);
    if (this.json['facility']) {
      this._facility = new hQuery.Facility(this.json['facility']);
    }
  }

  Procedure.prototype.facility = function() {
    return this._facility;
  };

  Procedure.prototype.facilityArrival = function() {
    var ref;
    return (ref = this._facility) != null ? ref.startDate() : void 0;
  };

  Procedure.prototype.facilityDeparture = function() {
    var ref;
    return (ref = this._facility) != null ? ref.endDate() : void 0;
  };


  /**
  @returns {hQuery.Actor} The provider that performed the procedure
   */

  Procedure.prototype.performer = function() {
    if (this.json['performer']) {
      return new hQuery.Actor(this.json['performer']);
    }
  };


  /**
  @returns {hQuery.CodedValue} A SNOMED code indicating the body site on which the
  procedure was performed
   */

  Procedure.prototype.site = function() {
    var ref, ref1;
    return new hQuery.CodedValue((ref = this.json['site']) != null ? ref['code'] : void 0, (ref1 = this.json['site']) != null ? ref1['code_system'] : void 0);
  };


  /**
  @returns {hQuery.CodedValue} A SNOMED code indicating where the procedure was performed.
   */

  Procedure.prototype.source = function() {
    return hQuery.createCodedValue(this.json['source']);
  };


  /**
  @returns {Date} The actual or intended start of an incision.
   */

  Procedure.prototype.incisionTime = function() {
    if (this.json['incisionTime']) {
      return hQuery.dateFromUtcSeconds(this.json['incisionTime']);
    }
  };


  /**
  Ordinality
  @returns {CodedValue}
   */

  Procedure.prototype.ordinality = function() {
    return hQuery.createCodedValue(this.json['ordinality']);
  };


  /**
  @returns {hQuery.CodedValue} A code indicating the approach body site on which the
  procedure was performed
   */

  Procedure.prototype.anatomicalApproach = function() {
    var ref, ref1;
    return new hQuery.CodedValue((ref = this.json['anatomicalApproach']) != null ? ref['code'] : void 0, (ref1 = this.json['anatomicalApproach']) != null ? ref1['code_system'] : void 0);
  };


  /**
  @returns {hQuery.CodedValue} A  code indicating the body site on which the
  procedure was performed
   */

  Procedure.prototype.anatomicalLocation = function() {
    var at;
    at = this.json['anatomicalLocation'];
    if (at != null) {
      return new hQuery.CodedValue(at['code'], at['code_system']);
    } else {
      return this.site();
    }
  };


  /**
  @returns {CodedValue}
   */

  Procedure.prototype.method = function() {
    return new hQuery.createCodedValue(this.json['method']);
  };


  /**
  @returns {CodedValue}
   */

  Procedure.prototype.reaction = function() {
    return new hQuery.createCodedValue(this.json['reaction']);
  };


  /**
  @returns {CodedValue}
   */

  Procedure.prototype.radiationDose = function() {
    return new hQuery.createCodedValue(this.json['radiationDose']);
  };


  /**
  @returns {CodedValue}
   */

  Procedure.prototype.radiationDuration = function() {
    return new hQuery.createCodedValue(this.json['radiationDuration']);
  };


  /**
  The resulting status of a procedure as defined in the QDM documentation. This is different
  than the status_code associated with the `CodedEntry` object, which relates to the data criteria
  status as defined in health-data-standards/lib/hqmf-model/data_criteria.json.
  @returns {CodedValue}
   */

  Procedure.prototype.qdmStatus = function() {
    return new hQuery.createCodedValue(this.json['qdm_status']);
  };

  return Procedure;

})(hQuery.CodedEntry);

/**
@namespace scoping into the hquery namespace
 */
var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

this.hQuery || (this.hQuery = {});


/**
This represents all  communications.
@class
@augments hQuery.CodedEntry
@exports Communication as hQuery.Communication
 */

hQuery.Communication = (function(superClass) {
  extend(Communication, superClass);

  function Communication(json) {
    this.json = json;
    Communication.__super__.constructor.call(this, this.json);
  }


  /**
  @returns {CodedValue}
   */

  Communication.prototype.direction = function() {
    return new hQuery.createCodedValue(this.json['direction']);
  };

  return Communication;

})(hQuery.CodedEntry);

/**
@namespace scoping into the hquery namespace
 */
var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

this.hQuery || (this.hQuery = {});


/**
This represents all  family history.
@class
@augments hQuery.CodedEntry
@exports FamilyHistory as hQuery.FamilyHistory
 */

hQuery.FamilyHistory = (function(superClass) {
  extend(FamilyHistory, superClass);

  function FamilyHistory(json) {
    this.json = json;
    FamilyHistory.__super__.constructor.call(this, this.json);
  }


  /**
  @returns {CodedValue}
   */

  FamilyHistory.prototype.relationshipToPatient = function() {
    return hQuery.createCodedValue(this.json['relationshipToPatient']);
  };


  /**
  @returns {CodedValue}
   */

  FamilyHistory.prototype.onsetAge = function() {
    return new hQuery.Scalar(this.json['onsetAge']);
  };

  return FamilyHistory;

})(hQuery.CodedEntry);

/**
@namespace scoping into the hquery namespace
 */
var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

this.hQuery || (this.hQuery = {});


/**
Observations generated by laboratories, imaging procedures, and other procedures. The scope
includes hematology, chemistry, serology, virology, toxicology, microbiology, plain x-ray,
ultrasound, CT, MRI, angiography, cardiac echo, nuclear medicine, pathology, and procedure
observations.
@class
@augments hQuery.CodedEntry
@exports Result as hQuery.Result
 */

hQuery.Result = (function(superClass) {
  extend(Result, superClass);

  function Result(json) {
    this.json = json;
    Result.__super__.constructor.call(this, this.json);
  }


  /**
  ASTM CCR defines a restricted set of required result Type codes (see ResultTypeCode in section 7.3
  Summary of CCD value sets), used to categorize a result into one of several commonly accepted values
  (e.g. Hematology, Chemistry, Nuclear Medicine).
  @returns {CodedValue}
   */

  Result.prototype.resultType = function() {
    return this.type();
  };


  /**
  @returns {CodedValue}
   */

  Result.prototype.interpretation = function() {
    return hQuery.createCodedValue(this.json['interpretation']);
  };


  /**
  @returns {String}
   */

  Result.prototype.referenceRange = function() {
    return this.json['referenceRange'];
  };


  /**
  @returns {String}
   */

  Result.prototype.referenceRangeHigh = function() {
    return this.json['referenceRangeHigh'];
  };


  /**
  @returns {String}
   */

  Result.prototype.referenceRangeLow = function() {
    return this.json['referenceRangeLow'];
  };


  /**
  @returns {String}
   */

  Result.prototype.comment = function() {
    return this.json['comment'];
  };


  /**
  The resulting status of a procedure as defined in the QDM documentation. This is different
  than the status_code associated with the `CodedEntry` object, which relates to the data criteria
  status as defined in health-data-standards/lib/hqmf-model/data_criteria.json.
  @returns {CodedValue}
   */

  Result.prototype.qdmStatus = function() {
    return hQuery.createCodedValue(this.json['qdm_status']);
  };

  return Result;

})(hQuery.CodedEntry);

/**
@namespace scoping into the hquery namespace
 */
var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

this.hQuery || (this.hQuery = {});


/**
NoImmunzation as defined by value set 2.16.840.1.113883.1.11.19717
The terms come from Health Level Seven (HL7) Version 3.0 Vocabulary and are managed by HL7
It indicates the reason an immunization was not administered.

@class NoImmunization - describes the status of the medication
@augments hQuery.CodedEntry
@exports NoImmunization as hQuery.NoImmunization
 */

hQuery.NoImmunization = (function(superClass) {
  var IMMUNITY, MED_PRECAUTION, OUT_OF_STOCK, PAT_OBJ, PHIL_OBJ, REL_OBJ, VAC_EFF, VAC_SAFETY;

  extend(NoImmunization, superClass);

  function NoImmunization() {
    return NoImmunization.__super__.constructor.apply(this, arguments);
  }

  IMMUNITY = "IMMUNE";

  MED_PRECAUTION = "MEDPREC";

  OUT_OF_STOCK = "OSTOCK";

  PAT_OBJ = "PATOBJ";

  PHIL_OBJ = "PHILISOP";

  REL_OBJ = "RELIG";

  VAC_EFF = "VACEFF";

  VAC_SAFETY = "VACSAF";


  /**
  @returns {Boolean}
   */

  NoImmunization.prototype.isImmune = function() {
    return this.c === IMMUNITY;
  };


  /**
  @returns {Boolean}
   */

  NoImmunization.prototype.isMedPrec = function() {
    return this.c === MED_PRECAUTION;
  };


  /**
  @returns {Boolean}
   */

  NoImmunization.prototype.isOstock = function() {
    return this.c === OUT_OF_STOCK;
  };


  /**
  @returns {Boolean}
   */

  NoImmunization.prototype.isPatObj = function() {
    return this.c === PAT_OBJ;
  };


  /**
  @returns {Boolean}
   */

  NoImmunization.prototype.isPhilisop = function() {
    return this.c === PHIL_OBJ;
  };


  /**
  @returns {Boolean}
   */

  NoImmunization.prototype.isRelig = function() {
    return this.c === REL_OBJ;
  };


  /**
  @returns {Boolean}
   */

  NoImmunization.prototype.isVacEff = function() {
    return this.c === VAC_EFF;
  };


  /**
  @returns {Boolean}
   */

  NoImmunization.prototype.isVacSaf = function() {
    return this.c === VAC_SAFETY;
  };

  return NoImmunization;

})(hQuery.CodedValue);


/**
@class represents a immunization entry for a patient.
@augments hQuery.CodedEntry
@exports Immunization as hQuery.Immunization
 */

hQuery.Immunization = (function(superClass) {
  extend(Immunization, superClass);

  function Immunization(json) {
    this.json = json;
    Immunization.__super__.constructor.call(this, this.json);
  }


  /**
  @returns{hQuery.Scalar}
   */

  Immunization.prototype.medicationSeriesNumber = function() {
    if (this.json['medicationSeriesNumber']) {
      return new hQuery.Scalar(this.json['medicationSeriesNumber']);
    }
  };


  /**
  @returns{hQuery.MedicationInformation}
   */

  Immunization.prototype.medicationInformation = function() {
    return new hQuery.MedicationInformation(this.json);
  };


  /**
  @returns{Date} Date immunization was administered
   */

  Immunization.prototype.administeredDate = function() {
    return dateFromUtcSeconds(this.json['administeredDate']);
  };


  /**
  @returns{hQuery.Actor} Performer of immunization
   */

  Immunization.prototype.performer = function() {
    if (this.json['performer']) {
      return new hQuery.Actor(this.json['performer']);
    }
  };


  /**
  @returns {comment} human readable description of event
   */

  Immunization.prototype.comment = function() {
    return this.json['comment'];
  };


  /**
  @returns {Boolean} whether the immunization has been refused by the patient.
   */

  Immunization.prototype.refusalInd = function() {
    return this.json['negationInd'];
  };


  /**
  NoImmunzation as defined by value set 2.16.840.1.113883.1.11.19717
  The terms come from Health Level Seven (HL7) Version 3.0 Vocabulary and are managed by HL7
  It indicates the reason an immunization was not administered.
  @returns {hQuery.NoImmunization}   Used to indicate reason an immunization was not administered.
   */

  Immunization.prototype.refusalReason = function() {
    var ref, ref1;
    return new hQuery.NoImmunization((ref = this.json['negationReason']) != null ? ref['code'] : void 0, (ref1 = this.json['negationReason']) != null ? ref1['code_system'] : void 0);
  };


  /**
  @returns {CodedValue}
   */

  Immunization.prototype.reaction = function() {
    return new hQuery.createCodedValue(this.json['reaction']);
  };

  return Immunization;

})(hQuery.CodedEntry);

/**
@namespace scoping into the hquery namespace
 */
var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

this.hQuery || (this.hQuery = {});


/**
@class
@augments hQuery.CodedEntry
@exports Allergy as hQuery.Allergy
 */

hQuery.Allergy = (function(superClass) {
  extend(Allergy, superClass);

  function Allergy(json) {
    this.json = json;
    Allergy.__super__.constructor.call(this, this.json);
  }


  /**
  Food and substance allergies use the Unique Ingredient Identifier(UNII) from the FDA
  http://www.fda.gov/ForIndustry/DataStandards/StructuredProductLabeling/ucm162523.htm
  
  Allegies to a class of medication Shall contain a value descending from the NDF-RT concept types
  of Mechanism of Action - N0000000223, Physiologic Effect - N0000009802 or
  Chemical Structure - N0000000002. NUI will be used as the concept code.
  For more information, please see the Web Site
  http://www.cancer.gov/cancertopics/terminologyresources/page5
  
  Allergies to a specific medication shall use RxNorm for the values.
  @returns {CodedValue}
   */

  Allergy.prototype.product = function() {
    return this.type();
  };


  /**
  Date of allergy or adverse event
  @returns{Date}
   */

  Allergy.prototype.adverseEventDate = function() {
    return dateFromUtcSeconds(this.json['adverseEventDate']);
  };


  /**
  Adverse event types SHALL be coded as specified in HITSP/C80 Section 2.2.3.4.2 Allergy/Adverse Event Type
  @returns {CodedValue}
   */

  Allergy.prototype.adverseEventType = function() {
    return hQuery.createCodedValue(this.json['type']);
  };


  /**
  This indicates the reaction that may be caused by the product or agent.
   It is defined by 2.16.840.1.113883.3.88.12.3221.6.2 and are SNOMED-CT codes.
  420134006   Propensity to adverse reactions (disorder)
  418038007   Propensity to adverse reactions to substance (disorder)
  419511003   Propensity to adverse reactions to drug (disorder)
  418471000   Propensity to adverse reactions to food (disorder)
  419199007  Allergy to substance (disorder)
  416098002  Drug allergy (disorder)
  414285001  Food allergy (disorder)
  59037007  Drug intolerance (disorder)
  235719002  Food intolerance (disorder)
  @returns {CodedValue}
   */

  Allergy.prototype.reaction = function() {
    return hQuery.createCodedValue(this.json['reaction']);
  };


  /**
  This is a description of the level of the severity of the allergy or intolerance.
  Use SNOMED-CT Codes as defined by 2.16.840.1.113883.3.88.12.3221.6.8
    255604002  Mild
    371923003  Mild to Moderate
    6736007      Moderate
    371924009  Moderate to Severe
    24484000    Severe
    399166001  Fatal
  @returns {CodedValue}
   */

  Allergy.prototype.severity = function() {
    return hQuery.createCodedValue(this.json['severity']);
  };


  /**
  Additional comment or textual information
  @returns {String}
   */

  Allergy.prototype.comment = function() {
    return this.json['comment'];
  };

  return Allergy;

})(hQuery.CodedEntry);

/**
@namespace scoping into the hquery namespace
 */
this.hQuery || (this.hQuery = {});


/**
@class

@exports Provider as hQuery.Provider
 */

hQuery.Provider = (function() {
  function Provider(json) {
    this.json = json;
  }


  /**
  @returns {hQuery.Person}
   */

  Provider.prototype.providerEntity = function() {
    if (this.json['providerEntity']) {
      return new hQuery.Person(this.json['providerEntity']);
    }
  };


  /**
  @returns {hQuery.DateRange}
   */

  Provider.prototype.careProvisionDateRange = function() {
    if (this.json['careProvisionDateRange']) {
      return new hQuery.DateRange(this.json['careProvisionDateRange']);
    }
  };


  /**
  @returns {hQuery.CodedValue}
   */

  Provider.prototype.role = function() {
    return hQuery.createCodedValue(this.json['role']);
  };


  /**
  @returns {String}
   */

  Provider.prototype.patientID = function() {
    return this.json['patientID'];
  };


  /**
  @returns {hQuery.CodedValue}
   */

  Provider.prototype.providerType = function() {
    return hQuery.createCodedValue(this.json['providerType']);
  };


  /**
  @returns {String}
   */

  Provider.prototype.providerID = function() {
    return this.json['providerID'];
  };


  /**
  @returns {hQuery.Organization}
   */

  Provider.prototype.organizationName = function() {
    return new hQuery.Organization(this.json);
  };

  return Provider;

})();

/**
@namespace scoping into the hquery namespace
 */
var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

this.hQuery || (this.hQuery = {});


/**
@class
@augments hQuery.CodedEntry
@exports Language as hQuery.Language
 */

hQuery.Language = (function(superClass) {
  extend(Language, superClass);

  function Language(json) {
    this.json = json;
    Language.__super__.constructor.call(this, this.json);
  }


  /**
  @returns {hQuery.CodedValue}
   */

  Language.prototype.modeCode = function() {
    return hQuery.createCodedValue(this.json['modeCode']);
  };


  /**
  @returns {String}
   */

  Language.prototype.preferenceIndicator = function() {
    return this.json['preferenceIndicator'];
  };

  return Language;

})(hQuery.CodedEntry);

/**
@namespace scoping into the hquery namespace
 */
var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

this.hQuery || (this.hQuery = {});


/**
This includes information about the patients current and past pregnancy status
The Coded Entry code system should be SNOMED-CT
@class
@augments hQuery.CodedEntry
@exports Pregnancy as hQuery.Pregnancy
 */

hQuery.Pregnancy = (function(superClass) {
  extend(Pregnancy, superClass);

  function Pregnancy(json) {
    this.json = json;
    Pregnancy.__super__.constructor.call(this, this.json);
  }


  /**
  @returns {String}
   */

  Pregnancy.prototype.comment = function() {
    return this.json['comment'];
  };

  return Pregnancy;

})(hQuery.CodedEntry);

/**
@namespace scoping into the hquery namespace
 */
var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

this.hQuery || (this.hQuery = {});


/**

The Social History Observation is used to define the patient's occupational, personal (e.g. lifestyle),
social, and environmental history and health risk factors, as well as administrative data such as
marital status, race, ethnicity and religious affiliation. The types of conditions
described have been constrained to the SNOMED CT code system using constrained code set, 2.16.840.1.113883.3.88.12.80.60:
229819007   Tobacco use and exposure
256235009   Exercise
160573003   Alcohol Intake
364393001   Nutritional observable
364703007   Employment detail
425400000   Toxic exposure status
363908000   Details of drug misuse behavior
228272008   Health-related behavior
105421008   Educational achievement

note:  Social History is not part of the existing green c32.
@exports Socialhistory as hQuery.Socialhistory
@augments hQuery.CodedEntry
 */

hQuery.Socialhistory = (function(superClass) {
  extend(Socialhistory, superClass);

  function Socialhistory(json) {
    this.json = json;
    Socialhistory.__super__.constructor.call(this, this.json);
  }


  /**
  Value returns the value of the result. This will return an object. The properties of this
  object are dependent on the type of result.
   */

  Socialhistory.prototype.value = function() {
    return this.json['value'];
  };

  return Socialhistory;

})(hQuery.CodedEntry);

/**
@namespace scoping into the hquery namespace
 */
var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

this.hQuery || (this.hQuery = {});


/**

The plan of care contains data defining prospective or intended orders, interventions, encounters, services, and procedures for the patient.

@exports CareGoal as hQuery.CareGoal
@augments hQuery.CodedEntry
 */

hQuery.CareGoal = (function(superClass) {
  extend(CareGoal, superClass);

  function CareGoal(json) {
    this.json = json;
    CareGoal.__super__.constructor.call(this, this.json);
  }


  /**
  @returns {CodedValue}
   */

  CareGoal.prototype.relatedTo = function() {
    return hQuery.createCodedValue(this.json['relatedTo']);
  };


  /**
  @returns {CodedValue}
   */

  CareGoal.prototype.targetOutcome = function() {
    var ref;
    if (((ref = this.json['targetOutcome']) != null ? ref['unit'] : void 0) != null) {
      return new hQuery.Scalar(this.json['targetOutcome']);
    } else if (this.json['targetOutcome'] != null) {
      return hQuery.createCodedValue(this.json['targetOutcome']);
    }
  };

  return CareGoal;

})(hQuery.CodedEntry);

/**
@namespace scoping into the hquery namespace
 */
var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

this.hQuery || (this.hQuery = {});


/**

The Medical Equipment section contains information describing a patients implanted and external medical devices and equipment that their health status depends on, as well as any pertinent equipment or device history.

The template identifier for this section is 2.16.840.1.113883.3.88.11.83.128

C83-[CT-128-1] This section shall conform to the HL7 CCD section, and shall contain a templateId element whose root attribute is 2.16.840.1.113883.10.20.1.7.
C83-[CT-128-2] This section SHALL conform to the IHE Medical Devices Section, and shall contain a templateId element whose root attribute is 1.3.6.1.4.1.19376.1.5.3.1.1.5.3.5

@exports MedicalEquipment as hQuery.MedicalEquipment
@augments hQuery.CodedEntry
 */

hQuery.MedicalEquipment = (function(superClass) {
  extend(MedicalEquipment, superClass);

  function MedicalEquipment(json) {
    this.json = json;
    MedicalEquipment.__super__.constructor.call(this, this.json);
  }


  /**
  @returns {CodedValue}
   */

  MedicalEquipment.prototype.anatomicalStructure = function() {
    return hQuery.createCodedValue(this.json['anatomicalStructure']);
  };


  /**
  @returns {CodedValue}
   */

  MedicalEquipment.prototype.anatomicalApproach = function() {
    return new hQuery.createCodedValue(this.json['anatomicalApproach']);
  };


  /**
  @returns {CodedValue}
   */

  MedicalEquipment.prototype.anatomicalLocation = function() {
    var at;
    at = this.json['anatomicalLocation'];
    if (at != null) {
      return new hQuery.CodedValue(at);
    } else {
      return this.anatomicalStructure();
    }
  };


  /**
  @returns {CodedValue}
   */

  MedicalEquipment.prototype.method = function() {
    return new hQuery.createCodedValue(this.json['method']);
  };


  /**
  @returns {CodedValue}
   */

  MedicalEquipment.prototype.reaction = function() {
    return new hQuery.createCodedValue(this.json['reaction']);
  };


  /**
  @returns {Date} The actual or intended removal time of the device.
   */

  MedicalEquipment.prototype.removalTime = function() {
    if (this.json['removalTime']) {
      return hQuery.dateFromUtcSeconds(this.json['removalTime']);
    }
  };

  return MedicalEquipment;

})(hQuery.CodedEntry);

/**
@namespace scoping into the hquery namespace
 */
var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

this.hQuery || (this.hQuery = {});


/**
This class can be used to represent a functional status for a patient. Currently,
it is not a very close representation of functional status as it is represented
in the HL7 CCD, HITSP C32 or Consolidated CDA.

In the previously mentioned specifications, functional status may represented
using either a condition or result. Having "mixed" types of entries in a section
is currently not well supported in the existing Record class

Additionally, there is a mismatch between the data needed to calculate Stage 2
Meaningful Use Quality Measures and the data contained in patient summary
standards. The CQMs are checking to see if a functional status represented by
a result was patient supplied. Right now, results do not have a source, and
even if we were to use Provider as a source, it would need to be extended
to support patients.

To avoid this, the patient summary style functional status has been "flattened"
into this class. This model supports the information needed to calculate
Stage 2 MU CQMs. If importers are created from C32 or CCDA, the information
can be stored here, but it will be a lossy transformation.
@class
@augments hQuery.CodedEntry
@exports FunctionalStatus as hQuery.FunctionalStatus
 */

hQuery.FunctionalStatus = (function(superClass) {
  extend(FunctionalStatus, superClass);

  function FunctionalStatus(json) {
    this.json = json;
    FunctionalStatus.__super__.constructor.call(this, this.json);
  }


  /**
  Either "condition" or "result"
  @returns {String}
   */

  FunctionalStatus.prototype.type = function() {
    return this.json["type"];
  };


  /**
  A coded value. Like a code for patient supplied.
  @returns {hQuery.CodedValue}
   */

  FunctionalStatus.prototype.source = function() {
    return hQuery.createCodedValue(this.json["source"]);
  };


  /**
  @returns {CodedValue}
   */

  FunctionalStatus.prototype.reaction = function() {
    return hQuery.createCodedValue(this.json['reaction']);
  };


  /**
  @returns {CodedValue}
   */

  FunctionalStatus.prototype.method = function() {
    return hQuery.createCodedValue(this.json['method']);
  };

  return FunctionalStatus;

})(hQuery.CodedEntry);

/**
@namespace scoping into the hquery namespace
 */
var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

this.hQuery || (this.hQuery = {});


/**
This represents all care experience.
@class
@augments hQuery.CodedEntry
@exports CareExperience as hQuery.CareExperience
 */

hQuery.CareExperience = (function(superClass) {
  extend(CareExperience, superClass);

  function CareExperience(json) {
    this.json = json;
    CareExperience.__super__.constructor.call(this, this.json);
  }


  /**
  Value returns the value of the result. This will return an object. The properties of this
  object are dependent on the type of result.
   */

  CareExperience.prototype.value = function() {
    return this.json['value'];
  };

  return CareExperience;

})(hQuery.CodedEntry);

/**
@namespace scoping into the hquery namespace
 */
var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

this.hQuery || (this.hQuery = {});


/**
This represents all care experience.
@class
@augments hQuery.CodedEntry
@exports Assessment as hQuery.Assessment
 */

hQuery.Assessment = (function(superClass) {
  extend(Assessment, superClass);

  function Assessment(json) {
    this.json = json;
    Assessment.__super__.constructor.call(this, this.json);
  }


  /**
  @returns {CodedValue}
   */

  Assessment.prototype.method = function() {
    return hQuery.createCodedValue(this.json['method']);
  };

  return Assessment;

})(hQuery.CodedEntry);

/**
@namespace scoping into the hquery namespace
 */
var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

this.hQuery || (this.hQuery = {});


/**
@class Supports
@exports Supports as hQuery.Supports
 */

hQuery.Supports = (function() {
  function Supports(json) {
    this.json = json;
  }


  /**
  @returns {DateRange}
   */

  Supports.prototype.supportDate = function() {
    return new hQuery.DateRange(this.json['supportDate']);
  };


  /**
  @returns {Person}
   */

  Supports.prototype.guardian = function() {
    return new hQuery.Person(this.json['guardian']);
  };


  /**
  @returns {String}
   */

  Supports.prototype.guardianSupportType = function() {
    return this.json['guardianSupportType'];
  };


  /**
  @returns {Person}
   */

  Supports.prototype.contact = function() {
    return new hQuery.Person(this.json['contact']);
  };


  /**
  @returns {String}
   */

  Supports.prototype.contactSupportType = function() {
    return this.json['guardianSupportType'];
  };

  return Supports;

})();


/**
@class Representation of a patient
@augments hQuery.Person
@exports Patient as hQuery.Patient
 */

hQuery.Patient = (function(superClass) {
  extend(Patient, superClass);

  function Patient() {
    return Patient.__super__.constructor.apply(this, arguments);
  }


  /**
  @returns {String} containing M or F representing the gender of the patient
   */

  Patient.prototype.gender = function() {
    return this.json['gender'];
  };


  /**
  @returns {Date} containing the patients birthdate
   */

  Patient.prototype.birthtime = function() {
    if (this.json['birthdate']) {
      return hQuery.dateFromUtcSeconds(this.json['birthdate']);
    }
  };


  /**
  @param (Date) date the date at which the patient age is calculated, defaults to now.
  @returns {number} the patient age in years
   */

  Patient.prototype.age = function(date) {
    var oneDay, oneYear;
    if (date == null) {
      date = new Date();
    }
    oneDay = 24 * 60 * 60 * 1000;
    oneYear = 365 * oneDay;
    return (date.getTime() - this.birthtime().getTime()) / oneYear;
  };


  /**
  @returns {CodedValue} the domestic partnership status of the patient
  The following HL7 codeset is used:
  A  Annulled
  D  Divorced
  I   Interlocutory
  L  Legally separated
  M  Married
  P  Polygamous
  S  Never Married
  T  Domestic Partner
  W  Widowed
   */

  Patient.prototype.maritalStatus = function() {
    if (this.json['maritalStatus']) {
      return hQuery.createCodedValue(this.json['maritalStatus']);
    }
  };


  /**
  @returns {CodedValue}  of the spiritual faith affiliation of the patient
  It uses the HL7 codeset.  http://www.hl7.org/memonly/downloads/v3edition.cfm#V32008
   */

  Patient.prototype.religiousAffiliation = function() {
    if (this.json['religiousAffiliation']) {
      return hQuery.createCodedValue(this.json['religiousAffiliation']);
    }
  };


  /**
  @returns {CodedValue}  of the race of the patient
  CDC codes:  http://phinvads.cdc.gov/vads/ViewCodeSystemConcept.action?oid=2.16.840.1.113883.6.238&code=1000-9
   */

  Patient.prototype.race = function() {
    if (this.json['race']) {
      return hQuery.createCodedValue({
        code: this.json['race'],
        code_system: 'CDC Race'
      });
    }
  };


  /**
  @returns {CodedValue} of the payer of the patient
  SOP codes: https://www.health.ny.gov/statistics/sparcs/sysdoc/appp.htm
   */

  Patient.prototype.payer = function() {
    var ip, ref, ref1;
    if ((ref = this.json['insurance_providers']) != null ? ref.length : void 0) {
      ip = this.json['insurance_providers'][0];
      if (ip.codes && ((ref1 = ip.codes.SOP) != null ? ref1.length : void 0)) {
        return hQuery.createCodedValue({
          code: ip.codes.SOP[0],
          code_system: 'SOP'
        });
      }
    }
  };


  /**
  @returns {CodedValue} of the ethnicity of the patient
  CDC codes:  http://phinvads.cdc.gov/vads/ViewCodeSystemConcept.action?oid=2.16.840.1.113883.6.238&code=1000-9
   */

  Patient.prototype.ethnicity = function() {
    if (this.json['ethnicity']) {
      return hQuery.createCodedValue({
        code: this.json['ethnicity'],
        code_system: 'CDC Ethnicity'
      });
    }
  };


  /**
  @returns {CodedValue} This is the code specifying the level of confidentiality of the document.
  HL7 Confidentiality Code (2.16.840.1.113883.5.25)
   */

  Patient.prototype.confidentiality = function() {
    if (this.json['confidentiality']) {
      return hQuery.createCodedValue(this.json['confidentiality']);
    }
  };


  /**
  @returns {Address} of the location where the patient was born
   */

  Patient.prototype.birthPlace = function() {
    return new hQuery.Address(this.json['birthPlace']);
  };


  /**
  @returns {Supports} information regarding key support contacts relative to healthcare decisions, including next of kin
   */

  Patient.prototype.supports = function() {
    return new hQuery.Supports(this.json['supports']);
  };


  /**
  @returns {Organization}
   */

  Patient.prototype.custodian = function() {
    return new hQuery.Organization(this.json['custodian']);
  };


  /**
  @returns {Provider}  the providers associated with the patient
   */

  Patient.prototype.provider = function() {
    return new hQuery.Provider(this.json['provider']);
  };


  /**
  @returns {hQuery.CodedEntryList} A list of {@link hQuery.LanguagesSpoken} objects
  Code from http://www.ietf.org/rfc/rfc4646.txt representing the name of the human language
   */

  Patient.prototype.languages = function() {
    var i, language, len, list, ref;
    list = new hQuery.CodedEntryList;
    if (this.json['languages']) {
      ref = this.json['languages'];
      for (i = 0, len = ref.length; i < len; i++) {
        language = ref[i];
        list.push(new hQuery.Language(language));
      }
    }
    return list;
  };


  /**
  @returns {Boolean} returns true if the patient has died
   */

  Patient.prototype.expired = function() {
    return this.json['expired'];
  };


  /**
  @returns {hQuery.CodedEntryList} A list of {@link hQuery.Encounter} objects
   */

  Patient.prototype.encounters = function() {
    var encounter, i, len, list, ref;
    list = new hQuery.CodedEntryList;
    if (this.json['encounters']) {
      ref = this.json['encounters'];
      for (i = 0, len = ref.length; i < len; i++) {
        encounter = ref[i];
        list.pushIfUsable(new hQuery.Encounter(encounter));
      }
    }
    return list;
  };


  /**
  @returns {hQuery.CodedEntryList} A list of {@link Medication} objects
   */

  Patient.prototype.medications = function() {
    var i, len, list, medication, ref;
    list = new hQuery.CodedEntryList;
    if (this.json['medications']) {
      ref = this.json['medications'];
      for (i = 0, len = ref.length; i < len; i++) {
        medication = ref[i];
        list.pushIfUsable(new hQuery.Medication(medication));
      }
    }
    return list;
  };


  /**
  @returns {hQuery.CodedEntryList} A list of {@link Condition} objects
   */

  Patient.prototype.conditions = function() {
    var condition, i, len, list, ref;
    list = new hQuery.CodedEntryList;
    if (this.json['conditions']) {
      ref = this.json['conditions'];
      for (i = 0, len = ref.length; i < len; i++) {
        condition = ref[i];
        list.pushIfUsable(new hQuery.Condition(condition));
      }
    }
    return list;
  };


  /**
  @returns {hQuery.CodedEntryList} A list of {@link Procedure} objects
   */

  Patient.prototype.procedures = function() {
    var i, len, list, procedure, ref;
    list = new hQuery.CodedEntryList;
    if (this.json['procedures']) {
      ref = this.json['procedures'];
      for (i = 0, len = ref.length; i < len; i++) {
        procedure = ref[i];
        list.pushIfUsable(new hQuery.Procedure(procedure));
      }
    }
    return list;
  };


  /**
  @returns {hQuery.CodedEntryList} A list of {@link Communication} objects
   */

  Patient.prototype.communications = function() {
    var communication, i, len, list, ref;
    list = new hQuery.CodedEntryList;
    if (this.json['communications']) {
      ref = this.json['communications'];
      for (i = 0, len = ref.length; i < len; i++) {
        communication = ref[i];
        list.pushIfUsable(new hQuery.Communication(communication));
      }
    }
    return list;
  };


  /**
  @returns {hQuery.CodedEntryList} A list of {@link FamilyHistory} objects
   */

  Patient.prototype.family_history = function() {
    var familyhistory, i, len, list, ref;
    list = new hQuery.CodedEntryList;
    if (this.json['family_history']) {
      ref = this.json['family_history'];
      for (i = 0, len = ref.length; i < len; i++) {
        familyhistory = ref[i];
        list.pushIfUsable(new hQuery.FamilyHistory(familyhistory));
      }
    }
    return list;
  };


  /**
  @returns {hQuery.CodedEntryList} A list of {@link CareExperience} objects
   */

  Patient.prototype.careExperiences = function() {
    var care_experience, i, len, list, ref;
    list = new hQuery.CodedEntryList;
    if (this.json['care_experiences']) {
      ref = this.json['care_experiences'];
      for (i = 0, len = ref.length; i < len; i++) {
        care_experience = ref[i];
        list.pushIfUsable(new hQuery.CareExperience(care_experience));
      }
    }
    return list;
  };


  /**
  @returns {hQuery.CodedEntryList} A list of {@link Assessment} objects
   */

  Patient.prototype.assessments = function() {
    var assessment, i, len, list, ref;
    list = new hQuery.CodedEntryList;
    if (this.json['assessments']) {
      ref = this.json['assessments'];
      for (i = 0, len = ref.length; i < len; i++) {
        assessment = ref[i];
        list.pushIfUsable(new hQuery.Assessment(assessment));
      }
    }
    return list;
  };


  /**
  @returns {hQuery.CodedEntryList} A list of {@link Result} objects
   */

  Patient.prototype.results = function() {
    var i, len, list, ref, result;
    list = new hQuery.CodedEntryList;
    if (this.json['results']) {
      ref = this.json['results'];
      for (i = 0, len = ref.length; i < len; i++) {
        result = ref[i];
        list.pushIfUsable(new hQuery.Result(result));
      }
    }
    return list;
  };


  /**
  @returns {hQuery.CodedEntryList} A list of {@link Result} objects
   */

  Patient.prototype.vitalSigns = function() {
    var i, len, list, ref, vital;
    list = new hQuery.CodedEntryList;
    if (this.json['vital_signs']) {
      ref = this.json['vital_signs'];
      for (i = 0, len = ref.length; i < len; i++) {
        vital = ref[i];
        list.pushIfUsable(new hQuery.Result(vital));
      }
    }
    return list;
  };


  /**
  @returns {hQuery.CodedEntryList} A list of {@link Immunization} objects
   */

  Patient.prototype.immunizations = function() {
    var i, immunization, len, list, ref;
    list = new hQuery.CodedEntryList;
    if (this.json['immunizations']) {
      ref = this.json['immunizations'];
      for (i = 0, len = ref.length; i < len; i++) {
        immunization = ref[i];
        list.pushIfUsable(new hQuery.Immunization(immunization));
      }
    }
    return list;
  };


  /**
  @returns {hQuery.CodedEntryList} A list of {@link Allergy} objects
   */

  Patient.prototype.allergies = function() {
    var allergy, i, len, list, ref;
    list = new hQuery.CodedEntryList;
    if (this.json['allergies']) {
      ref = this.json['allergies'];
      for (i = 0, len = ref.length; i < len; i++) {
        allergy = ref[i];
        list.pushIfUsable(new hQuery.Allergy(allergy));
      }
    }
    return list;
  };


  /**
  @returns {hQuery.CodedEntryList} A list of {@link Pregnancy} objects
   */

  Patient.prototype.pregnancies = function() {
    var i, len, list, pregnancy, ref;
    list = new hQuery.CodedEntryList;
    if (this.json['pregnancies']) {
      ref = this.json['pregnancies'];
      for (i = 0, len = ref.length; i < len; i++) {
        pregnancy = ref[i];
        list.pushIfUsable(new hQuery.Pregnancy(pregnancy));
      }
    }
    return list;
  };


  /**
  @returns {hQuery.CodedEntryList} A list of {@link Socialhistory} objects
   */

  Patient.prototype.socialHistories = function() {
    var i, len, list, ref, socialhistory;
    list = new hQuery.CodedEntryList;
    if (this.json['socialhistories']) {
      ref = this.json['socialhistories'];
      for (i = 0, len = ref.length; i < len; i++) {
        socialhistory = ref[i];
        list.pushIfUsable(new hQuery.Socialhistory(socialhistory));
      }
    }
    return list;
  };


  /**
  @returns {hQuery.CodedEntryList} A list of {@link CareGoal} objects
   */

  Patient.prototype.careGoals = function() {
    var caregoal, i, len, list, ref;
    list = new hQuery.CodedEntryList;
    if (this.json['care_goals']) {
      ref = this.json['care_goals'];
      for (i = 0, len = ref.length; i < len; i++) {
        caregoal = ref[i];
        list.pushIfUsable(new hQuery.CareGoal(caregoal));
      }
    }
    return list;
  };


  /**
  @returns {hQuery.CodedEntryList} A list of {@link MedicalEquipment} objects
   */

  Patient.prototype.medicalEquipment = function() {
    var equipment, i, len, list, ref;
    list = new hQuery.CodedEntryList;
    if (this.json['medical_equipment']) {
      ref = this.json['medical_equipment'];
      for (i = 0, len = ref.length; i < len; i++) {
        equipment = ref[i];
        list.pushIfUsable(new hQuery.MedicalEquipment(equipment));
      }
    }
    return list;
  };


  /**
  @returns {hQuery.CodedEntryList} A list of {@link FunctionalStatus} objects
   */

  Patient.prototype.functionalStatuses = function() {
    var fs, i, len, list, ref;
    list = new hQuery.CodedEntryList;
    if (this.json['functional_statuses']) {
      ref = this.json['functional_statuses'];
      for (i = 0, len = ref.length; i < len; i++) {
        fs = ref[i];
        list.pushIfUsable(new hQuery.FunctionalStatus(fs));
      }
    }
    return list;
  };

  return Patient;

})(hQuery.Person);

// #########################
// ## SPECIFIC OCCURRENCES ##
// #########################

var Row,
  slice = [].slice,
  indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

this.hqmf || (this.hqmf = {});


/*
  {
    rows: [
      [1,3,5],
      [1,7,8],
    ]
  }

A singleton class the represents the table of all specific occurrences
 */

hqmf.SpecificsManagerSingleton = (function() {
  function SpecificsManagerSingleton() {
    this.patient = null;
    this.any = '*';
  }

  SpecificsManagerSingleton.prototype.initialize = function() {
    var base, hqmfjs, i, j, len, name, occurrenceKey, occurrences, patient, results;
    patient = arguments[0], hqmfjs = arguments[1], occurrences = 3 <= arguments.length ? slice.call(arguments, 2) : [];
    this.occurrences = occurrences;
    this.keyLookup = {};
    this.indexLookup = {};
    this.typeLookup = {};
    this.functionLookup = {};
    this.patient = patient;
    this.hqmfjs = hqmfjs;
    results = [];
    for (i = j = 0, len = occurrences.length; j < len; i = ++j) {
      occurrenceKey = occurrences[i];
      this.keyLookup[i] = occurrenceKey.id;
      this.indexLookup[occurrenceKey.id] = i;
      this.functionLookup[i] = occurrenceKey["function"];
      (base = this.typeLookup)[name = occurrenceKey.type] || (base[name] = []);
      results.push(this.typeLookup[occurrenceKey.type].push(i));
    }
    return results;
  };

  SpecificsManagerSingleton.prototype._generateCartisian = function(allValues) {
    return _.reduce(allValues, function(as, bs) {
      var a, b, j, k, len, len1, product;
      product = [];
      for (j = 0, len = as.length; j < len; j++) {
        a = as[j];
        for (k = 0, len1 = bs.length; k < len1; k++) {
          b = bs[k];
          product.push(a.concat(b));
        }
      }
      return product;
    }, [[]]);
  };

  SpecificsManagerSingleton.prototype.identity = function() {
    return new hqmf.SpecificOccurrence([new Row(void 0)]);
  };

  SpecificsManagerSingleton.prototype.setIfNull = function(events) {
    if (events.specificContext == null) {
      if (events.isTrue()) {
        events.specificContext = hqmf.SpecificsManager.identity();
      } else {
        events.specificContext = hqmf.SpecificsManager.empty();
      }
    }
    return events;
  };

  SpecificsManagerSingleton.prototype.getColumnIndex = function(occurrenceID) {
    var columnIndex;
    columnIndex = this.indexLookup[occurrenceID];
    if (typeof columnIndex === "undefined") {
      throw new Error("Unknown occurrence identifier: " + occurrenceID);
    }
    return columnIndex;
  };

  SpecificsManagerSingleton.prototype.empty = function() {
    return new hqmf.SpecificOccurrence([]);
  };

  SpecificsManagerSingleton.prototype.extractEventsForLeftMost = function(rows) {
    var event, events, j, k, len, len1, ref, row;
    events = [];
    for (j = 0, len = rows.length; j < len; j++) {
      row = rows[j];
      ref = row.leftMostEvents();
      for (k = 0, len1 = ref.length; k < len1; k++) {
        event = ref[k];
        event = new event.constructor(event.json);
        event.specificRow = row;
        events.push(event);
      }
    }
    return events;
  };

  SpecificsManagerSingleton.prototype.intersectSpecifics = function(nextPopulation, previousPopulation, occurrenceIDs) {
    var episodeIndices, occurrenceID, value;
    episodeIndices = null;
    if (occurrenceIDs != null) {
      episodeIndices = (function() {
        var j, len, results;
        results = [];
        for (j = 0, len = occurrenceIDs.length; j < len; j++) {
          occurrenceID = occurrenceIDs[j];
          results.push(this.getColumnIndex(occurrenceID));
        }
        return results;
      }).call(this);
    }
    value = this.intersectAll(new Boolean(nextPopulation.isTrue()), [nextPopulation, previousPopulation], false, episodeIndices);
    return value;
  };

  SpecificsManagerSingleton.prototype.countUnique = function(occurrenceIDs, intersectedPopulation) {
    var columnIndices, occurrenceID;
    if (occurrenceIDs != null) {
      columnIndices = (function() {
        var j, len, results;
        results = [];
        for (j = 0, len = occurrenceIDs.length; j < len; j++) {
          occurrenceID = occurrenceIDs[j];
          results.push(this.getColumnIndex(occurrenceID));
        }
        return results;
      }).call(this);
      return intersectedPopulation.specificContext.uniqueEvents(columnIndices);
    } else if (this.validate(intersectedPopulation)) {
      return 1;
    } else {
      return 0;
    }
  };

  SpecificsManagerSingleton.prototype.exclude = function(occurrenceIDs, initial, exclusions) {
    var columnIndex, j, len, occurrenceID, result, resultContext;
    if (occurrenceIDs != null) {
      resultContext = initial.specificContext;
      for (j = 0, len = occurrenceIDs.length; j < len; j++) {
        occurrenceID = occurrenceIDs[j];
        columnIndex = this.getColumnIndex(occurrenceID);
        resultContext = resultContext.removeMatchingRows(columnIndex, exclusions.specificContext);
      }
      result = new Boolean(resultContext.hasRows());
      result.specificContext = resultContext;
      return result;
    } else if (this.validate(exclusions)) {
      return this.maintainSpecifics(new Boolean(false), initial);
    } else {
      return initial;
    }
  };

  SpecificsManagerSingleton.prototype.validate = function(intersectedPopulation) {
    return intersectedPopulation.isTrue() && intersectedPopulation.specificContext.hasRows();
  };

  SpecificsManagerSingleton.prototype.intersectAll = function(boolVal, values, negate, episodeIndices, options) {
    var j, len, result, value;
    if (negate == null) {
      negate = false;
    }
    if (options == null) {
      options = {};
    }
    result = new hqmf.SpecificOccurrence;
    result.addIdentityRow();
    for (j = 0, len = values.length; j < len; j++) {
      value = values[j];
      if (value.specificContext != null) {
        result = result.intersect(value.specificContext, episodeIndices, options);
      }
    }
    if (negate && (!result.hasRows() || result.hasSpecifics())) {
      result = result.negate();
      result = result.compactReusedEvents();
      if (this.occurrences.length > 0) {
        boolVal = new Boolean(true);
      }
    }
    boolVal.specificContext = result.compactReusedEvents();
    return boolVal;
  };

  SpecificsManagerSingleton.prototype.unionAll = function(boolVal, values, negate) {
    var j, len, result, value;
    if (negate == null) {
      negate = false;
    }
    result = new hqmf.SpecificOccurrence;
    for (j = 0, len = values.length; j < len; j++) {
      value = values[j];
      if ((value.specificContext != null) && (value.isTrue() || negate)) {
        if (value.specificContext != null) {
          result = result.union(value.specificContext);
        }
      }
    }
    if (negate && (!result.hasRows() || result.hasSpecifics())) {
      result = result.negate();
      if (this.occurrences.length > 0) {
        boolVal = new Boolean(true);
      }
    }
    boolVal.specificContext = result;
    return boolVal;
  };

  SpecificsManagerSingleton.prototype.filterEventsAgainstSpecifics = function(events) {
    var referencedEventIds, referencedEvents, result;
    if (!events.specificContext.hasSpecifics()) {
      return events;
    }
    referencedEvents = hqmf.SpecificsManager.extractEventsForLeftMost(events.specificContext.rows);
    referencedEventIds = _(referencedEvents).pluck('id');
    result = _(events).select(function(e) {
      return !e.id || _(referencedEventIds).contains(e.id);
    });
    hqmf.SpecificsManager.maintainSpecifics(result, events);
    return result;
  };

  SpecificsManagerSingleton.prototype.maintainSpecifics = function(newElement, existingElement) {
    if (newElement.isTrue() && existingElement.isFalse() && (existingElement.specificContext != null) && !existingElement.specificContext.hasRows()) {
      newElement.specificContext = hqmf.SpecificsManager.identity();
    } else {
      newElement.specificContext = existingElement.specificContext;
    }
    newElement.specific_occurrence = existingElement.specific_occurrence;
    return newElement;
  };

  SpecificsManagerSingleton.prototype.flattenToIds = function(specificContext) {
    return (specificContext != null ? specificContext.flattenToIds() : void 0) || [];
  };

  SpecificsManagerSingleton.prototype.storeFinal = function(key, result, target) {
    return target[key] = hqmf.SpecificsManager.flattenToIds(result.specificContext);
  };

  return SpecificsManagerSingleton;

})();

this.hqmf.SpecificsManager = new hqmf.SpecificsManagerSingleton;

hqmf.SpecificOccurrence = (function() {
  function SpecificOccurrence(rows) {
    if (rows == null) {
      rows = [];
    }
    this.rows = rows;
  }

  SpecificOccurrence.prototype.addRows = function(rows) {
    return this.rows = this.rows.concat(rows);
  };

  SpecificOccurrence.prototype.removeMatchingRows = function(columnIndex, other) {
    var idsToRemove, j, k, len, len1, ref, ref1, ref2, removeAll, result, row, rowsToAdd;
    removeAll = false;
    idsToRemove = [];
    ref = other.rows;
    for (j = 0, len = ref.length; j < len; j++) {
      row = ref[j];
      if (row.values[columnIndex].id != null) {
        idsToRemove.push(row.values[columnIndex].id);
      } else if (row.values[columnIndex] === hqmf.SpecificsManager.any) {
        removeAll = true;
      }
    }
    rowsToAdd = [];
    if (!removeAll) {
      ref1 = this.rows;
      for (k = 0, len1 = ref1.length; k < len1; k++) {
        row = ref1[k];
        if (!(ref2 = row.values[columnIndex].id, indexOf.call(idsToRemove, ref2) >= 0)) {
          rowsToAdd.push(row);
        }
      }
    }
    result = new hqmf.SpecificOccurrence(rowsToAdd);
    return result;
  };

  SpecificOccurrence.prototype.removeDuplicateRows = function() {
    var j, len, ref, row, uniqRows;
    uniqRows = {};
    ref = this.rows;
    for (j = 0, len = ref.length; j < len; j++) {
      row = ref[j];
      uniqRows[row.toHashKey()] = row;
    }
    return new hqmf.SpecificOccurrence(_(uniqRows).values());
  };

  SpecificOccurrence.prototype.uniqueEvents = function(columnIndices) {
    var columnIndex, columnIndexInside, event, eventIds, j, k, l, len, len1, len2, onlyOneMatch, ref, ref1, row;
    eventIds = [];
    for (j = 0, len = columnIndices.length; j < len; j++) {
      columnIndex = columnIndices[j];
      ref = this.rows;
      for (k = 0, len1 = ref.length; k < len1; k++) {
        row = ref[k];
        event = row.values[columnIndex];
        if (event !== hqmf.SpecificsManager.any && !(ref1 = event.id, indexOf.call(eventIds, ref1) >= 0)) {
          onlyOneMatch = true;
          if (columnIndices.length > 1) {
            for (l = 0, len2 = columnIndices.length; l < len2; l++) {
              columnIndexInside = columnIndices[l];
              if (columnIndexInside !== columnIndex && row.values[columnIndexInside] !== hqmf.SpecificsManager.any) {
                onlyOneMatch = false;
              }
            }
          }
          if (onlyOneMatch) {
            eventIds.push(event.id);
          }
        }
      }
    }
    return eventIds.length;
  };

  SpecificOccurrence.prototype.hasExactRow = function(other) {
    var j, len, ref, row;
    ref = this.rows;
    for (j = 0, len = ref.length; j < len; j++) {
      row = ref[j];
      if (row.equals(other)) {
        return true;
      }
    }
    return false;
  };

  SpecificOccurrence.prototype.union = function(other) {
    var value;
    value = new hqmf.SpecificOccurrence();
    value.rows = this.rows.concat(other.rows);
    return value.removeDuplicateRows();
  };

  SpecificOccurrence.prototype.intersect = function(other, episodeIndices, options) {
    var j, k, leftRow, len, len1, ref, ref1, result, rightRow, value;
    if (options == null) {
      options = {};
    }
    value = new hqmf.SpecificOccurrence();
    ref = this.rows;
    for (j = 0, len = ref.length; j < len; j++) {
      leftRow = ref[j];
      ref1 = other.rows;
      for (k = 0, len1 = ref1.length; k < len1; k++) {
        rightRow = ref1[k];
        result = leftRow.intersect(rightRow, episodeIndices, options);
        if (result != null) {
          value.rows.push(result);
        }
      }
    }
    return value.removeDuplicateRows();
  };

  SpecificOccurrence.prototype.getLeftMost = function() {
    var j, len, ref, row, specificLeftMost;
    specificLeftMost = void 0;
    ref = this.rows;
    for (j = 0, len = ref.length; j < len; j++) {
      row = ref[j];
      if (specificLeftMost == null) {
        specificLeftMost = row.specificLeftMost;
      }
      if (specificLeftMost !== row.specificLeftMost) {
        return void 0;
      }
    }
    return specificLeftMost;
  };

  SpecificOccurrence.prototype.negate = function() {
    var allValues, cartesian, i, index, j, k, key, keys, l, len, len1, len2, negatedRows, occurrences, ref, row, values;
    negatedRows = [];
    keys = [];
    allValues = [];
    ref = this.specificsWithValues();
    for (j = 0, len = ref.length; j < len; j++) {
      index = ref[j];
      keys.push(hqmf.SpecificsManager.keyLookup[index]);
      allValues.push(hqmf.SpecificsManager.hqmfjs[hqmf.SpecificsManager.functionLookup[index]](hqmf.SpecificsManager.patient));
    }
    cartesian = hqmf.SpecificsManager._generateCartisian(allValues);
    for (k = 0, len1 = cartesian.length; k < len1; k++) {
      values = cartesian[k];
      occurrences = {};
      for (i = l = 0, len2 = keys.length; l < len2; i = ++l) {
        key = keys[i];
        occurrences[key] = values[i];
      }
      row = new Row(this.getLeftMost(), occurrences);
      if (!this.hasRow(row)) {
        negatedRows.push(row);
      }
    }
    return (new hqmf.SpecificOccurrence(negatedRows)).compactReusedEvents();
  };

  SpecificOccurrence.prototype.compactReusedEvents = function() {
    var goodRow, ids, index, indexes, j, k, len, len1, myRow, newRows, ref, ref1, type;
    newRows = [];
    ref = this.rows;
    for (j = 0, len = ref.length; j < len; j++) {
      myRow = ref[j];
      goodRow = true;
      ref1 = hqmf.SpecificsManager.typeLookup;
      for (type in ref1) {
        indexes = ref1[type];
        ids = [];
        for (k = 0, len1 = indexes.length; k < len1; k++) {
          index = indexes[k];
          if (myRow.values[index] !== hqmf.SpecificsManager.any) {
            ids.push(myRow.values[index].id);
          }
        }
        goodRow && (goodRow = ids.length === _.unique(ids).length);
      }
      if (goodRow) {
        newRows.push(myRow);
      }
    }
    return new hqmf.SpecificOccurrence(newRows);
  };

  SpecificOccurrence.prototype.filterSpecificsAgainstEvents = function(events) {
    var rowsToKeep;
    if (!this.hasSpecifics()) {
      return this;
    }
    rowsToKeep = _(this.rows).select(function(row) {
      return _(row.leftMostEvents()).any(function(leftMostEvent) {
        return _(events).any(function(event) {
          return (event instanceof Date && leftMostEvent instanceof Date && event.getTime() === leftMostEvent.getTime()) || ((event.id != null) && (leftMostEvent.id != null) && event.id === leftMostEvent.id);
        });
      });
    });
    return new hqmf.SpecificOccurrence(rowsToKeep);
  };

  SpecificOccurrence.prototype.hasRow = function(row) {
    var found, j, len, myRow, ref, result;
    found = false;
    ref = this.rows;
    for (j = 0, len = ref.length; j < len; j++) {
      myRow = ref[j];
      result = myRow.intersect(row);
      if (result != null) {
        return true;
      }
    }
    return false;
  };

  SpecificOccurrence.prototype.hasRows = function() {
    return this.rows.length > 0;
  };

  SpecificOccurrence.prototype.specificsWithValues = function() {
    var foundSpecificIndexes, j, len, ref, row;
    foundSpecificIndexes = [];
    ref = this.rows;
    for (j = 0, len = ref.length; j < len; j++) {
      row = ref[j];
      foundSpecificIndexes = foundSpecificIndexes.concat(row.specificsWithValues());
    }
    return _.unique(foundSpecificIndexes);
  };

  SpecificOccurrence.prototype.hasSpecifics = function() {
    var anyHaveSpecifics, j, len, ref, row;
    anyHaveSpecifics = false;
    ref = this.rows;
    for (j = 0, len = ref.length; j < len; j++) {
      row = ref[j];
      anyHaveSpecifics || (anyHaveSpecifics = row.hasSpecifics());
    }
    return anyHaveSpecifics;
  };

  SpecificOccurrence.prototype.finalizeEvents = function(eventsContext, boundsContext) {
    var result;
    result = this;
    if (eventsContext != null) {
      result = result.intersect(eventsContext);
    }
    if (boundsContext != null) {
      result = result.intersect(boundsContext);
    }
    return result.compactReusedEvents();
  };

  SpecificOccurrence.prototype.group = function() {
    var groupedRows, j, len, name, ref, row;
    groupedRows = {};
    ref = this.rows;
    for (j = 0, len = ref.length; j < len; j++) {
      row = ref[j];
      groupedRows[name = row.groupKeyForLeftMost()] || (groupedRows[name] = []);
      groupedRows[row.groupKeyForLeftMost()].push(row);
    }
    return groupedRows;
  };

  SpecificOccurrence.prototype.COUNT = function(range, fields) {
    return this.applyRangeSubset(COUNT, range, fields);
  };

  SpecificOccurrence.prototype.MIN = function(range, fields) {
    return this.applyRangeSubset(MIN, range, fields);
  };

  SpecificOccurrence.prototype.MAX = function(range, fields) {
    return this.applyRangeSubset(MAX, range, fields);
  };

  SpecificOccurrence.prototype.SUM = function(range, fields) {
    return this.applyRangeSubset(SUM, range, fields);
  };

  SpecificOccurrence.prototype.MEDIAN = function(range, fields) {
    return this.applyRangeSubset(MEDIAN, range, fields);
  };

  SpecificOccurrence.prototype.applyRangeSubset = function(func, range, fields) {
    var group, groupKey, groupedRows, resultRows;
    if (!this.hasSpecifics()) {
      return this;
    }
    resultRows = [];
    groupedRows = this.group();
    for (groupKey in groupedRows) {
      group = groupedRows[groupKey];
      if (func(hqmf.SpecificsManager.extractEventsForLeftMost(group), range, null, fields).isTrue()) {
        resultRows = resultRows.concat(group);
      }
    }
    return new hqmf.SpecificOccurrence(resultRows);
  };

  SpecificOccurrence.prototype.FIRST = function() {
    return this.applySubset(FIRST);
  };

  SpecificOccurrence.prototype.SECOND = function() {
    return this.applySubset(SECOND);
  };

  SpecificOccurrence.prototype.THIRD = function() {
    return this.applySubset(THIRD);
  };

  SpecificOccurrence.prototype.FOURTH = function() {
    return this.applySubset(FOURTH);
  };

  SpecificOccurrence.prototype.FIFTH = function() {
    return this.applySubset(FIFTH);
  };

  SpecificOccurrence.prototype.LAST = function() {
    return this.applySubset(LAST);
  };

  SpecificOccurrence.prototype.RECENT = function() {
    return this.applySubset(RECENT);
  };

  SpecificOccurrence.prototype.hasLeftMost = function() {
    var j, len, ref, row;
    ref = this.rows;
    for (j = 0, len = ref.length; j < len; j++) {
      row = ref[j];
      if ((row.specificLeftMost != null) || (row.nonSpecificLeftMost != null)) {
        return true;
      }
    }
    return false;
  };

  SpecificOccurrence.prototype.applySubset = function(func) {
    var entries, entry, group, groupKey, groupedRows, j, len, resultRows;
    if (!this.hasSpecifics() || !this.hasLeftMost()) {
      return this;
    }
    resultRows = [];
    groupedRows = this.group();
    for (groupKey in groupedRows) {
      group = groupedRows[groupKey];
      entries = func(hqmf.SpecificsManager.extractEventsForLeftMost(group));
      for (j = 0, len = entries.length; j < len; j++) {
        entry = entries[j];
        resultRows.push(entry.specificRow);
      }
    }
    return new hqmf.SpecificOccurrence(resultRows);
  };

  SpecificOccurrence.prototype.addIdentityRow = function() {
    return this.addRows(hqmf.SpecificsManager.identity().rows);
  };

  SpecificOccurrence.prototype.flattenToIds = function() {
    var j, len, ref, result, row;
    result = [];
    ref = this.rows;
    for (j = 0, len = ref.length; j < len; j++) {
      row = ref[j];
      result.push(row.flattenToIds());
    }
    return result;
  };

  return SpecificOccurrence;

})();

Row = (function() {
  function Row(specificLeftMost, occurrences) {
    var i, j, key, ref, value;
    if (occurrences == null) {
      occurrences = {};
    }
    this.length = hqmf.SpecificsManager.occurrences.length;
    this.values = [];
    this.specificLeftMost = specificLeftMost;
    this.nonSpecificLeftMost = occurrences[void 0];
    for (i = j = 0, ref = this.length; 0 <= ref ? j < ref : j > ref; i = 0 <= ref ? ++j : --j) {
      key = hqmf.SpecificsManager.keyLookup[i];
      value = occurrences[key] || hqmf.SpecificsManager.any;
      this.values[i] = value;
    }
  }

  Row.prototype.hasSpecifics = function() {
    var foundSpecific, i, j, ref;
    this.length = hqmf.SpecificsManager.occurrences.length;
    foundSpecific = false;
    for (i = j = 0, ref = this.length; 0 <= ref ? j < ref : j > ref; i = 0 <= ref ? ++j : --j) {
      if (this.values[i] !== hqmf.SpecificsManager.any) {
        return true;
      }
    }
    return false;
  };

  Row.prototype.specificsWithValues = function() {
    var foundSpecificIndexes, i, j, ref;
    this.length = hqmf.SpecificsManager.occurrences.length;
    foundSpecificIndexes = [];
    for (i = j = 0, ref = this.length; 0 <= ref ? j < ref : j > ref; i = 0 <= ref ? ++j : --j) {
      if ((this.values[i] != null) && this.values[i] !== hqmf.SpecificsManager.any) {
        foundSpecificIndexes.push(i);
      }
    }
    return foundSpecificIndexes;
  };

  Row.prototype.equals = function(other) {
    var equal, i, j, len, ref, value;
    equal = true;
    equal && (equal = Row.valuesEqual(this.nonSpecificLeftMost, other.nonSpecificLeftMost));
    ref = this.values;
    for (i = j = 0, len = ref.length; j < len; i = ++j) {
      value = ref[i];
      equal && (equal = Row.valuesEqual(value, other.values[i]));
    }
    return equal;
  };

  Row.prototype.intersect = function(other, episodeIndices, options) {
    var allEpisodesAny, i, intersectedRow, isEpisodeOfCare, j, len, ref, result, value;
    if (options == null) {
      options = {};
    }
    if (options.considerLeftMost) {
      if (this.specificLeftMost && other.specificLeftMost && !Row.valuesEqual(this.specificLeftMost, other.specificLeftMost)) {
        return void 0;
      }
      if (this.nonSpecificLeftMost && other.nonSpecificLeftMost && !Row.valuesEqual(this.nonSpecificLeftMost, other.nonSpecificLeftMost)) {
        return void 0;
      }
      intersectedRow = new Row(this.specificLeftMost || other.specificLeftMost, {});
      intersectedRow.nonSpecificLeftMost = this.nonSpecificLeftMost || other.nonSpecificLeftMost;
    } else {
      intersectedRow = new Row(this.specificLeftMost, {});
      intersectedRow.nonSpecificLeftMost = this.nonSpecificLeftMost;
    }
    allEpisodesAny = (episodeIndices != null) && (this.allValuesAny(episodeIndices) || other.allValuesAny(episodeIndices));
    ref = this.values;
    for (i = j = 0, len = ref.length; j < len; i = ++j) {
      value = ref[i];
      isEpisodeOfCare = (episodeIndices != null) && !allEpisodesAny && episodeIndices.indexOf(i) >= 0;
      result = Row.match(value, other.values[i], isEpisodeOfCare);
      if (result != null) {
        intersectedRow.values[i] = result;
      } else {
        return void 0;
      }
    }
    return intersectedRow;
  };

  Row.prototype.allValuesAny = function(indicies) {
    var i, j, len;
    for (j = 0, len = indicies.length; j < len; j++) {
      i = indicies[j];
      if (this.values[i] !== hqmf.SpecificsManager.any) {
        return false;
      }
    }
    return true;
  };

  Row.prototype.groupKeyForLeftMost = function() {
    if (_.isObject(this.specificLeftMost)) {
      return this.groupKey(_(this.specificLeftMost).chain().values().flatten().value());
    } else {
      return this.groupKey([this.specificLeftMost]);
    }
  };

  Row.prototype.groupKey = function(keys) {
    var i, j, keyForGroup, ref, value;
    if (_.isString(keys)) {
      keys = [keys];
    }
    keyForGroup = '';
    for (i = j = 0, ref = this.length; 0 <= ref ? j < ref : j > ref; i = 0 <= ref ? ++j : --j) {
      if (_(keys).include(hqmf.SpecificsManager.keyLookup[i])) {
        keyForGroup += "X_";
      } else {
        value = this.values[i] !== hqmf.SpecificsManager.any ? this.values[i].id : hqmf.SpecificsManager.any;
        keyForGroup += value + "_";
      }
    }
    return keyForGroup;
  };

  Row.match = function(left, right, isEpisodeOfCare) {
    if (left === hqmf.SpecificsManager.any) {
      return this.checkEpisodeOfCare(right, isEpisodeOfCare);
    }
    if (right === hqmf.SpecificsManager.any) {
      return this.checkEpisodeOfCare(left, isEpisodeOfCare);
    }
    if (left.id === right.id) {
      return left;
    }
    return void 0;
  };

  Row.checkEpisodeOfCare = function(value, isEpisodeOfCare) {
    if (isEpisodeOfCare) {
      return hqmf.SpecificsManager.any;
    }
    return value;
  };

  Row.valuesEqual = function(left, right) {
    if ((left == null) && (right == null)) {
      return true;
    }
    if (left == null) {
      return false;
    }
    if (right == null) {
      return false;
    }
    if (left === hqmf.SpecificsManager.any && right === hqmf.SpecificsManager.any) {
      return true;
    }
    if (left.id === right.id) {
      return true;
    }
    return false;
  };

  Row.buildRowsForMatching = function(entryKey, entry, matchesKey, matches) {
    var entryOccurrences, j, k, l, len, len1, len2, match, matchKey, matchKeys, nonSpecificLeftMostRow, nonSpecificLeftMostRows, occurrences, result, rows;
    rows = [];
    for (j = 0, len = matches.length; j < len; j++) {
      match = matches[j];
      matchKeys = (_.isObject(matchesKey) ? matchesKey[match.id] : [matchesKey]);
      if (matchKeys) {
        for (k = 0, len1 = matchKeys.length; k < len1; k++) {
          matchKey = matchKeys[k];
          occurrences = {};
          occurrences[entryKey] = entry;
          if (matchKey != null) {
            occurrences[matchKey] = match;
          }
          rows.push(new Row(entryKey, occurrences));
        }
      } else {
        nonSpecificLeftMostRows = _(matches.specificContext.rows).select(function(r) {
          var ref;
          return ((ref = r.nonSpecificLeftMost) != null ? ref.id : void 0) === match.id;
        });
        entryOccurrences = {};
        entryOccurrences[entryKey] = entry;
        for (l = 0, len2 = nonSpecificLeftMostRows.length; l < len2; l++) {
          nonSpecificLeftMostRow = nonSpecificLeftMostRows[l];
          result = nonSpecificLeftMostRow.intersect(new Row(entryKey, entryOccurrences));
          if (result != null) {
            rows.push(result);
          }
        }
      }
    }
    return rows;
  };

  Row.buildForDataCriteria = function(entryKey, entries) {
    var entry, j, len, occurrences, rows;
    rows = [];
    for (j = 0, len = entries.length; j < len; j++) {
      entry = entries[j];
      occurrences = {};
      occurrences[entryKey] = entry;
      rows.push(new Row(entryKey, occurrences));
    }
    return rows;
  };

  Row.prototype.flattenToIds = function() {
    var j, len, ref, result, value;
    result = [];
    ref = this.values;
    for (j = 0, len = ref.length; j < len; j++) {
      value = ref[j];
      if (value === hqmf.SpecificsManager.any) {
        result.push(value);
      } else {
        result.push(value.id);
      }
    }
    return result;
  };

  Row.prototype.toHashKey = function() {
    var ref;
    return this.flattenToIds().join(",") + ("," + this.specificLeftMost) + ("," + ((ref = this.nonSpecificLeftMost) != null ? ref.id : void 0));
  };

  Row.prototype.leftMostEvents = function() {
    var events, id, j, len, occurrence, occurrences, ref, ref1, specificIndex;
    if (this.nonSpecificLeftMost != null) {
      return [this.nonSpecificLeftMost];
    }
    if ((this.specificLeftMost != null) && _.isString(this.specificLeftMost)) {
      specificIndex = hqmf.SpecificsManager.getColumnIndex(this.specificLeftMost);
      if ((this.values[specificIndex] != null) && this.values[specificIndex] !== hqmf.SpecificsManager.any) {
        return [this.values[specificIndex]];
      }
    }
    if ((this.specificLeftMost != null) && _.isObject(this.specificLeftMost)) {
      events = [];
      ref = this.specificLeftMost;
      for (id in ref) {
        occurrences = ref[id];
        ref1 = _.uniq(occurrences);
        for (j = 0, len = ref1.length; j < len; j++) {
          occurrence = ref1[j];
          specificIndex = hqmf.SpecificsManager.getColumnIndex(occurrence);
          if ((this.values[specificIndex] != null) && this.values[specificIndex] !== hqmf.SpecificsManager.any) {
            events.push(this.values[specificIndex]);
          }
        }
      }
      return events;
    }
    return [];
  };

  return Row;

})();

this.Row = Row;


/*
  Wrap methods to maintain specificContext and specific_occurrence
 */

hQuery.CodedEntryList.prototype.withStatuses = _.wrap(hQuery.CodedEntryList.prototype.withStatuses, function(func, statuses, includeUndefined) {
  var context, occurrence, result;
  if (includeUndefined == null) {
    includeUndefined = true;
  }
  context = this.specificContext;
  occurrence = this.specific_occurrence;
  func = _.bind(func, this);
  result = func(statuses, includeUndefined);
  result.specificContext = context;
  result.specific_occurrence = occurrence;
  return result;
});

hQuery.CodedEntryList.prototype.withNegation = _.wrap(hQuery.CodedEntryList.prototype.withNegation, function(func, codeSet) {
  var context, occurrence, result;
  context = this.specificContext;
  occurrence = this.specific_occurrence;
  func = _.bind(func, this);
  result = func(codeSet);
  result.specificContext = context;
  result.specific_occurrence = occurrence;
  return result;
});

hQuery.CodedEntryList.prototype.withoutNegation = _.wrap(hQuery.CodedEntryList.prototype.withoutNegation, function(func) {
  var context, occurrence, result;
  context = this.specificContext;
  occurrence = this.specific_occurrence;
  func = _.bind(func, this);
  result = func();
  result.specificContext = context;
  result.specific_occurrence = occurrence;
  return result;
});

hQuery.CodedEntryList.prototype.concat = _.wrap(hQuery.CodedEntryList.prototype.concat, function(func, otherEntries) {
  var context, occurrence, result;
  context = this.specificContext;
  occurrence = this.specific_occurrence;
  func = _.bind(func, this);
  result = func(otherEntries);
  result.specificContext = context;
  result.specific_occurrence = occurrence;
  return result;
});

hQuery.CodedEntryList.prototype.match = _.wrap(hQuery.CodedEntryList.prototype.match, function(func, codeSet, start, end, includeNegated) {
  var context, occurrence, result;
  if (includeNegated == null) {
    includeNegated = false;
  }
  context = this.specificContext;
  occurrence = this.specific_occurrence;
  func = _.bind(func, this);
  result = func(codeSet, start, end, includeNegated);
  result.specificContext = context;
  result.specific_occurrence = occurrence;
  return result;
});

// #########################
// ### LIBRARY FUNCTIONS ####
// #########################

var ANYNonNull, ActiveDays, CD, CMD, CONCURRENT, COUNT, CodeList, CrossProduct, DATEDIFF, DATETIMEDIFF, DURING, EACW, EACWS, EAE, EAS, EBCW, EBCWS, EBDU, EBE, EBS, ECW, ECWS, EDU, FIELD_METHOD_UNITS, FIFTH, FIRST, FOURTH, INTERSECT, IVL_PQ, IVL_TS, LAST, MAX, MEDIAN, MIN, OVERLAP, PQ, RECENT, SACW, SACWE, SAE, SAS, SBCW, SBCWE, SBDU, SBE, SBS, SCW, SCWE, SDU, SECOND, SUM, THIRD, TIMEDIFF, TS, UNION, XPRODUCT, adjustBoundsForField, allFalse, allTrue, anyMatchingValue, applySpecificOccurrenceSubset, applySubsetOperator, atLeastOneFalse, atLeastOneTrue, boundAccessor, dateSortAscending, dateSortDescending, denormalizeEvent, denormalizeEventsByLocation, denormalizeEventsByTransfer, evalUnlessShortCircuit, eventAccessor, eventMatchesBounds, eventsMatchBounds, fieldOrContainerValue, filterEventsByCommunicationDirection, filterEventsByField, filterEventsByReference, filterEventsByValue, getCodes, getIVL, getTS, hqmfjs, invokeAll, invokeOne, matchingValue, narrowEventForFacility, selectConcurrent, shiftTimes, uniqueEvents, valueSortAscending, valueSortDescending, withinRange,
  slice = [].slice,
  indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; },
  extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

TS = (function() {
  function TS(hl7ts, inclusive1) {
    var day, hour, minute, month, year;
    this.inclusive = inclusive1 != null ? inclusive1 : false;
    if (hl7ts) {
      year = parseInt(hl7ts.substring(0, 4));
      month = parseInt(hl7ts.substring(4, 6), 10) - 1;
      day = parseInt(hl7ts.substring(6, 8), 10);
      hour = parseInt(hl7ts.substring(8, 10), 10);
      if (isNaN(hour)) {
        hour = 0;
      }
      minute = parseInt(hl7ts.substring(10, 12), 10);
      if (isNaN(minute)) {
        minute = 0;
      }
      this.date = new Date(Date.UTC(year, month, day, hour, minute));
    } else {
      this.date = new Date();
    }
  }

  TS.prototype.add = function(pq) {
    if (pq.unit === "a") {
      this.date.setUTCFullYear(this.date.getUTCFullYear() + pq.value);
    } else if (pq.unit === "mo") {
      this.date.setUTCMonth(this.date.getUTCMonth() + pq.value);
    } else if (pq.unit === "wk") {
      this.date.setUTCDate(this.date.getUTCDate() + (7 * pq.value));
    } else if (pq.unit === "d") {
      this.date.setUTCDate(this.date.getUTCDate() + pq.value);
    } else if (pq.unit === "h") {
      this.date.setUTCHours(this.date.getUTCHours() + pq.value);
    } else if (pq.unit === "min") {
      this.date.setUTCMinutes(this.date.getUTCMinutes() + pq.value);
    } else {
      throw new Error("Unknown time unit: " + pq.unit);
    }
    return this;
  };

  TS.prototype.difference = function(ts, granularity) {
    var earlier, later;
    earlier = later = null;
    if (this.afterOrConcurrent(ts)) {
      earlier = ts.asDate();
      later = this.date;
    } else {
      earlier = this.date;
      later = ts.asDate();
    }
    if ((earlier == null) || (later == null)) {
      return Number.MAX_VALUE;
    }
    if (granularity === "a") {
      return TS.yearsDifference(earlier, later);
    } else if (granularity === "mo") {
      return TS.monthsDifference(earlier, later);
    } else if (granularity === "wk") {
      return TS.weeksDifference(earlier, later);
    } else if (granularity === "d") {
      return TS.daysDifference(earlier, later);
    } else if (granularity === "h") {
      return TS.hoursDifference(earlier, later);
    } else if (granularity === "min") {
      return TS.minutesDifference(earlier, later);
    } else {
      throw new Error("Unknown time unit: " + granularity);
    }
  };

  TS.prototype.asDate = function() {
    return this.date;
  };

  TS.prototype.before = function(other) {
    var a, b, ref;
    if (this.date === null || other.date === null) {
      return false;
    }
    if (other.inclusive) {
      return this.beforeOrConcurrent(other);
    } else {
      ref = TS.dropSeconds(this.date, other.date), a = ref[0], b = ref[1];
      return a.getTime() < b.getTime();
    }
  };

  TS.prototype.after = function(other) {
    var a, b, ref;
    if (this.date === null || other.date === null) {
      return false;
    }
    if (other.inclusive) {
      return this.afterOrConcurrent(other);
    } else {
      ref = TS.dropSeconds(this.date, other.date), a = ref[0], b = ref[1];
      return a.getTime() > b.getTime();
    }
  };

  TS.prototype.equals = function(other) {
    return (this.date === null && other.date === null) || (this.date !== null && other.date !== null && this.date.getTime() === other.date.getTime());
  };

  TS.prototype.beforeOrConcurrent = function(other) {
    var a, b, ref;
    if (this.date === null || other.date === null) {
      return false;
    }
    ref = TS.dropSeconds(this.date, other.date), a = ref[0], b = ref[1];
    return a.getTime() <= b.getTime();
  };

  TS.prototype.afterOrConcurrent = function(other) {
    var a, b, ref;
    if (this.date === null || other.date === null) {
      return false;
    }
    ref = TS.dropSeconds(this.date, other.date), a = ref[0], b = ref[1];
    return a.getTime() >= b.getTime();
  };

  TS.prototype.withinSameMinute = function(other) {
    var a, b, ref;
    ref = TS.dropSeconds(this.date, other.date), a = ref[0], b = ref[1];
    return a.getTime() === b.getTime();
  };

  TS.yearsDifference = function(earlier, later) {
    if (later.getUTCMonth() < earlier.getUTCMonth()) {
      return later.getUTCFullYear() - earlier.getUTCFullYear() - 1;
    } else if (later.getUTCMonth() === earlier.getUTCMonth() && later.getUTCDate() >= earlier.getUTCDate()) {
      return later.getUTCFullYear() - earlier.getUTCFullYear();
    } else if (later.getUTCMonth() === earlier.getUTCMonth() && later.getUTCDate() < earlier.getUTCDate()) {
      return later.getUTCFullYear() - earlier.getUTCFullYear() - 1;
    } else {
      return later.getUTCFullYear() - earlier.getUTCFullYear();
    }
  };

  TS.monthsDifference = function(earlier, later) {
    if (later.getUTCDate() >= earlier.getUTCDate()) {
      return (later.getUTCFullYear() - earlier.getUTCFullYear()) * 12 + later.getUTCMonth() - earlier.getUTCMonth();
    } else {
      return (later.getUTCFullYear() - earlier.getUTCFullYear()) * 12 + later.getUTCMonth() - earlier.getUTCMonth() - 1;
    }
  };

  TS.minutesDifference = function(earlier, later) {
    var e, l, ref;
    ref = TS.dropSeconds(earlier, later), e = ref[0], l = ref[1];
    return Math.floor(((l.getTime() - e.getTime()) / 1000) / 60);
  };

  TS.hoursDifference = function(earlier, later) {
    return Math.floor(TS.minutesDifference(earlier, later) / 60);
  };

  TS.daysDifference = function(earlier, later) {
    var e, l;
    e = new Date(Date.UTC(earlier.getUTCFullYear(), earlier.getUTCMonth(), earlier.getUTCDate()));
    l = new Date(Date.UTC(later.getUTCFullYear(), later.getUTCMonth(), later.getUTCDate()));
    return Math.floor(TS.hoursDifference(e, l) / 24);
  };

  TS.weeksDifference = function(earlier, later) {
    return Math.floor(TS.daysDifference(earlier, later) / 7);
  };

  TS.dropSeconds = function() {
    var noSeconds, timeStamp, timeStamps, timeStampsNoSeconds;
    timeStamps = 1 <= arguments.length ? slice.call(arguments, 0) : [];
    timeStampsNoSeconds = (function() {
      var i, len, results1;
      results1 = [];
      for (i = 0, len = timeStamps.length; i < len; i++) {
        timeStamp = timeStamps[i];
        noSeconds = new Date(timeStamp.getTime());
        noSeconds.setSeconds(0);
        results1.push(noSeconds);
      }
      return results1;
    })();
    return timeStampsNoSeconds;
  };

  return TS;

})();

this.TS = TS;

fieldOrContainerValue = function(value, fieldName, defaultToValue) {
  if (defaultToValue == null) {
    defaultToValue = true;
  }
  if (value != null) {
    if (typeof value[fieldName] === 'function') {
      return value[fieldName]();
    } else if (typeof value[fieldName] !== 'undefined') {
      return value[fieldName];
    } else if ((value.json != null) && typeof value.json[fieldName] !== 'undefined') {
      return value.json[fieldName];
    } else if (defaultToValue) {
      return value;
    } else {
      return null;
    }
  } else {
    return null;
  }
};

this.fieldOrContainerValue = fieldOrContainerValue;

CD = (function() {
  function CD(code1, system) {
    this.code = code1;
    this.system = system;
  }

  CD.prototype.match = function(codeOrHash) {
    var c1, c2, codeToMatch, systemToMatch;
    codeToMatch = fieldOrContainerValue(codeOrHash, 'code');
    systemToMatch = fieldOrContainerValue(codeOrHash, 'codeSystemName', false);
    c1 = hQuery.CodedValue.normalize(codeToMatch);
    c2 = hQuery.CodedValue.normalize(this.code);
    if (this.system && systemToMatch) {
      return c1 === c2 && this.system === systemToMatch;
    } else {
      return c1 === c2;
    }
  };

  return CD;

})();

this.CD = CD;

CodeList = (function() {
  function CodeList(codes1) {
    this.codes = codes1;
  }

  CodeList.prototype.match = function(codeOrHash) {
    var c1, c2, code, codeList, codeSystemName, codeToMatch, i, len, ref, result, systemToMatch;
    codeToMatch = fieldOrContainerValue(codeOrHash, 'code');
    c1 = hQuery.CodedValue.normalize(codeToMatch);
    systemToMatch = fieldOrContainerValue(codeOrHash, 'codeSystemName', false);
    result = false;
    ref = this.codes;
    for (codeSystemName in ref) {
      codeList = ref[codeSystemName];
      for (i = 0, len = codeList.length; i < len; i++) {
        code = codeList[i];
        c2 = hQuery.CodedValue.normalize(code);
        if (codeSystemName && systemToMatch) {
          if (c1 === c2 && codeSystemName === systemToMatch) {
            result = true;
          }
        } else if (c1 === c2) {
          result = true;
        }
      }
    }
    return result;
  };

  return CodeList;

})();

this.CodeList = CodeList;

PQ = (function() {
  function PQ(value1, unit1, inclusive1) {
    this.value = value1;
    this.unit = unit1;
    this.inclusive = inclusive1 != null ? inclusive1 : true;
  }

  PQ.prototype.scalar = function() {
    return this.value;
  };

  PQ.prototype.lessThan = function(scalarOrHash) {
    var val;
    val = fieldOrContainerValue(scalarOrHash, 'scalar');
    if (this.inclusive) {
      return this.lessThanOrEqual(val);
    } else {
      return this.value < val;
    }
  };

  PQ.prototype.greaterThan = function(scalarOrHash) {
    var val;
    val = fieldOrContainerValue(scalarOrHash, 'scalar');
    if (this.inclusive) {
      return this.greaterThanOrEqual(val);
    } else {
      return this.value > val;
    }
  };

  PQ.prototype.lessThanOrEqual = function(scalarOrHash) {
    var val;
    val = fieldOrContainerValue(scalarOrHash, 'scalar');
    return this.value <= val;
  };

  PQ.prototype.greaterThanOrEqual = function(scalarOrHash) {
    var val;
    val = fieldOrContainerValue(scalarOrHash, 'scalar');
    return this.value >= val;
  };

  PQ.prototype.match = function(scalarOrHash) {
    var val;
    val = fieldOrContainerValue(scalarOrHash, 'scalar');
    return this.value === val;
  };

  PQ.prototype.normalizeToMins = function() {
    var TIME_UNITS, TIME_UNITS_MAP;
    TIME_UNITS = {
      a: 'years',
      mo: 'months',
      wk: 'weeks',
      d: 'days',
      h: 'hours',
      min: 'minutes',
      s: 'seconds'
    };
    TIME_UNITS_MAP = {
      a: 365 * 24 * 60,
      mo: 30 * 24 * 60,
      wk: 7 * 24 * 60,
      d: 24 * 60,
      h: 60,
      min: 1,
      s: 1 / 60
    };
    if (TIME_UNITS[this.unit] == null) {
      return;
    }
    return new PQ(this.value * TIME_UNITS_MAP[this.unit], 'min', this.inclusive);
  };

  return PQ;

})();

this.PQ = PQ;

IVL_PQ = (function() {
  function IVL_PQ(low_pq, high_pq) {
    this.low_pq = low_pq;
    this.high_pq = high_pq;
    if (!this.low_pq && !this.high_pq) {
      throw new Error("Must have a lower or upper bound");
    }
    if (this.low_pq && this.low_pq.unit && this.high_pq && this.high_pq.unit && this.low_pq.unit !== this.high_pq.unit) {
      throw new Error("Mismatched low and high units: " + this.low_pq.unit + ", " + this.high_pq.unit);
    }
  }

  IVL_PQ.prototype.unit = function() {
    if (this.low_pq) {
      return this.low_pq.unit;
    } else {
      return this.high_pq.unit;
    }
  };

  IVL_PQ.prototype.match = function(scalarOrHash) {
    var val;
    val = fieldOrContainerValue(scalarOrHash, 'scalar');
    if ((this.low_pq != null) && this.low_pq.constructor === ANYNonNull) {
      return val !== null;
    } else if ((this.high_pq != null) && this.high_pq.constructor === ANYNonNull) {
      return val !== null;
    } else {
      return ((this.low_pq == null) || this.low_pq.lessThan(val)) && ((this.high_pq == null) || this.high_pq.greaterThan(val));
    }
  };

  IVL_PQ.prototype.normalizeToMins = function() {
    var ref, ref1;
    return new IVL_PQ((ref = this.low_pq) != null ? ref.normalizeToMins() : void 0, (ref1 = this.high_pq) != null ? ref1.normalizeToMins() : void 0);
  };

  return IVL_PQ;

})();

this.IVL_PQ = IVL_PQ;

IVL_TS = (function() {
  function IVL_TS(low1, high1) {
    this.low = low1;
    this.high = high1;
  }

  IVL_TS.prototype.match = function(other) {
    var ref, ref1;
    if (other == null) {
      return false;
    }
    other = getTS(other, ((ref = this.low) != null ? ref.inclusive : void 0) || ((ref1 = this.high) != null ? ref1.inclusive : void 0));
    if (this.low && this.low.inclusive && this.high && this.high.inclusive) {
      return this.low.equals(other) && this.high.equals(other);
    } else if (this.low) {
      return this.low.before(other);
    } else if (this.high) {
      return this.high.after(other);
    }
  };

  IVL_TS.prototype.add = function(pq) {
    if (this.low) {
      this.low.add(pq);
    }
    if (this.high) {
      this.high.add(pq);
    }
    return this;
  };

  IVL_TS.prototype.DURING = function(other) {
    return this.SDU(other) && this.EDU(other);
  };

  IVL_TS.prototype.OVERLAP = function(other) {
    if (this.high.date === null && other.high.date === null) {
      return true;
    } else if (this.high.date === null) {
      return !this.SAE(other);
    } else if (other.high.date === null) {
      return !this.EBS(other);
    } else {
      return this.SDU(other) || this.EDU(other) || (this.SBS(other) && this.EAE(other));
    }
  };

  IVL_TS.prototype.CONCURRENT = function(other) {
    return this.SCW(other) && this.ECW(other);
  };

  IVL_TS.prototype.SBS = function(other) {
    if (this.low && other.low) {
      return this.low.before(other.low);
    } else {
      return false;
    }
  };

  IVL_TS.prototype.SAS = function(other) {
    if (this.low && other.low) {
      return this.low.after(other.low);
    } else {
      return false;
    }
  };

  IVL_TS.prototype.SBE = function(other) {
    if (this.low && other.high) {
      return this.low.before(other.high);
    } else {
      return false;
    }
  };

  IVL_TS.prototype.SAE = function(other) {
    if (this.low && other.high) {
      return this.low.after(other.high);
    } else {
      return false;
    }
  };

  IVL_TS.prototype.SDU = function(other) {
    if (this.low && other.low && other.high) {
      return this.low.afterOrConcurrent(other.low) && this.low.beforeOrConcurrent(other.high);
    } else {
      return false;
    }
  };

  IVL_TS.prototype.SBDU = function(other) {
    return this.SBS(other) || this.SDU(other);
  };

  IVL_TS.prototype.SCW = function(other) {
    if (this.low && other.low) {
      return this.low.asDate() && other.low.asDate() && this.low.withinSameMinute(other.low);
    } else {
      return false;
    }
  };

  IVL_TS.prototype.SCWE = function(other) {
    if (this.low && other.high) {
      return this.low.asDate() && other.high.asDate() && this.low.withinSameMinute(other.high);
    } else {
      return false;
    }
  };

  IVL_TS.prototype.SBCW = function(other) {
    return this.SBS(other) || this.SCW(other);
  };

  IVL_TS.prototype.SBCWE = function(other) {
    return this.SBE(other) || this.SCWE(other);
  };

  IVL_TS.prototype.SACW = function(other) {
    return this.SAS(other) || this.SCW(other);
  };

  IVL_TS.prototype.SACWE = function(other) {
    return this.SAE(other) || this.SCWE(other);
  };

  IVL_TS.prototype.EBS = function(other) {
    if (this.high && other.low) {
      return this.high.before(other.low);
    } else {
      return false;
    }
  };

  IVL_TS.prototype.EAS = function(other) {
    if (this.high && other.low) {
      return this.high.after(other.low);
    } else {
      return false;
    }
  };

  IVL_TS.prototype.EBE = function(other) {
    if (this.high && other.high) {
      return this.high.before(other.high);
    } else {
      return false;
    }
  };

  IVL_TS.prototype.EAE = function(other) {
    if (this.high && other.high) {
      return this.high.after(other.high);
    } else {
      return false;
    }
  };

  IVL_TS.prototype.EDU = function(other) {
    if (this.high && other.low && other.high) {
      return this.high.afterOrConcurrent(other.low) && this.high.beforeOrConcurrent(other.high);
    } else {
      return false;
    }
  };

  IVL_TS.prototype.ECW = function(other) {
    if (this.high && other.high) {
      return this.high.asDate() && other.high.asDate() && this.high.withinSameMinute(other.high);
    } else {
      return false;
    }
  };

  IVL_TS.prototype.ECWS = function(other) {
    if (this.high && other.low) {
      return this.high.asDate() && other.low.asDate() && this.high.withinSameMinute(other.low);
    } else {
      return false;
    }
  };

  IVL_TS.prototype.EBDU = function(other) {
    return this.EBS(other) || this.EDU(other);
  };

  IVL_TS.prototype.EBCW = function(other) {
    return this.EBE(other) || this.ECW(other);
  };

  IVL_TS.prototype.EACW = function(other) {
    return this.EAE(other) || this.ECW(other);
  };

  IVL_TS.prototype.EBCWS = function(other) {
    return this.EBS(other) || this.ECWS(other);
  };

  IVL_TS.prototype.EACWS = function(other) {
    return this.EAS(other) || this.ECWS(other);
  };

  IVL_TS.prototype.equals = function(other) {
    return ((this.low === null && other.low === null) || (this.low !== null && this.low.equals(other.low))) && ((this.high === null && other.high === null) || (this.high !== null && this.high.equals(other.high)));
  };

  return IVL_TS;

})();

this.IVL_TS = IVL_TS;

ANYNonNull = (function() {
  function ANYNonNull() {}

  ANYNonNull.prototype.match = function(scalarOrHash) {
    var val;
    val = fieldOrContainerValue(scalarOrHash, 'scalar');
    return val !== null;
  };

  return ANYNonNull;

})();

this.ANYNonNull = ANYNonNull;

invokeOne = function(patient, initialSpecificContext, fn) {
  if (typeof fn.isTrue === 'function' || typeof fn === 'boolean') {
    return fn;
  } else {
    return fn(patient, initialSpecificContext);
  }
};

this.invokeOne = invokeOne;

evalUnlessShortCircuit = function(fn) {
  if (Logger.short_circuit) {
    return fn;
  } else {
    return fn();
  }
};

this.evalUnlessShortCircuit = evalUnlessShortCircuit;

invokeAll = function(patient, initialSpecificContext, fns) {
  var fn, i, len, results1;
  results1 = [];
  for (i = 0, len = fns.length; i < len; i++) {
    fn = fns[i];
    results1.push(invokeOne(patient, initialSpecificContext, fn));
  }
  return results1;
};

this.invokeAll = invokeAll;

atLeastOneTrue = function() {
  var initialSpecificContext, patient, precondition, valueFns;
  precondition = arguments[0], patient = arguments[1], initialSpecificContext = arguments[2], valueFns = 4 <= arguments.length ? slice.call(arguments, 3) : [];
  return evalUnlessShortCircuit(function() {
    var trueValues, value, values;
    values = invokeAll(patient, initialSpecificContext, valueFns);
    trueValues = (function() {
      var i, len, results1;
      results1 = [];
      for (i = 0, len = values.length; i < len; i++) {
        value = values[i];
        if (value && value.isTrue()) {
          results1.push(value);
        }
      }
      return results1;
    })();
    return hqmf.SpecificsManager.unionAll(new Boolean(trueValues.length > 0), values);
  });
};

this.atLeastOneTrue = atLeastOneTrue;

allTrue = function() {
  var initialSpecificContext, patient, precondition, valueFns;
  precondition = arguments[0], patient = arguments[1], initialSpecificContext = arguments[2], valueFns = 4 <= arguments.length ? slice.call(arguments, 3) : [];
  return evalUnlessShortCircuit(function() {
    var i, len, trueValues, value, valueFn, values;
    values = [];
    for (i = 0, len = valueFns.length; i < len; i++) {
      valueFn = valueFns[i];
      value = invokeOne(patient, initialSpecificContext, valueFn);
      if (value.isFalse() && Logger.short_circuit) {
        break;
      }
      values.push(value);
    }
    trueValues = (function() {
      var j, len1, results1;
      results1 = [];
      for (j = 0, len1 = values.length; j < len1; j++) {
        value = values[j];
        if (value && value.isTrue()) {
          results1.push(value);
        }
      }
      return results1;
    })();
    if (trueValues.length === valueFns.length) {
      return hqmf.SpecificsManager.intersectAll(new Boolean(trueValues.length > 0), trueValues);
    } else {
      if (Logger.short_circuit) {
        value = new Boolean(false);
        value.specificContext = hqmf.SpecificsManager.empty();
        return value;
      } else {
        return hqmf.SpecificsManager.intersectAll(new Boolean(false), values);
      }
    }
  });
};

this.allTrue = allTrue;

atLeastOneFalse = function() {
  var initialSpecificContext, patient, precondition, valueFns;
  precondition = arguments[0], patient = arguments[1], initialSpecificContext = arguments[2], valueFns = 4 <= arguments.length ? slice.call(arguments, 3) : [];
  return evalUnlessShortCircuit(function() {
    var hasFalse, i, len, value, valueFn, values;
    values = [];
    hasFalse = false;
    for (i = 0, len = valueFns.length; i < len; i++) {
      valueFn = valueFns[i];
      value = invokeOne(patient, initialSpecificContext, valueFn);
      values.push(value);
      if (value.isFalse()) {
        hasFalse = true;
        if (Logger.short_circuit) {
          break;
        }
      }
    }
    return hqmf.SpecificsManager.intersectAll(new Boolean(values.length > 0 && hasFalse), values, true);
  });
};

this.atLeastOneFalse = atLeastOneFalse;

allFalse = function() {
  var initialSpecificContext, patient, precondition, valueFns;
  precondition = arguments[0], patient = arguments[1], initialSpecificContext = arguments[2], valueFns = 4 <= arguments.length ? slice.call(arguments, 3) : [];
  return evalUnlessShortCircuit(function() {
    var falseValues, value, values;
    values = invokeAll(patient, initialSpecificContext, valueFns);
    falseValues = (function() {
      var i, len, results1;
      results1 = [];
      for (i = 0, len = values.length; i < len; i++) {
        value = values[i];
        if (value.isFalse()) {
          results1.push(value);
        }
      }
      return results1;
    })();
    return hqmf.SpecificsManager.unionAll(new Boolean(falseValues.length > 0 && falseValues.length === values.length), values, true);
  });
};

this.allFalse = allFalse;

matchingValue = function(value, compareTo) {
  return new Boolean(compareTo.match(value));
};

this.matchingValue = matchingValue;

anyMatchingValue = function(event, valueToMatch) {
  var matchingValues, value;
  matchingValues = (function() {
    var i, len, ref, results1;
    ref = event.values();
    results1 = [];
    for (i = 0, len = ref.length; i < len; i++) {
      value = ref[i];
      if (valueToMatch.match(value)) {
        results1.push(value);
      }
    }
    return results1;
  })();
  return matchingValues.length > 0;
};

this.anyMatchingValue = anyMatchingValue;

filterEventsByValue = function(events, value) {
  var event, matchingEvents;
  matchingEvents = (function() {
    var i, len, results1;
    results1 = [];
    for (i = 0, len = events.length; i < len; i++) {
      event = events[i];
      if (anyMatchingValue(event, value)) {
        results1.push(event);
      }
    }
    return results1;
  })();
  return hqmf.SpecificsManager.maintainSpecifics(matchingEvents, events);
};

this.filterEventsByValue = filterEventsByValue;

filterEventsByField = function(events, field, value) {
  var attr, event, i, j, len, len1, ref, respondingEvents, result, unit;
  respondingEvents = (function() {
    var i, len, results1;
    results1 = [];
    for (i = 0, len = events.length; i < len; i++) {
      event = events[i];
      if (event.respondTo(field)) {
        results1.push(event);
      }
    }
    return results1;
  })();
  if (value.unit != null) {
    unit = value.unit();
  }
  result = [];
  for (i = 0, len = respondingEvents.length; i < len; i++) {
    event = respondingEvents[i];
    if (event[field](unit) instanceof Array) {
      ref = event[field](unit);
      for (j = 0, len1 = ref.length; j < len1; j++) {
        attr = ref[j];
        if (value.match(attr)) {
          result.push(event);
          break;
        }
      }
    } else {
      if (value.match(event[field](unit))) {
        result.push(event);
      }
    }
  }
  return hqmf.SpecificsManager.maintainSpecifics(result, events);
};

this.filterEventsByField = filterEventsByField;

filterEventsByCommunicationDirection = function(events, value) {
  var event, matchingEvents;
  matchingEvents = (function() {
    var i, len, results1;
    results1 = [];
    for (i = 0, len = events.length; i < len; i++) {
      event = events[i];
      if (event.json.direction === value) {
        results1.push(event);
      }
    }
    return results1;
  })();
  return hqmf.SpecificsManager.maintainSpecifics(matchingEvents, events);
};

this.filterEventsByCommunicationDirection = filterEventsByCommunicationDirection;

filterEventsByReference = function(events, type, possibles) {
  var event, i, item, len, matching, matchingPossibles, possible, referencedIds, specificContext;
  specificContext = new hqmf.SpecificOccurrence();
  matching = [];
  matching.specific_occurrence = events.specific_occrrence;
  for (i = 0, len = events.length; i < len; i++) {
    event = events[i];
    if (!(event.respondTo("references"))) {
      continue;
    }
    referencedIds = (function() {
      var j, len1, ref, results1;
      ref = event.referencesByType(type);
      results1 = [];
      for (j = 0, len1 = ref.length; j < len1; j++) {
        item = ref[j];
        results1.push(item.referenced_id().valueOf());
      }
      return results1;
    })();
    matchingPossibles = (function() {
      var j, len1, ref, results1;
      results1 = [];
      for (j = 0, len1 = possibles.length; j < len1; j++) {
        possible = possibles[j];
        if (ref = possible.id.valueOf(), indexOf.call(referencedIds, ref) >= 0) {
          results1.push(possible);
        }
      }
      return results1;
    })();
    if (matchingPossibles.length > 0) {
      matching.push(event);
    }
    if ((events.specific_occurrence != null) || (possibles.specific_occurrence != null)) {
      specificContext.addRows(Row.buildRowsForMatching(events.specific_occurrence, event, possibles.specific_occurrence, matchingPossibles));
    } else {
      specificContext.addIdentityRow();
    }
  }
  matching.specificContext = specificContext.finalizeEvents(events.specificContext, possibles.specificContext);
  return matching;
};

this.filterEventsByReference = filterEventsByReference;

shiftTimes = function(event, field) {
  var shiftedEvent;
  shiftedEvent = new event.constructor(event.json);
  shiftedEvent.setTimestamp(shiftedEvent[field]());
  return shiftedEvent;
};

this.shiftTimes = shiftTimes;

adjustBoundsForField = function(events, field) {
  var event, shiftedEvents, validEvents;
  validEvents = (function() {
    var i, len, results1;
    results1 = [];
    for (i = 0, len = events.length; i < len; i++) {
      event = events[i];
      if (event.respondTo(field) && event[field]()) {
        results1.push(event);
      }
    }
    return results1;
  })();
  shiftedEvents = (function() {
    var i, len, results1;
    results1 = [];
    for (i = 0, len = validEvents.length; i < len; i++) {
      event = validEvents[i];
      results1.push(shiftTimes(event, field));
    }
    return results1;
  })();
  return hqmf.SpecificsManager.maintainSpecifics(shiftedEvents, events);
};

this.adjustBoundsForField = adjustBoundsForField;

narrowEventForFacility = function(event, facility) {
  var narrowed;
  narrowed = new event.constructor(event.json);
  return narrowed;
};

this.narrowEventForFacility = narrowEventForFacility;

denormalizeEvent = function(event) {
  var facility, narrowed;
  return narrowed = (function() {
    var i, len, ref, results1;
    ref = [event.facility];
    results1 = [];
    for (i = 0, len = ref.length; i < len; i++) {
      facility = ref[i];
      results1.push(narrowEventForFacility(event, facility));
    }
    return results1;
  })();
};

this.denormalizeEvent = denormalizeEvent;

denormalizeEventsByLocation = function(events, field) {
  var denormalizedEvents, event, ref, respondingEvents, result;
  respondingEvents = (function() {
    var i, len, results1;
    results1 = [];
    for (i = 0, len = events.length; i < len; i++) {
      event = events[i];
      if (event.respondTo("facility") && event.facility()) {
        results1.push(event);
      }
    }
    return results1;
  })();
  denormalizedEvents = (function() {
    var i, len, results1;
    results1 = [];
    for (i = 0, len = respondingEvents.length; i < len; i++) {
      event = respondingEvents[i];
      results1.push(denormalizeEvent(event));
    }
    return results1;
  })();
  denormalizedEvents = (ref = []).concat.apply(ref, denormalizedEvents);
  result = adjustBoundsForField(denormalizedEvents, field);
  return hqmf.SpecificsManager.maintainSpecifics(result, events);
};

this.denormalizeEventsByLocation = denormalizeEventsByLocation;

denormalizeEventsByTransfer = function(events, field) {
  var denormalizedEvents, event, ref, respondingEvents, result;
  respondingEvents = (function() {
    var i, len, results1;
    results1 = [];
    for (i = 0, len = events.length; i < len; i++) {
      event = events[i];
      if (event.respondTo(field) && event[field]()) {
        results1.push(event);
      }
    }
    return results1;
  })();
  denormalizedEvents = (function() {
    var i, len, results1;
    results1 = [];
    for (i = 0, len = respondingEvents.length; i < len; i++) {
      event = respondingEvents[i];
      results1.push(denormalizeEvent(event));
    }
    return results1;
  })();
  denormalizedEvents = (ref = []).concat.apply(ref, denormalizedEvents);
  result = adjustBoundsForField(denormalizedEvents, 'transferTime');
  return hqmf.SpecificsManager.maintainSpecifics(result, events);
};

this.denormalizeEventsByTransfer = denormalizeEventsByTransfer;

getCodes = function(oid) {
  var codes;
  codes = OidDictionary[oid];
  if (codes == null) {
    throw new Error("value set oid could not be found: " + oid);
  }
  return codes;
};

this.getCodes = getCodes;

CrossProduct = (function(superClass) {
  extend(CrossProduct, superClass);

  function CrossProduct(allEventLists) {
    var event, eventList, i, j, len, len1;
    CrossProduct.__super__.constructor.call(this);
    this.eventLists = [];
    this.specific_occurrence = {};
    for (i = 0, len = allEventLists.length; i < len; i++) {
      eventList = allEventLists[i];
      this.eventLists.push(eventList);
      for (j = 0, len1 = eventList.length; j < len1; j++) {
        event = eventList[j];
        this.push(event);
        if (eventList.specific_occurrence) {
          this.specific_occurrence[event.id] = eventList.specific_occurrence;
        }
      }
    }
  }

  CrossProduct.prototype.listCount = function() {
    return this.eventLists.length;
  };

  CrossProduct.prototype.childList = function(index) {
    return this.eventLists[index];
  };

  CrossProduct.prototype.intersect = function() {
    var currentIds, i, index, ref, result;
    result = this.childList(0) || [];
    for (index = i = 1, ref = this.listCount(); i < ref; index = i += 1) {
      currentIds = this.childList(index).map(function(event) {
        return event.id;
      });
      result = result.filter(function(event) {
        return currentIds.indexOf(event.id) >= 0;
      });
    }
    return result;
  };

  return CrossProduct;

})(Array);

XPRODUCT = function() {
  var eventLists;
  eventLists = 1 <= arguments.length ? slice.call(arguments, 0) : [];
  return hqmf.SpecificsManager.intersectAll(new CrossProduct(eventLists), eventLists, false, null, {
    considerLeftMost: true
  });
};

this.XPRODUCT = XPRODUCT;

UNION = function() {
  var event, eventList, eventLists, i, id, j, len, len1, name, occurrences, ref, specific_occurrence, union;
  eventLists = 1 <= arguments.length ? slice.call(arguments, 0) : [];
  union = [];
  specific_occurrence = {};
  for (i = 0, len = eventLists.length; i < len; i++) {
    eventList = eventLists[i];
    for (j = 0, len1 = eventList.length; j < len1; j++) {
      event = eventList[j];
      if (eventList.specific_occurrence) {
        if (_.isObject(eventList.specific_occurrence)) {
          ref = eventList.specific_occurrence;
          for (id in ref) {
            occurrences = ref[id];
            specific_occurrence[id] || (specific_occurrence[id] = []);
            specific_occurrence[id] = _.uniq(specific_occurrence[id].concat(occurrences));
          }
        } else {
          specific_occurrence[name = event.id] || (specific_occurrence[name] = []);
          specific_occurrence[event.id].push(eventList.specific_occurrence);
        }
      }
      union.push(event);
    }
  }
  if (!_.isEmpty(specific_occurrence)) {
    union.specific_occurrence = specific_occurrence;
  }
  return hqmf.SpecificsManager.unionAll(union, eventLists);
};

this.UNION = UNION;

INTERSECT = function() {
  var eventLists, events;
  eventLists = 1 <= arguments.length ? slice.call(arguments, 0) : [];
  events = hqmf.SpecificsManager.intersectAll((new CrossProduct(eventLists)).intersect(), eventLists, false, null, {
    considerLeftMost: true
  });
  events.specificContext = events.specificContext.filterSpecificsAgainstEvents(events);
  return events;
};

this.INTERSECT = INTERSECT;

COUNT = function(events, range) {
  var count, result;
  count = events.length;
  result = new Boolean(range.match(count));
  return applySpecificOccurrenceSubset('COUNT', hqmf.SpecificsManager.maintainSpecifics(result, events), range);
};

this.COUNT = COUNT;

getIVL = function(eventOrTimeStamp) {
  var ts;
  if (eventOrTimeStamp.asIVL_TS) {
    return eventOrTimeStamp.asIVL_TS();
  } else {
    ts = new TS();
    ts.date = eventOrTimeStamp;
    return new IVL_TS(ts, ts);
  }
};

this.getIVL = getIVL;

getTS = function(date, inclusive) {
  var ts;
  if (inclusive == null) {
    inclusive = false;
  }
  if (date.asDate) {
    return date;
  } else {
    ts = new TS(null, inclusive);
    ts.date = date;
    return ts;
  }
};

this.getTS = getTS;

eventAccessor = {
  'DURING': 'low',
  'OVERLAP': 'low',
  'SBS': 'low',
  'SAS': 'low',
  'SBE': 'low',
  'SAE': 'low',
  'EBS': 'high',
  'EAS': 'high',
  'EBE': 'high',
  'EAE': 'high',
  'SDU': 'low',
  'EDU': 'high',
  'ECW': 'high',
  'SCW': 'low',
  'ECWS': 'high',
  'SCWE': 'low',
  'SBCW': 'low',
  'SBCWE': 'low',
  'SACW': 'low',
  'SACWE': 'low',
  'SBDU': 'low',
  'EBCW': 'high',
  'EBCWS': 'high',
  'EACW': 'high',
  'EACWS': 'high',
  'EADU': 'high',
  'CONCURRENT': 'low',
  'DATEDIFF': 'low'
};

boundAccessor = {
  'DURING': 'low',
  'OVERLAP': 'low',
  'SBS': 'low',
  'SAS': 'low',
  'SBE': 'high',
  'SAE': 'high',
  'EBS': 'low',
  'EAS': 'low',
  'EBE': 'high',
  'EAE': 'high',
  'SDU': 'low',
  'EDU': 'low',
  'ECW': 'high',
  'SCW': 'low',
  'ECWS': 'low',
  'SCWE': 'high',
  'SBCW': 'low',
  'SBCWE': 'high',
  'SACW': 'low',
  'SACWE': 'high',
  'SBDU': 'high',
  'EBCW': 'high',
  'EBCWS': 'low',
  'EACW': 'high',
  'EACWS': 'low',
  'EADU': 'low',
  'CONCURRENT': 'low',
  'DATEDIFF': 'low'
};

withinRange = function(method, eventIVL, boundIVL, range) {
  var boundTS, eventTS;
  eventTS = eventIVL[eventAccessor[method]];
  boundTS = boundIVL[boundAccessor[method]];
  return range.match(eventTS.difference(boundTS, range.unit()));
};

this.withinRange = withinRange;

eventMatchesBounds = function(event, bounds, methodName, range) {
  var bound, boundIVL, boundList, currentMatches, eventIVL, i, len, matchingBounds, ref, result;
  if (bounds.eventLists) {
    matchingBounds = [];
    ref = bounds.eventLists;
    for (i = 0, len = ref.length; i < len; i++) {
      boundList = ref[i];
      currentMatches = eventMatchesBounds(event, boundList, methodName, range);
      if (currentMatches.length === 0) {
        return [];
      }
      matchingBounds = matchingBounds.concat(currentMatches);
    }
    return hqmf.SpecificsManager.maintainSpecifics(matchingBounds, bounds);
  } else {
    eventIVL = getIVL(event);
    matchingBounds = (function() {
      var j, len1, results1;
      results1 = [];
      for (j = 0, len1 = bounds.length; j < len1; j++) {
        bound = bounds[j];
        if ((boundIVL = getIVL(bound), result = eventIVL[methodName](boundIVL), result && range ? result && (result = withinRange(methodName, eventIVL, boundIVL, range)) : void 0, result)) {
          results1.push(bound);
        }
      }
      return results1;
    })();
    return hqmf.SpecificsManager.maintainSpecifics(matchingBounds, bounds);
  }
};

this.eventMatchesBounds = eventMatchesBounds;

eventsMatchBounds = function(events, bounds, methodName, range) {
  var event, hasSpecificOccurrence, i, len, matchingBounds, matchingEvents, ref, specificContext;
  if (bounds.length === void 0) {
    bounds = [bounds];
  }
  if (events.length === void 0) {
    events = [events];
  }
  specificContext = new hqmf.SpecificOccurrence();
  hasSpecificOccurrence = (events.specific_occurrence != null) || (bounds.specific_occurrence != null) || ((ref = bounds.specificContext) != null ? ref.hasSpecifics() : void 0);
  matchingEvents = [];
  matchingEvents.specific_occurrence = events.specific_occurrence;
  for (i = 0, len = events.length; i < len; i++) {
    event = events[i];
    if (!event) {
      continue;
    }
    matchingBounds = eventMatchesBounds(event, bounds, methodName, range);
    if (matchingBounds.length > 0) {
      matchingEvents.push(event);
    }
    if (hasSpecificOccurrence) {
      matchingEvents.specific_occurrence = events.specific_occurrence;
      specificContext.addRows(Row.buildRowsForMatching(events.specific_occurrence, event, bounds.specific_occurrence, matchingBounds));
    } else {
      specificContext.addIdentityRow();
    }
  }
  matchingEvents.specificContext = specificContext.finalizeEvents(events.specificContext, bounds.specificContext);
  return matchingEvents;
};

this.eventsMatchBounds = eventsMatchBounds;

DURING = function(events, bounds, offset) {
  return eventsMatchBounds(events, bounds, "DURING", offset);
};

this.DURING = DURING;

OVERLAP = function(events, bounds, offset) {
  return eventsMatchBounds(events, bounds, "OVERLAP", offset);
};

this.OVERLAP = OVERLAP;

SBS = function(events, bounds, offset) {
  return eventsMatchBounds(events, bounds, "SBS", offset);
};

this.SBS = SBS;

SAS = function(events, bounds, offset) {
  return eventsMatchBounds(events, bounds, "SAS", offset);
};

this.SAS = SAS;

SBE = function(events, bounds, offset) {
  return eventsMatchBounds(events, bounds, "SBE", offset);
};

this.SBE = SBE;

SAE = function(events, bounds, offset) {
  return eventsMatchBounds(events, bounds, "SAE", offset);
};

this.SAE = SAE;

EBS = function(events, bounds, offset) {
  return eventsMatchBounds(events, bounds, "EBS", offset);
};

this.EBS = EBS;

EAS = function(events, bounds, offset) {
  return eventsMatchBounds(events, bounds, "EAS", offset);
};

this.EAS = EAS;

EBE = function(events, bounds, offset) {
  return eventsMatchBounds(events, bounds, "EBE", offset);
};

this.EBE = EBE;

EAE = function(events, bounds, offset) {
  return eventsMatchBounds(events, bounds, "EAE", offset);
};

this.EAE = EAE;

SDU = function(events, bounds, offset) {
  return eventsMatchBounds(events, bounds, "SDU", offset);
};

this.SDU = SDU;

EDU = function(events, bounds, offset) {
  return eventsMatchBounds(events, bounds, "EDU", offset);
};

this.EDU = EDU;

ECW = function(events, bounds, offset) {
  return eventsMatchBounds(events, bounds, "ECW", offset);
};

this.ECW = ECW;

SCW = function(events, bounds, offset) {
  return eventsMatchBounds(events, bounds, "SCW", offset);
};

this.SCW = SCW;

ECWS = function(events, bounds, offset) {
  return eventsMatchBounds(events, bounds, "ECWS", offset);
};

this.ECWS = ECWS;

SCWE = function(events, bounds, offset) {
  return eventsMatchBounds(events, bounds, "SCWE", offset);
};

this.SCWE = SCWE;

EBDU = function(events, bounds, offset) {
  return eventsMatchBounds(events, bounds, "EBDU", offset);
};

this.EBDU = EBDU;

EBCW = function(events, bounds, offset) {
  return eventsMatchBounds(events, bounds, "EBCW", offset);
};

this.EBCW = EBCW;

EACW = function(events, bounds, offset) {
  return eventsMatchBounds(events, bounds, "EACW", offset);
};

this.EACW = EACW;

EBCWS = function(events, bounds, offset) {
  return eventsMatchBounds(events, bounds, "EBCWS", offset);
};

this.EBCWS = EBCWS;

EACWS = function(events, bounds, offset) {
  return eventsMatchBounds(events, bounds, "EACWS", offset);
};

this.EACWS = EACWS;

SBDU = function(events, bounds, offset) {
  return eventsMatchBounds(events, bounds, "SBDU", offset);
};

this.SBDU = SBDU;

SBCW = function(events, bounds, offset) {
  return eventsMatchBounds(events, bounds, "SBCW", offset);
};

this.SBCW = SBCW;

SBCWE = function(events, bounds, offset) {
  return eventsMatchBounds(events, bounds, "SBCWE", offset);
};

this.SBCWE = SBCWE;

SACW = function(events, bounds, offset) {
  return eventsMatchBounds(events, bounds, "SACW", offset);
};

this.SACW = SACW;

SACWE = function(events, bounds, offset) {
  return eventsMatchBounds(events, bounds, "SACWE", offset);
};

this.SACWE = SACWE;

CONCURRENT = function(events, bounds, offset) {
  return eventsMatchBounds(events, bounds, "CONCURRENT", offset);
};

this.CONCURRENT = CONCURRENT;

dateSortDescending = function(a, b) {
  return b.timeStamp().getTime() - a.timeStamp().getTime();
};

this.dateSortDescending = dateSortDescending;

dateSortAscending = function(a, b) {
  return a.timeStamp().getTime() - b.timeStamp().getTime();
};

this.dateSortAscending = dateSortAscending;

applySpecificOccurrenceSubset = function(operator, result, range, fields) {
  if ((result.specificContext != null)) {
    if ((range != null)) {
      result.specificContext = result.specificContext[operator](range, fields);
    } else {
      result.specificContext = result.specificContext[operator]();
    }
  }
  return result;
};

uniqueEvents = function(events) {
  var event, hash, i, len;
  hash = {};
  for (i = 0, len = events.length; i < len; i++) {
    event = events[i];
    hash[event.id] = event;
  }
  return _.values(hash);
};

this.uniqueEvents = uniqueEvents;

selectConcurrent = function(target, events) {
  var result;
  return uniqueEvents((function() {
    var i, len, results1;
    results1 = [];
    for (i = 0, len = events.length; i < len; i++) {
      result = events[i];
      if (target.timeStamp().getTime() === result.timeStamp().getTime()) {
        results1.push(result);
      }
    }
    return results1;
  })());
};

this.selectConcurrent = selectConcurrent;

applySubsetOperator = function(operatorName, events, sortFunction, subsetIndex) {
  var result;
  if (events.specificContext && events.specificContext.hasSpecifics()) {
    events.specificContext = events.specificContext[operatorName]();
    return hqmf.SpecificsManager.filterEventsAgainstSpecifics(events);
  } else {
    result = [];
    if (events.length > subsetIndex) {
      result = selectConcurrent(events.sort(sortFunction)[subsetIndex], events);
    }
    hqmf.SpecificsManager.maintainSpecifics(result, events);
    return result;
  }
};

FIRST = function(events) {
  return applySubsetOperator('FIRST', events, dateSortAscending, 0);
};

this.FIRST = FIRST;

SECOND = function(events) {
  return applySubsetOperator('SECOND', events, dateSortAscending, 1);
};

this.SECOND = SECOND;

THIRD = function(events) {
  return applySubsetOperator('THIRD', events, dateSortAscending, 2);
};

this.THIRD = THIRD;

FOURTH = function(events) {
  return applySubsetOperator('FOURTH', events, dateSortAscending, 3);
};

this.FOURTH = FOURTH;

FIFTH = function(events) {
  return applySubsetOperator('FIFTH', events, dateSortAscending, 4);
};

this.FIFTH = FIFTH;

RECENT = function(events) {
  return applySubsetOperator('RECENT', events, dateSortDescending, 0);
};

this.RECENT = RECENT;

LAST = function(events) {
  return RECENT(events);
};

this.LAST = LAST;

valueSortDescending = function(a, b) {
  var va, vb;
  va = vb = 2e308;
  if (a.value) {
    va = a.value()["scalar"];
  }
  if (b.value) {
    vb = b.value()["scalar"];
  }
  if (va === vb) {
    return 0;
  } else {
    return vb - va;
  }
};

this.valueSortDescending = valueSortDescending;

valueSortAscending = function(a, b) {
  var va, vb;
  va = vb = 2e308;
  if (a.value) {
    va = a.value()["scalar"];
  }
  if (b.value) {
    vb = b.value()["scalar"];
  }
  if (va === vb) {
    return 0;
  } else {
    return va - vb;
  }
};

this.valueSortAscending = valueSortAscending;

FIELD_METHOD_UNITS = {
  'cumulativeMedicationDuration': 'd',
  'lengthOfStay': 'd'
};

MIN = function(events, range, fields) {
  var minValue, result;
  minValue = 2e308;
  if (events.length > 0) {
    minValue = events.sort(valueSortAscending)[0].value()["scalar"];
  }
  result = new Boolean(range.match(minValue));
  return applySpecificOccurrenceSubset('MIN', hqmf.SpecificsManager.maintainSpecifics(result, events), range, fields);
};

this.MIN = MIN;

MAX = function(events, range, fields) {
  var maxValue, result;
  maxValue = -2e308;
  if (events.length > 0) {
    maxValue = events.sort(valueSortDescending)[0].value()["scalar"];
  }
  result = new Boolean(range.match(maxValue));
  return applySpecificOccurrenceSubset('MAX', hqmf.SpecificsManager.maintainSpecifics(result, events), range, fields);
};

this.MAX = MAX;

SUM = function(events, range, initialSpecificContext, fields) {
  var comparison, event, field, i, j, len, len1, result, sum, unit;
  sum = 0;
  comparison = range;
  field = fields != null ? fields[0] : void 0;
  if (field === 'result') {
    field = 'values';
  }
  if (events.length > 0) {
    if (field) {
      unit = FIELD_METHOD_UNITS[field] || 'd';
      if (field === 'values') {
        for (i = 0, len = events.length; i < len; i++) {
          event = events[i];
          sum += event[field]()['scalar'];
        }
      } else {
        for (j = 0, len1 = events.length; j < len1; j++) {
          event = events[j];
          sum += event[field]();
        }
        sum = (new PQ(sum, unit, true)).normalizeToMins();
        comparison = comparison.normalizeToMins();
      }
    }
  }
  result = new Boolean(comparison.match(sum));
  return applySpecificOccurrenceSubset('SUM', hqmf.SpecificsManager.maintainSpecifics(result, events), range, fields);
};

this.SUM = SUM;

MEDIAN = function(events, range, initialSpecificContext, fields) {
  var comparison, event, field, median, result, sorted, unit, values;
  median = 2e308;
  comparison = range;
  field = fields != null ? fields[0] : void 0;
  if (field === 'result') {
    field = 'values';
  }
  if (events.length > 0) {
    if (field) {
      unit = FIELD_METHOD_UNITS[field] || 'd';
      if (field === 'values') {
        values = (function() {
          var i, len, results1;
          results1 = [];
          for (i = 0, len = events.length; i < len; i++) {
            event = events[i];
            results1.push(event[field]()['scalar']);
          }
          return results1;
        })();
      } else {
        values = (function() {
          var i, len, results1;
          results1 = [];
          for (i = 0, len = events.length; i < len; i++) {
            event = events[i];
            results1.push(event[field]());
          }
          return results1;
        })();
      }
      sorted = _.clone(values).sort(function(f, s) {
        return f - s;
      });
      median = sorted.length % 2 ? sorted[Math.floor(sorted.length / 2)] : (sorted[sorted.length / 2 - 1] + sorted[sorted.length / 2]) / 2;
      if (field !== 'values') {
        median = (new PQ(median, unit, true)).normalizeToMins();
        comparison = comparison.normalizeToMins();
      }
    }
  }
  result = new Boolean(comparison.match(median));
  return applySpecificOccurrenceSubset('MEDIAN', hqmf.SpecificsManager.maintainSpecifics(result, events), range, fields);
};

this.MEDIAN = MEDIAN;

DATEDIFF = function(events, range) {
  if (events.length < 2) {
    return hqmf.SpecificsManager.maintainSpecifics(new Boolean(false), events);
  }
  events = events.sort(dateSortAscending);
  return hqmf.SpecificsManager.maintainSpecifics(new Boolean(withinRange('DATEDIFF', getIVL(events[0]), getIVL(events[events.length - 1]), range)), events);
};

this.DATEDIFF = DATEDIFF;

TIMEDIFF = function(events, range, initialSpecificContext) {
  var event, event1, event2, eventIndex1, eventIndex2, eventList1, eventList2, eventMap1, eventMap2, i, j, k, len, len1, len2, ref, results, row, shiftedEvent1, shiftedEvent2;
  if (events.listCount() !== 2) {
    if (events.length >= 2) {
      event1 = events.sort(dateSortAscending)[0];
      event2 = events.sort(dateSortAscending)[events.length - 1];
      return [event1.asTS().difference(event2.asTS(), 'min')];
    } else {
      throw new Error("TIMEDIFF can only process 2 lists of events");
    }
  }
  eventList1 = events.childList(0);
  eventList2 = events.childList(1);
  if (eventList1.specific_occurrence) {
    eventIndex1 = hqmf.SpecificsManager.getColumnIndex(eventList1.specific_occurrence);
  }
  if (eventList2.specific_occurrence) {
    eventIndex2 = hqmf.SpecificsManager.getColumnIndex(eventList2.specific_occurrence);
  }
  if ((eventIndex1 != null) && (eventIndex2 != null)) {
    eventMap1 = {};
    eventMap2 = {};
    for (i = 0, len = eventList1.length; i < len; i++) {
      event = eventList1[i];
      eventMap1[event.id] = event;
    }
    for (j = 0, len1 = eventList2.length; j < len1; j++) {
      event = eventList2[j];
      eventMap2[event.id] = event;
    }
    results = [];
    ref = initialSpecificContext.rows;
    for (k = 0, len2 = ref.length; k < len2; k++) {
      row = ref[k];
      event1 = row.values[eventIndex1];
      event2 = row.values[eventIndex2];
      if (event1 && event2 && event1 !== hqmf.SpecificsManager.any && event2 !== hqmf.SpecificsManager.any) {
        shiftedEvent1 = eventMap1[event1.id];
        shiftedEvent2 = eventMap2[event2.id];
        if (shiftedEvent1 && shiftedEvent2) {
          results.push(shiftedEvent1.asTS().difference(shiftedEvent2.asTS(), 'min'));
        }
      }
    }
  } else {
    if (eventList1.length > 0 && eventList2.length > 0) {
      event1 = eventList1.sort(dateSortAscending)[0];
      event2 = eventList2.sort(dateSortAscending)[eventList2.length - 1];
      results = [event1.asTS().difference(event2.asTS(), 'min')];
    }
  }
  return results;
};

this.TIMEDIFF = TIMEDIFF;

DATETIMEDIFF = function(events, range, initialSpecificContext) {
  if (range) {
    return DATEDIFF(events, range);
  } else {
    return TIMEDIFF(events, range, initialSpecificContext);
  }
};

this.DATETIMEDIFF = DATETIMEDIFF;

ActiveDays = (function() {
  function ActiveDays() {
    this.active_days = [];
  }

  ActiveDays.prototype.reset = function() {
    return this.active_days = [];
  };

  ActiveDays.prototype.add_ivlts = function(ivlts) {
    return this.add_range(ivlts.low, ivlts.high);
  };

  ActiveDays.prototype.add_range = function(low, high) {
    var days, end, start;
    start = this.as_date(low);
    end = this.as_date(high);
    days = (end.getTime() - start.getTime()) / (1000 * 60 * 60 * 24);
    days += 1;
    return this.add_days_from(start, days);
  };

  ActiveDays.prototype.add_days_from = function(start, number_of_days) {
    var diff, i, ref, results1, x;
    results1 = [];
    for (x = i = 0, ref = number_of_days - 1; 0 <= ref ? i <= ref : i >= ref; x = 0 <= ref ? ++i : --i) {
      diff = (1000 * 60 * 60 * 24) * x;
      results1.push(this.add_date(new Date(start.getTime() + diff)));
    }
    return results1;
  };

  ActiveDays.prototype.add_date = function(_date) {
    var date, formated_date;
    date = this.as_date(_date);
    formated_date = this.format_date(date);
    if (this.active_days[formated_date]) {
      return this.active_days[formated_date]["count"] += 1;
    } else {
      return this.active_days[formated_date] = {
        date: formated_date,
        count: 1
      };
    }
  };

  ActiveDays.prototype.days_active = function(low, high) {
    var days, end, formated_end, formated_start, start;
    start = this.as_date(low);
    end = this.as_date(high);
    formated_start = this.format_date(start);
    formated_end = this.format_date(end);
    days = this.active_days.slice(formated_start, formated_end + 1).filter(function(e) {
      return e;
    });
    return days;
  };

  ActiveDays.prototype.format_date = function(date) {
    var day, ds, month;
    ds = "" + date.getFullYear();
    month = date.getMonth() + 1;
    day = date.getDate();
    ds += month < 10 ? "0" + month : month;
    ds += day < 10 ? "0" + day : day;
    return parseInt(ds);
  };

  ActiveDays.prototype.date_diff = function(low, high) {};

  ActiveDays.prototype.as_date = function(date) {
    if (date instanceof TS) {
      return new Date(date.asDate().getTime());
    } else {
      return new Date(date.getTime());
    }
  };

  ActiveDays.prototype.print_days_in_range = function(low, high) {
    var end, formated_end, formated_start, i, len, ref, start, str, x;
    start = this.as_date(low);
    end = this.as_date(high);
    formated_start = this.format_date(start);
    formated_end = this.format_date(end);
    str = "Start :" + start.toString() + "\n";
    str += "End :" + end.toString() + "\n";
    str += "Start :" + formated_start + "\n";
    str += "End :" + formated_end + "\n";
    ref = this.days_active(low, high);
    for (i = 0, len = ref.length; i < len; i++) {
      x = ref[i];
      str += "Date: " + x["date"] + "  count: " + x["count"] + "\n";
    }
    return str;
  };

  return ActiveDays;

})();

this.ActiveDays = ActiveDays;

CMD = (function(superClass) {
  extend(CMD, superClass);

  function CMD(medications, calculation_type) {
    var i, len, m, ref;
    this.medications = medications;
    this.calculation_type = calculation_type;
    CMD.__super__.constructor.call(this);
    ref = this.medications;
    for (i = 0, len = ref.length; i < len; i++) {
      m = ref[i];
      this.add_medication(m);
    }
  }

  CMD.prototype.add_medication = function(medication) {
    var dose, dosesPerDay, fh, fills, history, i, j, len, len1, oi, ref, results1, results2, startDate, totalDays;
    dose = medication.dose().scalar;
    dosesPerDay = medication.administrationTiming().dosesPerDay();
    if (this.calculation_type === "order") {
      ref = medication.orderInformation();
      results1 = [];
      for (i = 0, len = ref.length; i < len; i++) {
        oi = ref[i];
        totalDays = oi.quantityOrdered().value() / dose / dosesPerDay;
        if (!isNaN(totalDays)) {
          startDate = new Date(oi.orderDateTime());
          fills = oi.fills() || 1;
          results1.push(this.add_days_from(startDate, totalDays * fills));
        } else {
          results1.push(void 0);
        }
      }
      return results1;
    } else {
      history = medication.fulfillmentHistory();
      results2 = [];
      for (j = 0, len1 = history.length; j < len1; j++) {
        fh = history[j];
        totalDays = fh.quantityDispensed().value() / dose / dosesPerDay;
        if (!isNaN(totalDays)) {
          startDate = new Date(fh.dispenseDate());
          results2.push(this.add_days_from(startDate, totalDays));
        } else {
          results2.push(void 0);
        }
      }
      return results2;
    }
  };

  return CMD;

})(ActiveDays);

this.CMD = CMD;

this.OidDictionary = {};

hqmfjs = hqmfjs || {};

this.hqmfjs = this.hqmfjs || {};

// #########################
// ### PATIENT EXTENSION ####
// #########################

var slice = [].slice;

hQuery.Patient.prototype.procedureResults = function() {
  return this.results().concat(this.vitalSigns()).concat(this.procedures());
};

hQuery.Patient.prototype.allProcedures = function() {
  return this.procedures().concat(this.immunizations()).concat(this.medications());
};

hQuery.Patient.prototype.laboratoryTests = function() {
  return this.results().concat(this.vitalSigns());
};

hQuery.Patient.prototype.allMedications = function() {
  return this.medications().concat(this.immunizations());
};

hQuery.Patient.prototype.allProblems = function() {
  return this.conditions().concat(this.socialHistories()).concat(this.procedures());
};

hQuery.Patient.prototype.allDevices = function() {
  return this.conditions().concat(this.procedures()).concat(this.careGoals()).concat(this.medicalEquipment());
};

hQuery.Patient.prototype.activeDiagnoses = function() {
  return this.conditions().concat(this.socialHistories()).withStatuses(['active']);
};

hQuery.Patient.prototype.inactiveDiagnoses = function() {
  return this.conditions().concat(this.socialHistories()).withStatuses(['inactive']);
};

hQuery.Patient.prototype.resolvedDiagnoses = function() {
  return this.conditions().concat(this.socialHistories()).withStatuses(['resolved']);
};

hQuery.Patient.prototype.getAndCacheEvents = function() {
  var args, fn, key, that;
  key = arguments[0], that = arguments[1], fn = arguments[2], args = 4 <= arguments.length ? slice.call(arguments, 3) : [];
  this.cache || (this.cache = {});
  if (!this.cache[key]) {
    this.cache[key] = fn.apply(that, args);
  }
  return this.cache[key];
};

hQuery.Patient.prototype.getEvents = function(eventCriteria) {
  var cacheKey, codes, events;
  cacheKey = eventCriteria.type;
  events = this.getAndCacheEvents(cacheKey, this, this[eventCriteria.type]);
  if (eventCriteria.statuses && eventCriteria.statuses.length > 0) {
    cacheKey = cacheKey + "_" + String(eventCriteria.statuses);
    events = this.getAndCacheEvents(cacheKey, events, events.withStatuses, eventCriteria.statuses, eventCriteria.includeEventsWithoutStatus);
  }
  cacheKey = cacheKey + "_" + String(eventCriteria.negated) + String(eventCriteria.negationValueSetId);
  if (eventCriteria.negated) {
    codes = getCodes(eventCriteria.negationValueSetId);
    events = this.getAndCacheEvents(cacheKey, events, events.withNegation, codes);
  } else {
    events = this.getAndCacheEvents(cacheKey, events, events.withoutNegation);
  }
  if (eventCriteria.valueSetId) {
    cacheKey = cacheKey + "_" + String(eventCriteria.valueSetId) + "_" + String(eventCriteria.start) + "_" + String(eventCriteria.stop);
    codes = getCodes(eventCriteria.valueSetId);
    events = this.getAndCacheEvents(cacheKey, events, events.match, codes, eventCriteria.start, eventCriteria.stop, true);
  } else if (eventCriteria.valueSet) {
    events = events.match(eventCriteria.valueSet, eventCriteria.start, eventCriteria.stop, true);
  }
  events = events.slice(0);
  if (eventCriteria.specificOccurrence) {
    events.specific_occurrence = eventCriteria.specificOccurrence;
  }
  return events;
};

hQuery.Patient.prototype.deathdate = function() {
  return hQuery.dateFromUtcSeconds(this.json["deathdate"]);
};

hQuery.CodedEntry.prototype.asIVL_TS = function() {
  var tsHigh, tsLow;
  tsLow = new TS();
  tsLow.date = this.startDate() || this.date() || null;
  tsHigh = new TS();
  tsHigh.date = this.endDate() || this.date() || null;
  return new IVL_TS(tsLow, tsHigh);
};

hQuery.CodedEntry.prototype.asTS = function() {
  var ts;
  ts = new TS();
  ts.date = this.timeStamp();
  return ts;
};

hQuery.Encounter.prototype.lengthOfStay = function(unit) {
  var ivl_ts;
  ivl_ts = this.asIVL_TS();
  return ivl_ts.low.difference(ivl_ts.high, unit);
};

hQuery.Encounter.prototype.transferTime = function() {
  var time, transfer;
  transfer = this.json['transferFrom'] || this.json['transferTo'];
  if (transfer) {
    time = transfer.time;
  }
  if (time) {
    return hQuery.dateFromUtcSeconds(time);
  } else {
    if (this.json['transferTo']) {
      return this.endDate();
    } else {
      return this.startDate();
    }
  }
};

hQuery.AdministrationTiming.prototype.dosesPerDay = function() {
  var p;
  p = this.period();
  switch (p.unit()) {
    case "h":
      return 24 / p.value();
    case "d":
      return 1 / p.value();
  }
};

hQuery.Fulfillment.prototype.daysInRange = function(dateRange, dose, dosesPerDay) {
  var endDate, endDiff, high, low, startDiff, totalDays;
  totalDays = this.quantityDispensed().value() / dose / dosesPerDay;
  if (isNaN(totalDays)) {
    totalDays = 0;
  }
  endDate = new Date(this.dispenseDate().getTime() + (totalDays * 60 * 60 * 24 * 1000));
  high = dateRange && dateRange.high ? dateRange.high.asDate() : endDate;
  low = dateRange && dateRange.low ? dateRange.low.asDate() : this.dispenseDate();
  startDiff = TS.daysDifference(low, this.dispenseDate());
  endDiff = TS.daysDifference(endDate, high);
  if (startDiff < 0) {
    totalDays += startDiff;
  }
  if (endDiff < 0) {
    totalDays += endDiff;
  }
  if (isNaN(totalDays) || totalDays < 0) {
    totalDays = 0;
  }
  return totalDays;
};

hQuery.Medication.prototype.fulfillmentTotals = function(dateRange) {
  var dose, dpd;
  dpd = this.administrationTiming().dosesPerDay();
  dose = this.dose().scalar;
  return this.fulfillmentHistory().reduce(function(t, s) {
    return t + s.daysInRange(dateRange, dose, dpd);
  }, 0);
};

hQuery.Medication.prototype.cumulativeMedicationDuration = function(dateRange) {
  var cumulativeMedicationDuration;
  if (this.administrationTiming() && this.dose() && this.json['fulfillmentHistory']) {
    return this.fulfillmentTotals(dateRange);
  } else if (this.administrationTiming() && this.allowedAdministrations()) {
    cumulativeMedicationDuration = this.allowedAdministrations() / this.administrationTiming().dosesPerDay();
    if (isNaN(cumulativeMedicationDuration)) {
      cumulativeMedicationDuration = 0;
    }
    return cumulativeMedicationDuration;
  }
};

hQuery.Reference = (function() {
  function Reference(json) {
    this.json = json;
  }

  Reference.prototype.referenced_id = function() {
    return this.json["referenced_id"];
  };

  Reference.prototype.referenced_type = function() {
    return this.json["reference"];
  };

  Reference.prototype.type = function() {
    return this.json["type"];
  };

  return Reference;

})();

hQuery.CodedEntry.prototype.references = function() {
  var i, len, ref, ref1, results;
  ref1 = this.json["references"] || [];
  results = [];
  for (i = 0, len = ref1.length; i < len; i++) {
    ref = ref1[i];
    results.push(new hQuery.Reference(ref));
  }
  return results;
};

hQuery.CodedEntry.prototype.referencesByType = function(type) {
  var e, i, len, ref1, results;
  ref1 = this.references();
  results = [];
  for (i = 0, len = ref1.length; i < len; i++) {
    e = ref1[i];
    if (e.type() === type) {
      results.push(e);
    }
  }
  return results;
};

hQuery.CodedEntry.prototype.respondTo = function(functionName) {
  return typeof this[functionName] === "function";
};

hQuery.CodedEntryList.prototype.isTrue = function() {
  return this.length !== 0;
};

hQuery.CodedEntryList.prototype.isFalse = function() {
  return this.length === 0;
};

Array.prototype.isTrue = function() {
  return this.length !== 0;
};

Array.prototype.isFalse = function() {
  return this.length === 0;
};

Boolean.prototype.isTrue = (function(_this) {
  return function() {
    return this == true;
  };
})(this);

Boolean.prototype.isFalse = (function(_this) {
  return function() {
    return this == false;
  };
})(this);

// #########################
// ## CUSTOM CALCULATIONS ###
// #########################

var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

this.hqmf.CustomCalc = {};

this.ADE_PRE_V4_ID = ['40280381-454E-C5FA-0145-517F7383016D'];

this.hqmf.CustomCalc.ADE_TTR_OBSERV = function(patient, hqmfjs) {
  var inrReadings;
  if (ADE_PRE_V4_ID.indexOf(hqmfjs.hqmf_id) !== -1) {
    inrReadings = DURING(hqmfjs.LaboratoryTestResultInr(patient), hqmfjs.MeasurePeriod(patient));
  } else {
    inrReadings = DURING(hqmfjs.LaboratoryTestPerformedInr(patient), hqmfjs.MeasurePeriod(patient));
  }
  inrReadings = new hqmf.CustomCalc.PercentTTREntries(inrReadings);
  return [inrReadings.calculatePercentTTR()];
};

this.hqmf.CustomCalc.ADE_TTR_MSRPOPL = function(patient, hqmfjs) {
  var inrReadings;
  if (ADE_PRE_V4_ID.indexOf(hqmfjs.hqmf_id) !== -1) {
    inrReadings = DURING(hqmfjs.LaboratoryTestResultInr(patient), hqmfjs.MeasurePeriod(patient));
  } else {
    inrReadings = DURING(hqmfjs.LaboratoryTestPerformedInr(patient), hqmfjs.MeasurePeriod(patient));
  }
  inrReadings = new hqmf.CustomCalc.PercentTTREntries(inrReadings);
  return new Boolean(inrReadings.calculateNumberOfIntervals() > 1);
};

this.hqmf.CustomCalc.PercentTTREntries = (function(superClass) {
  extend(PercentTTREntries, superClass);

  function PercentTTREntries(events) {
    var clonedEvents, currentClosestValue, date, entriesByDay, entry, event, finalEvents, j, k, key, l, len, len1, len2, len3, len4, len5, len6, m, n, o, p, passingValues, ref, ref1, ref2, selectedEntry, value;
    PercentTTREntries.__super__.constructor.call(this);
    this.inrRanges = 0;
    this.totalNumberOfDays = 0;
    this.minInr = 2.0;
    this.maxInr = 3.0;
    this.minOutOfRange = 0.8;
    this.maxOutOfRange = 10;
    this.closestSetpoint = 2.5;
    clonedEvents = [];
    for (j = 0, len = events.length; j < len; j++) {
      event = events[j];
      clonedEvents.push(new event.constructor(event.json));
    }
    for (k = 0, len1 = clonedEvents.length; k < len1; k++) {
      entry = clonedEvents[k];
      currentClosestValue = null;
      ref = entry.values();
      for (l = 0, len2 = ref.length; l < len2; l++) {
        value = ref[l];
        if (value.scalar() > this.maxOutOfRange) {
          value.json['scalar'] = '10.0';
        }
        if (value.scalar() >= this.minOutOfRange && value.scalar() <= this.maxOutOfRange) {
          currentClosestValue = this.closestValueToSetpoint(currentClosestValue, value);
        }
      }
      passingValues = [];
      if (currentClosestValue != null) {
        passingValues = [currentClosestValue.json];
      }
      entry.json['values'] = passingValues;
    }
    entriesByDay = {};
    for (m = 0, len3 = clonedEvents.length; m < len3; m++) {
      entry = clonedEvents[m];
      date = entry.timeStamp();
      key = (date.getUTCFullYear()) + "_" + (date.getUTCMonth()) + "_" + (date.getUTCDate());
      if (!entriesByDay[key]) {
        entriesByDay[key] = [];
      }
      if (entry.values().length > 0) {
        entriesByDay[key].push(entry);
      }
    }
    finalEvents = [];
    ref1 = _.keys(entriesByDay);
    for (n = 0, len4 = ref1.length; n < len4; n++) {
      key = ref1[n];
      if (entriesByDay[key].length > 1) {
        currentClosestValue = null;
        selectedEntry = null;
        ref2 = entriesByDay[key];
        for (o = 0, len5 = ref2.length; o < len5; o++) {
          entry = ref2[o];
          currentClosestValue = this.closestValueToSetpoint(currentClosestValue, entry.values()[0]);
          if (currentClosestValue.scalar() === entry.values()[0].scalar()) {
            selectedEntry = entry;
          }
        }
        finalEvents.push(selectedEntry);
      } else {
        finalEvents = finalEvents.concat(entriesByDay[key]);
      }
    }
    finalEvents = finalEvents.sort(dateSortAscending);
    for (p = 0, len6 = finalEvents.length; p < len6; p++) {
      event = finalEvents[p];
      this.push(event);
    }
  }

  PercentTTREntries.prototype.closestValueToSetpoint = function(one, two) {
    if (one === null) {
      return two;
    }
    if (two === null) {
      return one;
    }
    if (Math.abs(one.scalar() - this.closestSetpoint) > Math.abs(two.scalar() - this.closestSetpoint)) {
      return two;
    } else {
      return one;
    }
  };

  PercentTTREntries.prototype.calculateDaysInRange = function(firstInr, secondInr) {
    if (this.differenceInDays(firstInr, secondInr) < 57) {
      this.inrRanges = this.inrRanges + 1;
      this.totalNumberOfDays = this.totalNumberOfDays + this.differenceInDays(firstInr, secondInr);
      if ((this.belowRange(firstInr) && this.belowRange(secondInr)) || (this.aboveRange(firstInr) && this.aboveRange(secondInr))) {
        return 0;
      } else if (this.inRange(firstInr) && this.inRange(secondInr)) {
        return this.differenceInDays(firstInr, secondInr);
      } else if (this.outsideRange(firstInr) && this.inRange(secondInr)) {
        return this.calculateCrossingRange(firstInr, secondInr);
      } else if (this.inRange(firstInr) && this.outsideRange(secondInr)) {
        return this.calculateCrossingRange(secondInr, firstInr);
      } else {
        return this.calculateSpanningRange(firstInr, secondInr);
      }
    } else {
      return 0;
    }
  };

  PercentTTREntries.prototype.calculateCrossingRange = function(outside, inside) {
    var boundary, insideInr, outsideInr;
    outsideInr = this.inrValue(outside);
    insideInr = this.inrValue(inside);
    boundary = this.maxInr;
    if (this.belowRange(outside)) {
      boundary = this.minInr;
    }
    return (Math.abs(boundary - insideInr) / Math.abs(insideInr - outsideInr)) * this.differenceInDays(outside, inside);
  };

  PercentTTREntries.prototype.calculateSpanningRange = function(first, second) {
    return (1.0 / Math.abs(this.inrValue(first) - this.inrValue(second))) * this.differenceInDays(first, second);
  };

  PercentTTREntries.prototype.inRange = function(entry) {
    var inr;
    inr = this.inrValue(entry);
    return inr >= this.minInr && inr <= this.maxInr;
  };

  PercentTTREntries.prototype.outsideRange = function(entry) {
    return !this.inRange(entry);
  };

  PercentTTREntries.prototype.belowRange = function(entry) {
    var inr;
    inr = this.inrValue(entry);
    return inr < this.minInr;
  };

  PercentTTREntries.prototype.aboveRange = function(entry) {
    var inr;
    inr = this.inrValue(entry);
    return inr > this.maxInr;
  };

  PercentTTREntries.prototype.differenceInDays = function(first, second) {
    return getIVL(first).low.difference(getIVL(second).low, 'd');
  };

  PercentTTREntries.prototype.inrValue = function(entry) {
    return entry.values()[0].scalar();
  };

  PercentTTREntries.prototype.calculateTTR = function() {
    var i, j, left, len, ref, right, total;
    total = 0;
    ref = this;
    for (i = j = 0, len = ref.length; j < len; i = ++j) {
      left = ref[i];
      if (i < this.length - 1) {
        right = this[i + 1];
        total += this.calculateDaysInRange(left, right);
      }
    }
    return total;
  };

  PercentTTREntries.prototype.calculateNumberOfIntervals = function() {
    var i, j, left, len, ref, right, total;
    total = 0;
    ref = this;
    for (i = j = 0, len = ref.length; j < len; i = ++j) {
      left = ref[i];
      if (i < this.length - 1) {
        right = this[i + 1];
        if (this.differenceInDays(left, right) < 57) {
          total = total + 1;
        }
      }
    }
    return total;
  };

  PercentTTREntries.prototype.calculatePercentTTR = function() {
    this.totalNumberOfDays = 0;
    if (this.calculateNumberOfIntervals() > 1) {
      return this.calculateTTR() / this.totalNumberOfDays * 100;
    } else {

    }
  };

  return PercentTTREntries;

})(hQuery.CodedEntryList);

// #########################
// ##### LOGGING UTILS ######
// #########################

this.Logger = (function() {
  function Logger() {}

  Logger.logger = [];

  Logger.rationale = {};

  Logger.info = function(string) {
    if (this.enable_logging) {
      return this.logger.push("" + (Logger.indent()) + string);
    }
  };

  Logger.record = function(id, result) {
    var json_results, specific_ids;
    if (this.enable_rationale && (result != null) && typeof result.isTrue === 'function') {
      if (result.isTrue() && result.length) {
        json_results = _.map(result, function(item) {
          return {
            id: item.id,
            json: item.json
          };
        });
        if (result.specificContext != null) {
          specific_ids = result.specificContext.flattenToIds();
        }
        return this.rationale[id] = {
          results: json_results,
          specifics: specific_ids
        };
      } else {
        return this.rationale[id] = result.isTrue();
      }
    }
  };

  Logger.enable_logging = true;

  Logger.enable_rationale = true;

  Logger.short_circuit = true;

  Logger.initialized = false;

  Logger.indentCount = 0;

  Logger.indent = function() {
    var i, indent, num, ref;
    indent = '';
    for (num = i = 0, ref = this.indentCount * 8; 0 <= ref ? i <= ref : i >= ref; num = 0 <= ref ? ++i : --i) {
      indent += ' ';
    }
    return indent;
  };

  Logger.stringify = function(object) {
    if (object && !_.isUndefined(object) && !_.isUndefined(object.length)) {
      return object.length + " entries";
    } else {
      return "" + object;
    }
  };

  Logger.asBoolean = function(object) {
    if (object && !_.isUndefined(object) && !_.isUndefined(object.length)) {
      return object.length > 0;
    } else {
      return object;
    }
  };

  Logger.toJson = function(value) {
    if (typeof JSON === 'object') {
      return JSON.stringify(value);
    } else {
      return tojson(value);
    }
  };

  Logger.classNameFor = function(object) {
    var funcNameRegex, results;
    funcNameRegex = /function(.+)\(/;
    results = funcNameRegex.exec(object.constructor.toString());
    if (results && results.length > 1) {
      return results[1];
    } else {
      return "";
    }
  };

  Logger.codedValuesAsString = function(codedValues) {
    return "[" + _.reduce(codedValues, function(memo, entry) {
      memo.push((entry.codeSystemName()) + ":" + (entry.code()));
      return memo;
    }, []).join(',') + "]";
  };

  Logger.formatSpecificEntry = function(object, index) {
    if (object === hqmf.SpecificsManager.any) {
      return object;
    } else {
      return "" + object.id;
    }
  };

  Logger.formatSpecificContext = function(object) {
    var displayRows, fn, i, item, len, ref, ref1, ref2, row;
    displayRows = [];
    if (object != null ? (ref = object.specificContext) != null ? (ref1 = ref.rows) != null ? ref1.length : void 0 : void 0 : void 0) {
      displayRows.push(Logger.toJson((function() {
        var i, len, ref2, results1;
        ref2 = hqmf.SpecificsManager.occurrences;
        results1 = [];
        for (i = 0, len = ref2.length; i < len; i++) {
          item = ref2[i];
          results1.push(item.id);
        }
        return results1;
      })()));
      ref2 = object.specificContext.rows;
      fn = function(row) {
        var displayRow, entry, fn1, index, j, len1, ref3;
        displayRow = [];
        ref3 = row.values;
        fn1 = function(entry) {
          return displayRow.push(Logger.formatSpecificEntry(entry, index));
        };
        for (index = j = 0, len1 = ref3.length; j < len1; index = ++j) {
          entry = ref3[index];
          fn1(entry);
        }
        return displayRows.push(Logger.toJson(displayRow));
      };
      for (i = 0, len = ref2.length; i < len; i++) {
        row = ref2[i];
        fn(row);
      }
    }
    return displayRows;
  };

  Logger.logSpecificContext = function(object) {
    var fn, i, len, ref, row;
    Logger.indentCount++;
    ref = Logger.formatSpecificContext(object);
    fn = function(row) {
      return Logger.info(row);
    };
    for (i = 0, len = ref.length; i < len; i++) {
      row = ref[i];
      fn(row);
    }
    return Logger.indentCount--;
  };

  return Logger;

})();

this.injectLogger = function(hqmfjs, enable_logging, enable_rationale, short_circuit) {
  Logger.enable_logging = enable_logging;
  Logger.enable_rationale = enable_rationale;
  Logger.short_circuit = short_circuit;
  _.each(_.functions(hqmfjs), function(method) {
    if (method !== 'initializeSpecifics') {
      return hqmfjs[method] = _.wrap(hqmfjs[method], function(func) {
        var args, ref, ref1, result;
        args = Array.prototype.slice.call(arguments, 1);
        Logger.info(method + ":");
        Logger.indentCount++;
        result = func.apply(this, args);
        Logger.indentCount--;
        Logger.info(method + " -> " + (Logger.asBoolean(result)));
        if ((ref = result.specificContext) != null ? (ref1 = ref.rows) != null ? ref1.length : void 0 : void 0) {
          Logger.info("Specific context");
          Logger.logSpecificContext(result);
          Logger.info("------");
        }
        Logger.record(method, result);
        return result;
      });
    }
  });
  if (!Logger.initialized) {
    Logger.initialized = true;
    _.each(_.functions(hQuery.Patient.prototype), function(method) {
      if (method !== 'getEvents' && method !== 'getAndCacheEvents') {
        if (hQuery.Patient.prototype[method].length === 0) {
          return hQuery.Patient.prototype[method] = _.wrap(hQuery.Patient.prototype[method], function(func) {
            var result;
            Logger.info("called patient." + method + "():");
            func = _.bind(func, this);
            result = func();
            Logger.info("patient." + method + "() -> " + (Logger.stringify(result)));
            return result;
          });
        } else {
          return hQuery.Patient.prototype[method] = _.wrap(hQuery.Patient.prototype[method], function(func) {
            var args, result;
            args = Array.prototype.slice.call(arguments, 1);
            Logger.info("called patient." + method + "(" + args + "):");
            result = func.apply(this, args);
            Logger.info("patient." + method + "(" + args + ") -> " + (Logger.stringify(result)));
            return result;
          });
        }
      }
    });
    hQuery.CodedEntryList.prototype.match = _.wrap(hQuery.CodedEntryList.prototype.match, function(func, codeSet, start, end) {
      var result;
      func = _.bind(func, this, codeSet, start, end);
      result = func(codeSet, start, end);
      Logger.info("matched -> " + (Logger.stringify(result)));
      return result;
    });
    hqmf.SpecificsManagerSingleton.prototype.intersectAll = _.wrap(hqmf.SpecificsManagerSingleton.prototype.intersectAll, function(func, boolVal, values, negate, episodeIndices, options) {
      var i, len, result, value;
      if (negate == null) {
        negate = false;
      }
      func = _.bind(func, this, boolVal, values, negate, episodeIndices, options);
      result = func(boolVal, values, negate, episodeIndices, options);
      Logger.info("Intersecting (" + values.length + "):");
      for (i = 0, len = values.length; i < len; i++) {
        value = values[i];
        Logger.logSpecificContext(value);
      }
      Logger.info("Intersected result:");
      Logger.logSpecificContext(result);
      return result;
    });
    this.getCodes = _.wrap(this.getCodes, function(func, oid) {
      var codes;
      codes = func(oid);
      Logger.info("accessed codes: " + oid);
      return codes;
    });
    this.atLeastOneTrue = _.wrap(this.atLeastOneTrue, function(func) {
      var args, result;
      args = Array.prototype.slice.call(arguments, 1);
      Logger.info("called atLeastOneTrue(" + args + "):");
      Logger.indentCount++;
      result = func.apply(this, args);
      Logger.indentCount--;
      Logger.info("atLeastOneTrue -> " + result);
      Logger.record("precondition_" + args[0], result);
      return result;
    });
    this.allTrue = _.wrap(this.allTrue, function(func) {
      var args, result;
      args = Array.prototype.slice.call(arguments, 1);
      Logger.info("called allTrue(" + args + "):");
      Logger.indentCount++;
      result = func.apply(this, args);
      Logger.indentCount--;
      Logger.info("allTrue -> " + result);
      Logger.record("precondition_" + args[0], result);
      return result;
    });
    this.allFalse = _.wrap(this.allFalse, function(func) {
      var args, result;
      args = Array.prototype.slice.call(arguments, 1);
      Logger.info("called allFalse(" + args + "):");
      Logger.indentCount++;
      result = func.apply(this, args);
      Logger.indentCount--;
      Logger.info("allFalse -> " + result);
      Logger.record("precondition_" + args[0], result);
      return result;
    });
    this.eventsMatchBounds = _.wrap(this.eventsMatchBounds, function(func, events, bounds, methodName, range) {
      var args, result;
      args = Array.prototype.slice.call(arguments, 1);
      result = func(events, bounds, methodName, range);
      Logger.info(methodName + "(Events: " + (Logger.stringify(events)) + ", Bounds: " + (Logger.stringify(bounds)) + ", Range: " + (Logger.toJson(range)) + ") -> " + (Logger.stringify(result)));
      return result;
    });
    return this.atLeastOneFalse = _.wrap(this.atLeastOneFalse, function(func) {
      var args, result;
      args = Array.prototype.slice.call(arguments, 1);
      Logger.info("called atLeastOneFalse(" + args + "):");
      Logger.indentCount++;
      result = func.apply(this, args);
      Logger.indentCount--;
      Logger.info("atLeastOneFalse -> " + result);
      Logger.record("precondition_" + args[0], result);
      return result;
    });
  }
};