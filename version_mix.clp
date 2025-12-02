;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PRACTICA SBC - MVP DE RECOMENDACIÓN DE VIVIENDAS
;; Basado en CLASSES (defclass)
;; Compatible con CLIPS 6.30
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 1. MÓDULO DE ENTRADA (INPUT)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmodule INPUT
   (export all)
)

;; Clase Solicitante
(defclass Solicitante
   (is-a USER)
   (role concrete)
   (pattern-match reactive)

   (multislot cerca_de (type INSTANCE) (create-accessor read-write))
   (multislot media_de (type INSTANCE) (create-accessor read-write))
   (multislot lejos_de (type INSTANCE) (create-accessor read-write))

   (slot precioMax (type INTEGER) (create-accessor read-write))
   (slot numHabitacionesMin (type INTEGER) (create-accessor read-write))
   (slot necesitaAscensor (type SYMBOL) (create-accessor read-write))
   (slot tieneMascotas (type SYMBOL) (create-accessor read-write))
   (slot prefiereAmueblado (type SYMBOL) (create-accessor read-write))
   (slot prefiereTransporteCerca (type SYMBOL) (create-accessor read-write))
)

;; Clase Vivienda
(defclass Vivienda
   (is-a USER)
   (role concrete)
   (pattern-match reactive)

   (slot precio (type INTEGER) (create-accessor read-write))
   (slot habitaciones (type INTEGER) (create-accessor read-write))
   (slot superficie (type INTEGER) (create-accessor read-write))
   (slot planta (type INTEGER) (create-accessor read-write))
   (slot ascensor (type SYMBOL) (create-accessor read-write))
   (slot mascotasPermitidas (type SYMBOL) (create-accessor read-write))
   (slot amueblado (type SYMBOL) (create-accessor read-write))
   (slot distTransporte (type INTEGER) (create-accessor read-write))
   (slot soleado (type SYMBOL) (create-accessor read-write))
   (slot coordX (type INTEGER) (create-accessor read-write))
   (slot coordY (type INTEGER) (create-accessor read-write))

   (multislot cerca_de (type INSTANCE) (create-accessor read-write))
   (multislot media_de (type INSTANCE) (create-accessor read-write))
   (multislot lejos_de (type INSTANCE) (create-accessor read-write))
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 2. MÓDULO DE ABSTRACCIÓN
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmodule ABSTRACCION
   (import INPUT)
   (export all)
)

;; Clase ViviendaAbstracta
(defclass ViviendaAbstracta
   (is-a USER)
   (role concrete)
   (pattern-match reactive)

   (slot categoriaPrecio (type SYMBOL) (create-accessor read-write))
   (slot categoriaTamano (type SYMBOL) (create-accessor read-write))
   (slot accesibilidad (type SYMBOL) (create-accessor read-write))

   (multislot cerca_de (type INSTANCE) (create-accessor read-write))
   (multislot media_de (type INSTANCE) (create-accessor read-write))
   (multislot lejos_de (type INSTANCE) (create-accessor read-write))
)

;; Crear ViviendaAbstracta a partir de Vivienda
(defrule crear-vivienda-abstracta
   ?v <- (Vivienda (precio ?p) (habitaciones ?h) (ascensor ?a) (distTransporte ?d) (coordX ?cx) (coordY ?cy))
   =>
   (bind ?cp (if (< ?p 600) then bajo else (if (< ?p 1000) then medio else alto)))
   (bind ?ct (if (< ?h 2) then pequeño else (if (<= ?h 3) then medio else grande)))
   (bind ?acc (if (and (eq ?a yes) (<= ?d 500)) then buena else (if (or (eq ?a yes) (<= ?d 1000)) then regular else mala)))

   (make-instance (str-cat ?v "-abstracta") of ViviendaAbstracta
       (categoriaPrecio ?cp)
       (categoriaTamano ?ct)
       (accesibilidad ?acc)
       (cerca_de (create$))
       (media_de (create$))
       (lejos_de (create$))
   )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 3. MÓDULO DE HEURÍSTICAS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmodule HEURISTICAS
   (import INPUT)
   (import ABSTRACCION)
   (export all)
)

;; Clase Recomendacion
(defclass Recomendacion
   (is-a USER)
   (role concrete)
   (pattern-match reactive)

   (slot puntuacion (type INTEGER) (create-accessor read-write))
   (multislot razones (type SYMBOL) (create-accessor read-write))
   (slot etiqueta (type SYMBOL) (create-accessor read-write))
)

