function countdown() {
    var seconds = 11
    setInterval(function() {
        if (seconds < 1) {
            seconds = 11
        }
        seconds -= 1
        document.getElementById("countdown").innerHTML = seconds
    }, 1000);
}

window.onload = function() {
    countdown();
};