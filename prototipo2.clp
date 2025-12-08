;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PRACTICA SBC 
;; CLIPS 6.30
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 1. MÓDULO DE ENTRADA (INPUT)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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

(deffunction pregunta-llista (?pregunta)
   (format t "%s " ?pregunta)
   (bind ?resposta (readline))
   (bind ?resultat (explode$ ?resposta))
   ?resultat
)

(deffunction calcDistanciaEuclidiana (?x1 ?y1 ?x2 ?y2)
   (sqrt (+ (* (- ?x2 ?x1) (- ?x2 ?x1))
            (* (- ?y2 ?y1) (- ?y2 ?y1)))))


;; Clase Solicitante
(defclass Solicitante
   (is-a USER)
   (role concrete)
   (pattern-match reactive)

   (slot id (type SYMBOL) (create-accessor read-write))
   (slot tipo_solicitante (type SYMBOL) (create-accessor read-write))
   

   (multislot cerca_de (type INSTANCE) (create-accessor read-write))
   (multislot media_de (type INSTANCE) (create-accessor read-write))
   (multislot lejos_de (type INSTANCE) (create-accessor read-write))

   (slot precioMax (type INTEGER) (create-accessor read-write))
   (slot edad (type INTEGER) (create-accessor read-write))
   (slot numHabitaciones (type INTEGER) (create-accessor read-write))
   (slot tipoVivienda (type SYMBOL) (create-accessor read-write))
   (slot coche (type SYMBOL) (create-accessor read-write))

   (slot ascensor (type SYMBOL) (create-accessor read-write))
   (slot mascotas (type SYMBOL) (create-accessor read-write))
   (slot amueblado (type SYMBOL) (create-accessor read-write))
   (slot piscina (type SYMBOL) (create-accessor read-write))
   (slot aire_acondicionado (type SYMBOL) (create-accessor read-write))
   (slot calefaccion (type SYMBOL) (create-accessor read-write))
   (slot garaje (type SYMBOL) (create-accessor read-write))
   (slot buenas_vistas (type SYMBOL) (create-accessor read-write))
   (slot terraza (type SYMBOL) (create-accessor read-write))
   (slot balcon (type SYMBOL) (create-accessor read-write))

   (slot altura-cat (type SYMBOL) (create-accessor read-write))
   (slot precio-cat (type SYMBOL) (create-accessor read-write))
   (slot tamano-cat (type SYMBOL) (create-accessor read-write))
   (slot edad-cat (type SYMBOL) (create-accessor read-write))

   (slot ascensor_Abs (type SYMBOL) (create-accessor read-write))
   (slot mascotas_Abs (type SYMBOL) (create-accessor read-write))
   (slot amueblado_Abs (type SYMBOL) (create-accessor read-write))
   (slot piscina_Abs (type SYMBOL) (create-accessor read-write))
   (slot aire_acondicionado_Abs (type SYMBOL) (create-accessor read-write))
   (slot calefaccion_Abs (type SYMBOL) (create-accessor read-write))
   (slot garaje_Abs (type SYMBOL) (create-accessor read-write))
   (slot buenas_vistas_Abs (type SYMBOL) (create-accessor read-write))
   (slot terraza_Abs (type SYMBOL) (create-accessor read-write))
   (slot balcon_Abs (type SYMBOL) (create-accessor read-write))

   (multislot restricciones)
   (multislot preferencias_pendientes (type SYMBOL) (create-accessor read-write))
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
   (slot ascensor (type SYMBOL) (create-accessor read-write))
   (slot mascotasPermitidas (type SYMBOL) (create-accessor read-write))
   (slot amueblado (type SYMBOL) (create-accessor read-write))
   (slot piscina (type SYMBOL) (create-accessor read-write))
   (slot aire_acondicionado (type SYMBOL) (create-accessor read-write))
   (slot calefaccion (type SYMBOL) (create-accessor read-write))
   (slot garaje (type SYMBOL) (create-accessor read-write))
   (slot buenas_vistas (type SYMBOL) (create-accessor read-write))
   (slot terraza (type SYMBOL) (create-accessor read-write))
   (slot balcon (type SYMBOL) (create-accessor read-write))
   
   (slot soleado (type SYMBOL) (create-accessor read-write))
   (slot fechaEdificacion (type INTEGER) (create-accessor read-write))
   
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
   (slot piscina_Abs (type SYMBOL) (create-accessor read-write))
   (slot aire_acondicionado_Abs (type SYMBOL) (create-accessor read-write))
   (slot calefaccion_Abs (type SYMBOL) (create-accessor read-write))
   (slot garaje_Abs (type SYMBOL) (create-accessor read-write))
   (slot buenas_vistas_Abs (type SYMBOL) (create-accessor read-write))
   (slot terraza_Abs (type SYMBOL) (create-accessor read-write))
   (slot balcon_Abs (type SYMBOL) (create-accessor read-write))
   
   (slot soleado_Abs (type SYMBOL) (create-accessor read-write))
   (slot fechaEdificacion_Abs (type SYMBOL) (create-accessor read-write))

   ;; Atributos para la asociación heurística
   (slot etiqueta-recomendacion (type SYMBOL) (default Sin-Clasificar) (create-accessor read-write))
   (multislot requisitos-fallados (type SYMBOL) (create-accessor read-write))
   (multislot ventajas-extra (type SYMBOL) (create-accessor read-write))
)
;; Subclase intermedia para tipos de vivienda en altura
(defclass ViviendaVertical
   (is-a Vivienda)
   (role concrete)
   (pattern-match reactive)
   (slot planta (type INTEGER) (create-accessor read-write))
   (slot planta_Abs (type SYMBOL) (create-accessor read-write))
   (slot atico (type SYMBOL) (create-accessor read-write))
)

