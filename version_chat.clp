;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PRACTICA SBC - MVP DE RECOMENDACIÓN DE VIVIENDAS
;; Compatible con CLIPS 6.30
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Definición de Módulos
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 1. MÓDULO DE ENTRADA (INPUT)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmodule INPUT
  (export deftemplate user)
  (export deftemplate offer)
)
  (deftemplate user
    (slot id)
    (slot max-price)
    (slot min-rooms)
    (slot needs-elevator)
    (slot has-pets)
    (slot prefers-furnished)
    (slot prefers-transport-near)
  )

  (deftemplate offer
    (slot id)
    (slot price)
    (slot rooms)
    (slot area)
    (slot floor)
    (slot has-elevator)
    (slot pets-allowed)
    (slot furnished)
    (slot dist-transport)
    (slot sunny)
  )

  (deffacts initial-data
    (user 
      (id u1)
      (max-price 900)
      (min-rooms 2)
      (needs-elevator yes)
      (has-pets yes)
      (prefers-furnished no)
      (prefers-transport-near yes)
    )

    (offer 
      (id o1) (price 850) (rooms 2) (area 60) (floor 3)
      (has-elevator yes) (pets-allowed yes) (furnished no)
      (dist-transport 300) (sunny yes)
    )

    (offer 
      (id o2) (price 1200) (rooms 3) (area 85) (floor 1)
      (has-elevator no) (pets-allowed no) (furnished yes)
      (dist-transport 1200) (sunny no)
    )

    (offer 
      (id o3) (price 700) (rooms 1) (area 35) (floor 5)
      (has-elevator no) (pets-allowed yes) (furnished yes)
      (dist-transport 200) (sunny no)
    )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 2. MÓDULO DE ABSTRACCIÓN
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmodule ABSTRACTION
  (import INPUT deftemplate offer)
  (export deftemplate abstract-offer)
)
  (deftemplate abstract-offer
    (slot id)
    (slot price-cat)
    (slot size-cat)
    (slot accessibility)
  )

  (defrule make-abstract-offer
    ?o <- (offer (id ?id) (price ?p) (rooms ?r) (has-elevator ?e) (dist-transport ?d))
    =>
    (bind ?pc (if (< ?p 600) then low else (if (< ?p 1000) then medium else high)))
    (bind ?sc (if (< ?r 2) then small else (if (<= ?r 3) then medium else large)))
    (bind ?acc (if (and (eq ?e yes) (<= ?d 500)) 
                then good
                else 
                  (if (or (eq ?e yes) (<= ?d 1000))
                      then ok
                      else poor)))
    (assert (abstract-offer (id ?id) (price-cat ?pc) (size-cat ?sc) (accessibility ?acc)))
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 3. MÓDULO DE HEURÍSTICAS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmodule HEURISTICS
  (import INPUT deftemplate user)
  (import INPUT deftemplate offer)
  (import ABSTRACTION deftemplate abstract-offer)
  (export deftemplate recommendation)
)
  (deftemplate recommendation
    (slot id)
    (slot score)
    (multislot reasons)
    (slot label)
  )

  (defrule init-evaluate
    ?u <- (user)
    ?o <- (offer (id ?id))
    (not (recommendation (id ?id)))
    =>
    (assert (recommendation (id ?id) (score 0) (reasons) (label none)))
  )

  (defrule score-price
    ?u <- (user (max-price ?max))
    ?r <- (recommendation (id ?id) (score ?s) (reasons $?rs))
    (test (not (member$ price $?rs)))
    ?o <- (offer (id ?id) (price ?p))
    =>
    (if (or (<= ?p ?max) (<= ?p (+ ?max 150))) then (modify ?r (reasons $?rs price)))
  )

  (defrule score-rooms
    ?u <- (user (min-rooms ?min))
    ?r <- (recommendation (id ?id) (score ?s) (reasons $?rs))
    (test (not (member$ rooms $?rs)))
    ?o <- (offer (id ?id) (rooms ?rms))
    =>
    (if (>= ?rms ?min) then (modify ?r (reasons $?rs rooms)))
  )

  (defrule score-access-good
    (abstract-offer (id ?id) (accessibility good))
    ?r <- (recommendation (id ?id) (score ?s) (reasons $?rs))
    (test (not (or (member$ accessibility-good $?rs) (member$ accessibility-ok $?rs))))
    =>
    (modify ?r (reasons $?rs accessibility-good))
  )

  (defrule score-access-ok
    (abstract-offer (id ?id) (accessibility ok))
    ?r <- (recommendation (id ?id) (score ?s) (reasons $?rs))
    (test (not (or (member$ accessibility-good $?rs) (member$ accessibility-ok $?rs))))
    =>
    (modify ?r (reasons $?rs accessibility-ok))
  )

  (defrule score-pets
    ?u <- (user (has-pets yes))
    ?o <- (offer (id ?id) (pets-allowed yes))
    ?r <- (recommendation (id ?id) (score ?s) (reasons $?rs))
    (test (not (member$ pets $?rs)))
    =>
    (modify ?r (reasons $?rs pets))
  )

  (defrule score-furnished
    ?u <- (user (prefers-furnished yes))
    ?o <- (offer (id ?id) (furnished yes))
    ?r <- (recommendation (id ?id) (score ?s) (reasons $?rs))
    (test (not (member$ furnished $?rs)))
    =>
    (modify ?r (reasons $?rs furnished))
  )

  (defrule score-transport
    ?u <- (user (prefers-transport-near yes))
    ?o <- (offer (id ?id) (dist-transport ?d))
    ?r <- (recommendation (id ?id) (score ?s) (reasons $?rs))
    (test (not (or (member$ transport-near $?rs) (member$ transport-medium $?rs) (member$ transport-far $?rs))))
    =>
    (if (<= ?d 500) then 
        (modify ?r (reasons $?rs transport-near))
        else
        (if (<= ?d 1000)
            then (modify ?r (reasons $?rs transport-medium))
            else (modify ?r (reasons $?rs transport-far))))
  )

  (defrule score-sunny
    ?o <- (offer (id ?id) (sunny yes))
    ?r <- (recommendation (id ?id) (score ?s) (reasons $?rs))
    (test (not (member$ sunny $?rs)))
    =>
    (modify ?r (reasons $?rs sunny))
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 4. MÓDULO DE REFINAMIENTO (Etiquetas)
;;;;;;;;;;;;;;;;;;;;;;;;;;¡;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmodule REFINEMENT
  (import INPUT deftemplate user)
  (import INPUT deftemplate offer)
  (import ABSTRACTION deftemplate abstract-offer)
  (import HEURISTICS deftemplate recommendation)
)
  (defrule calculate-final-score
    (declare (salience -10)) ; Se ejecuta después de que las heurísticas recopilen razones
    ?u <- (user)
    ?o <- (offer (id ?id))
    ?ao <- (abstract-offer (id ?id))
    ?r <- (recommendation (id ?id) (score 0) (reasons $?rs&:(> (length$ $?rs) 0)))
    =>
    (bind ?score 0)
    ; Re-evaluar las condiciones y sumar puntos
    (if (member$ price $?rs) then
      (if (<= (fact-slot-value ?o price) (fact-slot-value ?u max-price))
        then (bind ?score (+ ?score 40))
        else (bind ?score (+ ?score 10))))
    
    (if (member$ rooms $?rs) then (bind ?score (+ ?score 25)))
    (if (member$ accessibility-good $?rs) then (bind ?score (+ ?score 25)))
    (if (member$ accessibility-ok $?rs) then (bind ?score (+ ?score 10)))
    (if (member$ pets $?rs) then (bind ?score (+ ?score 30)))
    (if (member$ furnished $?rs) then (bind ?score (+ ?score 10)))
    (if (member$ transport-near $?rs) then (bind ?score (+ ?score 15)))
    (if (member$ transport-medium $?rs) then (bind ?score (+ ?score 5)))
    (if (member$ sunny $?rs) then (bind ?score (+ ?score 5)))

    (modify ?r (score ?score))
  )

  (defrule label-muy-recomendable
    (declare (salience -20))
    ?r <- (recommendation (score ?s&:(> ?s 0)) (label none))
    (test (>= ?s 70))
    =>
    (modify ?r (label muy_recomendable))
  )

  (defrule label-adecuado
    (declare (salience -20))
    ?r <- (recommendation (score ?s&:(> ?s 0)) (label none))
    (test (and (>= ?s 40) (< ?s 70)))
    =>
    (modify ?r (label adecuado))
  )

  (defrule label-parcial
    (declare (salience -20))
    ?r <- (recommendation (score ?s&:(> ?s 0)) (label none))
    (test (< ?s 40))
    =>
    (modify ?r (label parcialmente_adecuado))
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 5. MÓDULO DE SALIDA (OUTPUT)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmodule OUTPUT
  (import HEURISTICS deftemplate recommendation)
)
  (defrule print-results
    ?r <- (recommendation (id ?id) (score ?s) (reasons $?rs) (label ?lab&~none))
    =>
    (printout t "----------------------------------" crlf)
    (printout t "Oferta: " ?id crlf)
    (printout t "Score: " ?s crlf)
    (printout t "Etiqueta: " ?lab crlf)
    (printout t "Razones: " ?rs crlf crlf)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 6. FLUJO DE CONTROL
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule MAIN::startup
  (declare (salience 100))
  =>
  (focus ABSTRACTION HEURISTICS REFINEMENT OUTPUT)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FIN
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
