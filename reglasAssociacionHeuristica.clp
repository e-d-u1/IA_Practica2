(defrule precioMatch
   ?v <- (object (is-a Vivienda) (rangoPrecio ?rangoVivienda))
   ?s <- (object (is-a Solicitante) (rangoPrecio ?rangoSolicitante))
   (test (eq ?rangoVivienda ?rangoSolicitante))
   => 
   (send ?v put-aceptable "Aceptable")
   (printout t "La Vivienda " (instance-name ?v) 
               "tiene match con "
               (instance-name ?s) 
               "ahora la vivienda es "
               (send ?v get-aceptable) crlf)
)