;; Duplex
(defclass Duplex
   (is-a Vivienda)
   (role concrete)
   (pattern-match reactive)
   (slot numPlantas (type INTEGER) (create-accessor read-write))
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
   )

   ;; Viviendas
   ([CasaAuto1] of ViviendaVertical
       (id oAuto1)
       (precio 1378)
       (habitaciones 4)
       (superficie 148)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas yes)
       (terraza yes)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 1989)
       (coordX 2881)
       (coordY 670)
       (planta 6)
       (planta_Abs Baja)
       (atico yes)
   )

   ([CasaAuto2] of Vivienda
       (id oAuto2)
       (precio 1260)
       (habitaciones 4)
       (superficie 137)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas yes)
       (terraza no)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1972)
       (coordX 1948)
       (coordY 3378)
   )

   ([CasaAuto3] of Vivienda
       (id oAuto3)
       (precio 929)
       (habitaciones 2)
       (superficie 87)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas yes)
       (terraza no)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 1998)
       (coordX 981)
       (coordY 2064)
   )

   ([CasaAuto4] of Vivienda
       (id oAuto4)
       (precio 1496)
       (habitaciones 4)
       (superficie 47)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje no)
       (buenas_vistas yes)
       (terraza yes)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1976)
       (coordX 1579)
       (coordY 990)
   )

   ([CasaAuto5] of Vivienda
       (id oAuto5)
       (precio 1849)
       (habitaciones 1)
       (superficie 34)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje no)
       (buenas_vistas yes)
       (terraza yes)
       (balcon no)
       (soleado no)
       (fechaEdificacion 2016)
       (coordX 3259)
       (coordY 1009)
   )

   ([CasaAuto6] of Vivienda
       (id oAuto6)
       (precio 1383)
       (habitaciones 1)
       (superficie 86)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje no)
       (buenas_vistas yes)
       (terraza no)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1986)
       (coordX 3584)
       (coordY 901)
   )

   ([CasaAuto7] of ViviendaVertical
       (id oAuto7)
       (precio 1261)
       (habitaciones 4)
       (superficie 57)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas no)
       (terraza yes)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 1982)
       (coordX 1747)
       (coordY 3519)
       (planta 5)
       (planta_Abs Baja)
       (atico yes)
   )

   ([CasaAuto8] of Duplex
       (id oAuto8)
       (precio 2276)
       (habitaciones 3)
       (superficie 89)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas yes)
       (terraza yes)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 1961)
       (coordX 415)
       (coordY 260)
       (numPlantas 3)
   )

   ([CasaAuto9] of Vivienda
       (id oAuto9)
       (precio 2441)
       (habitaciones 3)
       (superficie 67)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas no)
       (terraza yes)
       (balcon no)
       (soleado no)
       (fechaEdificacion 1992)
       (coordX 1966)
       (coordY 3667)
   )

   ([CasaAuto10] of Vivienda
       (id oAuto10)
       (precio 524)
       (habitaciones 2)
       (superficie 57)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas yes)
       (terraza no)
       (balcon no)
       (soleado no)
       (fechaEdificacion 1998)
       (coordX 1953)
       (coordY 1072)
   )

   ([CasaAuto11] of ViviendaVertical
       (id oAuto11)
       (precio 1185)
       (habitaciones 5)
       (superficie 103)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje no)
       (buenas_vistas no)
       (terraza no)
       (balcon no)
       (soleado no)
       (fechaEdificacion 1969)
       (coordX 3371)
       (coordY 1905)
       (planta 5)
       (planta_Abs Baja)
       (atico no)
   )

   ([CasaAuto12] of ViviendaVertical
       (id oAuto12)
       (precio 1525)
       (habitaciones 1)
       (superficie 86)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje no)
       (buenas_vistas yes)
       (terraza no)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1962)
       (coordX 764)
       (coordY 1303)
       (planta 1)
       (planta_Abs Baja)
       (atico yes)
   )

   ([CasaAuto13] of Vivienda
       (id oAuto13)
       (precio 1261)
       (habitaciones 2)
       (superficie 82)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje no)
       (buenas_vistas no)
       (terraza no)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 1967)
       (coordX 3079)
       (coordY 1)
   )

   ([CasaAuto14] of Vivienda
       (id oAuto14)
       (precio 1820)
       (habitaciones 1)
       (superficie 71)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas yes)
       (terraza no)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 1981)
       (coordX 2037)
       (coordY 1404)
   )

   ([CasaAuto15] of Vivienda
       (id oAuto15)
       (precio 717)
       (habitaciones 4)
       (superficie 101)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas no)
       (terraza no)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 1996)
       (coordX 762)
       (coordY 2225)
   )

   ([CasaAuto16] of Vivienda
       (id oAuto16)
       (precio 1020)
       (habitaciones 1)
       (superficie 40)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas no)
       (terraza yes)
       (balcon no)
       (soleado no)
       (fechaEdificacion 2013)
       (coordX 3799)
       (coordY 1163)
   )

   ([CasaAuto17] of ViviendaVertical
       (id oAuto17)
       (precio 685)
       (habitaciones 4)
       (superficie 47)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas yes)
       (terraza no)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 2000)
       (coordX 1077)
       (coordY 318)
       (planta 4)
       (planta_Abs Baja)
       (atico no)
   )

   ([CasaAuto18] of Vivienda
       (id oAuto18)
       (precio 2025)
       (habitaciones 5)
       (superficie 73)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas no)
       (terraza no)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 2010)
       (coordX 228)
       (coordY 2522)
   )

   ([CasaAuto19] of Vivienda
       (id oAuto19)
       (precio 949)
       (habitaciones 1)
       (superficie 103)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas yes)
       (terraza yes)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1995)
       (coordX 3229)
       (coordY 874)
   )

   ([CasaAuto20] of Vivienda
       (id oAuto20)
       (precio 1551)
       (habitaciones 1)
       (superficie 85)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas yes)
       (terraza no)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 1966)
       (coordX 1278)
       (coordY 2550)
   )

   ([CasaAuto21] of Vivienda
       (id oAuto21)
       (precio 539)
       (habitaciones 5)
       (superficie 87)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas yes)
       (terraza no)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1974)
       (coordX 3563)
       (coordY 3385)
   )

   ([CasaAuto22] of ViviendaVertical
       (id oAuto22)
       (precio 789)
       (habitaciones 4)
       (superficie 133)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas no)
       (terraza no)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 2002)
       (coordX 3776)
       (coordY 824)
       (planta 6)
       (planta_Abs Baja)
       (atico no)
   )

   ([CasaAuto23] of ViviendaVertical
       (id oAuto23)
       (precio 2256)
       (habitaciones 3)
       (superficie 90)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas yes)
       (terraza no)
       (balcon no)
       (soleado no)
       (fechaEdificacion 2016)
       (coordX 107)
       (coordY 1564)
       (planta 12)
       (planta_Abs Alta)
       (atico no)
   )

   ([CasaAuto24] of Vivienda
       (id oAuto24)
       (precio 1117)
       (habitaciones 5)
       (superficie 60)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas no)
       (terraza yes)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 2009)
       (coordX 1465)
       (coordY 631)
   )

   ([CasaAuto25] of Vivienda
       (id oAuto25)
       (precio 621)
       (habitaciones 2)
       (superficie 33)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas yes)
       (terraza yes)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 1967)
       (coordX 3482)
       (coordY 119)
   )

   ([CasaAuto26] of Vivienda
       (id oAuto26)
       (precio 1717)
       (habitaciones 1)
       (superficie 81)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas no)
       (terraza no)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1996)
       (coordX 3493)
       (coordY 709)
   )

   ([CasaAuto27] of Vivienda
       (id oAuto27)
       (precio 1231)
       (habitaciones 2)
       (superficie 116)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas no)
       (terraza no)
       (balcon no)
       (soleado no)
       (fechaEdificacion 2017)
       (coordX 3458)
       (coordY 2134)
   )

   ([CasaAuto28] of Vivienda
       (id oAuto28)
       (precio 1460)
       (habitaciones 2)
       (superficie 58)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas yes)
       (terraza yes)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 1967)
       (coordX 2766)
       (coordY 3543)
   )

   ([CasaAuto29] of ViviendaVertical
       (id oAuto29)
       (precio 1826)
       (habitaciones 5)
       (superficie 124)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje no)
       (buenas_vistas yes)
       (terraza yes)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 2013)
       (coordX 861)
       (coordY 3681)
       (planta 7)
       (planta_Abs Alta)
       (atico yes)
   )

   ([CasaAuto30] of ViviendaVertical
       (id oAuto30)
       (precio 664)
       (habitaciones 4)
       (superficie 45)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas yes)
       (terraza no)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 1980)
       (coordX 1026)
       (coordY 610)
       (planta 4)
       (planta_Abs Baja)
       (atico yes)
   )

   ([CasaAuto31] of Vivienda
       (id oAuto31)
       (precio 1021)
       (habitaciones 3)
       (superficie 89)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas no)
       (terraza yes)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 2024)
       (coordX 3692)
       (coordY 1007)
   )

   ([CasaAuto32] of Vivienda
       (id oAuto32)
       (precio 2335)
       (habitaciones 2)
       (superficie 69)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas no)
       (terraza yes)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 2012)
       (coordX 2104)
       (coordY 689)
   )

   ([CasaAuto33] of ViviendaVertical
       (id oAuto33)
       (precio 2439)
       (habitaciones 1)
       (superficie 124)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje no)
       (buenas_vistas yes)
       (terraza no)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1979)
       (coordX 864)
       (coordY 3760)
       (planta 12)
       (planta_Abs Alta)
       (atico yes)
   )

   ([CasaAuto34] of Vivienda
       (id oAuto34)
       (precio 1641)
       (habitaciones 2)
       (superficie 116)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas no)
       (terraza no)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1989)
       (coordX 412)
       (coordY 3242)
   )

   ([CasaAuto35] of Vivienda
       (id oAuto35)
       (precio 1646)
       (habitaciones 1)
       (superficie 136)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas no)
       (terraza yes)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 1980)
       (coordX 544)
       (coordY 2762)
   )

   ([CasaAuto36] of Vivienda
       (id oAuto36)
       (precio 2173)
       (habitaciones 4)
       (superficie 106)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas yes)
       (terraza yes)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 1999)
       (coordX 1679)
       (coordY 3027)
   )

   ([CasaAuto37] of Vivienda
       (id oAuto37)
       (precio 1215)
       (habitaciones 4)
       (superficie 80)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas yes)
       (terraza no)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1970)
       (coordX 3785)
       (coordY 3219)
   )

   ([CasaAuto38] of Vivienda
       (id oAuto38)
       (precio 873)
       (habitaciones 4)
       (superficie 91)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas no)
       (terraza yes)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 2016)
       (coordX 2660)
       (coordY 2369)
   )

   ([CasaAuto39] of Duplex
       (id oAuto39)
       (precio 1608)
       (habitaciones 5)
       (superficie 108)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas yes)
       (terraza yes)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 2009)
       (coordX 796)
       (coordY 2420)
       (numPlantas 3)
   )

   ([CasaAuto40] of Vivienda
       (id oAuto40)
       (precio 501)
       (habitaciones 3)
       (superficie 116)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje no)
       (buenas_vistas yes)
       (terraza yes)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 1971)
       (coordX 3544)
       (coordY 656)
   )

   ([CasaAuto41] of ViviendaVertical
       (id oAuto41)
       (precio 645)
       (habitaciones 5)
       (superficie 130)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas no)
       (terraza no)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1963)
       (coordX 3949)
       (coordY 3367)
       (planta 1)
       (planta_Abs Baja)
       (atico no)
   )

   ([CasaAuto42] of ViviendaVertical
       (id oAuto42)
       (precio 2309)
       (habitaciones 3)
       (superficie 84)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas yes)
       (terraza yes)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 1999)
       (coordX 2854)
       (coordY 2190)
       (planta 8)
       (planta_Abs Alta)
       (atico yes)
   )

   ([CasaAuto43] of Vivienda
       (id oAuto43)
       (precio 1432)
       (habitaciones 1)
       (superficie 144)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas no)
       (terraza no)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 1989)
       (coordX 1532)
       (coordY 3455)
   )

   ([CasaAuto44] of ViviendaVertical
       (id oAuto44)
       (precio 2081)
       (habitaciones 5)
       (superficie 105)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas no)
       (terraza no)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 2003)
       (coordX 3265)
       (coordY 1410)
       (planta 9)
       (planta_Abs Alta)
       (atico no)
   )

   ([CasaAuto45] of Vivienda
       (id oAuto45)
       (precio 825)
       (habitaciones 5)
       (superficie 134)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas no)
       (terraza yes)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 1991)
       (coordX 2471)
       (coordY 3299)
   )

   ([CasaAuto46] of Vivienda
       (id oAuto46)
       (precio 2288)
       (habitaciones 4)
       (superficie 128)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas yes)
       (terraza yes)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 2021)
       (coordX 276)
       (coordY 1196)
   )

   ([CasaAuto47] of Vivienda
       (id oAuto47)
       (precio 740)
       (habitaciones 1)
       (superficie 109)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas yes)
       (terraza yes)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 2011)
       (coordX 1378)
       (coordY 765)
   )

   ([CasaAuto48] of Vivienda
       (id oAuto48)
       (precio 1396)
       (habitaciones 4)
       (superficie 49)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje no)
       (buenas_vistas no)
       (terraza yes)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 1980)
       (coordX 3379)
       (coordY 1306)
   )

   ([CasaAuto49] of Vivienda
       (id oAuto49)
       (precio 837)
       (habitaciones 1)
       (superficie 53)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje no)
       (buenas_vistas yes)
       (terraza no)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 1997)
       (coordX 2487)
       (coordY 3662)
   )

   ([CasaAuto50] of Vivienda
       (id oAuto50)
       (precio 1316)
       (habitaciones 5)
       (superficie 139)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas no)
       (terraza no)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 2011)
       (coordX 3388)
       (coordY 1531)
   )

   ([CasaAuto51] of Vivienda
       (id oAuto51)
       (precio 1922)
       (habitaciones 1)
       (superficie 66)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas yes)
       (terraza no)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 1984)
       (coordX 1448)
       (coordY 2940)
   )

   ([CasaAuto52] of ViviendaVertical
       (id oAuto52)
       (precio 1920)
       (habitaciones 4)
       (superficie 131)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje no)
       (buenas_vistas no)
       (terraza no)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 1960)
       (coordX 298)
       (coordY 3570)
       (planta 10)
       (planta_Abs Alta)
       (atico yes)
   )

   ([CasaAuto53] of Vivienda
       (id oAuto53)
       (precio 2051)
       (habitaciones 3)
       (superficie 46)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje no)
       (buenas_vistas yes)
       (terraza no)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 2015)
       (coordX 76)
       (coordY 844)
   )

   ([CasaAuto54] of Vivienda
       (id oAuto54)
       (precio 1973)
       (habitaciones 2)
       (superficie 130)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje no)
       (buenas_vistas yes)
       (terraza no)
       (balcon no)
       (soleado no)
       (fechaEdificacion 1993)
       (coordX 1576)
       (coordY 2225)
   )

   ([CasaAuto55] of ViviendaVertical
       (id oAuto55)
       (precio 1445)
       (habitaciones 2)
       (superficie 145)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas yes)
       (terraza yes)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 2018)
       (coordX 1156)
       (coordY 1818)
       (planta 7)
       (planta_Abs Alta)
       (atico no)
   )

   ([CasaAuto56] of Duplex
       (id oAuto56)
       (precio 1089)
       (habitaciones 4)
       (superficie 45)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas no)
       (terraza yes)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 1960)
       (coordX 3317)
       (coordY 3958)
       (numPlantas 2)
   )

   ([CasaAuto57] of Vivienda
       (id oAuto57)
       (precio 1464)
       (habitaciones 2)
       (superficie 111)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas no)
       (terraza no)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 2000)
       (coordX 3150)
       (coordY 2728)
   )

   ([CasaAuto58] of ViviendaVertical
       (id oAuto58)
       (precio 2265)
       (habitaciones 5)
       (superficie 89)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje no)
       (buenas_vistas no)
       (terraza no)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1997)
       (coordX 2617)
       (coordY 1880)
       (planta 6)
       (planta_Abs Baja)
       (atico no)
   )

   ([CasaAuto59] of Vivienda
       (id oAuto59)
       (precio 1601)
       (habitaciones 4)
       (superficie 144)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje no)
       (buenas_vistas yes)
       (terraza no)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1983)
       (coordX 2780)
       (coordY 2683)
   )

   ([CasaAuto60] of Vivienda
       (id oAuto60)
       (precio 916)
       (habitaciones 4)
       (superficie 112)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje no)
       (buenas_vistas no)
       (terraza no)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 1969)
       (coordX 2412)
       (coordY 429)
   )

   ([CasaAuto61] of Vivienda
       (id oAuto61)
       (precio 1645)
       (habitaciones 1)
       (superficie 93)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas no)
       (terraza no)
       (balcon no)
       (soleado no)
       (fechaEdificacion 2012)
       (coordX 3624)
       (coordY 150)
   )

   ([CasaAuto62] of ViviendaVertical
       (id oAuto62)
       (precio 765)
       (habitaciones 4)
       (superficie 131)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas yes)
       (terraza yes)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 1993)
       (coordX 3628)
       (coordY 1847)
       (planta 2)
       (planta_Abs Baja)
       (atico no)
   )

   ([CasaAuto63] of Vivienda
       (id oAuto63)
       (precio 2274)
       (habitaciones 5)
       (superficie 70)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas no)
       (terraza no)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 1969)
       (coordX 711)
       (coordY 1823)
   )

   ([CasaAuto64] of Vivienda
       (id oAuto64)
       (precio 1441)
       (habitaciones 4)
       (superficie 118)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas yes)
       (terraza yes)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 1983)
       (coordX 2183)
       (coordY 2994)
   )

   ([CasaAuto65] of ViviendaVertical
       (id oAuto65)
       (precio 1723)
       (habitaciones 1)
       (superficie 109)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas yes)
       (terraza yes)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1975)
       (coordX 1486)
       (coordY 370)
       (planta 10)
       (planta_Abs Alta)
       (atico no)
   )

   ([CasaAuto66] of Vivienda
       (id oAuto66)
       (precio 1000)
       (habitaciones 3)
       (superficie 45)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje no)
       (buenas_vistas yes)
       (terraza yes)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 1985)
       (coordX 3075)
       (coordY 3843)
   )

   ([CasaAuto67] of Vivienda
       (id oAuto67)
       (precio 2157)
       (habitaciones 3)
       (superficie 69)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje no)
       (buenas_vistas yes)
       (terraza yes)
       (balcon no)
       (soleado no)
       (fechaEdificacion 2016)
       (coordX 537)
       (coordY 3165)
   )

   ([CasaAuto68] of ViviendaVertical
       (id oAuto68)
       (precio 947)
       (habitaciones 4)
       (superficie 63)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas yes)
       (terraza yes)
       (balcon no)
       (soleado no)
       (fechaEdificacion 2010)
       (coordX 3319)
       (coordY 2604)
       (planta 2)
       (planta_Abs Baja)
       (atico no)
   )

   ([CasaAuto69] of Vivienda
       (id oAuto69)
       (precio 1465)
       (habitaciones 3)
       (superficie 142)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas yes)
       (terraza no)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 1997)
       (coordX 536)
       (coordY 709)
   )

   ([CasaAuto70] of Vivienda
       (id oAuto70)
       (precio 2075)
       (habitaciones 2)
       (superficie 70)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje no)
       (buenas_vistas yes)
       (terraza yes)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1992)
       (coordX 191)
       (coordY 2147)
   )

   ([CasaAuto71] of Vivienda
       (id oAuto71)
       (precio 1889)
       (habitaciones 2)
       (superficie 94)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas no)
       (terraza no)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 1963)
       (coordX 1903)
       (coordY 3286)
   )

   ([CasaAuto72] of Vivienda
       (id oAuto72)
       (precio 1192)
       (habitaciones 2)
       (superficie 90)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas no)
       (terraza no)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 2017)
       (coordX 1225)
       (coordY 3070)
   )

   ([CasaAuto73] of Vivienda
       (id oAuto73)
       (precio 808)
       (habitaciones 5)
       (superficie 94)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas no)
       (terraza no)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 1963)
       (coordX 398)
       (coordY 3461)
   )

   ([CasaAuto74] of Vivienda
       (id oAuto74)
       (precio 1693)
       (habitaciones 5)
       (superficie 49)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas no)
       (terraza yes)
       (balcon no)
       (soleado no)
       (fechaEdificacion 2009)
       (coordX 2586)
       (coordY 3048)
   )

   ([CasaAuto75] of Vivienda
       (id oAuto75)
       (precio 1362)
       (habitaciones 1)
       (superficie 135)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje no)
       (buenas_vistas yes)
       (terraza no)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 1963)
       (coordX 3559)
       (coordY 980)
   )

   ([CasaAuto76] of Vivienda
       (id oAuto76)
       (precio 1917)
       (habitaciones 1)
       (superficie 128)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas yes)
       (terraza yes)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 1974)
       (coordX 3294)
       (coordY 3035)
   )

   ([CasaAuto77] of ViviendaVertical
       (id oAuto77)
       (precio 624)
       (habitaciones 5)
       (superficie 44)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas yes)
       (terraza yes)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 2009)
       (coordX 2026)
       (coordY 708)
       (planta 3)
       (planta_Abs Baja)
       (atico yes)
   )

   ([CasaAuto78] of Vivienda
       (id oAuto78)
       (precio 894)
       (habitaciones 3)
       (superficie 47)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas yes)
       (terraza yes)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1996)
       (coordX 1171)
       (coordY 3592)
   )

   ([CasaAuto79] of ViviendaVertical
       (id oAuto79)
       (precio 1557)
       (habitaciones 3)
       (superficie 131)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas yes)
       (terraza yes)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 2007)
       (coordX 1358)
       (coordY 2436)
       (planta 10)
       (planta_Abs Alta)
       (atico no)
   )

   ([CasaAuto80] of Duplex
       (id oAuto80)
       (precio 1583)
       (habitaciones 3)
       (superficie 147)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje no)
       (buenas_vistas no)
       (terraza yes)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 2006)
       (coordX 838)
       (coordY 1568)
       (numPlantas 3)
   )

   ([CasaAuto81] of Duplex
       (id oAuto81)
       (precio 715)
       (habitaciones 5)
       (superficie 131)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas no)
       (terraza yes)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1964)
       (coordX 2298)
       (coordY 3312)
       (numPlantas 2)
   )

   ([CasaAuto82] of Vivienda
       (id oAuto82)
       (precio 1752)
       (habitaciones 3)
       (superficie 113)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje no)
       (buenas_vistas yes)
       (terraza no)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 2014)
       (coordX 953)
       (coordY 613)
   )

   ([CasaAuto83] of ViviendaVertical
       (id oAuto83)
       (precio 2219)
       (habitaciones 4)
       (superficie 64)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje no)
       (buenas_vistas no)
       (terraza yes)
       (balcon no)
       (soleado no)
       (fechaEdificacion 2015)
       (coordX 1348)
       (coordY 397)
       (planta 7)
       (planta_Abs Alta)
       (atico no)
   )

   ([CasaAuto84] of Vivienda
       (id oAuto84)
       (precio 863)
       (habitaciones 5)
       (superficie 64)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas yes)
       (terraza yes)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 1977)
       (coordX 2307)
       (coordY 784)
   )

   ([CasaAuto85] of Vivienda
       (id oAuto85)
       (precio 2358)
       (habitaciones 5)
       (superficie 96)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje no)
       (buenas_vistas no)
       (terraza yes)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 2021)
       (coordX 2845)
       (coordY 229)
   )

   ([CasaAuto86] of Vivienda
       (id oAuto86)
       (precio 1540)
       (habitaciones 2)
       (superficie 147)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas yes)
       (terraza no)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 2000)
       (coordX 353)
       (coordY 460)
   )

   ([CasaAuto87] of Vivienda
       (id oAuto87)
       (precio 677)
       (habitaciones 1)
       (superficie 83)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas no)
       (terraza no)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 1998)
       (coordX 1347)
       (coordY 19)
   )

   ([CasaAuto88] of Vivienda
       (id oAuto88)
       (precio 717)
       (habitaciones 4)
       (superficie 84)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas yes)
       (terraza yes)
       (balcon no)
       (soleado no)
       (fechaEdificacion 2021)
       (coordX 1205)
       (coordY 3647)
   )

   ([CasaAuto89] of Vivienda
       (id oAuto89)
       (precio 761)
       (habitaciones 2)
       (superficie 82)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas no)
       (terraza yes)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1997)
       (coordX 2158)
       (coordY 3609)
   )

   ([CasaAuto90] of ViviendaVertical
       (id oAuto90)
       (precio 2334)
       (habitaciones 4)
       (superficie 93)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas no)
       (terraza no)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 2008)
       (coordX 883)
       (coordY 2561)
       (planta 4)
       (planta_Abs Baja)
       (atico no)
   )

   ([CasaAuto91] of ViviendaVertical
       (id oAuto91)
       (precio 2335)
       (habitaciones 1)
       (superficie 132)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje no)
       (buenas_vistas no)
       (terraza yes)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1974)
       (coordX 1768)
       (coordY 2432)
       (planta 11)
       (planta_Abs Alta)
       (atico no)
   )

   ([CasaAuto92] of Vivienda
       (id oAuto92)
       (precio 1422)
       (habitaciones 1)
       (superficie 102)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas no)
       (terraza no)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 2013)
       (coordX 3011)
       (coordY 3309)
   )

   ([CasaAuto93] of Vivienda
       (id oAuto93)
       (precio 1390)
       (habitaciones 3)
       (superficie 38)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas no)
       (terraza yes)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 2022)
       (coordX 3406)
       (coordY 414)
   )

   ([CasaAuto94] of Vivienda
       (id oAuto94)
       (precio 1252)
       (habitaciones 4)
       (superficie 38)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas no)
       (terraza no)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 1997)
       (coordX 3498)
       (coordY 410)
   )

   ([CasaAuto95] of Duplex
       (id oAuto95)
       (precio 2446)
       (habitaciones 5)
       (superficie 58)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas no)
       (terraza no)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 2024)
       (coordX 2699)
       (coordY 528)
       (numPlantas 3)
   )

   ([CasaAuto96] of Vivienda
       (id oAuto96)
       (precio 859)
       (habitaciones 5)
       (superficie 128)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas yes)
       (terraza no)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 2016)
       (coordX 1258)
       (coordY 1134)
   )

   ([CasaAuto97] of Vivienda
       (id oAuto97)
       (precio 916)
       (habitaciones 5)
       (superficie 101)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje no)
       (buenas_vistas no)
       (terraza no)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 2009)
       (coordX 2451)
       (coordY 2609)
   )

   ([CasaAuto98] of Vivienda
       (id oAuto98)
       (precio 650)
       (habitaciones 4)
       (superficie 121)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas yes)
       (terraza no)
       (balcon no)
       (soleado no)
       (fechaEdificacion 1962)
       (coordX 2699)
       (coordY 3307)
   )

   ([CasaAuto99] of Vivienda
       (id oAuto99)
       (precio 1644)
       (habitaciones 1)
       (superficie 60)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas no)
       (terraza no)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 2014)
       (coordX 3391)
       (coordY 2291)
   )

   ([CasaAuto100] of Vivienda
       (id oAuto100)
       (precio 1113)
       (habitaciones 1)
       (superficie 85)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje no)
       (buenas_vistas no)
       (terraza no)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1963)
       (coordX 139)
       (coordY 450)
   )
   ([HospitalSantPau] of Servicio
      (tipo hospital) (coordX 10) (coordY 10)
   )
   ([ParqueLesCorts] of Servicio
      (tipo zonaVerde) (coordX 10) (coordY 50)
   )
   ([Centro] of Servicio
      (tipo centro) (coordX 0) (coordY 0)
   )
   ([Discoteca_Wolf] of Servicio
      (tipo ocio_nocturno) (coordX 100) (coordY 100)
   )
   ([Discoteca_Razz] of Servicio
      (tipo ocio_nocturno) (coordX 20) (coordY 20)
   )
   ([Metro_L1] of Servicio
      (tipo transporte_publico) (coordX 50) (coordY 300)
   )
   ([CalleComercial_Gracia] of Servicio
      (tipo zona_comercial) (coordX 400) (coordY 400)
   )
   ([Supermercado_Dia] of Servicio
      (tipo supermercado) (coordX 150) (coordY 250)
   )
   ([Supermercado_Carrefour] of Servicio
      (tipo supermercado) (coordX 2000) (coordY 1000)
   )
   ([Centro_Educativo_Cervantes] of Servicio
      (tipo centro_educativo) (coordX 80) (coordY 120)
   )
   ([Estadio_Camp_Nou] of Servicio
      (tipo ocio) (coordX 800) (coordY 800)
   )
   ([Metro_L5] of Servicio
      (tipo transporte_publico) (coordX 600) (coordY 200)
   )
   ([Supermercado_Lidl] of Servicio
      (tipo supermercado) (coordX 700) (coordY 300)
   )
   ([ParqueDiagonal] of Servicio
      (tipo zonaVerde) (coordX 500) (coordY 900)
   )
   ([Hospital_Vall_dHebron] of Servicio
      (tipo hospital) (coordX 300) (coordY 200)
   )
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 2. MÓDULO DE ABSTRACCIÓN
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmodule ABSTRACCION
   (import INPUT ?ALL)
   (export ?ALL)
)
   ;; Extraemos todos los tipos de servicios existentes
   (deffunction obtener-tipos-servicio ()
      (bind ?inst (find-all-instances ((?s Servicio)) TRUE))
      (bind ?tipos (create$))

      (foreach ?i ?inst
         (bind ?t (send ?i get-tipo))
         (if (not (member$ ?t ?tipos)) then
            (bind ?tipos (create$ ?tipos ?t))
         )
      )
      ?tipos
   ) 
   (deffunction preguntar-distancia-tipoServicio (?tipo)
      (format t "¿Como prefieres el servicio tipo " )
      (printout t ?tipo " (cerca media lejos): ")
      (bind ?resp (read))

      ;; Validación correcta usando member$
      (while (not (member$ ?resp (create$ cerca media lejos))) do
         (format t "Respuesta inválida. Indica cerca media o lejos: ")
         (bind ?resp (read))
      )

      ?resp
   )

   ;función auxiliar para comprobar si un servicio de un tipo dado está en una lista de instancias
   (deffunction hay-servicio-de-tipo (?tipo_buscado ?lista_servicios)
      (bind ?encontrado FALSE)
      (foreach ?servicio ?lista_servicios
         (if (eq (send ?servicio get-tipo) ?tipo_buscado) then
            (bind ?encontrado TRUE)
            (break)))
      ?encontrado
   )

   (defrule queEdad
      ?x <- (object (is-a Solicitante) (edad ?e&:(eq ?e 0)))
      =>
      (bind ?age (ask-int "Cual es tu edad? "))
      (send ?x put-edad ?age)
   )
   (defrule vehiculoPropio
      ?x <- (object (is-a Solicitante) (coche ?e&:(eq ?e 0)))
      =>
      (bind ?vehiculo (ask-int "Tienes vehiculo propio? "))
      (send ?x put-coche ?vehiculo)
   )
   
   (defrule preguntar-tipo-solicitante
      ?s <- (object (is-a Solicitante) (tipo_solicitante ?t&:(eq ?t nil)))
      =>
      (bind ?tipo (ask-question "¿Que tipo de solicitante eres? (estudiante, pareja_sin_hijos, pareja_con_hijos, movilidad_reducida, soltero): "
                                 estudiante pareja_sin_hijos pareja_con_hijos movilidad_reducida soltero))
      (send ?s put-tipo_solicitante ?tipo)
   )

   (defrule preguntar-tipo-vivienda
      ?s <- (object (is-a Solicitante) (tipoVivienda ?t&:(eq ?t nil)))
      =>
      (bind ?tipo (ask-question 
         "¿Que tipo de vivienda prefieres? (casa, piso): "
         casa piso))
      (send ?s put-tipoVivienda ?tipo)
   )

   ;; Preguntar altura solo si es Piso
   (defrule preguntar-altura-piso
      ?s <- (object (is-a Solicitante) 
                  (tipoVivienda piso)
                  (altura-cat ?a&:(eq ?a nil)))
      =>
      (bind ?altura (ask-question 
         "Si es un piso, ¿que altura prefieres? (baja, media, alta): "
         baja media alta))
      (send ?s put-altura-cat ?altura)
   )

   (defrule preguntar-precio-maximo
      ?s <- (object (is-a Solicitante) (precioMax ?p&:(eq ?p 0)))
      =>
      (bind ?precio (ask-int "Cual es tu presupuesto maximo? "))
      (send ?s put-precioMax ?precio)
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
      ?u <- (object (is-a Solicitante) (id ?id))
      =>
      (bind ?lista
         (pregunta-llista
            "Indica tus restricciones obligatorias separadas por espacios (habitaciones mascotas ascensor amueblado piscina aire_acondicionado calefaccion garaje buenas_vistas terraza balcon):"
         ))
      (send ?u put-restricciones ?lista)

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
      (bind ?ans (yes-or-no-p "¿La vivienda tiene que aceptar masctoas? (yes/no): "))
      (send ?x put-mascotas ?ans)
   )

   (defrule preguntar-restriccion-habitaciones
      ?x <- (object (is-a Solicitante)
            (restricciones $?r&:(member habitaciones ?r))
            (numHabitaciones ?h&:(eq ?h 0)))
      =>
      (bind ?habs (ask-int "Cuantas habitaciones necesitas como minimo? "))
      (send ?x put-numHabitaciones ?habs)
   )

   (defrule preguntar-restriccion-piscina
      ?x <- (object (is-a Solicitante)
            (restricciones $?r&:(member piscina ?r))
            (piscina ?p&:(eq ?p nil)))
      =>
      (bind ?ans (yes-or-no-p "¿Necesitas que tenga piscina? (yes/no): "))
      (send ?x put-piscina ?ans)
   )

   (defrule preguntar-restriccion-aire_acondicionado
      ?x <- (object (is-a Solicitante)
            (restricciones $?r&:(member aire_acondicionado ?r))
            (aire_acondicionado ?a&:(eq ?a nil)))
      =>
      (bind ?ans (yes-or-no-p "¿Necesitas que tenga aire acondicionado? (yes/no): "))
      (send ?x put-aire_acondicionado ?ans)
   )

   (defrule preguntar-restriccion-calefaccion
      ?x <- (object (is-a Solicitante)
            (restricciones $?r&:(member calefaccion ?r))
            (calefaccion ?c&:(eq ?c nil)))
      =>
      (bind ?ans (yes-or-no-p "¿Necesitas que tenga calefacción? (yes/no): "))
      (send ?x put-calefaccion ?ans)
   )

   (defrule preguntar-restriccion-garaje
      ?x <- (object (is-a Solicitante)
            (restricciones $?r&:(member garaje ?r))
            (garaje ?g&:(eq ?g nil)))
      =>
      (bind ?ans (yes-or-no-p "¿Necesitas que tenga garaje? (yes/no): "))
      (send ?x put-garaje ?ans)
   )

   (defrule preguntar-restriccion-buenas_vistas
      ?x <- (object (is-a Solicitante)
            (restricciones $?r&:(member buenas_vistas ?r))
            (buenas_vistas ?v&:(eq ?v nil)))
      =>
      (bind ?ans (yes-or-no-p "¿Necesitas que tenga buenas vistas? (yes/no): "))
      (send ?x put-buenas_vistas ?ans)
   )

   (defrule preguntar-restriccion-terraza
      ?x <- (object (is-a Solicitante)
            (restricciones $?r&:(member terraza ?r))
            (terraza ?t&:(eq ?t nil)))
      =>
      (bind ?ans (yes-or-no-p "¿Necesitas que tenga terraza? (yes/no): "))
      (send ?x put-terraza ?ans)
   )

   (defrule preguntar-restriccion-balcon
      ?x <- (object (is-a Solicitante)
            (restricciones $?r&:(member balcon ?r))
            (balcon ?b&:(eq ?b nil)))
      =>
      (bind ?ans (yes-or-no-p "¿Necesitas que tenga balcón? (yes/no): "))
      (send ?x put-balcon ?ans)
   )

   (defrule preguntar-si-hay-preferencias-servicios
      ?u <- (object (is-a Solicitante) (id ?id))
      (not (pregunta-hecha preferencias-servicios))
      =>
      (assert (pregunta-hecha preferencias-servicios))
      (bind ?resp (yes-or-no-p "¿Tienes alguna preferencia sobre la cercania de servicios? (yes/no) "))
      (if (eq ?resp yes) then
         (assert (debe-preguntar-preferencias-servicios ?id))
      )
   )

   (defrule preguntar-que-preferencias-servicios
      ?f <- (debe-preguntar-preferencias-servicios ?id)
      ?u <- (object (is-a Solicitante) (id ?id))
      =>
      (retract ?f)
      (bind ?tipos_disponibles (obtener-tipos-servicio))
      (printout t "Servicios disponibles: " (implode$ ?tipos_disponibles) crlf)
      (bind ?lista_prefs (pregunta-llista "Indica los servicios sobre los que tienes preferencias, separados por espacios: "))      
      (send ?u put-preferencias_pendientes ?lista_prefs)
   )

   (defrule preguntar-distancia-para-preferencias-seleccionadas
      ?u <- (object (is-a Solicitante)
                  (preferencias_pendientes ?tipo_pref $?resto_prefs) 
                  (cerca_de $?c) (media_de $?m) (lejos_de $?l))
      =>
      (bind ?pref_dist (preguntar-distancia-tipoServicio ?tipo_pref))
      (switch ?pref_dist
         (case cerca then (send ?u put-cerca_de (create$ ?c ?tipo_pref))) ;; se crea una nueva lista usando la antigua y añadiendo el nuevo
         (case media then (send ?u put-media_de (create$ ?m ?tipo_pref)))
         (case lejos then (send ?u put-lejos_de (create$ ?l ?tipo_pref)))
      )
      (send ?u put-preferencias_pendientes ?resto_prefs) ;se elimina el procesado de la lista de pendientes
   )
   
   (defrule asignar-servicios-segun-distancia
      ?v <- (object (is-a Vivienda) (coordX ?vx)  (coordY ?vy)
                  (cerca_de $?c) (media_de $?m) (lejos_de $?l))
      ?s <- (object (is-a Servicio) (tipo ?tipo) (coordX ?sx) (coordY ?sy))
      (not (distancia-servicio-calculada ?v ?s))
      =>
      ;; Calcular distancia euclidiana
      (assert (distancia-servicio-calculada ?v ?s))

      (bind ?dist (calcDistanciaEuclidiana ?vx ?vy ?sx ?sy))

      ;; Clasificar según distancia
      (if (< ?dist 500) then
         ;; Insertar el tipo en cerca_de si no está ya
         (if (not (member$ ?s ?c)) then
            (slot-insert$ ?v cerca_de (+ (length$ ?c) 1) ?s)
         )
      else 
         (if (and (>= ?dist 500) (<= ?dist 1000)) then
            (if (not (member$ ?s ?m)) then
                  (slot-insert$ ?v media_de (+ (length$ ?m) 1) ?s)
            )
         else 
            (if (not (member$ ?s ?l)) then
                  (slot-insert$ ?v lejos_de (+ (length$ ?l) 1) ?s)
            )
         )
      )
   )



   (defrule ABSTRACCION::crear-atributos-vivienda-abstractos
      ?v <- (object (is-a Vivienda) (id ?id) 
                     (precio ?p) (habitaciones ?h) (superficie ?s)
                     (ascensor ?asc-val)
                     (mascotasPermitidas ?mas-val)
                     (amueblado ?amu-val)
                     (piscina ?pis-val)
                     (aire_acondicionado ?air-val)
                     (calefaccion ?cal-val)
                     (garaje ?gar-val)
                     (buenas_vistas ?vis-val)
                     (terraza ?ter-val)
                     (balcon ?bal-val)
                     (soleado ?sol-val)
                     (fechaEdificacion ?anio-val)
            )
      =>
      ;; precio-cat
      (bind ?cp (if (< ?p 600) then bajo else (if (< ?p 1000) then medio else alto)))

      ;; tamano-cat
      (bind ?ct (if (< ?h 2) then pequeño else (if (<= ?h 3) then medio else grande)))

      ;; superficie-cat
      (bind ?cs (if (< ?s 50) then pequeña else (if (< ?s 90) then mediana else grande)))

      ;; fechaEdificacion
      (bind ?actual 2025)
      (bind ?edad (- ?actual ?anio-val))

      (bind ?anioAbs (if (< ?edad 6) then reciente else (if (< ?edad 20) then moderna else antigua)))

      ;; Atributos booleanos
      (bind ?asc (if (eq ?asc-val yes) then TRUE else FALSE))
      (bind ?mas (if (eq ?mas-val yes) then TRUE else FALSE))
      (bind ?amu (if (eq ?amu-val yes) then TRUE else FALSE))
      (bind ?pis (if (eq ?pis-val yes) then TRUE else FALSE))
      (bind ?air (if (eq ?air-val yes) then TRUE else FALSE))
      (bind ?cal (if (eq ?cal-val yes) then TRUE else FALSE))
      (bind ?gar (if (eq ?gar-val yes) then TRUE else FALSE))
      (bind ?vis (if (eq ?vis-val yes) then TRUE else FALSE))
      (bind ?ter (if (eq ?ter-val yes) then TRUE else FALSE))
      (bind ?bal (if (eq ?bal-val yes) then TRUE else FALSE))
      (bind ?sol (if (eq ?sol-val yes) then TRUE else FALSE))

      ;; actualizar la instancia
      (send ?v put-precio-cat ?cp) (send ?v put-tamano-cat ?ct) (send ?v put-superficie-cat ?cs)
      (send ?v put-ascensor_Abs ?asc)
      (send ?v put-mascotasPermitidas_Abs ?mas)
      (send ?v put-amueblado_Abs ?amu)
      (send ?v put-piscina_Abs ?pis)
      (send ?v put-aire_acondicionado_Abs ?air)
      (send ?v put-calefaccion_Abs ?cal)
      (send ?v put-garaje_Abs ?gar)
      (send ?v put-buenas_vistas_Abs ?vis)
      (send ?v put-terraza_Abs ?ter)
      (send ?v put-balcon_Abs ?bal)
      (send ?v put-soleado_Abs ?sol)
      (send ?v put-fechaEdificacion_Abs ?anioAbs)
   )

   (defrule ABSTRACCION::crear-atributos-solicitante-abstractos
      ?s <- (object (is-a Solicitante) 
                     (precioMax ?p) 
                     (edad ?e)
                     (numHabitaciones ?h)
                     (ascensor ?asc-val)
                     (mascotas ?mas-val)
                     (amueblado ?amu-val)
                     (piscina ?pis-val)
                     (aire_acondicionado ?air-val)
                     (calefaccion ?cal-val)
                     (garaje ?gar-val)
                     (buenas_vistas ?vis-val)
                     (terraza ?ter-val)
                     (balcon ?bal-val))
      =>
      ;; precio-cat
      (bind ?cp (if (< ?p 600) then bajo else (if (< ?p 1000) then medio else alto)))

      ;; tamano-cat (basado en numHabitaciones)
      (bind ?ct (if (< ?h 2) then pequeño else (if (<= ?h 3) then medio else grande)))

      ;; edad-cat
      (bind ?ce (if (< ?e 30) then joven else (if (< ?e 65) then adulto else anciano)))

      ;; Preferencias booleanas
      (bind ?asc (if (eq ?asc-val yes) then TRUE else FALSE))
      (bind ?mas (if (eq ?mas-val yes) then TRUE else FALSE))
      (bind ?amu (if (eq ?amu-val yes) then TRUE else FALSE))
      (bind ?pis (if (eq ?pis-val yes) then TRUE else FALSE))
      (bind ?air (if (eq ?air-val yes) then TRUE else FALSE))
      (bind ?cal (if (eq ?cal-val yes) then TRUE else FALSE))
      (bind ?gar (if (eq ?gar-val yes) then TRUE else FALSE))
      (bind ?vis (if (eq ?vis-val yes) then TRUE else FALSE))
      (bind ?ter (if (eq ?ter-val yes) then TRUE else FALSE))
      (bind ?bal (if (eq ?bal-val yes) then TRUE else FALSE))

      ;; actualizar la instancia
      (send ?s put-precio-cat ?cp) (send ?s put-tamano-cat ?ct) (send ?s put-edad-cat ?ce)
      (send ?s put-ascensor_Abs ?asc)
      (send ?s put-mascotas_Abs ?mas)
      (send ?s put-amueblado_Abs ?amu)
      (send ?s put-piscina_Abs ?pis)
      (send ?s put-aire_acondicionado_Abs ?air)
      (send ?s put-calefaccion_Abs ?cal)
      (send ?s put-garaje_Abs ?gar)
      (send ?s put-buenas_vistas_Abs ?vis)
      (send ?s put-terraza_Abs ?ter)
      (send ?s put-balcon_Abs ?bal)
   )

   (defrule abstraccion-pisos
      ?v <- (object (is-a ViviendaVertical))
      =>
      (bind ?planta (send ?v get-planta))

      ;; Calcular la categoría de altura
      (bind ?altura (if (<= ?planta 1)
            then baja
            else (if (<= ?planta 4) then media else alta)))

      ;; Guardar atributo abstracto
      (send ?v put-planta_Abs ?altura)
   )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 3. MÓDULO DE HEURÍSTICAS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmodule HEURISTICAS
   (import INPUT ?ALL)
   (import ABSTRACCION ?ALL)
   (export ?ALL)
)

