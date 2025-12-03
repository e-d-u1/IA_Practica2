;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PRACTICA SBC - MVP DE RECOMENDACIÓN DE VIVIENDAS
;; Basado en CLASSES (defclass)
;; Compatible con CLIPS 6.30
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 1. MÓDULO DE ENTRADA (INPUT)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmodule INPUT
   (export ?ALL)
)
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
       then yes
       else no))



;; Clase Solicitante
(defclass Solicitante
   (is-a USER)
   (role concrete)
   (pattern-match reactive)

   (slot id (type SYMBOL) (create-accessor read-write))
   

   (multislot cerca_de (type INSTANCE) (create-accessor read-write))
   (multislot media_de (type INSTANCE) (create-accessor read-write))
   (multislot lejos_de (type INSTANCE) (create-accessor read-write))

   (slot precioMax (type INTEGER) (create-accessor read-write))
   (slot edad (type INTEGER) (create-accessor read-write))
   (slot numHabitaciones (type INTEGER) (create-accessor read-write))
   (slot ascensor (type SYMBOL) (create-accessor read-write))
   (slot mascotas (type SYMBOL) (create-accessor read-write))
   (slot amueblado (type SYMBOL) (create-accessor read-write))

   (slot precio-cat (type SYMBOL) (create-accessor read-write))
   (slot tamano-cat (type SYMBOL) (create-accessor read-write))

   (slot ascensor_Abs (type SYMBOL) (create-accessor read-write))
   (slot mascotas_Abs (type SYMBOL) (create-accessor read-write))
   (slot amueblado_Abs (type SYMBOL) (create-accessor read-write))

   (multislot restricciones)
)

;; Clase Vivienda
(defclass Vivienda
   (is-a USER)
   (role concrete)
   (pattern-match reactive)

   (slot id (type SYMBOL) (create-accessor read-write))
   
   (slot precio (type INTEGER) (create-accessor read-write))
   (slot habitaciones (type INTEGER) (create-accessor read-write))
   (slot superficie (type INTEGER) (create-accessor read-write))
   (slot planta (type INTEGER) (create-accessor read-write))
   (slot ascensor (type SYMBOL) (create-accessor read-write))
   (slot mascotasPermitidas (type SYMBOL) (create-accessor read-write))
   (slot amueblado (type SYMBOL) (create-accessor read-write))
   (slot soleado (type SYMBOL) (create-accessor read-write))
   (slot coordX (type INTEGER) (create-accessor read-write))
   (slot coordY (type INTEGER) (create-accessor read-write))

   (multislot cerca_de (type INSTANCE) (create-accessor read-write))
   (multislot media_de (type INSTANCE) (create-accessor read-write))
   (multislot lejos_de (type INSTANCE) (create-accessor read-write))

   (slot precio-cat (type SYMBOL) (create-accessor read-write))
   (slot tamano-cat (type SYMBOL) (create-accessor read-write))
   (slot superficie-cat (type SYMBOL) (create-accessor read-write))

   (slot ascensor_Abs (type SYMBOL) (create-accessor read-write))
   (slot mascotasPermitidas_Abs (type SYMBOL) (create-accessor read-write))
   (slot amueblado_Abs (type SYMBOL) (create-accessor read-write))
   (slot soleado_Abs (type SYMBOL) (create-accessor read-write))
)

;; Clase Servicio
(defclass Servicio
   (is-a USER)
   (role concrete)
   (pattern-match reactive)

   (slot tipo (type SYMBOL) (create-accessor read-write))
   (slot coordX (type INTEGER) (create-accessor read-write))
   (slot coordY (type INTEGER) (create-accessor read-write))
)


