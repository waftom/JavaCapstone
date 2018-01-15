<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>IT Resume Builder</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="tinymce/js/tinymce/tinymce.min.js"></script>

<link type="text/css" rel="stylesheet" href="js/jquery.qtip.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.qtip.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('#ps_text').each(function() {
			$(this).qtip({
				content : {
					text : $(this).next('div')
				}
			});
		});
		$('#ts_text').each(function() {
			$(this).qtip({
				content : {
					text : $(this).next('div')
				}
			});
		});
		$('#pe_text').each(function() {
			$(this).qtip({
				content : {
					text : $(this).next('div')
				}
			});
		});
		$('#ed_text').each(function() {
			$(this).qtip({
				content : {
					text : $(this).next('div')
				}
			});
		});
	});

	tinymce
			.init({
				selector : 'textarea',
				height : 200,
				plugins : [ 'advlist autolink lists link charmap preview',
						'searchreplace visualblocks fullscreen',
						'insertdatetime table contextmenu paste' ],
				toolbar : 'insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent',
				content_css : [
						'//fast.fonts.net/cssapi/e6dc9b99-64fe-4292-ad98-6974f93cd2a2.css',
						'//www.tinymce.com/css/codepen.min.css' ]
			});

	function editor(topic, name) {
		var editor = document.getElementById(topic);
		var content = document.getElementById(topic + "_t");
		var button = document.getElementById(topic + "_bt");
		var button_class = document.getElementById(topic + "_btn");

		if (editor.style.display == "none") {
			editor.style.display = "";
			content.style.display = "none";
			button.innerHTML = "View content";
			button_class.className = "btn btn-warning btn-sm";
		} else {
			editor.style.display = "none";
			content.style.display = "";
			button.innerHTML = "Add / Edit content";
			content.innerHTML = tinyMCE.get(name).getContent();
			button_class.className = "btn btn-info btn-sm";
		}
	}

	function turnimg(state, img_id) {
		var img = document.getElementById(img_id);
		if (state == 'in') {
			img.style.width = '65%';
		} else {
			img.style.width = '70%';
		}
	}

	function sendForm(type) {
		var form = document.getElementById('form_edit_resume');
		var save = document.getElementById('save_only');
		var title = document.getElementById('title');

		if (title.value == '' && type != 'cl') {
			alert('Write a Title for your Resume.');
		} else {
			switch (type) {
			case 'pr':
				form.action = "viewprint";
				form.target = "_blank";
				form.submit();
				form.action = "resumesave";
				form.target = "_self";
				break;
			case 'cl':
				window.location = "resumelist";
				break;
			case 'sc':
				save.value = "n";
				form.submit();
				break;
			case 'sa':
				save.value = "y";
				form.submit();
				break;
			}
		}
	}

	function check() {
		var pub = document.getElementById('public');
		var pubc = document.getElementById('publicc');
		if (pub.checked == true) {
			pubc.style.color = "#009d00";
			pub.value = "yes";
		} else {
			pubc.style.color = "#c60000";
			pub.value = "no";
		}
	}