;; --- REGLAS DE ASOCIACIÓN HEURÍSTICA ---

;; Evaluar Precio  (precio-cat)
(defrule asociar-heuristica-precio
   ?s <- (object (is-a Solicitante) (precio-cat ?spc))
   ?v <- (object (is-a Vivienda) (precio-cat ?vpc) (requisitos-fallados $?fallos) (ventajas-extra $?extras))
   =>
   ;; Es un fallo si el precio de la vivienda es de una categoría superior a la del solicitante
   (if (and (eq ?spc medio) (eq ?vpc alto)) then
      (if (not (member$ precio-excedido ?fallos)) then (slot-insert$ ?v requisitos-fallados 1 precio-excedido)))
   (if (and (eq ?spc bajo) (or (eq ?vpc medio) (eq ?vpc alto))) then
      (if (not (member$ precio-excedido ?fallos)) then (slot-insert$ ?v requisitos-fallados 1 precio-excedido)))

   ;; es una ventaja/extra si el precio de la vivienda es de una categoría inferior
   (if (and (eq ?spc alto) (or (eq ?vpc medio) (eq ?vpc bajo))) then
      (if (not (member$ precio-ventajoso ?extras)) then (slot-insert$ ?v ventajas-extra 1 precio-ventajoso)))
   (if (and (eq ?spc medio) (eq ?vpc bajo)) then
      (if (not (member$ precio-ventajoso ?extras)) then (slot-insert$ ?v ventajas-extra 1 precio-ventajoso)))
)

