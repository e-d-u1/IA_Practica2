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

(defrule precioPisoAbs
   ?s <- (object (is-a Solicitante) (precioMax ?pMax))
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