</script>
</head>
<body>
	<%@ include file="session.jsp"%>
	<%@ include file="top.jsp"%>
	<div class="row">
		<%@ include file="side.jsp"%>
		<form action="resumesave" method="post" name="form_edit_resume"
			id="form_edit_resume">
			<input name="save_only" id="save_only" type="hidden" value="n" />
			<div style="padding: 20px 30px 20px 10px;" class="col-md-10">
				<div style="padding-bottom: 20px;">
					<div style="float: left;">
						<div style="font-size: 25px; font-weight: bold; color: #337AB7;">Create
							/ Edit Resume</div>
						<div style="width: 300px; height: 3px; background-color: #337AB7;"></div>
					</div>
					<div align="center"
						style="float: right; font-size: 9px; font-weight: bold; cursor: pointer;"
						onclick="sendForm('pr')" onmouseover="turnimg('in','pr')"
						onmouseout="turnimg('out','pr')">
						<img id="pr" src="img/print.jpg" width="70%" height="70%" /><br />View/Print
					</div>
					<div align="center"
						style="float: right; font-size: 9px; font-weight: bold; cursor: pointer; padding-right: 15px;"
						onclick="sendForm('cl')" onmouseover="turnimg('in','cl')"
						onmouseout="turnimg('out','cl')">
						<img id="cl" src="img/close.jpg" width="70%" height="70%" /><br />Close/Cancel
					</div>
					<div align="center"
						style="float: right; font-size: 9px; font-weight: bold; cursor: pointer; padding-right: 15px;"
						onclick="sendForm('sc')" onmouseover="turnimg('in','sc')"
						onmouseout="turnimg('out','sc')">
						<img id="sc" src="img/savec.jpg" width="70%" height="70%" /><br />Save
						& Close
					</div>
					<div align="center"
						style="float: right; font-size: 9px; font-weight: bold; cursor: pointer; padding-right: 15px;"
						onclick="sendForm('sa')" onmouseover="turnimg('in','sa')"
						onmouseout="turnimg('out','sa')">
						<img id="sa" src="img/save.jpg" width="70%" height="70%" /><br />Save
					</div>
				</div>
				<div class="form-inline"
					style="padding: 50px 0px 30px 0px; font-weight: bold; font-size: 16px; width: 100%;">
					Title: <input type="text" class="form-control" id="title"
						placeholder="Write a Title for the Resume" name="title"> <span
						id="publicc" style="color: #c60000; padding: 5px 0px 0px 30px;">
						<input name="public" id="public" type="checkbox" value="no"
						onclick="check()" /> Public?
					</span>
				</div>
				<div style="text-align: center; font-weight: bold; font-size: 30px;">
					<c:out value="${sessionScope.id[1]}" />
					<c:out value="${sessionScope.id[2]}" />
				</div>
				<div style="width: 100%; height: 5px; background-color: black;"></div>
				<div style="text-align: center; padding-bottom: 60px;">
					<c:out value="${sessionScope.id[5]}" />
					|
					<c:out value="${sessionScope.id[3]}" />
					|
					<c:out value="${sessionScope.id[4]}" />
				</div>
				<div style="font-weight: bold; padding-bottom: 20px;">
					Professional Summary <span id="ps_text"
						style="border: 1px solid #666; background-color: #fed08b; border-radius: 10px; text-align: center; font-weight: bold; cursor: help;">&nbsp;?&nbsp;</span>
					<div class="qtip-bootstrap" style="display: none;">
						<div class="qtip-titlebar">Help / Example</div>
						<div class="qtip-content">
							<p>Brief statement about what you bring to the table: ROI.
								(This should be no longer than 3 - 4 sentences, and should be
								changed EVERY time you apply to a different role)</p>
						</div>
					</div>
					<div style="width: 100%; height: 3px; background-color: black;"></div>
				</div>
				<div id="ps" style="display: none; padding-bottom: 5px;">
					<textarea id="professional_summary" name="professional_summary"></textarea>
				</div>
				<div id="ps_t" style="display: block; padding-bottom: 5px;"></div>
				<button id="ps_btn" type="button" class="btn btn-info btn-sm"
					onclick="editor('ps','professional_summary')">
					<span id="ps_bt">Add / Edit content</span>
				</button>
				<div style="padding-top: 50px;"></div>
				<div style="font-weight: bold; padding-bottom: 20px;">
					Technical Skills <span id="ts_text"
						style="border: 1px solid #666; background-color: #fed08b; border-radius: 10px; text-align: center; font-weight: bold; cursor: help;">&nbsp;?&nbsp;</span>
					<div class="qtip-bootstrap" style="display: none;">
						<div class="qtip-titlebar">Help / Example</div>
						<div class="qtip-content">
							<table width="285" style="max-width: 500px;" border="0"
								cellspacing="0" cellpadding="0">
								<tr>
									<td width="134">Platforms</td>
									<td width="1" bgcolor="#000000">&nbsp;</td>
									<td width="26">&nbsp;</td>
									<td width="135">one, two, three ...</td>
								</tr>
								<tr>
									<td>Hardware</td>
									<td bgcolor="#000000">&nbsp;</td>
									<td>&nbsp;</td>
									<td>one, two, three ...</td>
								</tr>
								<tr>
									<td>Applications</td>
									<td bgcolor="#000000">&nbsp;</td>
									<td>&nbsp;</td>
									<td>one, two, three ...</td>
								</tr>
								<tr>
									<td>Networking</td>
									<td bgcolor="#000000">&nbsp;</td>
									<td>&nbsp;</td>
									<td>one, two, three ...</td>
								</tr>
								<tr>
									<td>Scripting</td>
									<td bgcolor="#000000">&nbsp;</td>
									<td>&nbsp;</td>
									<td>one, two, three ...</td>
								</tr>
								<tr>
									<td>Soft Skills</td>
									<td bgcolor="#000000">&nbsp;</td>
									<td>&nbsp;</td>
									<td>one, two, three ...</td>
								</tr>
							</table>
						</div>
					</div>
					<div style="width: 100%; height: 3px; background-color: black;"></div>
				</div>
				<div id="ts" style="display: none; padding-bottom: 5px;">
					<textarea id="technical_skills" name="technical_skills"></textarea>
				</div>
				<div id="ts_t" style="display: block; padding-bottom: 5px;"></div>
				<button id="ts_btn" type="button" class="btn btn-info btn-sm"
					onclick="editor('ts','technical_skills')">
					<span id="ts_bt">Add / Edit content</span>
				</button>
				<div style="padding-top: 50px;"></div>
				<div style="font-weight: bold; padding-bottom: 20px;">
					Professional Experience <span id="pe_text"
						style="border: 1px solid #666; background-color: #fed08b; border-radius: 10px; text-align: center; font-weight: bold; cursor: help;">&nbsp;?&nbsp;</span>
					<div class="qtip-bootstrap" style="display: none;">
						<div class="qtip-titlebar">Help / Example</div>
						<div class="qtip-content">
							<span style="font-weight: bold;">NOTE: This section should
								include the last 10 years of experience. If your experience goes
								beyond 10 years list out the company name, title and dates of
								employment only. </span><br /> <br /> <span
								style="font-weight: bold;">Company</span><br /> <span
								style="font-style: italic;">Title, Location (date - date)</span><br />
							Brief description of job (2 - 3 sentences MAX)
							<ul>
								<li>Bullet 1</li>
								<li>Bullet 2</li>
								<li>Bullet 3 ...</li>
							</ul>
							<span style="font-style: italic;">Environment: (List all
								technologies utilized)</span><br /> <br /> <span
								style="font-weight: bold;">Company</span><br /> <span
								style="font-style: italic;">Title, Location (date - date)</span><br />
							Brief description of job (2 - 3 sentences MAX)
							<ul>
								<li>Bullet 1</li>
								<li>Bullet 2</li>
								<li>Bullet 3 ...</li>
							</ul>
							<span style="font-style: italic;">Environment: (List all
								technologies utilized)</span><br /> <br /> <span
								style="font-weight: bold;">Company - </span><span
								style="font-style: italic;">Title, Location (date - date)
								... this is used for over 10 years, and only if you WANT to list
								it.</span><br /> <span style="font-weight: bold;">Company - </span><span
								style="font-style: italic;">Title, Location (date - date)</span>
						</div>
					</div>
					<div style="width: 100%; height: 3px; background-color: black;"></div>
				</div>
				<div id="pe" style="display: none; padding-bottom: 5px;">
					<textarea id="professional_experience"
						name="professional_experience"></textarea>
				</div>
				<div id="pe_t" style="display: block; padding-bottom: 5px;"></div>
				<button id="pe_btn" type="button" class="btn btn-info btn-sm"
					onclick="editor('pe','professional_experience')">
					<span id="pe_bt">Add / Edit content</span>
				</button>
				<div style="padding-top: 50px;"></div>
				<div style="font-weight: bold; padding-bottom: 20px;">
					Education <span id="ed_text"
						style="border: 1px solid #666; background-color: #fed08b; border-radius: 10px; text-align: center; font-weight: bold; cursor: help;">&nbsp;?&nbsp;</span>
					<div class="qtip-bootstrap" style="display: none;">
						<div class="qtip-titlebar">Help / Example</div>
						<div class="qtip-content">
							<p>
								<span style="font-weight: bold;">School Name</span><br /> <span
									style="font-style: italic;">Degree or program</span>
							</p>
						</div>
					</div>
					<div style="width: 100%; height: 3px; background-color: black;"></div>
				</div>
				<div id="ed" style="display: none; padding-bottom: 5px;">
					<textarea id="education" name="education"></textarea>
				</div>
				<div id="ed_t" style="display: block; padding-bottom: 5px;"></div>
				<button id="ed_btn" type="button" class="btn btn-info btn-sm"
					onclick="editor('ed','education')">
					<span id="ed_bt">Add / Edit content</span>
				</button>
			</div>
		</form>
	</div>
</body>
</html>