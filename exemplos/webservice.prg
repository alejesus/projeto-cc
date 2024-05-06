#include "hbcompat.ch"

FUNCTION Main()

   // Tenta criar ...
   Try
      ? "HTTP 6.0"
      oHttp := win_OleCreateObject( "MSXML2.ServerXMLHTTP.6.0")
   Catch
      ? "Erro na Criação do Serviço ..."
      Return Nil
   End
  
   IF oHttp:ClassName = NIL
      Try
         ? "HTTP 5.0"
         oHttp := win_OleCreateObject( "MSXML2.ServerXMLHTTP.5.0")
      Catch
         ? "Erro na Criação do Serviço ..."
         Return Nil
      End
   ENDIF

   IF oHttp:ClassName = NIL
      Try
         ? "Outro HTTP"
         oHttp := win_OleCreateObject( "MSXML2.ServerXMLHTTP")
      Catch
         ? "Erro na Criação do Serviço ..."
         Return Nil
      End
   ENDIF

   TRY
      ? "chamando ViaCep ..."
      oHttp:Open( 'GET', "http://www.viacep.com.br/ws/06401147/json/", .F. )
      oHttp:Send()
   CATCH
      ? "Erro no processo - " + oHttp:lastErrorMessage()
   END

? oHttp:ResponseBody

RETURN
