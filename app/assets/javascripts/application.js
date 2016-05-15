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
    var efd = document.getElementById(id);
    if (efd.style.display !== 'none') {
        efd.style.display = 'none';
    }
    else {
        efd.style.display = 'block';
    }
}
function toggle_visibility_plural(name) {
    var e = document.getElementsByName(name);
    var el
    var len
    if (e.length > 0) {
        if (e[0].style.display !== 'none') {
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
    var ebv;
    if (type === 'public') {
        if (document.getElementById('badNormal').style.display !== 'none') {
            var ebv = document.getElementsByName('publicMessage');
            ebv[ebv.length - 1].style.display = 'none';
        }
    } else if (type === 'private') {
        if (document.getElementById('badPrivate').style.display !== 'none') {
            var ebv = document.getElementsByName('privateMessage');
            ebv[ebv.length - 1].style.display = 'none';
        }
    } else if (type === 'society') {
        if (document.getElementById('badSociety').style.display !== 'none') {
            var ebv = document.getElementsByName('societyMessage');
            ebv[ebv.length - 1].style.display = 'none';
        }
    }
    scrollBottom();
}

function scrollBottom() {
    var panel = document.getElementById('panelchat');
    panel.scrollTop = panel.scrollHeight;
}

function showOmni() {
    var esh = document.getElementById('omniscreen');
    esh.style.display = 'block';
    var bsh = document.getElementById('youtubeBox');
    var csh = document.getElementById('twitchFollows');
    csh.style.display = 'none';
    bsh.style.display = 'none';
}
function showYt() {
    var esf = document.getElementById('omniscreen');
    var bsf = document.getElementById('youtubeBox');
    var csf = document.getElementById('twitchFollows');
    esf.style.display = 'none';
    csf.style.display = 'none';
    bsf.style.display = 'block';
}
function showTwitch() {
    var esd = document.getElementById('omniscreen');
    var bsd = document.getElementById('youtubeBox');
    var csd = document.getElementById('twitchFollows');
    csd.style.display = 'block';
    esd.style.display = 'none';
    bsd.style.display = 'none';
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
