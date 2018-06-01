function saveMyGame() {
    var countdown = document.getElementById("countdown").innerHTML
    var xhr = new XMLHttpRequest();

    xhr.open('POST', '/plays/save_my_play');
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhr.onload = function() {
        console.log(this.responseText);
        if (xhr.status === 200) {
            document.getElementById("plays").innerHTML = this.responseText;
        }
        else if (xhr.status !== 200) {
            alert('Request failed.  Returned status of ' + xhr.status);
        }
    };
    auth_token = document.head.querySelector("[name=csrf-token]").content;
    xhr.send(encodeURI('countdown=' + countdown + '&authenticity_token=' + auth_token));

}