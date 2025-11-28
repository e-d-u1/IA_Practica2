(defrule mascotas_check
   ?v <- (object (is-a Vivienda) (sePermitenMascotas ?mascotasVivienda&:(neq ?mascotasVivienda nil)))
   ?s <- (object (is-a Solicitante) (mascotas ?mascotasSolicitante&:(neq ?mascotasSolicitante nil)))
   (test (eq ?mascotasVivienda ?mascotasSolicitante))
   => 
   (send ?v put-mascotas_cumple "Ok")
   (printout t "La Vivienda " (instance-name ?v) 
               " cumple con las mascotas de "
               (instance-name ?s) crlf)
)

(defrule precioMatch
   ?v <- (object (is-a Vivienda) (rangoPrecio_Abs ?rangoVivienda&:(neq ?rangoVivienda nil)))
   ?s <- (object (is-a Solicitante) (rangoPrecio_Abs ?rangoSolicitante&:(neq ?rangoSolicitante nil)))
   (test (eq ?rangoVivienda ?rangoSolicitante))
   => 
   (send ?v put-aceptable_Abs "Aceptable")
   (printout t "La Vivienda " (instance-name ?v) 
               "tiene match con "
               (instance-name ?s) 
               "ahora la vivienda es "
               (send ?v get-aceptable_Abs) crlf)
)