;; Inicializar recomendaciones
(defrule init-evaluar
   ?s <- (Solicitante)
   ?v <- (Vivienda)
   (not (Recomendacion (etiqueta none)))
   =>
   (make-instance (str-cat "rec-" ?v) of Recomendacion
       (puntuacion 0)
       (razones (create$))
       (etiqueta none)
   )
)

;; Score de precio
(defrule score-precio
   ?s <- (Solicitante (precioMax ?max))
   ?r <- (Recomendacion)
   ?v <- (Vivienda (precio ?pv))
   =>
   (if (<= ?pv ?max) then
       (send ?r put-razones (create$ precio))
   )
)

;; Score habitaciones
(defrule score-habitaciones
   ?s <- (Solicitante (numHabitacionesMin ?min))
   ?r <- (Recomendacion)
   ?v <- (Vivienda (habitaciones ?h))
   =>
   (if (>= ?h ?min) then
       (send ?r put-razones (create$ habitaciones))
   )
)

;; Score accesibilidad (basado en ViviendaAbstracta)
(defrule score-accesibilidad
   ?va <- (ViviendaAbstracta (accesibilidad ?acc))
   ?r <- (Recomendacion)
   =>
   (if (eq ?acc buena) then
       (send ?r put-razones (create$ accesibilidad-buena))
       else
       (send ?r put-razones (create$ accesibilidad-regular))
   )
)

;; Score mascotas
(defrule score-mascotas
   ?s <- (Solicitante (tieneMascotas yes))
   ?v <- (Vivienda (mascotasPermitidas yes))
   ?r <- (Recomendacion)
   =>
   (send ?r put-razones (create$ mascotas))
)

;; Score amueblado
(defrule score-amueblado
   ?s <- (Solicitante (prefiereAmueblado yes))
   ?v <- (Vivienda (amueblado yes))
   ?r <- (Recomendacion)
   =>
   (send ?r put-razones (create$ amueblado))
)

;; Score transporte
(defrule score-transporte
   ?s <- (Solicitante (prefiereTransporteCerca yes))
   ?v <- (Vivienda (distTransporte ?d))
   ?r <- (Recomendacion)
   =>
   (if (<= ?d 500) then
       (send ?r put-razones (create$ transporte-cerca))
       else
       (if (<= ?d 1000) then
           (send ?r put-razones (create$ transporte-medio))
           else
           (send ?r put-razones (create$ transporte-lejos))
       )
   )
)

;; Score soleado
(defrule score-soleado
   ?v <- (Vivienda (soleado yes))
   ?r <- (Recomendacion)
   =>
   (send ?r put-razones (create$ soleado))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 4. MÓDULO DE REFINAMIENTO (Etiquetas)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmodule REFINAMIENTO
   (import HEURISTICAS)
   (import ABSTRACCION)
   (import INPUT)
   (export all)
)

;; Calcular puntuacion final
(defrule calcular-puntuacion-final
   ?r <- (Recomendacion)
   =>
   (bind ?puntuacion 0)
   ;; Iterar sobre razones
   ;; Simplificado: suma valores
   (send ?r put-puntuacion 50) ;; Ejemplo fijo para mantener compatibilidad
)

;; Asignar etiquetas
(defrule etiqueta-muy-recomendable
   ?r <- (Recomendacion (puntuacion ?p&:(> ?p 70)))
   =>
   (send ?r put-etiqueta muy_recomendable)
)

(defrule etiqueta-adecuado
   ?r <- (Recomendacion (puntuacion ?p&:(and (>= ?p 40) (< ?p 70))))
   =>
   (send ?r put-etiqueta adecuado)
)

(defrule etiqueta-parcial
   ?r <- (Recomendacion (puntuacion ?p&:(< ?p 40)))
   =>
   (send ?r put-etiqueta parcialmente_adecuado)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 5. MÓDULO DE SALIDA (OUTPUT)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmodule SALIDA
   (import REFINAMIENTO)
   (export all)
)

(defrule imprimir-resultados
   ?r <- (Recomendacion (etiqueta ?etq&~none) (puntuacion ?p) (razones $?rs))
   =>
   (printout t "----------------------------------" crlf)
   (printout t "Puntuacion: " ?p crlf)
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
