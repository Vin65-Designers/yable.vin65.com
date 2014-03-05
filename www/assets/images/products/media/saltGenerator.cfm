<cfset results.secretKey=GenerateSecretKey('DESEDE')>

<cfset passwordCharacters='abcdefghijklmnopqrstuvwxyz'>

<cfset results.salt=''>
<cfloop from="1" to="8" index="i">
	<cfset results.salt=results.salt & Mid(passwordCharacters,RandRange(1,len(passwordCharacters)),1)>
</cfloop>


<cfdump var="#results#">
<Cfabort>


<cfoutput>

<cfset variables.theKey = "rpaSPvIvVLlrcmtzPU9/c67Gkj7yL1S5">
<cfset variables.theIV = BinaryDecode("password","Base64")>
<cfset variables.theAlgorithm = "DESEDE">
<cfset variables.theEncoding = "Base64">

<cfset variables.theString = decrypt('vZQ4eeMKhrYGvmr9GAVh8qX9WI9mVSJA', variables.theKey, variables.theAlgorithm, variables.theEncoding, variables.theIV)>

<cfset variables.theString=encrypt('Yes Master',variables.theKey,variables.theAlgorithm,variables.theEncoding,variables.theIV)>

   <p>Output: #variables.theString#





<!---
<cfset decryptString=decrypt('4FB4C0786E2D3698','123456789112345678911234567891123456789112345678','DESEDE','HEX','MTIzNDU2Nzg5MTEyMzQ1Ng==')>
--->

<cfabort>

<cffunction name="genSalt" access="public" returnType="string">
    <cfargument name="size" type="numeric" required="false" default="16" />
    <cfscript>
     var byteType = createObject('java', 'java.lang.Byte').TYPE;
     var bytes = createObject('java','java.lang.reflect.Array').newInstance( byteType , size);
     var rand = createObject('java', 'java.security.SecureRandom').nextBytes(bytes);
     return toBase64(bytes);
    </cfscript>
</cffunction>

<cfset salt=genSalt()>

<cfset test=GenerateSecretKey('DESEDE')>



<cfdump var="#test#">
<hr/>
<cfdump var="#salt#">
<cfset encryptedString=Encrypt('HelloWorld',test,'DESEDE','HEX',salt)>
<!---
<cfdump var="#secretKey#">
<hr/>
--->
<hr/>
<cfdump var="#encryptedString#">

</Cfoutput>