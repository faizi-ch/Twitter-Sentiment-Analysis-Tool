<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Main.aspx.cs" Inherits="Main" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit, Version=4.1.7.123, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">

<meta charset="UTF-8">
		<title>Tweets Analysis</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<link rel="shortcut icon" href="http://icanbecreative.com/resources/images/favico.ico" />
		<link href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">

		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="canvasjs.min.js"></script>
  <script>
  $( function() {
	var availableTags = [
	  "Apple",
	  "AppleMac",
	  "AppleiPhone",
	  "AppleiPad",
	  "#Apple",
	  "#AppleMac",
	  "#AppleiPhone",
	  "#AppleiPad",
	  "#Apple_Mac",
	  "#Apple_iPhone",
	  "#Apple_iPad",
	  "Samsung",
	  "iPhone",
	  "Oppo",
	  "HTC",
	  "Microsoft",
	  "Google",
	  "Android",
	  "psl",
	  "psl2015",
	  "psl2016",
		"psl2017",
	  "ipl",
	  "ipl2015",
	  "ipl2016",
		"ipl2017",
		"worldcup2011",
	  "worldcup2015",
	  "worldcup2019",
		"T20",
	  "T20_2007",
	  "T20_2009",
	  "T20_2011",
	  "#Samsung",
	  "#iPhone",
		"#Oppo",
	  "#HTC",
	  "#Microsoft",
	  "#Google",
		"#Android",
		"#psl",
	  "#psl2015",
		"#psl2016",
	  "#psl2017",
	  "#ipl",
	  "#ipl2015",
	  "#ipl2016",
	  "#ipl2017",
		"#worldcup2011",
	  "#worldcup2015",
	  "#worldcup2019",
	  "#T20",
		"#T20_2007",
		"#T20_2009",
	  "#PAKvsIND",
		"PAKvsIND",
		"#INDvsPAK",
		"INDvsPAK",
		"BreakingNews",
		"#BreakingNews",
		"Twitter",
		"#Twitter",
		"Facebook",
		"#Facebook",
		"Instagram",
		"#Instagram",
		"Snapchat",
		"#Snapchat",
		"Skype",
		"#Skype",
		"Whatsapp",
	  "#Whatsapp"
	];
	$( "#search" ).autocomplete({
	  source: availableTags
	});
	  });