;; Evaluar Habitaciones  (tamano-cat)
(defrule asociar-heuristica-habitaciones
   ;; solo se activa si el usuario ha pedido un número de habitaciones > 0 para que no se active si el usuario no ha indicado com restriccion el numero de habitaciones
   ?s <- (object (is-a Solicitante) (numHabitaciones ?h&:(> ?h 0)) (tamano-cat ?stc))
   ?v <- (object (is-a Vivienda) (tamano-cat ?vtc) (requisitos-fallados $?fallos) (ventajas-extra $?extras))
   =>
   ;; Falla si el tamaño de la vivienda es de una categoría inferior
   (if (and (eq ?stc medio) (eq ?vtc pequeño)) then
      (if (not (member$ habitaciones-insuficientes ?fallos)) then (slot-insert$ ?v requisitos-fallados 1 habitaciones-insuficientes)))
   (if (and (eq ?stc grande) (or (eq ?vtc medio) (eq ?vtc pequeño))) then
      (if (not (member$ habitaciones-insuficientes ?fallos)) then (slot-insert$ ?v requisitos-fallados 1 habitaciones-insuficientes)))

   ;; Ventaja si el tamaño de la vivienda es de una categoría superior
   (if (and (eq ?stc pequeño) (or (eq ?vtc medio) (eq ?vtc grande))) then
      (if (not (member$ habitaciones-extra ?extras)) then (slot-insert$ ?v ventajas-extra 1 habitaciones-extra)))
   (if (and (eq ?stc medio) (eq ?vtc grande)) then
      (if (not (member$ habitaciones-extra ?extras)) then (slot-insert$ ?v ventajas-extra 1 habitaciones-extra)))
)

