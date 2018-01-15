<script type="text/javascript">
	function changeMenu(id, menu) {
		var idd = document.getElementById(id);

		if (menu == 'r') {
			idd.style.backgroundColor = '#DDD';
			idd.style.color = '#FFF';
		} else {
			idd.style.backgroundColor = '';
			idd.style.color = '#000';
		}
	}
</script>
<div style="padding: 20px 10px 0px 30px; min-width: 180px;" class="col-md-2">
	<ol class="list-group">
		<li id="m1" class="list-group-item" onmouseover="changeMenu('m1','r')"
			onmouseout="changeMenu('m1','t')"><a href="home"
			style="text-decoration: none;"><span style="font-weight: bold;">Home</span></a></li>
		<li id="m2" class="list-group-item" onmouseover="changeMenu('m2','r')"
			onmouseout="changeMenu('m2','t')"><a href="updateprofile"
			style="text-decoration: none;"><span style="font-weight: bold;">Update
					profile</span></a></li>
		<li id="m3" class="list-group-item" onmouseover="changeMenu('m3','r')"
			onmouseout="changeMenu('m3','t')"><a href="resumelist"
			style="text-decoration: none;"><span style="font-weight: bold;">Create
					/ Edit Resume</span></a></li>
		<li id="m4" class="list-group-item" onmouseover="changeMenu('m4','r')"
			onmouseout="changeMenu('m4','t')"><a href="interview_tips.jsp"
			style="text-decoration: none;"><span style="font-weight: bold;">Interview
					tips</span></a></li>
		<li id="m5" class="list-group-item" onmouseover="changeMenu('m5','r')"
			onmouseout="changeMenu('m5','t')"><a href="about.jsp"
			style="text-decoration: none;"><span style="font-weight: bold;">About</span></a></li>
		<li id="m6" class="list-group-item" onmouseover="changeMenu('m6','r')"
			onmouseout="changeMenu('m6','t')"><a href="logout"
			style="text-decoration: none;"><span style="font-weight: bold;">Logout</span></a></li>
	</ol>
</div>