function showGraph (posCount, negCount, neuCount) {
	var chart = new CanvasJS.Chart("chartContainer",
	{
		theme: "theme2",
		title:{
			text: "Sentiment Graph"
		},
		data: [
		{
			type: "pie",
			showInLegend: true,
			toolTipContent: "{y} - #percent %",
			yValueFormatString: "#",
			legendText: "{indexLabel}",
			dataPoints: [
				{  y: posCount, indexLabel: "Positive" },
				{  y: negCount, indexLabel: "Negative" },
				{  y: neuCount, indexLabel: "Neutral" }
			]
		}
		]
	});
	chart.render();
	  }

	</script>
	
  
		<meta property="og:url"           content="http://demo.icanbecreative.com/css3-animated-search-box/" />
		<meta property="og:type"          content="website" />
		<meta property="og:title"         content="CSS3 Animated Search Box" />
		<meta property="og:description"   content="Your description" />
		<meta property="og:image"         content="http://demo.icanbecreative.com/css3-animated-search-box/featured.jpg" />

		<style type="text/css">
			.top {
	border: 5px solid white;
	padding: 10px;
	color: white;
}
			header {
				background-color: black;
	padding: 10px;
	color: white;
	clear: left;
	text-align: right;
}
			 html,body {height: 100%;}
			body {padding: 0px; margin:0px; background:url(image.jpg) ; background-position: center; background-size: cover; background-attachment: fixed; background-repeat: no-repeat;}

			.search-wrapper {
				position: absolute;
				-webkit-transform: translate(-50%, -50%);
				-moz-transform: translate(-50%, -50%);
				transform: translate(-50%, -50%);
				top:50%;
				left:50%;
			}
			.search-wrapper.active {}

			.search-wrapper .input-holder {
				overflow: hidden;
				height: 70px;
				background: rgba(255,255,255,0);
				border-radius:6px;
				position: relative;
				width:70px;
				-webkit-transition: all 0.3s ease-in-out;
				-moz-transition: all 0.3s ease-in-out;
				transition: all 0.3s ease-in-out;
			}
			.search-wrapper.active .input-holder {
				border-radius: 50px;
				width:450px;
				background: rgba(0,0,0,0.5);
				-webkit-transition: all .5s cubic-bezier(0.000, 0.105, 0.035, 1.570);
				-moz-transition: all .5s cubic-bezier(0.000, 0.105, 0.035, 1.570);
				transition: all .5s cubic-bezier(0.000, 0.105, 0.035, 1.570);
			}

			.search-wrapper .input-holder .search-input {
				width:100%;
				height: 50px;
				padding:0px 70px 0 20px;
				opacity: 0;
				position: absolute;
				top:0px;
				left:0px;
				background: transparent;
				-webkit-box-sizing: border-box;
				-moz-box-sizing: border-box;
				box-sizing: border-box;
				border:none;
				outline:none;
				font-family:"Open Sans", Arial, Verdana;
				font-size: 16px;
				font-weight: 400;
				line-height: 20px;
				color:#FFF;
				-webkit-transform: translate(0, 60px);
				-moz-transform: translate(0, 60px);
				transform: translate(0, 60px);
				-webkit-transition: all .3s cubic-bezier(0.000, 0.105, 0.035, 1.570);
				-moz-transition: all .3s cubic-bezier(0.000, 0.105, 0.035, 1.570);
				transition: all .3s cubic-bezier(0.000, 0.105, 0.035, 1.570);

				-webkit-transition-delay: 0.3s;
				-moz-transition-delay: 0.3s;
				transition-delay: 0.3s;
			}
			.search-wrapper.active .input-holder .search-input {
				opacity: 1;
				-webkit-transform: translate(0, 10px);
				-moz-transform: translate(0, 10px);
				transform: translate(0, 10px);
			}

			.search-wrapper .input-holder .search-icon {
				width:70px;
				height:70px;
				border:none;
				border-radius:6px;
				background: #FFF;
				padding:0px;
				outline:none;
				position: relative;
				z-index: 2;
				float:right;
				cursor: pointer;
				-webkit-transition: all 0.3s ease-in-out;
				-moz-transition: all 0.3s ease-in-out;
				transition: all 0.3s ease-in-out;
			}
			.search-wrapper.active .input-holder .search-icon {
				width: 50px;
				height:50px;
				margin: 10px;
				border-radius: 30px;
			}
			.search-wrapper .input-holder .search-icon span {
				width:22px;
				height:22px;
				display: inline-block;
				vertical-align: middle;
				position:relative;
				-webkit-transform: rotate(45deg);
				-moz-transform: rotate(45deg);
				transform: rotate(45deg);
				-webkit-transition: all .4s cubic-bezier(0.650, -0.600, 0.240, 1.650);
				-moz-transition: all .4s cubic-bezier(0.650, -0.600, 0.240, 1.650);
				transition: all .4s cubic-bezier(0.650, -0.600, 0.240, 1.650);

			}
			.search-wrapper.active .input-holder .search-icon span {
				-webkit-transform: rotate(-45deg);
				-moz-transform: rotate(-45deg);
				transform: rotate(-45deg);
			}
			.search-wrapper .input-holder .search-icon span::before, .search-wrapper .input-holder .search-icon span::after {
				position: absolute;
				content:'';
			}
			.search-wrapper .input-holder .search-icon span::before {
				width: 4px;
				height: 11px;
				left: 9px;
				top: 18px;
				border-radius: 2px;
				background: #974BE0;
			}
			.search-wrapper .input-holder .search-icon span::after {
				width: 14px;
				height: 14px;
				left: 0px;
				top: 0px;
				border-radius: 16px;
				border: 4px solid #974BE0;
			}

			.search-wrapper .close {
				position: absolute;
				z-index: 1;
				top:24px;
				right:20px;
				width:25px;
				height:25px;
				cursor: pointer;
				-webkit-transform: rotate(-180deg);
				-moz-transform: rotate(-180deg);
				transform: rotate(-180deg);
				-webkit-transition: all .3s cubic-bezier(0.285, -0.450, 0.935, 0.110);
				-moz-transition: all .3s cubic-bezier(0.285, -0.450, 0.935, 0.110);
				transition: all .3s cubic-bezier(0.285, -0.450, 0.935, 0.110);
				-webkit-transition-delay: 0.2s;
				-moz-transition-delay: 0.2s;
				transition-delay: 0.2s;
			}
			.search-wrapper.active .close {
				right:-50px;
				-webkit-transform: rotate(45deg);
				-moz-transform: rotate(45deg);
				transform: rotate(45deg);
				-webkit-transition: all .6s cubic-bezier(0.000, 0.105, 0.035, 1.570);
				-moz-transition: all .6s cubic-bezier(0.000, 0.105, 0.035, 1.570);
				transition: all .6s cubic-bezier(0.000, 0.105, 0.035, 1.570);
				-webkit-transition-delay: 0.5s;
				-moz-transition-delay: 0.5s;
				transition-delay: 0.5s;
			}
			.search-wrapper .close::before, .search-wrapper .close::after {
				position:absolute;
				content:'';
				background: #FFF;
				border-radius: 2px;
			}
			.search-wrapper .close::before {
				width: 5px;
				height: 25px;
				left: 10px;
				top: 0px;
			}
			.search-wrapper .close::after {
				width: 25px;
				height: 5px;
				left: 0px;
				top: 10px;
			}
			.search-wrapper .result-container {
				width: 100%;
				position: absolute;
				top:80px;
				left:0px;
				text-align: center;
				font-family: "Open Sans", Arial, Verdana;
				font-size: 14px;
				display:none;
				color:#B7B7B7;
			}


			@media screen and (max-width: 560px) {
				.search-wrapper.active .input-holder {width:200px;}
			}  
		</style>
		
