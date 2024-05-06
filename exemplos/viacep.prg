function main

cURL := "www.viacep.com.br/ws/01001000/json/"

oServerWS := CreateObject( _MSXML2_ServerXMLHTTP )
oServerWS:open('GET', cURL, .f.)
// oServerWS:setRequestHeader('host',cHost)
Try
   oServerWS:send()
CATCH e
   ? "Problemas ao realizar solicitação com o Web Service."
END


/*

https://fivewin.com.br/index.php?/topic/30254-arquivo-bin%C3%A1rio/#comment-305789

oHttp := CreateObject("MSXML2.ServerXMLHTTP.6.0")
oHttp:Open("POST", "https://content.dropboxapi.com/2/files/upload", .f.)
oHttp:setRequestHeader( "Authorization", "Bearer " + alltrim(Taux_Token) )
oHttp:setRequestHeader( "Content-Length: " + str(len(Taux_Binario)) )
oHttp:setRequestHeader( "Content-Type", "application/pdf" )
oHttp:setRequestHeader( [Content-Disposition: form-data; name="arquivo"; filename="\temp\TestePZ.pdf" ] + Taux_Binario )
oHttp:setRequestHeader( "Dropbox-API-Arg", Taux_API_Arg )
oHttp:Send()


https://fivewin.com.br/index.php?/topic/40047-ref-api/#comment-304885

#Include "Fivewin.ch"
//--------------------------------

function main()
local pCpf     := "99999999999" 
local pCnpj    := "08124858000100"
local pNome    := "joao carlos" 
local pArquivo := ".\func0001.JPG"
local cRetorno := ""
cRetorno := fEnviaArquivo( pCpf, pCnpj, pNome, pArquivo )
SysRefresh()
 MsgInfo( cRetorno )
MemoWrit(".\carlos.txt", cRetorno )

return .t.
*------------------------------------------------------------------------------*


*------------------------------------------------------------------------------*
* Analista : maniel
*
* Objetivo : Enviar Arquivo 
*------------------------------------------------------------------------------*
Function fEnviaArquivo( pCpf, pCnpj, pNome, pArquivo )
Local oHttp , cTexto :=""
Try
   oHttp := CreateObject( 'MSXML2.XMLHTTP' )
Catch
   oHttp := CreateObject( 'Microsoft.XMLHTTP' )
End

oHttp:Open( 'POST', "https://api-fpm.syspel.com.br/api/recibos/", .F. )

cTexto := '{ '
cTexto += '"id_client": '  +pCpf
cTexto += '"id_company": ' +pCnpj
cTexto += '"Id_employee": '+pNome
cTexto += '"File": '       +pArquivo 
cTexto += ' }' 

try
   oHttp:Send( cTexto )
catch
   MsgInfo( "Erro no processo post:" + oHttp:lastErrorMessage())
end

Return oHttp:ResponseBody

*/