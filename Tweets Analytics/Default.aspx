<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="UTF-8">
		
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<link rel="shortcut icon" href="http://icanbecreative.com/resources/images/favico.ico" />
		<link href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">

		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
	
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Bootstrap Login &amp; Register Templates</title>

	<!-- CSS -->
	<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
	<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="assets/css/form-elements.css">
	<link rel="stylesheet" href="assets/css/style.css">

	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
		<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	<![endif]-->

	<!-- Favicon and touch icons -->
	<link rel="shortcut icon" href="assets/ico/favicon.png">
	<link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
	<link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
	<link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
	<link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">
	
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
	<link rel="stylesheet" href="/resources/demos/style.css"/>
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
  } );
  </script>
</head>
<body>

<!-- Top content -->
<div class="top-content">

	<div class="inner-bg">
		<div class="container">

			<div class="row">
				<div class="col-sm-8 col-sm-offset-2 text">
					<h1><strong>Tweets</strong> Analysis
					</h1>
					<div class="description">
						<p>
							We use a sentiment dictionary to estimate sentiment. We search each tweet for words in the dictionary, then combine the words' pleasure and arousal ratings to estimate sentiment for the entire tweet.
						</p>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-sm-8 col-sm-offset-2">

					<div class="form-box">
						<div class="form-top">
							<div class="form-top-left">
								
								<form runat="server">
		
		<asp:TextBox ID="search" class="search-input" type="text" placeholder="Type to search" runat="server"></asp:TextBox>

		<button id="Button1" OnServerClick="Button1_OnClick" runat="server">
	Search
</button>
									
								<div class="form-group">
									<div style="OVERFLOW:auto;WIDTH:1020px;HEIGHT:500px">
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
	

								</div>
							</form>
						</div>
					</div>


				</div>

				

				

		</div>
	
									
							</div>
							<div class="form-top-right">
								<i class="fa fa-lock"></i>
							</div>
						</div>
						<div class="form-bottom">
							
								<div class="form-group">
									

								</div>
							
						</div>
					</div>


				</div>

				

				

	

<!-- Footer -->
<footer>
	<div class="container">
		<div class="row">

			<div class="col-sm-8 col-sm-offset-2">
				<div class="footer-border"></div>
				<p>
					Made by Faizan Ishfaq at <a href="http://faceboook.com/faizi.ch4" target="_blank">
						<strong>Faizi</strong>... 
					</a>
					Have a lot of fun. <i class="fa fa-smile-o"></i>
				</p>
			</div>

		</div>
	</div>
</footer>

<!-- Javascript -->
<script src="assets/js/jquery-1.11.1.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/js/jquery.backstretch.min.js"></script>
<script src="assets/js/scripts.js"></script>

<!--[if lt IE 10]>
	<script src="assets/js/placeholder.js"></script>
<![endif]-->
</body>
</html>