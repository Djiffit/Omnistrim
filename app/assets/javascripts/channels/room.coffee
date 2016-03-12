App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
# Called when the subscription is ready for use on the server

  disconnected: ->
# Called when the subscription has been terminated by the server

  received: (data) ->
    $('#messages').append data['message']

  speak: (message, name) ->
    @perform 'speak', message: message, name: name

  $(document).on 'keypress', '[data-behavior~=room-speaker]', (event) ->
    if event.keyCode is 13 # return = send
      App.room.speak(event.target.value, document.getElementById("nimi").value)
      event.target.value = ''
      event.preventDefault()