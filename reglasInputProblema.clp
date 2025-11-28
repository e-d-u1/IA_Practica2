(deffunction ask-number (?question)
	(printout t ?question)
	(bind ?answer (read))
	(while (lexemep ?answer) do
		(printout t ?question)
		(bind ?answer (read))
		)
	(float ?answer)
)

(deffunction ask-int (?question)
	(printout t ?question)
	(bind ?answer (read))
	(while (lexemep ?answer) do
		(printout t ?question)
		(bind ?answer (read))
		)
	(integer ?answer))


(deffunction ask-question (?question $?allowed-values)
   (printout t ?question)
   (bind ?answer (read))
   (if (lexemep ?answer)
       then (bind ?answer (lowcase ?answer)))
   (while (not (member ?answer ?allowed-values)) do
      (printout t ?question)
      (bind ?answer (read))
      (if (lexemep ?answer)
          then (bind ?answer (lowcase ?answer))))
   ?answer)

(deffunction yes-or-no-p (?question)
   (bind ?response (ask-question ?question yes no y n))
   (if (or (eq ?response yes) (eq ?response y))
       then "true"
       else "false"))

		
(defrule tieneMascota
	?x <- (object (is-a Solicitante) (mascotas ?e&:(eq ?e nil)))
	=>
	(bind ?tieneMascota (yes-or-no-p "Tienes mascota? (yes/no) "))
	(send ?x put-mascotas ?tieneMascota)
)

(defrule queEdad
	?x <- (object (is-a Solicitante) (edad ?e&:(eq ?e nil)))
	=>
	(bind ?age (ask-int "Cual es tu edad? "))
	(send ?x put-edad ?age)
)

(defrule esNegociable
	?x <- (object (is-a Solicitante) (precioNegociable ?pN&:(eq ?pN nil)))
	=>
	(bind ?pN (yes-or-no-p "El precio es negociable ? (yes/no) "))
	(send ?x put-precioNegociable ?pN)
)