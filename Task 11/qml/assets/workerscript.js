function fibonacci(n) {
    var cache = new Array(n)
    cache[0] = 0; cache[1] = 1
    for(var i = 2; i < n + 1; i++)
        cache[i] = cache[i-2] + cache[i-1]

    return cache[n];
}

WorkerScript.onMessage = function(number) {
    //Calculate result (may take a while, using a naive algorithm)
    var calculatedResult = fibonacci(number).toFixed(0);
    //Send result back to main thread
    WorkerScript.sendMessage({ result: calculatedResult });
}