(definstances instances
   ;; Solicitantes
   ([Usuario1] of Solicitante
       (id u1)
       (precioMax 900)
       (numHabitaciones 2)
       (ascensor yes)
       (amueblado no)
   )

   ;; Viviendas
   ([Vivienda1] of Vivienda
       (id o1) (precio 850) (habitaciones 2) (superficie 60) (planta 3) (ascensor yes)
       (mascotasPermitidas yes) (amueblado no) (soleado yes)
   )

   ([Vivienda2] of Vivienda
       (id o2) (precio 1200) (habitaciones 3) (superficie 85) (planta 1)(ascensor no)
       (mascotasPermitidas no) (amueblado yes) (soleado no)
   )

   ([Vivienda3] of Vivienda
       (id o3) (precio 700) (habitaciones 1) (superficie 35) (planta 5)
       (ascensor no) (mascotasPermitidas yes) (amueblado yes) (soleado no)
   )
   ([HospitalSantPau] of Servicio
      (tipo Hospital) (coordX 10) (coordY 10)
   )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 2. MÓDULO DE ABSTRACCIÓN
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmodule ABSTRACCION
   (import INPUT ?ALL)
   (export ?ALL)
)
      (defrule queEdad
      ?x <- (object (is-a Solicitante) (edad ?e&:(eq ?e 0)))
      =>
      (bind ?age (ask-int "Cual es tu edad? "))
      (send ?x put-edad ?age)
   )

     (defrule preguntar-si-hay-restricciones
      ?u <- (object (is-a Solicitante) (id ?id))
      (not (pregunta-hecha restricciones-iniciales))
      =>
      (assert (pregunta-hecha restricciones-iniciales))
      (bind ?resp (yes-or-no-p "¿Tienes alguna restriccion? (yes/no) "))

      (if (eq ?resp yes)
         then
            (assert (debe-preguntar-restriccion ?id))
      )
   )

   (defrule preguntar-tipo-restriccion
      ?x <- (debe-preguntar-restriccion ?id)
      ?u <- (object (is-a Solicitante) (id ?id) (restricciones $?r))
      =>
      (bind ?tipo (ask-question 
         "¿Que restriccion tienes? (mascotas, ascensor, amueblado) "
         mascotas ascensor amueblado))

      ;; Insertar la restricción en el multislot
      (send ?u put-restricciones (create$ $?r ?tipo))

      (retract ?x)
   )

   (defrule preguntar-restriccion-ascensor
      ?x <- (object (is-a Solicitante)
            (restricciones $?r&:(member ascensor ?r))
            (ascensor ?a&:(eq ?a nil)))
      =>
      (bind ?ans (yes-or-no-p "¿Necesitas ascensor? (yes/no): "))
      (send ?x put-ascensor ?ans)
   )

   (defrule preguntar-restriccion-amueblado
      ?x <- (object (is-a Solicitante)
            (restricciones $?r&:(member amueblado ?r))
            (amueblado ?a&:(eq ?a nil)))
      =>
      (bind ?ans (yes-or-no-p "¿Debe estar amueblado? (yes/no): "))
      (send ?x put-amueblado ?ans)
   )
   (defrule preguntar-restriccion-mascotas
      ?x <- (object (is-a Solicitante)
            (restricciones $?r&:(member mascotas ?r))
            (mascotas ?m&:(eq ?m nil)))
      =>
      (bind ?ans (yes-or-no-p "¿Tienes mascota o la vivienda debe aceptarlas? (yes/no): "))
      (send ?x put-mascotas ?ans)
   )

   (defrule ABSTRACCION::crear-atributos-vivienda-abstractos
      ?v <- (object (is-a Vivienda) (id ?id) 
                     (precio ?p) (habitaciones ?h) (superficie ?s)
                     (ascensor ?asc-val)
                     (mascotasPermitidas ?mas-val)
                     (amueblado ?amu-val)
                     (soleado ?sol-val)
            )
      =>
      ;; precio-cat
      (bind ?cp (if (< ?p 600) then bajo else (if (< ?p 1000) then medio else alto)))

      ;; tamano-cat
      (bind ?ct (if (< ?h 2) then pequeño else (if (<= ?h 3) then medio else grande)))

      ;; superficie-cat
      (bind ?cs (if (< ?s 50) then pequeña else (if (< ?s 90) then mediana else grande)))

      ;; Atributos booleanos
      (bind ?asc (if (eq ?asc-val yes) then TRUE else FALSE))
      (bind ?mas (if (eq ?mas-val yes) then TRUE else FALSE))
      (bind ?amu (if (eq ?amu-val yes) then TRUE else FALSE))
      (bind ?sol (if (eq ?sol-val yes) then TRUE else FALSE))

      ;; actualizar la instancia
      (send ?v put-precio-cat ?cp) (send ?v put-tamano-cat ?ct) (send ?v put-superficie-cat ?cs)
      (send ?v put-ascensor_Abs ?asc)
      (send ?v put-mascotasPermitidas_Abs ?mas)
      (send ?v put-amueblado_Abs ?amu)
      (send ?v put-soleado_Abs ?sol)
   )

   (defrule ABSTRACCION::crear-atributos-solicitante-abstractos
      ?s <- (object (is-a Solicitante) 
                     (precioMax ?p) 
                     (numHabitaciones ?h)
                     (ascensor ?asc-val)
                     (mascotas ?mas-val)
                     (amueblado ?amu-val))
      =>
      ;; precio-cat
      (bind ?cp (if (< ?p 600) then bajo else (if (< ?p 1000) then medio else alto)))

      ;; tamano-cat (basado en numHabitaciones)
      (bind ?ct (if (< ?h 2) then pequeño else (if (<= ?h 3) then medio else grande)))

      ;; Preferencias booleanas
      (bind ?asc (if (eq ?asc-val yes) then TRUE else FALSE))
      (bind ?mas (if (eq ?mas-val yes) then TRUE else FALSE))
      (bind ?amu (if (eq ?amu-val yes) then TRUE else FALSE))

      ;; actualizar la instancia
      (send ?s put-precio-cat ?cp) (send ?s put-tamano-cat ?ct)
      (send ?s put-ascensor_Abs ?asc)
      (send ?s put-mascotas_Abs ?mas)
      (send ?s put-amueblado_Abs ?amu)
   )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 3. MÓDULO DE HEURÍSTICAS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmodule HEURISTICAS
   (import INPUT ?ALL)
   (import ABSTRACCION ?ALL)
   (export ?ALL)
)

