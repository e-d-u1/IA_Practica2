(defrule precioPisoAbs
   ?v <- (object (is-a Vivienda) (precio ?p))
   => 
   (if (< ?p 1000) then
         (send ?v put-rangoPrecio "Bajo")
      else
         (if (< ?p 1700) then
            (send ?v put-rangoPrecio "Medio")
         else
            (send ?v put-rangoPrecio "Alto")
         )
      )
   
   (printout t "La Vivienda " (instance-name ?v) 
               "tiene como rango de precio  "
               (send ?v get-rangoPrecio) crlf)
)

(defrule precioSolicitanteAbs
   ?s <- (object (is-a Solicitante) (precioMax ?p))
   => 
   (if (< ?p 1000) then
         (send ?s put-rangoPrecio "Bajo")
      else
         (if (< ?p 1700) then
            (send ?s put-rangoPrecio "Medio")
         else
            (send ?s put-rangoPrecio "Alto")
         )
      )
   
   (printout t "El solicitante " (instance-name ?s) 
               "tiene como rango de precio  "
               (send ?s get-rangoPrecio) crlf)
)