(defrule asociar-heuristica-piso
   ?s <- (object (is-a Solicitante) 
                 (tipoVivienda ?tipoDeseado) 
                 (altura-cat ?plantaSolicitada))
   ?v <- (object (is-a ViviendaVertical) 
                 (requisitos-fallados $?fallos) 
                 (planta_Abs ?plantaReal))
               
    =>
   (if (neq ?plantaSolicitada ?plantaReal) then
      (if (not (member$ planta-incorrecta (send ?v get-requisitos-fallados))) then
         (slot-insert$ ?v requisitos-fallados 1 planta-incorrecta)))

)

;; Evaluar características booleanas  (_Abs)
(defrule asociar-heuristica-booleanas
   ?s <- (object (is-a Solicitante) 
                  (ascensor_Abs ?asc_req) (mascotas_Abs ?mas_req) (amueblado_Abs ?amu_req)
                  (piscina_Abs ?pis_req) (aire_acondicionado_Abs ?air_req)
                  (calefaccion_Abs ?cal_req) (garaje_Abs ?gar_req) (buenas_vistas_Abs ?vis_req)
                  (terraza_Abs ?ter_req) (balcon_Abs ?bal_req)
         )
   ?v <- (object (is-a Vivienda) 
                  (ascensor_Abs ?asc_viv) (mascotasPermitidas_Abs ?mas_viv) 
                  (amueblado_Abs ?amu_viv) (piscina_Abs ?pis_viv)
                  (aire_acondicionado_Abs ?air_viv) (calefaccion_Abs ?cal_viv)
                  (garaje_Abs ?gar_viv) (buenas_vistas_Abs ?vis_viv) (terraza_Abs ?ter_viv)
                  (balcon_Abs ?bal_viv)
                  (requisitos-fallados $?fallos)
                  (ventajas-extra $?extras)
         )
   =>
   ;; Ascensor
   (if (and (eq ?asc_req TRUE) (eq ?asc_viv FALSE)) then
      (if (not (member$ ascensor-faltante ?fallos)) then (slot-insert$ ?v requisitos-fallados 1 ascensor-faltante)))

   ;; Mascotas
   (if (and (eq ?mas_req TRUE) (eq ?mas_viv FALSE)) then
      (if (not (member$ mascotas-no-permitidas ?fallos)) then (slot-insert$ ?v requisitos-fallados 1 mascotas-no-permitidas)))

   ;; Amueblado
   (if (and (eq ?amu_req TRUE) (eq ?amu_viv FALSE)) then
      (if (not (member$ no-amueblado ?fallos)) then (slot-insert$ ?v requisitos-fallados 1 no-amueblado)))

   ;; Piscina
   (if (and (eq ?pis_req TRUE) (eq ?pis_viv FALSE)) then
      (if (not (member$ piscina-faltante ?fallos)) then (slot-insert$ ?v requisitos-fallados 1 piscina-faltante))
   )

   ;; Aire Acondicionado
   (if (and (eq ?air_req TRUE) (eq ?air_viv FALSE)) then
      (if (not (member$ aire-faltante ?fallos)) then (slot-insert$ ?v requisitos-fallados 1 aire-faltante))
   )

   ;; Calefacción
   (if (and (eq ?cal_req TRUE) (eq ?cal_viv FALSE)) then
      (if (not (member$ calefaccion-faltante ?fallos)) then (slot-insert$ ?v requisitos-fallados 1 calefaccion-faltante))
   )

   ;; Garaje
   (if (and (eq ?gar_req TRUE) (eq ?gar_viv FALSE)) then
      (if (not (member$ garaje-faltante ?fallos)) then (slot-insert$ ?v requisitos-fallados 1 garaje-faltante))
   )

   ;; Buenas Vistas
   (if (and (eq ?vis_req TRUE) (eq ?vis_viv FALSE)) then
      (if (not (member$ sin-buenas-vistas ?fallos)) then (slot-insert$ ?v requisitos-fallados 1 sin-buenas-vistas))
   )

   ;; Terraza
   (if (and (eq ?ter_req TRUE) (eq ?ter_viv FALSE)) then
      (if (not (member$ terraza-faltante ?fallos)) then (slot-insert$ ?v requisitos-fallados 1 terraza-faltante))
   )

   ;; Balcón
   (if (and (eq ?bal_req TRUE) (eq ?bal_viv FALSE)) then
      (if (not (member$ balcon-faltante ?fallos)) then (slot-insert$ ?v requisitos-fallados 1 balcon-faltante))
   )

   ;; Comprobación de tipo de vivienda
   (bind ?tipoDeseado (send ?s get-tipoVivienda))   ;; casa / piso
   (bind ?claseReal (class ?v))
   
    ;; Si es Vivienda base y quiere piso → fallo
   (if (and (eq ?claseReal Vivienda) (eq ?tipoDeseado piso)) then
      (if (not (member$ tipoVivienda-incorrecto ?fallos)) then
         (slot-insert$ ?v requisitos-fallados 1 tipoVivienda-incorrecto)))
   
   ;; Si es ViviendaVertical y quiere casa → fallo
   (if (and (eq ?claseReal ViviendaVertical) (eq ?tipoDeseado casa)) then
      (if (not (member$ tipoVivienda-incorrecto ?fallos)) then
         (slot-insert$ ?v requisitos-fallados 1 tipoVivienda-incorrecto)))
      
)