(deftemplate Recomendacion
   (slot idVivienda)
   (slot puntos)
   (multislot razones)
   (slot etiqueta)
   (multislot asumpciones)
)

;; Crear recomendaciones iniciales: 1 por vivienda
(defrule init-evaluar
   ?s <- (object (is-a Solicitante))
   ?v <- (object (is-a Vivienda) (id ?id))
   (not (Recomendacion (idVivienda ?id)))
   =>
   (assert (Recomendacion (idVivienda ?id) (puntos 0) (razones) (etiqueta none)))
)

;; Score de precio
(defrule score-precio
   ?s <- (object (is-a Solicitante) (precioMax ?max))
   ?r <- (Recomendacion (idVivienda ?idv) (puntos ?p) (razones $?rs))
   (test (not (member$ precio $?rs)))
   ?v <- (object (is-a Vivienda) (id ?idv) (precio ?pv))
   =>
   (if (or (<= ?pv ?max) (<= ?pv (+ ?max 150))) then
         (modify ?r (razones (create$ $?rs precio)))
   )
)

   ;; Score habitaciones
  (defrule score-habitaciones
      ?s <- (object (is-a Solicitante) (numHabitaciones ?min))
      ?r <- (Recomendacion (idVivienda ?idv) (puntos ?p) (razones $?rs))
      (test (not (member$ habitaciones $?rs)))
      ?v <- (object (is-a Vivienda) (id ?idv) (habitaciones ?h))
      =>
      (if (>= ?h ?min) then
          (modify ?r (razones (create$ $?rs habitaciones)))
      )
  )
  

  ;; Score mascotas
  (defrule score-mascotas
      ?s <- (object (is-a Solicitante) (mascotas yes))
      ?v <- (object (is-a Vivienda) (id ?idv) (mascotasPermitidas yes))
      ?r <- (Recomendacion (idVivienda ?idv) (puntos ?p) (razones $?rs))
      (test (not (member$ mascotas $?rs)))
      =>
      (modify ?r (razones (create$ $?rs mascotas)))
  )

   ;; Score amueblado
   (defrule score-amueblado
      ?s <- (object (is-a Solicitante) (amueblado yes))
      ?v <- (object (is-a Vivienda) (id ?idv) (amueblado yes))
      ?r <- (Recomendacion (idVivienda ?idv) (puntos ?p) (razones $?rs))
      (test (not (member$ amueblado $?rs)))
      =>
      (modify ?r (razones (create$ $?rs amueblado)))
   )

   ;; Score soleado
   (defrule score-soleado
      ?v <- (object (is-a Vivienda) (id ?idv) (soleado yes))
      ?r <- (Recomendacion (idVivienda ?idv) (puntos ?p) (razones $?rs))
      (test (not (member$ soleado $?rs)))
      =>
      (modify ?r (razones (create$ $?rs soleado)))
   )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 4. MÓDULO DE REFINAMIENTO (Etiquetas)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmodule REFINAMIENTO
   (import HEURISTICAS ?ALL)
   (import ABSTRACCION ?ALL)
   (import INPUT ?ALL)
   (export ?ALL)
)

