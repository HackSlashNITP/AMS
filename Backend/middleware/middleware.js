function splitFunction(str, n) {
    let result = [];
    for (let i = 0; i < str.length; i += n) {
        result.push(str.slice(i, i + n));
    }
    return result;
}

module.exports = splitFunction;