;; Evaluar ventajas extra no solicitadas (ej soleado) 
(defrule asociar-heuristica-ventaja-soleado
   ?v <- (object (is-a Vivienda) (soleado_Abs TRUE) (ventajas-extra $?extras))
   =>
   (if (not (member$ soleado ?extras)) then
      (slot-insert$ ?v ventajas-extra 1 soleado)
   )         
)
(defrule asociar-heuristica-ventaja-reciente
   ?v <- (object (is-a Vivienda)
                 (fechaEdificacion_Abs reciente)
                 (ventajas-extra $?extras))
   =>
   (if (not (member$ reciente ?extras)) then
      (slot-insert$ ?v ventajas-extra 1 reciente)
   )
)
(defrule asociar-heuristica-ventaja-atico
   ?v <- (object (is-a ViviendaVertical) (atico yes) (ventajas-extra $?extras))
   =>
   (if (not (member$ atico ?extras)) then
      (slot-insert$ ?v ventajas-extra 1 atico)
   )
)

(defrule asociar-heuristica-ventaja-duplex
   ?v <- (object (is-a Duplex) (ventajas-extra $?extras))
   =>
   (if (not (member$ duplex ?extras)) then
      (slot-insert$ ?v ventajas-extra 1 duplex))
)

;; Evaluar preferencias de servicios como ventajas extra (coincidencia estricta)
(defrule asociar-heuristica-servicios
   ?s <- (object (is-a Solicitante) 
                  (cerca_de $?sc) 
                  (media_de $?sm)
                  (lejos_de $?sl))
   ?v <- (object (is-a Vivienda) 
                  (cerca_de $?servicios_cercanos) 
                  (media_de $?servicios_medios) 
                  (lejos_de $?servicios_lejanos)
                  (ventajas-extra $?extras))
   =>
   ;; 1. Añadir ventaja si un servicio preferido "cerca" está cerca
   (foreach ?tipo_req ?sc
      (bind ?encontrado_cerca FALSE)
      (foreach ?servicio_instancia ?servicios_cercanos
         (if (eq (send ?servicio_instancia get-tipo) ?tipo_req) then (bind ?encontrado_cerca TRUE) (break)))
      (if (eq ?encontrado_cerca TRUE) then
         (if (not (member$ (sym-cat servicio-cercano- ?tipo_req) ?extras)) then
            (slot-insert$ ?v ventajas-extra 1 (sym-cat servicio-cercano- ?tipo_req)))))
   
   ;; 2. Añadir ventaja si un servicio preferido a "media" distancia está a media distancia
   (foreach ?tipo_req ?sm
      (bind ?encontrado_media FALSE)
      (foreach ?servicio_instancia ?servicios_medios
         (if (eq (send ?servicio_instancia get-tipo) ?tipo_req) then (bind ?encontrado_media TRUE) (break)))
      (if (eq ?encontrado_media TRUE) then
         (if (not (member$ (sym-cat servicio-a-distancia-media- ?tipo_req) ?extras)) then
            (slot-insert$ ?v ventajas-extra 1 (sym-cat servicio-a-distancia-media- ?tipo_req)))))

   ;; 3. Añadir ventaja si un servicio preferido "lejos" está lejos
   (foreach ?tipo_req ?sl
      (bind ?encontrado_lejos FALSE)
      (foreach ?servicio_instancia ?servicios_lejanos
         (if (eq (send ?servicio_instancia get-tipo) ?tipo_req) then (bind ?encontrado_lejos TRUE) (break)))
      (if (eq ?encontrado_lejos TRUE) then
         (if (not (member$ (sym-cat servicio-lejano- ?tipo_req) ?extras)) then
            (slot-insert$ ?v ventajas-extra 1 (sym-cat servicio-lejano- ?tipo_req)))))
)

