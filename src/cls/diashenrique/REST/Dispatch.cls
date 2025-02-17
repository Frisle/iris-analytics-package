Class diashenrique.REST.Dispatch Extends %CSP.REST
{

/// Ignore any writes done directly by the REST method.
Parameter IgnoreWrites = 0;

/// By default convert the input stream to Unicode
Parameter CONVERTINPUTSTREAM = 1;

/// The default response charset is utf-8
Parameter CHARSET = "utf-8";

Parameter HandleCorsRequest = 1;

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>

<Route Url="/" Method="GET" Call="Test" Cors="true"/>
<Route Url="/import" Method="post" Call="import" />

</Routes>
}

ClassMethod Test() As %Status
{
	Set %response.ContentType = "application/json"
	Set retObj = { }
	Set retMessage = "Hello World!"
	Set retObj.Message = retMessage
	Write retObj.%ToJSON()
	Quit $$$OK
}

/// Get this spec
ClassMethod import() As %Status
{
  #dim %request As %CSP.Request
  #dim %response As %CSP.Response
  #dim stream As %CSP.BinaryStream 
  
  Try {

    // Get properties
    set body = %request.Get("body")
    set ^log("body") = body
    if '$d(body) {
      $$$ThrowOnError($$$ERROR(9200,"no parameters"))
    }
    set dynaBody = {}.%FromJSON(body)

    // Get stream
    set stream = %request.GetMimeData("FileStream")
    if (('$IsObject(stream)) && ('dynaBody.enableUrl)) {
      $$$ThrowOnError($$$ERROR(9200,"no file"))
    }
    
    if 'dynaBody.enableUrl{
      $$$ThrowOnError(##class(community.csvgen).StreamToFile(stream,.filename))
      $$$ThrowOnError(##class(community.csvgen).Generate(filename,dynaBody.separator,dynaBody.className))
    } else {
      $$$ThrowOnError(##class(community.csvgen).GenerateFromURL(dynaBody.url,dynaBody.separator,dynaBody.className))
    }

  } Catch ex {
      Return ex.AsStatus()
  }

  Quit $$$OK
}

}
