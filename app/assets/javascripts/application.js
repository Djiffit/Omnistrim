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
function toggle_visibility_plural(name) {
    var e = document.getElementsByName(name);
    var el
    var len
    if (e.length > 0) {
        if (e[0].style.display != 'none') {
            for (var i = 0, len = e.length; i < len; i++) {
                e[i].style.display = 'none'
            }
        }
        else {
            for (var i = 0, len = e.length; i < len; i++) {
                e[i].style.display = 'block'
            }
        }
    }
}

function hideMessage(type) {
    var e;
    if (type === 'public') {
        if (document.getElementById('badNormal').style.display != 'none') {
            var e = document.getElementsByName('publicMessage');
            e[e.length - 1].style.display = 'none';
        }
    } else if (type === 'private') {
        if (document.getElementById('badPrivate').style.display != 'none') {
            var e = document.getElementsByName('privateMessage');
            e[e.length - 1].style.display = 'none';
        }
    } else if (type === 'society') {
        if (document.getElementById('badSociety').style.display != 'none') {
            var e = document.getElementsByName('societyMessage');
            e[e.length - 1].style.display = 'none';
        }
    }
    scrollBottom();
}

function scrollBottom() {
    var panel = document.getElementById('panelchat');
    panel.scrollTop = panel.scrollHeight;
}

function showOmni() {
    var e = document.getElementById('omniscreen');
    e.style.display = 'block';
    var b = document.getElementById('youtubeBox');
    var c = document.getElementById('twitchFollows');
    c.style.display = 'none';
    b.style.display = 'none';
}
function showYt() {
    var e = document.getElementById('omniscreen');
    var b = document.getElementById('youtubeBox');
    var c = document.getElementById('twitchFollows');
    e.style.display = 'none';
    c.style.display = 'none';
    b.style.display = 'block';
}
function showTwitch() {
    var e = document.getElementById('omniscreen');
    var b = document.getElementById('youtubeBox');
    var c = document.getElementById('twitchFollows');
    c.style.display = 'block';
    e.style.display = 'none';
    b.style.display = 'none';
}
function enableThing() {
    $(document.body).on('click', '.dropdown-menu li', function (event) {
        var $target = $(event.currentTarget);
        $target.closest('.btn-group')
            .find('[data-bind="label"]').text($target.text())
            .end()
            .children('.dropdown-toggle').dropdown('toggle');
        return false;
    });
}
function setStreamId(id) {
    var a = document.getElementById('stream_id')
    a.value = id
}