;Regla extra para solicitantes de tipo 'anciano'
;si el anciano no ha especificado preferencia por hospitales,
;se añade como ventaja extra si la vivienda está cerca de uno
(defrule asociar-heuristica-extra-hospital-anciano
   ;condición 1 El solicitante es 'anciano'
   ?s <- (object (is-a Solicitante)
                  (tipo_solicitante anciano)
                  ; y NO se ha especificado una preferencia por 'hospital'
                  (cerca_de $?c&:(not (member$ hospital ?c)))
                  (media_de $?m&:(not (member$ hospital ?m)))
                  (lejos_de $?l&:(not (member$ hospital ?l)))
         )
   ; condición 2 Existe una vivienda
   ?v <- (object (is-a Vivienda)
                  (cerca_de $?servicios_cercanos&:(hay-servicio-de-tipo hospital ?servicios_cercanos))
                  (ventajas-extra $?extras&:(not (member$ extra-hospital-cercano-anciano ?extras)))
         )
   =>
   (slot-insert$ ?v ventajas-extra 1 extra-hospital-cercano-anciano)
)

;Regla extra para solicitantes de tipo 'joven'
;si el joven no ha especificado preferencia por el centro,
;se añade como ventaja extra si la vivienda está cerca de el
(defrule asociar-heuristica-extra-centro-joven-declarativa
   (object (is-a Solicitante)
                  (tipo_solicitante joven)
                  (cerca_de $?c&:(not (member$ centro ?c)))
                  (media_de $?m&:(not (member$ centro ?m)))
                  (lejos_de $?l&:(not (member$ centro ?l)))
         )
   ?v <- (object (is-a Vivienda)
                  (cerca_de $?servicios_cercanos&:(hay-servicio-de-tipo centro ?servicios_cercanos))
                  (ventajas-extra $?extras&:(not (member$ extra-centro-cercano-joven ?extras)))
         )
   =>
   (slot-insert$ ?v ventajas-extra 1 extra-centro-cercano-joven)
)

;Regla extra para solicitantes de tipo 'joven'
;si el joven no ha especificado preferencia por el ocio nocturno,
;se añade como ventaja extra si la vivienda está cerca de el
(defrule asociar-heuristica-extra-ocio-nocturno-joven-declarativa
   (object (is-a Solicitante)
                  (tipo_solicitante joven)
                  (cerca_de $?c&:(not (member$ ocio_nocturno ?c)))
                  (media_de $?m&:(not (member$ ocio_nocturno ?m)))
                  (lejos_de $?l&:(not (member$ ocio_nocturno ?l)))
         )
   ?v <- (object (is-a Vivienda)
                  (cerca_de $?servicios_cercanos&:(hay-servicio-de-tipo ocio_nocturno ?servicios_cercanos))
                  (ventajas-extra $?extras&:(not (member$ extra-ocio-nocturno-cercano-joven ?extras)))
         )
   =>
   (slot-insert$ ?v ventajas-extra 1 extra-ocio-nocturno-cercano-joven)
)

;Regla extra para solicitantes de tipo 'pareja_con_hijos'
;si no han especificado preferencia por el centro_educativo,
;se añade como ventaja extra si la vivienda está a media distancia de uno
(defrule asociar-heuristica-extra-centro-educativo-media-familia-declarativa
   (object (is-a Solicitante)
                  (tipo_solicitante pareja_con_hijos)
                  (cerca_de $?c&:(not (member$ centro_educativo ?c)))
                  (media_de $?m&:(not (member$ centro_educativo ?m)))
                  (lejos_de $?l&:(not (member$ centro_educativo ?l)))
         )
   ?v <- (object (is-a Vivienda)
                  (media_de $?servicios_medios&:(hay-servicio-de-tipo centro_educativo ?servicios_medios))
                  (ventajas-extra $?extras&:(not (member$ extra-centro-educativo-media-familia ?extras)))
         )
   =>
   (slot-insert$ ?v ventajas-extra 1 extra-centro-educativo-media-familia)
)

;Regla extra para solicitantes de tipo 'movilidad_reducida'
;si no han especificado como restricción un ascensor,
;se añade como ventaja extra si la vivienda lo tiene.
(defrule asociar-heuristica-extra-ascensor-movilidad-reducida
   (object (is-a Solicitante)
                  (tipo_solicitante movilidad_reducida)
                  ;; El usuario no ha pedido ascensor como restricción
                  (ascensor_Abs FALSE)
         )
   ?v <- (object (is-a Vivienda)
                  (ascensor_Abs TRUE)
                  (ventajas-extra $?extras&:(not (member$ extra-ascensor-movilidad-reducida ?extras)))
         )
   =>
   (slot-insert$ ?v ventajas-extra 1 extra-ascensor-movilidad-reducida)
)

;Regla extra para solicitantes de tipo 'estudiante'
;si no han especificado preferencia por el centro_educativo,
;se añade como ventaja extra si la vivienda está cerca de uno
(defrule asociar-heuristica-extra-centro-educativo-estudiante-declarativa
   (object (is-a Solicitante)
                  (tipo_solicitante estudiante)
                  (cerca_de $?c&:(not (member$ centro_educativo ?c)))
                  (media_de $?m&:(not (member$ centro_educativo ?m)))
                  (lejos_de $?l&:(not (member$ centro_educativo ?l)))
         )
   ?v <- (object (is-a Vivienda)
                  (cerca_de $?servicios_cercanos&:(hay-servicio-de-tipo centro_educativo ?servicios_cercanos))
                  (ventajas-extra $?extras&:(not (member$ extra-centro-educativo-cercano-estudiante ?extras)))
         )
   =>
   (slot-insert$ ?v ventajas-extra 1 extra-centro-educativo-cercano-estudiante)
)

