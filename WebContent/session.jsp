<script type="text/javascript">
	function renewSession() {
		var time_renew = document.getElementById('time_renew');
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (xhttp.readyState == 4 && xhttp.status == 200) {
				time_renew.value = xhttp.responseText;
				if (time_renew.value == "0") {
					window.location = "index.jsp";
				}
			}
		};
		xhttp.open("GET", "servletsession", true);
		xhttp.send();
	}

	function startTimer(duration, display) {
		var timer = duration, minutes, seconds;
		var timer_tx = document.getElementById('timer_tx');
		var time_renew = document.getElementById('time_renew');
		var aux = 0;

		setInterval(function() {
			minutes = parseInt(timer / 60, 10);
			seconds = parseInt(timer % 60, 10);

			minutes = minutes < 10 ? "0" + minutes : minutes;
			seconds = seconds < 10 ? "0" + seconds : seconds;

			if (minutes == "01" && seconds == "00") {
				timer_tx.style.color = "#0080c0";
				$('html, body').animate({
					scrollTop : 0
				}, 'fast');
				timer_tx.innerHTML = "Your Session is about to expire!";
			}
			if (minutes == "00" && seconds == "55") {
				timer_tx.innerHTML = "";
			}

			if (minutes == "00" && seconds == "00") {
				display.textContent = "00:00";
				timer_tx.style.color = "#c60000";
				if (aux == 0) {
					$('html, body').animate({
						scrollTop : 0
					}, 'fast');
				}
				aux = 1;
				timer_tx.innerHTML = "Your Session is expired!";
			} else {
				display.textContent = minutes + ":" + seconds;

				if (--timer < 0) {
					timer = duration;
				}

				if (time_renew.value == "1") {
					timer = 60 * 30;
					time_renew.value = "0";
				}
			}
		}, 1000);
	}

	window.onload = function() {
		var minutes = 60 * 30;
		var display = document.querySelector('#time');
		
		renewSession();
		startTimer(minutes, display);
	};
</script>
<div style="padding: 20px 20px 20px 20px; position: absolute; background-image: url('img/session.png');">
	<span style="font-weight: bold;">Session expires in</span> <span
		id="time"></span>
	<button type="button" class="btn btn-default btn-xs"
		onclick="renewSession()">Renew</button>
	<input name="time_renew" id="time_renew" type="hidden" value="0" /> <br />
	<span id="timer_tx" style="font-weight: bold;"></span>
</div>