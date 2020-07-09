function groupDebounce(wait) {
    wait = wait || 100;
    var wrapper = function (func, params) {
        return func.apply(this, params);
    };
    wrapper = _.debounce(wrapper, wait);
    return function (func) {
        return function () {
            return wrapper(func, arguments)
        }
    }
}