#include "Fivewin.ch"

FUNCTION Main()

   LOCAL pCpf     := "99999999999"
   LOCAL pCnpj    := "08124858000100"
   LOCAL pNome    := "joao carlos"
   LOCAL pArquivo := ".\func0001.JPG"
   // LOCAL pArquivo := ".\LOGO.jpg"
   LOCAL cRetorno := ""

   cRetorno := fEnviaArquivo( pCpf, pCnpj, pNome, pArquivo )

   MsgInfo( cRetorno )

   MemoWrit( ".\carlos.txt", cRetorno )

RETURN NIL // .T.

// ------------------------------------------------------------------------------*
// Analista : maniel
//
// Objetivo : Enviar Arquivo
// ------------------------------------------------------------------------------*
FUNCTION fEnviaArquivo( pCpf, pCnpj, pNome, pArquivo )

   LOCAL oHttp, cTexto := ""

   #IFDEF __XHARBOUR__  // xHarbour

      Try

          oHttp:= CreateObject( "MSXML2.ServerXMLHTTP.6.0" )

      Catch

         MsgInfo('Erro na Criação do Serviço!', 'xHarbour: Atenção!')

         Return Nil
      End

   #ELSE

      Try

         oHttp:= win_OleCreateObject( "MSXML2.ServerXMLHTTP.5.0")

      Catch

         MsgInfo('Erro na Criação do Serviço!', 'Harbour: Atenção!')

         Return Nil
      End

   #ENDIF

   TRY

      oHttp:Open( 'POST', "https://api-fpm.syspel.com.br/api/recibos/", .F. )

      cTexto := '{ '
      cTexto += '"id_client": '  + pCpf
      cTexto += '"id_company": ' + pCnpj
      cTexto += '"Id_employee": ' + pNome
      cTexto += '"File": '       + pArquivo
      cTexto += ' }'

      oHttp:Send( cTexto )

   CATCH

      MsgInfo( "Erro no processo post:" + oHttp:lastErrorMessage() )

   END

RETURN( oHttp:ResponseBody )
