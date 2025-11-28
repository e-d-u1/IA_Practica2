(defrule precioPisoAbs
   ?v <- (object (is-a Vivienda) (precio ?p))
   => 
   (if (< ?p 1000) then
         (send ?v put-rangoPrecio_Abs "Bajo")
      else
         (if (< ?p 1700) then
            (send ?v put-rangoPrecio_Abs "Medio")
         else
            (send ?v put-rangoPrecio_Abs "Alto")
         )
      )
   
   (printout t "La Vivienda " (instance-name ?v) 
               "tiene como rango de precio  "
               (send ?v get-rangoPrecio_Abs) crlf)
)


(defrule precioSolicitanteAbs
   ?s <- (object (is-a Solicitante) (precioMax ?p))
   => 
   (if (< ?p 1000) then
         (send ?s put-rangoPrecio_Abs "Bajo")
      else
         (if (< ?p 1700) then
            (send ?s put-rangoPrecio_Abs "Medio")
         else
            (send ?s put-rangoPrecio_Abs "Alto")
         )
      )
   
   (printout t "El solicitante " (instance-name ?s) 
               "tiene como rango de precio  "
               (send ?s get-rangoPrecio_Abs) crlf)
)

(defrule edadSolicitanteAbs
   ?s <- (object (is-a Solicitante) (edad ?e))
   => 
   (if (< ?e 31) then
         (send ?s put-edad_Abs "Joven")
      else
         (if (< ?e 60) then
            (send ?s put-edad_Abs "Adulto")
         else
            (send ?s put-edad_Abs "Anciano")
         )
      )
   
   (printout t "El solicitante " (instance-name ?s) 
               " es "
               (send ?s get-edad_Abs) crlf)
)