;Regla extra para solicitantes de tipo 'estudiante'
;si no han especificado preferencia por el transporte_publico,
;se añade como ventaja extra si la vivienda está cerca de uno
(defrule asociar-heuristica-extra-transporte-estudiante-declarativa
   (object (is-a Solicitante)
                  (tipo_solicitante estudiante)
                  (cerca_de $?c&:(not (member$ transporte_publico ?c)))
                  (media_de $?m&:(not (member$ transporte_publico ?m)))
                  (lejos_de $?l&:(not (member$ transporte_publico ?l)))
         )
   ?v <- (object (is-a Vivienda)
                  (cerca_de $?servicios_cercanos&:(hay-servicio-de-tipo transporte_publico ?servicios_cercanos))
                  (ventajas-extra $?extras&:(not (member$ extra-transporte-cercano-estudiante ?extras)))
         )
   =>
   (slot-insert$ ?v ventajas-extra 1 extra-transporte-cercano-estudiante)
)

;Regla extra para solicitantes sin coche
;si el solicitante no tiene coche,
;se añade como ventaja extra si la vivienda está cerca de transporte público
(defrule asociar-heuristica-extra-transporte-sinCoche
   (object (is-a Solicitante)
                  (coche no)
         )
   ?v <- (object (is-a Vivienda)
                  (cerca_de $?servicios_cercanos&:(hay-servicio-de-tipo transporte_publico ?servicios_cercanos))
                  (ventajas-extra $?extras&:(not (member$ extra-transporte-sinCoche ?extras)))
         )
   =>
   (slot-insert$ ?v ventajas-extra 1 extra-transporte-sinCoche)
)

;Regla extra para solicitantes de tipo 'soltero'
;si no han especificado preferencia por el ocio,
;se añade como ventaja extra si la vivienda está cerca de uno
(defrule asociar-heuristica-extra-ocio-soltero-declarativa
   (object (is-a Solicitante)
                  (tipo_solicitante soltero)
                  (cerca_de $?c&:(not (member$ ocio ?c)))
                  (media_de $?m&:(not (member$ ocio ?m)))
                  (lejos_de $?l&:(not (member$ ocio ?l)))
         )
   ?v <- (object (is-a Vivienda)
                  (cerca_de $?servicios_cercanos&:(hay-servicio-de-tipo ocio ?servicios_cercanos))
                  (ventajas-extra $?extras&:(not (member$ extra-ocio-cercano-soltero ?extras)))
         )
   =>
   (slot-insert$ ?v ventajas-extra 1 extra-ocio-cercano-soltero)
)

;Regla extra para solicitantes de tipo 'pareja_con_hijos'
;si no han especificado preferencia por zonaVerde a media distancia,
;se añade como ventaja extra si la vivienda está a media distancia de una.
(defrule asociar-heuristica-extra-zonaVerde-media-familia-declarativa
   (object (is-a Solicitante)
                  (tipo_solicitante pareja_con_hijos)
                  (cerca_de $?c&:(not (member$ zonaVerde ?c)))
                  (media_de $?m&:(not (member$ zonaVerde ?m)))
                  (lejos_de $?l&:(not (member$ zonaVerde ?l)))
         )
   ?v <- (object (is-a Vivienda)
                  (media_de $?servicios_medios&:(hay-servicio-de-tipo zonaVerde ?servicios_medios))
                  (ventajas-extra $?extras&:(not (member$ extra-zonaVerde-media-familia ?extras)))
         )
   =>
   (slot-insert$ ?v ventajas-extra 1 extra-zonaVerde-media-familia)
)

;; --- REGLAS DE CLASIFICACIÓN FINALES ---
;;se ejecutan con menor prioridad para asegurar que toda la asociación heurística ha terminado

;;Etiqueta: Parcialmente Adecuado
;;Condición: Falla en 2 o menos criterios
(defrule clasificar-parcialmente-adecuado
   (declare (salience -10))
   ?v <- (object (is-a Vivienda)
                  (etiqueta-recomendacion Sin-Clasificar)
                  (requisitos-fallados $?fallos&:(and (> (length$ ?fallos) 0)
                                                      (<= (length$ ?fallos) 2))))
   =>
   (send ?v put-etiqueta-recomendacion Parcialmente_Adecuado)
)

;; Etiqueta: Muy Recomendable
;; Condición: No falla en nada y tiene al menos una ventaja extra
(defrule clasificar-muy-recomendable
   (declare (salience -10))
   ?v <- (object (is-a Vivienda)
                  (etiqueta-recomendacion Sin-Clasificar)
                  (requisitos-fallados $?fallos&:(eq (length$ ?fallos) 0))
                  (ventajas-extra $?extras&:(> (length$ ?extras) 0)))
   =>
   (send ?v put-etiqueta-recomendacion Muy_Recomendable)
)

;; Etiqueta: Adecuado
;; Condición: No falla en nada y no tiene ventajas extra
(defrule clasificar-adecuado
   (declare (salience -10))
   ?v <- (object (is-a Vivienda)
                  (etiqueta-recomendacion Sin-Clasificar)
                  (requisitos-fallados $?fallos&:(eq (length$ ?fallos) 0))
                  (ventajas-extra $?extras&:(eq (length$ ?extras) 0)))
   =>
   (send ?v put-etiqueta-recomendacion Adecuado)
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 4. MÓDULO DE REFINAMIENTO 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmodule REFINAMIENTO
   (import HEURISTICAS ?ALL)
   (import ABSTRACCION ?ALL)
   (import INPUT ?ALL)
   (export ?ALL)
)

(deftemplate vivienda-a-mostrar
   (slot vivienda (type INSTANCE))
   (slot valor-orden (type INTEGER))
)

;; Regla para crear hechos de ordenación para viviendas MUY RECOMENDABLES
;; El valor de orden es el número de extras en negativo (más extras = menor valor = más prioridad)
(defrule refinar-orden-muy-recomendable
   (declare (salience -20))
   ?v <- (object (is-a Vivienda) (etiqueta-recomendacion Muy_Recomendable) (ventajas-extra $?extras))
   =>
   (assert (vivienda-a-mostrar (vivienda ?v) (valor-orden (- 0 (length$ ?extras)))))
)

;; Regla para crear hechos de ordenación para viviendas ADECUADAS
;; Se activa solo si NO hay viviendas muy recomendables.
(defrule refinar-orden-adecuado
   (declare (salience -30))
   (not (object (is-a Vivienda) (etiqueta-recomendacion Muy_Recomendable)))
   ?v <- (object (is-a Vivienda) (etiqueta-recomendacion Adecuado))
   =>
   (assert (vivienda-a-mostrar (vivienda ?v) (valor-orden 0)))
)

;; Regla para crear hechos de ordenación para viviendas PARCIALMENTE ADECUADAS
;; Se activa solo si NO hay viviendas adecuadas o muy recomendables.
;; El valor de orden es el número de fallos (menos fallos = menor valor = más prioridad)
(defrule refinar-orden-parcialmente-adecuado
   (declare (salience -30))
   (not (object (is-a Vivienda) (etiqueta-recomendacion Adecuado | Muy_Recomendable)))
   ?v <- (object (is-a Vivienda) (etiqueta-recomendacion Parcialmente_Adecuado) (requisitos-fallados $?fallos))
   =>
   (assert (vivienda-a-mostrar (vivienda ?v) (valor-orden (length$ ?fallos))))
)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 5. MÓDULO DE SALIDA (OUTPUT)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmodule SALIDA
   (import REFINAMIENTO ?ALL)
   (export ?ALL)
)

;;imprime la vivienda con el menor valor de orden y la elimina de la lista de impresión
(defrule imprimir-resultados-ordenados
   (declare (salience -40))
   ;;se encuentra el hecho con el menor valor de orden
   ?hecho <- (vivienda-a-mostrar (vivienda ?v) (valor-orden ?vo))
   (not (vivienda-a-mostrar (valor-orden ?vo2&:(< ?vo2 ?vo))))
   =>
   ;;se extraen los datos de la vivienda
   (bind ?id (send ?v get-id))
   (bind ?etq (send ?v get-etiqueta-recomendacion))
   (bind ?fallos (send ?v get-requisitos-fallados))
   (bind ?extras (send ?v get-ventajas-extra))

   (printout t "----------------------------------" crlf)
   (printout t "Vivienda ID: " ?id crlf)
   (printout t "Grado de Recomendacion: " ?etq crlf)
   (if (> (length$ ?fallos) 0) then
      (printout t "Requisitos NO cumplidos (simbolos): " (implode$ ?fallos) crlf)
   )
   (if (> (length$ ?extras) 0) then
      (printout t "Ventajas extra (simbolos): " (implode$ ?extras) crlf)
   )
   (printout t crlf)

   ;;se elimina el hecho para pasar a la siguiente vivienda en la próxima iteración
   (retract ?hecho)
)

(defrule imprimir-resumen-fallos
   (declare (salience -60))
   =>
   (printout t crlf "=== RESUMEN DE FALLOS POR VIVIENDA ===" crlf)
   (bind ?viviendas (find-all-instances ((?v Vivienda)) TRUE))
   (foreach ?v ?viviendas
      (bind ?id (send ?v get-id))
      (bind ?fallos (send ?v get-requisitos-fallados))
      (bind ?etq (send ?v get-etiqueta-recomendacion))
      (printout t ?etq "  Vivienda " ?id ": " (implode$ ?fallos)  crlf)
   )
   (printout t "===================================" crlf crlf)
)

(defrule fallback-ninguna-vivienda
   (declare (salience -50))
   ;; No existe ninguna vivienda con etiqueta distinta a Sin-Clasificar
   (not (object (is-a Vivienda)
                (etiqueta-recomendacion ~Sin-Clasificar)))
   =>
   (printout t "----------------------------------" crlf)
   (printout t " No existe ninguna vivienda que cumpla los requisitos del solicitante." crlf)
   (printout t "----------------------------------" crlf)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 6. FLUJO DE CONTROL
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule MAIN::inicio
   (declare (salience 100))
   =>
   (focus ABSTRACCION HEURISTICAS REFINAMIENTO SALIDA)
)