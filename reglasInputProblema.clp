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
       then TRUE
       else FALSE))

		
(defrule hasPet
	?x <- (object (is-a Solicitante) (mascotas ?e&:(eq ?e nil)))
	=>
	(bind ?teMascota (yes-or-no-p "Tens mascota? (yes/no) "))
	(send ?x put-mascotas ?teMascota)
)

(defrule howOld
	?x <- (object (is-a Solicitant) (edat ?e&:(eq ?e nil)))
	=>
	(bind ?age (ask-int "Quina es la teva edat? "))
	(send ?x put-edat ?age)
)

(defrule esNegociable
	?x <- (object (is-a Solicitant) (precioNegociable ?pN&:(eq ?pN nil)))
	=>
	(bind ?precioNegociable (yes-or-no-p "El precio es negociable ? (yes/no) "))
	(send ?x put-estricte ?precioNegociable)
)