</head>
<body>
<header>
</header>
	<form runat="server">
		
		<asp:TextBox ID="search" class="search-input" type="text" placeholder="Type to search" runat="server"></asp:TextBox>

		<button id="Button1" OnServerClick="Button1_OnClick" runat="server">
	Search
</button>
		
		<div style="OVERFLOW:auto;WIDTH:1030px;HEIGHT:500px">
			<asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Height="230px" Width="1004px">
				<AlternatingRowStyle BackColor="White" ForeColor="#284775" />

				<EditRowStyle BackColor="#999999" />
				<FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
				<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
				<PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
				<RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
				<SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
				<SortedAscendingCellStyle BackColor="#E9E7E2" />
				<SortedAscendingHeaderStyle BackColor="#506C8C" />
				<SortedDescendingCellStyle BackColor="#FFFDF8" />
				<SortedDescendingHeaderStyle BackColor="#6F8DAE" />
			</asp:GridView>
			</div>
		
		<p style="color: #ffffff">
			Postive:
			<asp:TextBox ID="postiveTextBox" Visible="False" ReadOnly="True" type="text" runat="server"></asp:TextBox>
		</p>
		<p style="color: #ffffff">
			Negative:
			<asp:TextBox ID="negativeTextBox" Visible="False" ReadOnly="True" type="text" runat="server"></asp:TextBox>
		</p>
		<p style="color: #ffffff">
			Neutral:
			<asp:TextBox ID="neutralTextBox" Visible="False" ReadOnly="True" type="text" runat="server"></asp:TextBox>
		</p>
	
		<div id="chartContainer" style="height: 400px; width: 100%;"></div>
	</form>
	
	

</body>
</html>