;; Calcular puntuacion final

   (defrule calcular-puntuacion-final
      (declare (salience -10))
      ?s <- (object (is-a Solicitante))
      ?v <- (object (is-a Vivienda) (id ?idv))
      ?r <- (Recomendacion (idVivienda ?idv) (puntos 0) (razones $?rs&:(> (length$ $?rs) 0)))
      =>
      (bind ?puntuacion 0)

      (if (member$ precio $?rs) then
         (if (<= (send ?v get-precio) (send ?s get-precioMax))
               then (bind ?puntuacion (+ ?puntuacion 40))
               else (bind ?puntuacion (+ ?puntuacion 10))
         )
      )

      (if (member$ habitaciones $?rs) then (bind ?puntuacion (+ ?puntuacion 25)))
      (if (member$ mascotas $?rs) then (bind ?puntuacion (+ ?puntuacion 30)))
      (if (member$ amueblado $?rs) then (bind ?puntuacion (+ ?puntuacion 10)))
      (if (member$ soleado $?rs) then (bind ?puntuacion (+ ?puntuacion 5)))

      (modify ?r (puntos ?puntuacion))
   )

  (defrule etiqueta-muy-recomendable
    (declare (salience -20))
    ?r <- (Recomendacion (puntos ?p&:(> ?p 0)) (etiqueta none))
    (test (>= ?p 70))
    =>
    (modify ?r (etiqueta muy_recomendable))
  )

  (defrule etiqueta-adecuado
    (declare (salience -20))
    ?r <- (Recomendacion (puntos ?p&:(> ?p 0)) (etiqueta none))
    (test (and (>= ?p 40) (< ?p 70)))
    =>
    (modify ?r (etiqueta adecuado))
  )

  (defrule etiqueta-parcial
    (declare (salience -20))
    ?r <- (Recomendacion (puntos ?p&:(> ?p 0)) (etiqueta none))
    (test (< ?p 40))
    =>
    (modify ?r (etiqueta parcialmente_adecuado))
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 5. MÓDULO DE SALIDA (OUTPUT)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmodule SALIDA
   (import REFINAMIENTO ?ALL)
   (export ?ALL)
)

(defrule imprimir-resultados
   ?r <- (Recomendacion (etiqueta ?etq&~none) (puntos ?p) (razones $?rs))
   =>
   (printout t "----------------------------------" crlf)
   (printout t "Puntos: " ?p crlf)
   (printout t "Etiqueta: " ?etq crlf)
   (printout t "Razones: " $?rs crlf crlf)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 6. FLUJO DE CONTROL
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule MAIN::inicio
   (declare (salience 100))
   =>
   (focus ABSTRACCION HEURISTICAS REFINAMIENTO SALIDA)
)