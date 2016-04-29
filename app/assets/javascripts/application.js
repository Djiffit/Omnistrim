// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require private_pub
//= require_tree .

function toggle_visibility(id) {
    var e = document.getElementById(id);
    if (e.style.display != 'none') {
        e.style.display = 'none';
    }
    else {
        e.style.display = 'block';
    }
}

function showOmni() {
    var e = document.getElementById('omniscreen');
    var b = document.getElementById('youtubeBox');
    var c = document.getElementById('twitchFollows');
    e.style.display = 'none';
    b.style.display = 'none';
    c.style.display = 'none';
    e.style.display = 'block';
}
function showYt() {
    var e = document.getElementById('omniscreen');
    var b = document.getElementById('youtubeBox');
    var c = document.getElementById('twitchFollows');
    e.style.display = 'none';
    b.style.display = 'none';
    c.style.display = 'none';
    b.style.display = 'block';
}
function showTwitch() {
    var e = document.getElementById('omniscreen');
    var b = document.getElementById('youtubeBox');
    var c = document.getElementById('twitchFollows');
    e.style.display = 'none';
    b.style.display = 'none';
    c.style.display = 'none';
    c.style.display = 'block';
}

