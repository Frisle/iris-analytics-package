Class diashenrique.util.Utils Extends %RegisteredObject [ ClassType = "", ProcedureBlock ]
{

ClassMethod GrantOnAllTables(schema As %String, user As %String, select As %Boolean, insert As %Boolean, delete As %Boolean, update As %Boolean, references As %Boolean)
{
	set %msql = "_SYSTEM"
	set owner = ""
	set sc = ##class(%SQLCatalog).SQLTablesExecute(.qhandle, owner)
	set sql = ##class(%ResultSet).%New("%DynamicQuery:SQL")
	
	set grants = ""
	set count = 0
	if (select) set $piece(grants, ", ", $increment(count)) = "SELECT"
	if (insert) set $piece(grants, ", ", $increment(count)) = "INSERT"
	if (delete) set $piece(grants, ", ", $increment(count)) = "DELETE"
	if (update) set $piece(grants, ", ", $increment(count)) = "UPDATE"
	if (references) set $piece(grants, ", ", $increment(count)) = "REFERENCES"
	
	set row = ""
	set atEnd = 0
	while (1)
	{
		set sc = ##class(%SQLCatalog).SQLTablesFetch(.qhandle, .row, .atEnd)
		quit:atEnd
 
		continue:(($length(schema) > 0) &&
			($piece($list(row, 1), ".", 1, $length($list(row, 1), ".") - 1) '= schema))
		
		write "Granting access on table '", $list(row, 1), "' to user '", user, "'", $char(13), $char(10)
		do sql.Prepare("GRANT "_grants_" ON "_$list(row, 1)_" TO "_user)
		do sql.Execute()
	}
	do ##class(%SQLCatalog).SQLTablesClose($get(qhandle))
}

/// do ##class(diashenrique.util.Utils).importCHSP()
ClassMethod importCHSP() As %Status
{
 
    set file = ##class(%File).%New("/irisdev/dataImport/chspFINANCE.csv")
    set sc = file.Open("R") 
    if $$$ISERR(sc) quit

    set count = 0
    while 'file.AtEnd {
        set count = $INCREMENT(count)
        set str=file.ReadLine() 
        continue:(count=1)
        quit:(str="")

        set newline = ##class(diashenrique.olist.data.chspfinance).%New()
        
        set valorCSV = $replace($piece(str,";",1),",",".")
        set newline.Valor = valorCSV

        set newline.CodRequisicao = $piece(str,";",2)

        set dataRequisicao = $piece(str,";",3)
        if (dataRequisicao = "0/0/0") {
            set dataRequisicao = ""
        } else {
            set dataRequisicao = $zdateh(dataRequisicao,4)
        }
        set newline.DataRequisicao = dataRequisicao
        
        set dataColeta = $piece(str,";",4)
        if (dataColeta = "0/0/0") {
            set dataColeta = ""
        } else {
            set dataColeta = $zdateh(dataColeta,4)
        }
        set newline.DataColeta = dataColeta

        set dataLiberacao = $piece(str,";",5)
        if (dataLiberacao = "0/0/0") {
            set dataLiberacao = ""
        } else {
            set dataLiberacao = $zdateh(dataLiberacao,4)
        }
        set newline.DataLiberacao = dataLiberacao

        set newline.Paciente = $piece(str,";",6)
        set newline.ItemTabelaComercial = $piece(str,";",7)
        set newline.UnidadeProducao = $piece(str,";",8)
        set newline.StatusUnidadeProducao = $piece(str,";",9)
        set newline.Setor = $piece(str,";",10)
        set newline.CodigoLote = $piece(str,";",11)
        set newline.StatusLote = $piece(str,";",12)
        set newline.DiaInicialLote = $piece(str,";",13)
        set newline.MesInicialLote = $piece(str,";",14)
        set newline.AnoInicialLote = $piece(str,";",15)
        set newline.DiaFinalLote = $piece(str,";",16)
        set newline.MesFinalLote = $piece(str,";",17)
        set newline.AnoFinalLote = $piece(str,";",18)
        set newline.Pagador = $piece(str,";",19)
        set newline.ClienteComercial = $piece(str,";",20)
        set newline.MedicoSolicitante = $piece(str,";",21)
        set newline.Executor = $piece(str,";",22)
        set newline.ResponsavelColeta = $piece(str,";",23)
        do newline.%Save()
    }
    do file.Close()
}

}
