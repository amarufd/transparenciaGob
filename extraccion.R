rm(list = ls())

#install.packages('httr')
#install.packages('XML')
#install.packages('jsonlite')
#install.packages('rvest')

library(httr)
library(jsonlite)
library(xml2)
library(XML)
library(rvest)

p_p_id <- 'pdtescritoriotaportlet_WAR_pdtescritoriotaportlet'
p_p_lifecycle <- 2
p_p_state <- 'normal'
p_p_mode <- 'view'
p_p_cacheability <- 'cacheLevelPage'
p_p_col_id <- 'column-1'
p_p_col_count <- 1


pdtescritoriotaportlet_WAR_pdtescritoriotaportlet__jsfBridgeAjax <- 'true'
pdtescritoriotaportlet_WAR_pdtescritoriotaportlet__facesViewIdResource <- '%2Fviews%2Fview-visualizacion-datos.xhtml'
pdtescritoriotaportlet_WAR_pdtescritoriotaportlet_materia <- 'PR'
pdtescritoriotaportlet_WAR_pdtescritoriotaportlet_pagina <- 52470664
pdtescritoriotaportlet_WAR_pdtescritoriotaportlet_organismo <- 'AR004'
pdtescritoriotaportlet_WAR_pdtescritoriotaportlet_item <- 'PCONT'


direccion <- paste('https://www.portaltransparencia.cl/PortalPdT/web/guest/pdtta?p_p_id=',p_p_id,'&p_p_lifecycle=',p_p_lifecycle,'&p_p_state=',p_p_state,'&p_p_mode=',p_p_mode,'&p_p_cacheability=',p_p_cacheability,'&p_p_col_id=',p_p_col_id,'&p_p_col_count=',p_p_col_count,'&_pdtescritoriotaportlet_WAR_pdtescritoriotaportlet__jsfBridgeAjax=',pdtescritoriotaportlet_WAR_pdtescritoriotaportlet__jsfBridgeAjax, '&_pdtescritoriotaportlet_WAR_pdtescritoriotaportlet__facesViewIdResource=',pdtescritoriotaportlet_WAR_pdtescritoriotaportlet__facesViewIdResource,'&_pdtescritoriotaportlet_WAR_pdtescritoriotaportlet_materia=',pdtescritoriotaportlet_WAR_pdtescritoriotaportlet_materia,'&_pdtescritoriotaportlet_WAR_pdtescritoriotaportlet_pagina=',pdtescritoriotaportlet_WAR_pdtescritoriotaportlet_pagina,'&_pdtescritoriotaportlet_WAR_pdtescritoriotaportlet_organismo=',pdtescritoriotaportlet_WAR_pdtescritoriotaportlet_organismo,'&_pdtescritoriotaportlet_WAR_pdtescritoriotaportlet_item=',pdtescritoriotaportlet_WAR_pdtescritoriotaportlet_item, sep = "")
Cookie <- 'csfcfc=64408Xfn_64406Xfn; JSESSIONID=F90FC88B3665F37D0E6FACED07FC01F7; JSESSION=.lfray6; __utmc=154704569; GUEST_LANGUAGE_ID=es_ES; COOKIE_SUPPORT=true; __utma=154704569.1511478743.1597889515.1598106367.1598132646.7; __utmz=154704569.1597889515.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); _ga=GA1.2.1511478743.1597889515; _gid=GA1.2.567061068.1598037784; __utmb=154704569.2.10.1598132646; __utmt=1; _dc_gtm_UA-40413011-1=1'
ContentType <- 'application/x-www-form-urlencoded; charset=UTF-8'
# A2248%3Aform-visualizar%3Adatosplantilla_first

datosFinal <- data.frame()
javaxfacesViewState <- '-8717808788863862306%3A-4995707457240490880'

for (numero in 1:14) {
  #numero <- 2
  urlInicio <- 'javax.faces.partial.ajax=true&javax.faces.source=A2248%3Aform-visualizar%3Adatosplantilla&javax.faces.partial.execute=A2248%3Aform-visualizar%3Adatosplantilla&javax.faces.partial.render=A2248%3Aform-visualizar%3Adatosplantilla&A2248%3Aform-visualizar%3Adatosplantilla=A2248%3Aform-visualizar%3Adatosplantilla&A2248%3Aform-visualizar%3Adatosplantilla_pagination=true&A2248%3Aform-visualizar%3Adatosplantilla_first='
  urlFinal <- '00&A2248%3Aform-visualizar%3Adatosplantilla_rows=100&A2248%3Aform-visualizar%3Adatosplantilla_encodeFeature=true&A2248%3Aform-visualizar=A2248%3Aform-visualizar&javax.faces.encodedURL=https%3A%2F%2Fwww.portaltransparencia.cl%2FPortalPdT%2Fweb%2Fguest%2Fpdtta%3Fp_p_id%3Dpdtescritoriotaportlet_WAR_pdtescritoriotaportlet%26p_p_lifecycle%3D2%26p_p_state%3Dnormal%26p_p_mode%3Dview%26p_p_cacheability%3DcacheLevelPage%26p_p_col_id%3Dcolumn-1%26p_p_col_count%3D1%26_pdtescritoriotaportlet_WAR_pdtescritoriotaportlet__jsfBridgeAjax%3Dtrue%26_pdtescritoriotaportlet_WAR_pdtescritoriotaportlet__facesViewIdResource%3D%252Fviews%252Fview-visualizacion-datos.xhtml%26_pdtescritoriotaportlet_WAR_pdtescritoriotaportlet_materia%3DPR%26_pdtescritoriotaportlet_WAR_pdtescritoriotaportlet_pagina%3D52470664%26_pdtescritoriotaportlet_WAR_pdtescritoriotaportlet_organismo%3DAR004%26_pdtescritoriotaportlet_WAR_pdtescritoriotaportlet_item%3DPCONT&javax.faces.ViewState='
  print(numero)
  BodyStr <- paste(urlInicio,numero,urlFinal,javaxfacesViewState,sep = "")
  contenido <- POST(url = direccion, add_headers('Content-Type'= ContentType ,Cookie = Cookie), body = BodyStr, encode = "form")
  contentNuevo <- content(contenido,"text")
  
  xData <- xmlParse(contentNuevo)
  cData <- xpathSApply(xData, "//text()", xmlValue)
  #cData
  typeof(cData)
  htmlInicial <- '<html> <header> <title> Mi Primera Pagina </title> </header> <body><table>'
  htmlFinal <- '</table> </body> </html>'
  htmlCdata <- paste(htmlInicial,cData[1],htmlFinal,sep = "")
  
  fileConn<-file("output.html")
  writeLines(htmlCdata, fileConn)
  close(fileConn)
  
  dataOut <-  read_html("output.html")
  datos <- html_table(dataOut)[[1]]
  datosFinal <- rbind(datosFinal, datos)
  
  #View(datosFinal)
  print(length(datos))
  print(length(datosFinal))  
}

write.csv(datosFinal,file = "datos.csv")



