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
   ([CasaAuto1] of Vivienda
       (id oAuto1)
       (precio 622)
       (habitaciones 5)
       (superficie 145)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas yes)
       (terraza no)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1973)
       (coordX 3785)
       (coordY 1539)
   )

   ([CasaAuto2] of Vivienda
       (id oAuto2)
       (precio 1768)
       (habitaciones 3)
       (superficie 42)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas no)
       (terraza no)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1961)
       (coordX 65)
       (coordY 3016)
   )

   ([CasaAuto3] of Vivienda
       (id oAuto3)
       (precio 809)
       (habitaciones 5)
       (superficie 85)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas no)
       (terraza no)
       (balcon no)
       (soleado no)
       (fechaEdificacion 1987)
       (coordX 2754)
       (coordY 414)
   )

   ([CasaAuto4] of ViviendaVertical
       (id oAuto4)
       (precio 1911)
       (habitaciones 5)
       (superficie 125)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas no)
       (terraza no)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 1990)
       (coordX 3857)
       (coordY 1793)
       (planta 9)
       (atico no)
   )

   ([CasaAuto5] of ViviendaVertical
       (id oAuto5)
       (precio 2006)
       (habitaciones 4)
       (superficie 95)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas yes)
       (terraza yes)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1984)
       (coordX 873)
       (coordY 3275)
       (planta 9)
       (atico yes)
   )

   ([CasaAuto6] of Vivienda
       (id oAuto6)
       (precio 920)
       (habitaciones 3)
       (superficie 106)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas yes)
       (terraza no)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 1964)
       (coordX 3435)
       (coordY 1354)
   )

   ([CasaAuto7] of Vivienda
       (id oAuto7)
       (precio 1592)
       (habitaciones 2)
       (superficie 113)
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
       (soleado yes)
       (fechaEdificacion 1984)
       (coordX 131)
       (coordY 2680)
   )

   ([CasaAuto8] of Vivienda
       (id oAuto8)
       (precio 1850)
       (habitaciones 3)
       (superficie 43)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas no)
       (terraza yes)
       (balcon no)
       (soleado no)
       (fechaEdificacion 1987)
       (coordX 865)
       (coordY 2735)
   )

   ([CasaAuto9] of Vivienda
       (id oAuto9)
       (precio 1790)
       (habitaciones 5)
       (superficie 96)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje no)
       (buenas_vistas yes)
       (terraza yes)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 1979)
       (coordX 1078)
       (coordY 3103)
   )

   ([CasaAuto10] of ViviendaVertical
       (id oAuto10)
       (precio 644)
       (habitaciones 3)
       (superficie 64)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje no)
       (buenas_vistas no)
       (terraza yes)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 1994)
       (coordX 2816)
       (coordY 1547)
       (planta 12)
       (atico no)
   )

   ([CasaAuto11] of Vivienda
       (id oAuto11)
       (precio 1275)
       (habitaciones 4)
       (superficie 58)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje no)
       (buenas_vistas no)
       (terraza no)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 2003)
       (coordX 869)
       (coordY 1666)
   )

   ([CasaAuto12] of Duplex
       (id oAuto12)
       (precio 1499)
       (habitaciones 2)
       (superficie 108)
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
       (fechaEdificacion 1999)
       (coordX 3506)
       (coordY 2044)
       (planta 11)
       (numPlantas 2)
   )

   ([CasaAuto13] of ViviendaVertical
       (id oAuto13)
       (precio 1318)
       (habitaciones 2)
       (superficie 38)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje no)
       (buenas_vistas yes)
       (terraza yes)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1965)
       (coordX 3952)
       (coordY 3450)
       (planta 7)
       (atico yes)
   )

   ([CasaAuto14] of Vivienda
       (id oAuto14)
       (precio 2011)
       (habitaciones 2)
       (superficie 95)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas no)
       (terraza no)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1981)
       (coordX 919)
       (coordY 1651)
   )

   ([CasaAuto15] of Vivienda
       (id oAuto15)
       (precio 1255)
       (habitaciones 4)
       (superficie 114)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje no)
       (buenas_vistas yes)
       (terraza yes)
       (balcon no)
       (soleado no)
       (fechaEdificacion 2001)
       (coordX 3367)
       (coordY 491)
   )

   ([CasaAuto16] of Vivienda
       (id oAuto16)
       (precio 768)
       (habitaciones 5)
       (superficie 34)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas yes)
       (terraza no)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 2004)
       (coordX 3701)
       (coordY 303)
   )

   ([CasaAuto17] of ViviendaVertical
       (id oAuto17)
       (precio 1141)
       (habitaciones 1)
       (superficie 86)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas no)
       (terraza no)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 2014)
       (coordX 2740)
       (coordY 3478)
       (planta 1)
       (atico no)
   )

   ([CasaAuto18] of Vivienda
       (id oAuto18)
       (precio 711)
       (habitaciones 4)
       (superficie 131)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas no)
       (terraza yes)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 2007)
       (coordX 1557)
       (coordY 1811)
   )

   ([CasaAuto19] of Vivienda
       (id oAuto19)
       (precio 1196)
       (habitaciones 2)
       (superficie 126)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje no)
       (buenas_vistas yes)
       (terraza no)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1971)
       (coordX 1468)
       (coordY 1190)
   )

   ([CasaAuto20] of Vivienda
       (id oAuto20)
       (precio 1409)
       (habitaciones 3)
       (superficie 126)
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
       (soleado yes)
       (fechaEdificacion 1968)
       (coordX 793)
       (coordY 2505)
   )

   ([CasaAuto21] of Vivienda
       (id oAuto21)
       (precio 1177)
       (habitaciones 2)
       (superficie 134)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas yes)
       (terraza yes)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1989)
       (coordX 578)
       (coordY 2937)
   )

   ([CasaAuto22] of ViviendaVertical
       (id oAuto22)
       (precio 1235)
       (habitaciones 5)
       (superficie 33)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje no)
       (buenas_vistas yes)
       (terraza no)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 1966)
       (coordX 1392)
       (coordY 1571)
       (planta 10)
       (atico yes)
   )

   ([CasaAuto23] of ViviendaVertical
       (id oAuto23)
       (precio 1383)
       (habitaciones 3)
       (superficie 122)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas yes)
       (terraza yes)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 1977)
       (coordX 2781)
       (coordY 1346)
       (planta 3)
       (atico yes)
   )

   ([CasaAuto24] of Vivienda
       (id oAuto24)
       (precio 632)
       (habitaciones 2)
       (superficie 103)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas yes)
       (terraza no)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1972)
       (coordX 1516)
       (coordY 3963)
   )

   ([CasaAuto25] of Vivienda
       (id oAuto25)
       (precio 655)
       (habitaciones 1)
       (superficie 127)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas no)
       (terraza no)
       (balcon no)
       (soleado no)
       (fechaEdificacion 1969)
       (coordX 3491)
       (coordY 1537)
   )

   ([CasaAuto26] of Vivienda
       (id oAuto26)
       (precio 1840)
       (habitaciones 1)
       (superficie 102)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas no)
       (terraza no)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 2003)
       (coordX 2171)
       (coordY 3372)
   )

   ([CasaAuto27] of Vivienda
       (id oAuto27)
       (precio 2188)
       (habitaciones 3)
       (superficie 59)
       (ascensor no)
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
       (fechaEdificacion 2013)
       (coordX 3843)
       (coordY 2773)
   )

   ([CasaAuto28] of Duplex
       (id oAuto28)
       (precio 1913)
       (habitaciones 4)
       (superficie 90)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas no)
       (terraza yes)
       (balcon no)
       (soleado no)
       (fechaEdificacion 1968)
       (coordX 3413)
       (coordY 3648)
       (planta 1)
       (numPlantas 3)
   )

   ([CasaAuto29] of Vivienda
       (id oAuto29)
       (precio 922)
       (habitaciones 2)
       (superficie 145)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas no)
       (terraza no)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 2012)
       (coordX 3786)
       (coordY 707)
   )

   ([CasaAuto30] of ViviendaVertical
       (id oAuto30)
       (precio 1248)
       (habitaciones 5)
       (superficie 114)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas yes)
       (terraza no)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 1988)
       (coordX 806)
       (coordY 3705)
       (planta 3)
       (atico no)
   )

   ([CasaAuto31] of ViviendaVertical
       (id oAuto31)
       (precio 2302)
       (habitaciones 2)
       (superficie 79)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje no)
       (buenas_vistas no)
       (terraza yes)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1988)
       (coordX 2312)
       (coordY 2894)
       (planta 6)
       (atico yes)
   )

   ([CasaAuto32] of Vivienda
       (id oAuto32)
       (precio 2321)
       (habitaciones 4)
       (superficie 31)
       (ascensor yes)
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
       (fechaEdificacion 1967)
       (coordX 2018)
       (coordY 3104)
   )

   ([CasaAuto33] of Vivienda
       (id oAuto33)
       (precio 2411)
       (habitaciones 5)
       (superficie 72)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas no)
       (terraza yes)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 1979)
       (coordX 1694)
       (coordY 1380)
   )

   ([CasaAuto34] of ViviendaVertical
       (id oAuto34)
       (precio 1616)
       (habitaciones 1)
       (superficie 95)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje no)
       (buenas_vistas no)
       (terraza yes)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 1991)
       (coordX 2356)
       (coordY 3415)
       (planta 12)
       (atico no)
   )

   ([CasaAuto35] of Vivienda
       (id oAuto35)
       (precio 1745)
       (habitaciones 1)
       (superficie 45)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje no)
       (buenas_vistas no)
       (terraza yes)
       (balcon no)
       (soleado no)
       (fechaEdificacion 2023)
       (coordX 1393)
       (coordY 2583)
   )

   ([CasaAuto36] of Vivienda
       (id oAuto36)
       (precio 550)
       (habitaciones 4)
       (superficie 40)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas yes)
       (terraza yes)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 1988)
       (coordX 3100)
       (coordY 2386)
   )

   ([CasaAuto37] of Vivienda
       (id oAuto37)
       (precio 1984)
       (habitaciones 5)
       (superficie 71)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje no)
       (buenas_vistas yes)
       (terraza yes)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 2005)
       (coordX 870)
       (coordY 3620)
   )

   ([CasaAuto38] of ViviendaVertical
       (id oAuto38)
       (precio 1042)
       (habitaciones 5)
       (superficie 84)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje no)
       (buenas_vistas yes)
       (terraza no)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 1967)
       (coordX 2072)
       (coordY 2078)
       (planta 10)
       (atico no)
   )

   ([CasaAuto39] of ViviendaVertical
       (id oAuto39)
       (precio 2139)
       (habitaciones 1)
       (superficie 139)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje no)
       (buenas_vistas no)
       (terraza no)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 2011)
       (coordX 2143)
       (coordY 1291)
       (planta 12)
       (atico no)
   )

   ([CasaAuto40] of Vivienda
       (id oAuto40)
       (precio 1254)
       (habitaciones 5)
       (superficie 131)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje no)
       (buenas_vistas no)
       (terraza yes)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 2006)
       (coordX 591)
       (coordY 1631)
   )

   ([CasaAuto41] of ViviendaVertical
       (id oAuto41)
       (precio 1920)
       (habitaciones 3)
       (superficie 78)
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
       (fechaEdificacion 1995)
       (coordX 1041)
       (coordY 279)
       (planta 12)
       (atico no)
   )

   ([CasaAuto42] of Vivienda
       (id oAuto42)
       (precio 1754)
       (habitaciones 5)
       (superficie 99)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje no)
       (buenas_vistas yes)
       (terraza yes)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1992)
       (coordX 1926)
       (coordY 1309)
   )

   ([CasaAuto43] of Vivienda
       (id oAuto43)
       (precio 1836)
       (habitaciones 4)
       (superficie 135)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje no)
       (buenas_vistas yes)
       (terraza no)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1977)
       (coordX 3027)
       (coordY 3842)
   )

   ([CasaAuto44] of Vivienda
       (id oAuto44)
       (precio 2274)
       (habitaciones 1)
       (superficie 120)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje no)
       (buenas_vistas no)
       (terraza no)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1985)
       (coordX 1970)
       (coordY 761)
   )

   ([CasaAuto45] of Vivienda
       (id oAuto45)
       (precio 1929)
       (habitaciones 2)
       (superficie 111)
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
       (soleado no)
       (fechaEdificacion 1991)
       (coordX 1490)
       (coordY 1300)
   )

   ([CasaAuto46] of Vivienda
       (id oAuto46)
       (precio 1217)
       (habitaciones 5)
       (superficie 127)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas no)
       (terraza yes)
       (balcon no)
       (soleado no)
       (fechaEdificacion 1985)
       (coordX 1890)
       (coordY 3206)
   )

   ([CasaAuto47] of Vivienda
       (id oAuto47)
       (precio 1293)
       (habitaciones 4)
       (superficie 103)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas no)
       (terraza no)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 2003)
       (coordX 390)
       (coordY 3573)
   )

   ([CasaAuto48] of Vivienda
       (id oAuto48)
       (precio 2152)
       (habitaciones 5)
       (superficie 103)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas no)
       (terraza no)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1991)
       (coordX 2804)
       (coordY 795)
   )

   ([CasaAuto49] of ViviendaVertical
       (id oAuto49)
       (precio 2039)
       (habitaciones 4)
       (superficie 33)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas yes)
       (terraza no)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1974)
       (coordX 784)
       (coordY 956)
       (planta 3)
       (atico no)
   )

   ([CasaAuto50] of Duplex
       (id oAuto50)
       (precio 2469)
       (habitaciones 1)
       (superficie 50)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas no)
       (terraza no)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 2012)
       (coordX 930)
       (coordY 186)
       (planta 7)
       (numPlantas 3)
   )

   ([CasaAuto51] of Vivienda
       (id oAuto51)
       (precio 898)
       (habitaciones 2)
       (superficie 60)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas yes)
       (terraza no)
       (balcon no)
       (soleado no)
       (fechaEdificacion 1999)
       (coordX 1170)
       (coordY 1344)
   )

   ([CasaAuto52] of ViviendaVertical
       (id oAuto52)
       (precio 1537)
       (habitaciones 2)
       (superficie 150)
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
       (fechaEdificacion 2001)
       (coordX 2067)
       (coordY 1724)
       (planta 5)
       (atico yes)
   )

   ([CasaAuto53] of Vivienda
       (id oAuto53)
       (precio 2126)
       (habitaciones 2)
       (superficie 92)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas no)
       (terraza no)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1963)
       (coordX 220)
       (coordY 468)
   )

   ([CasaAuto54] of ViviendaVertical
       (id oAuto54)
       (precio 777)
       (habitaciones 4)
       (superficie 65)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas yes)
       (terraza yes)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 2024)
       (coordX 2467)
       (coordY 2544)
       (planta 7)
       (atico yes)
   )

   ([CasaAuto55] of Vivienda
       (id oAuto55)
       (precio 1370)
       (habitaciones 2)
       (superficie 131)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas no)
       (terraza yes)
       (balcon no)
       (soleado no)
       (fechaEdificacion 1968)
       (coordX 564)
       (coordY 1271)
   )

   ([CasaAuto56] of Duplex
       (id oAuto56)
       (precio 1225)
       (habitaciones 4)
       (superficie 61)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas yes)
       (terraza no)
       (balcon no)
       (soleado no)
       (fechaEdificacion 1969)
       (coordX 1996)
       (coordY 915)
       (planta 7)
       (numPlantas 3)
   )

   ([CasaAuto57] of Vivienda
       (id oAuto57)
       (precio 1927)
       (habitaciones 4)
       (superficie 58)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas yes)
       (terraza yes)
       (balcon no)
       (soleado no)
       (fechaEdificacion 1970)
       (coordX 2069)
       (coordY 1554)
   )

   ([CasaAuto58] of ViviendaVertical
       (id oAuto58)
       (precio 524)
       (habitaciones 3)
       (superficie 89)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas no)
       (terraza no)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 1978)
       (coordX 889)
       (coordY 946)
       (planta 11)
       (atico yes)
   )

   ([CasaAuto59] of Vivienda
       (id oAuto59)
       (precio 1295)
       (habitaciones 2)
       (superficie 60)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas no)
       (terraza no)
       (balcon no)
       (soleado no)
       (fechaEdificacion 2003)
       (coordX 21)
       (coordY 3464)
   )

   ([CasaAuto60] of ViviendaVertical
       (id oAuto60)
       (precio 689)
       (habitaciones 4)
       (superficie 74)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje no)
       (buenas_vistas yes)
       (terraza yes)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 2017)
       (coordX 3374)
       (coordY 2335)
       (planta 1)
       (atico yes)
   )

   ([CasaAuto61] of ViviendaVertical
       (id oAuto61)
       (precio 927)
       (habitaciones 3)
       (superficie 105)
       (ascensor no)
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
       (fechaEdificacion 2003)
       (coordX 1768)
       (coordY 2036)
       (planta 4)
       (atico no)
   )

   ([CasaAuto62] of Vivienda
       (id oAuto62)
       (precio 530)
       (habitaciones 4)
       (superficie 102)
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
       (fechaEdificacion 2019)
       (coordX 1586)
       (coordY 2148)
   )

   ([CasaAuto63] of Vivienda
       (id oAuto63)
       (precio 788)
       (habitaciones 5)
       (superficie 60)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas yes)
       (terraza yes)
       (balcon no)
       (soleado no)
       (fechaEdificacion 1985)
       (coordX 2171)
       (coordY 3020)
   )

   ([CasaAuto64] of Vivienda
       (id oAuto64)
       (precio 1185)
       (habitaciones 5)
       (superficie 48)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje no)
       (buenas_vistas yes)
       (terraza no)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1998)
       (coordX 3305)
       (coordY 3342)
   )

   ([CasaAuto65] of Vivienda
       (id oAuto65)
       (precio 548)
       (habitaciones 4)
       (superficie 148)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje no)
       (buenas_vistas yes)
       (terraza yes)
       (balcon no)
       (soleado no)
       (fechaEdificacion 1975)
       (coordX 1522)
       (coordY 51)
   )

   ([CasaAuto66] of Vivienda
       (id oAuto66)
       (precio 1051)
       (habitaciones 4)
       (superficie 49)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas yes)
       (terraza no)
       (balcon no)
       (soleado no)
       (fechaEdificacion 1979)
       (coordX 928)
       (coordY 1576)
   )

   ([CasaAuto67] of ViviendaVertical
       (id oAuto67)
       (precio 1307)
       (habitaciones 3)
       (superficie 100)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas yes)
       (terraza yes)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 1967)
       (coordX 1637)
       (coordY 978)
       (planta 2)
       (atico no)
   )

   ([CasaAuto68] of ViviendaVertical
       (id oAuto68)
       (precio 1950)
       (habitaciones 1)
       (superficie 148)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje no)
       (buenas_vistas yes)
       (terraza no)
       (balcon no)
       (soleado no)
       (fechaEdificacion 1994)
       (coordX 1655)
       (coordY 600)
       (planta 8)
       (atico yes)
   )

   ([CasaAuto69] of ViviendaVertical
       (id oAuto69)
       (precio 1283)
       (habitaciones 3)
       (superficie 74)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas yes)
       (terraza yes)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1978)
       (coordX 3606)
       (coordY 205)
       (planta 8)
       (atico yes)
   )

   ([CasaAuto70] of Vivienda
       (id oAuto70)
       (precio 833)
       (habitaciones 5)
       (superficie 98)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje no)
       (buenas_vistas yes)
       (terraza no)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1964)
       (coordX 3517)
       (coordY 3645)
   )

   ([CasaAuto71] of ViviendaVertical
       (id oAuto71)
       (precio 1246)
       (habitaciones 5)
       (superficie 139)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje no)
       (buenas_vistas no)
       (terraza no)
       (balcon no)
       (soleado no)
       (fechaEdificacion 1989)
       (coordX 142)
       (coordY 2935)
       (planta 8)
       (atico no)
   )

   ([CasaAuto72] of Vivienda
       (id oAuto72)
       (precio 544)
       (habitaciones 2)
       (superficie 88)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas yes)
       (terraza no)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 1979)
       (coordX 2020)
       (coordY 3080)
   )

   ([CasaAuto73] of ViviendaVertical
       (id oAuto73)
       (precio 2080)
       (habitaciones 2)
       (superficie 146)
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
       (soleado no)
       (fechaEdificacion 2008)
       (coordX 3858)
       (coordY 3838)
       (planta 9)
       (atico no)
   )

   ([CasaAuto74] of ViviendaVertical
       (id oAuto74)
       (precio 2175)
       (habitaciones 3)
       (superficie 30)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje no)
       (buenas_vistas no)
       (terraza no)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 2010)
       (coordX 322)
       (coordY 815)
       (planta 9)
       (atico no)
   )

   ([CasaAuto75] of ViviendaVertical
       (id oAuto75)
       (precio 1486)
       (habitaciones 2)
       (superficie 88)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas no)
       (terraza no)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 2001)
       (coordX 2201)
       (coordY 1132)
       (planta 1)
       (atico yes)
   )

   ([CasaAuto76] of Vivienda
       (id oAuto76)
       (precio 1391)
       (habitaciones 4)
       (superficie 114)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas no)
       (terraza yes)
       (balcon no)
       (soleado no)
       (fechaEdificacion 1980)
       (coordX 3944)
       (coordY 2509)
   )

   ([CasaAuto77] of ViviendaVertical
       (id oAuto77)
       (precio 2071)
       (habitaciones 2)
       (superficie 140)
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
       (soleado yes)
       (fechaEdificacion 1988)
       (coordX 135)
       (coordY 3414)
       (planta 10)
       (atico yes)
   )

   ([CasaAuto78] of ViviendaVertical
       (id oAuto78)
       (precio 2193)
       (habitaciones 1)
       (superficie 42)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas no)
       (terraza no)
       (balcon no)
       (soleado no)
       (fechaEdificacion 1960)
       (coordX 317)
       (coordY 2106)
       (planta 1)
       (atico yes)
   )

   ([CasaAuto79] of Duplex
       (id oAuto79)
       (precio 553)
       (habitaciones 1)
       (superficie 112)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas no)
       (terraza no)
       (balcon no)
       (soleado no)
       (fechaEdificacion 1991)
       (coordX 156)
       (coordY 1583)
       (planta 9)
       (numPlantas 3)
   )

   ([CasaAuto80] of Vivienda
       (id oAuto80)
       (precio 1915)
       (habitaciones 1)
       (superficie 98)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas yes)
       (terraza yes)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 1964)
       (coordX 1707)
       (coordY 1061)
   )

   ([CasaAuto81] of Vivienda
       (id oAuto81)
       (precio 1286)
       (habitaciones 1)
       (superficie 148)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas yes)
       (terraza yes)
       (balcon no)
       (soleado no)
       (fechaEdificacion 1998)
       (coordX 2126)
       (coordY 3040)
   )

   ([CasaAuto82] of Vivienda
       (id oAuto82)
       (precio 1897)
       (habitaciones 5)
       (superficie 126)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas yes)
       (terraza no)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 2014)
       (coordX 1167)
       (coordY 1436)
   )

   ([CasaAuto83] of Vivienda
       (id oAuto83)
       (precio 517)
       (habitaciones 2)
       (superficie 53)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas yes)
       (terraza no)
       (balcon no)
       (soleado no)
       (fechaEdificacion 2011)
       (coordX 950)
       (coordY 1016)
   )

   ([CasaAuto84] of ViviendaVertical
       (id oAuto84)
       (precio 1922)
       (habitaciones 1)
       (superficie 90)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas no)
       (terraza no)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 1986)
       (coordX 2122)
       (coordY 882)
       (planta 10)
       (atico no)
   )

   ([CasaAuto85] of Vivienda
       (id oAuto85)
       (precio 2111)
       (habitaciones 3)
       (superficie 67)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas no)
       (terraza no)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 2006)
       (coordX 25)
       (coordY 302)
   )

   ([CasaAuto86] of ViviendaVertical
       (id oAuto86)
       (precio 1585)
       (habitaciones 2)
       (superficie 100)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas no)
       (terraza no)
       (balcon no)
       (soleado no)
       (fechaEdificacion 1979)
       (coordX 652)
       (coordY 79)
       (planta 3)
       (atico yes)
   )

   ([CasaAuto87] of Vivienda
       (id oAuto87)
       (precio 851)
       (habitaciones 5)
       (superficie 85)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje no)
       (buenas_vistas no)
       (terraza no)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 2023)
       (coordX 172)
       (coordY 3662)
   )

   ([CasaAuto88] of ViviendaVertical
       (id oAuto88)
       (precio 963)
       (habitaciones 2)
       (superficie 147)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas no)
       (terraza yes)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1981)
       (coordX 2208)
       (coordY 1453)
       (planta 7)
       (atico yes)
   )

   ([CasaAuto89] of Vivienda
       (id oAuto89)
       (precio 1891)
       (habitaciones 5)
       (superficie 70)
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
       (fechaEdificacion 1987)
       (coordX 1277)
       (coordY 3472)
   )

   ([CasaAuto90] of ViviendaVertical
       (id oAuto90)
       (precio 749)
       (habitaciones 1)
       (superficie 93)
       (ascensor no)
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
       (fechaEdificacion 2014)
       (coordX 3785)
       (coordY 291)
       (planta 9)
       (atico yes)
   )

   ([CasaAuto91] of Vivienda
       (id oAuto91)
       (precio 1675)
       (habitaciones 1)
       (superficie 74)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje no)
       (buenas_vistas no)
       (terraza no)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 2007)
       (coordX 3841)
       (coordY 1554)
   )

   ([CasaAuto92] of ViviendaVertical
       (id oAuto92)
       (precio 1303)
       (habitaciones 1)
       (superficie 68)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas no)
       (terraza no)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1978)
       (coordX 584)
       (coordY 2887)
       (planta 9)
       (atico yes)
   )

   ([CasaAuto93] of Vivienda
       (id oAuto93)
       (precio 2156)
       (habitaciones 2)
       (superficie 141)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje no)
       (buenas_vistas no)
       (terraza yes)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 2017)
       (coordX 309)
       (coordY 2134)
   )

   ([CasaAuto94] of ViviendaVertical
       (id oAuto94)
       (precio 1053)
       (habitaciones 4)
       (superficie 137)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas no)
       (terraza yes)
       (balcon no)
       (soleado no)
       (fechaEdificacion 2011)
       (coordX 959)
       (coordY 3081)
       (planta 1)
       (atico yes)
   )

   ([CasaAuto95] of Vivienda
       (id oAuto95)
       (precio 955)
       (habitaciones 1)
       (superficie 114)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje no)
       (buenas_vistas no)
       (terraza yes)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1984)
       (coordX 918)
       (coordY 1159)
   )

   ([CasaAuto96] of Vivienda
       (id oAuto96)
       (precio 588)
       (habitaciones 1)
       (superficie 112)
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
       (soleado no)
       (fechaEdificacion 1967)
       (coordX 1394)
       (coordY 1547)
   )

   ([CasaAuto97] of Duplex
       (id oAuto97)
       (precio 2465)
       (habitaciones 4)
       (superficie 72)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas no)
       (terraza yes)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1996)
       (coordX 1821)
       (coordY 3136)
       (planta 12)
       (numPlantas 2)
   )

   ([CasaAuto98] of Vivienda
       (id oAuto98)
       (precio 1617)
       (habitaciones 5)
       (superficie 68)
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
       (fechaEdificacion 2019)
       (coordX 2870)
       (coordY 2613)
   )

   ([CasaAuto99] of Vivienda
       (id oAuto99)
       (precio 1044)
       (habitaciones 2)
       (superficie 104)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje no)
       (buenas_vistas no)
       (terraza no)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 2017)
       (coordX 3797)
       (coordY 706)
   )

   ([CasaAuto100] of Vivienda
       (id oAuto100)
       (precio 1047)
       (habitaciones 2)
       (superficie 34)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas no)
       (terraza yes)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 2000)
       (coordX 2202)
       (coordY 549)
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