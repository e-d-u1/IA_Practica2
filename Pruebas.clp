(defrule recomendar-aire
   ?s <- (object (is-a Solicitante) (preferenciaAire ?aire))
   ?v <- (object (is-a Vivienda) (aireAcondicionado ?ac))
   (test (eq ?aire ?ac))
   => 
   (printout t "La Vivienda " (instance-name ?v) 
               "cumple con la preferencia de aireAcondicionado de "
               (instance-name ?s) clrf))

(defrule establecer-precio
   ?s <- (object (is-a Solicitante) (precioMin ?pMin) (precioMax ?pMax) (precioNegociable ?negociable))
   ?v <- (object (is-a Vivienda))
   
   =>
   
   (bind ?precioCasa (send ?v get-precio))

   (if (>= ?pMax ?precioCasa)
    then
       (send ?v put-rangoPrecio "Ajustado")
    else
       (if (and (eq ?negociable TRUE)
                (>= (* ?pMax 1.5) ?precioCasa))
           then
               (send ?v put-rangoPrecio "Aceptable")
           else
               (send ?v put-rangoPrecio "Fuera")))    
)