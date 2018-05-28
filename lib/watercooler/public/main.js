var $message = document.getElementById('messages') // 1.

displayUpdate = function (update) { // 2.
  var line = "<li>" + update.data +"</li>"
  $message.innerHTML = line + $message.innerHTML
}
var source = new EventSource('/listen'); // 3.

source.onmessage = displayUpdate // 4.
