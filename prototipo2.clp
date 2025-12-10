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
   (is-a ViviendaVertical)
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
       (precio 1835)
       (habitaciones 4)
       (superficie 30)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas no)
       (terraza yes)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 2006)
       (coordX 83)
       (coordY 929)
   )

   ([CasaAuto2] of Vivienda
       (id oAuto2)
       (precio 1884)
       (habitaciones 3)
       (superficie 38)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas no)
       (terraza yes)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 1973)
       (coordX 764)
       (coordY 254)
   )

   ([CasaAuto3] of ViviendaVertical
       (id oAuto3)
       (precio 2031)
       (habitaciones 5)
       (superficie 145)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas yes)
       (terraza yes)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1975)
       (coordX 1793)
       (coordY 442)
       (planta 11)
       (atico no)
   )

   ([CasaAuto4] of ViviendaVertical
       (id oAuto4)
       (precio 744)
       (habitaciones 5)
       (superficie 60)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas no)
       (terraza no)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 1969)
       (coordX 68)
       (coordY 213)
       (planta 11)
       (atico no)
   )

   ([CasaAuto5] of Vivienda
       (id oAuto5)
       (precio 1069)
       (habitaciones 5)
       (superficie 88)
       (ascensor yes)
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
       (fechaEdificacion 1971)
       (coordX 1249)
       (coordY 556)
   )

   ([CasaAuto6] of ViviendaVertical
       (id oAuto6)
       (precio 1269)
       (habitaciones 1)
       (superficie 135)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje no)
       (buenas_vistas no)
       (terraza yes)
       (balcon no)
       (soleado no)
       (fechaEdificacion 2008)
       (coordX 409)
       (coordY 430)
       (planta 7)
       (atico no)
   )

   ([CasaAuto7] of Vivienda
       (id oAuto7)
       (precio 1421)
       (habitaciones 4)
       (superficie 132)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje no)
       (buenas_vistas no)
       (terraza yes)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 1981)
       (coordX 209)
       (coordY 801)
   )

   ([CasaAuto8] of ViviendaVertical
       (id oAuto8)
       (precio 1909)
       (habitaciones 4)
       (superficie 108)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas yes)
       (terraza no)
       (balcon no)
       (soleado no)
       (fechaEdificacion 2023)
       (coordX 881)
       (coordY 1792)
       (planta 5)
       (atico yes)
   )

   ([CasaAuto9] of Vivienda
       (id oAuto9)
       (precio 1050)
       (habitaciones 4)
       (superficie 97)
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
       (soleado yes)
       (fechaEdificacion 1998)
       (coordX 854)
       (coordY 944)
   )

   ([CasaAuto10] of Vivienda
       (id oAuto10)
       (precio 2471)
       (habitaciones 1)
       (superficie 71)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas yes)
       (terraza no)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 1989)
       (coordX 894)
       (coordY 1463)
   )

   ([CasaAuto11] of Vivienda
       (id oAuto11)
       (precio 1862)
       (habitaciones 4)
       (superficie 103)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje no)
       (buenas_vistas no)
       (terraza no)
       (balcon no)
       (soleado no)
       (fechaEdificacion 1983)
       (coordX 583)
       (coordY 1240)
   )

   ([CasaAuto12] of Vivienda
       (id oAuto12)
       (precio 823)
       (habitaciones 2)
       (superficie 149)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas no)
       (terraza yes)
       (balcon no)
       (soleado no)
       (fechaEdificacion 1997)
       (coordX 825)
       (coordY 1682)
   )

   ([CasaAuto13] of Vivienda
       (id oAuto13)
       (precio 1659)
       (habitaciones 4)
       (superficie 124)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas no)
       (terraza yes)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1996)
       (coordX 289)
       (coordY 1041)
   )

   ([CasaAuto14] of Vivienda
       (id oAuto14)
       (precio 1282)
       (habitaciones 2)
       (superficie 75)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas yes)
       (terraza yes)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 2020)
       (coordX 1676)
       (coordY 23)
   )

   ([CasaAuto15] of Duplex
       (id oAuto15)
       (precio 804)
       (habitaciones 3)
       (superficie 148)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas yes)
       (terraza yes)
       (balcon no)
       (soleado no)
       (fechaEdificacion 2020)
       (coordX 1483)
       (coordY 644)
       (planta 11)
       (numPlantas 2)
   )

   ([CasaAuto16] of ViviendaVertical
       (id oAuto16)
       (precio 925)
       (habitaciones 4)
       (superficie 43)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas yes)
       (terraza yes)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 2016)
       (coordX 1328)
       (coordY 1554)
       (planta 4)
       (atico no)
   )

   ([CasaAuto17] of Vivienda
       (id oAuto17)
       (precio 1693)
       (habitaciones 2)
       (superficie 143)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas yes)
       (terraza yes)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 2018)
       (coordX 1642)
       (coordY 852)
   )

   ([CasaAuto18] of Vivienda
       (id oAuto18)
       (precio 648)
       (habitaciones 3)
       (superficie 32)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas yes)
       (terraza no)
       (balcon no)
       (soleado no)
       (fechaEdificacion 2023)
       (coordX 1331)
       (coordY 1479)
   )

   ([CasaAuto19] of Vivienda
       (id oAuto19)
       (precio 1265)
       (habitaciones 3)
       (superficie 55)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas no)
       (terraza yes)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 2001)
       (coordX 1041)
       (coordY 1485)
   )

   ([CasaAuto20] of Duplex
       (id oAuto20)
       (precio 1296)
       (habitaciones 2)
       (superficie 68)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas yes)
       (terraza yes)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1994)
       (coordX 115)
       (coordY 1873)
       (planta 9)
       (numPlantas 2)
   )

   ([CasaAuto21] of Vivienda
       (id oAuto21)
       (precio 2078)
       (habitaciones 2)
       (superficie 94)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas yes)
       (terraza no)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 1968)
       (coordX 1379)
       (coordY 633)
   )

   ([CasaAuto22] of ViviendaVertical
       (id oAuto22)
       (precio 598)
       (habitaciones 1)
       (superficie 147)
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
       (fechaEdificacion 1980)
       (coordX 1885)
       (coordY 1231)
       (planta 8)
       (atico yes)
   )

   ([CasaAuto23] of Vivienda
       (id oAuto23)
       (precio 2314)
       (habitaciones 3)
       (superficie 65)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas no)
       (terraza yes)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 1991)
       (coordX 1361)
       (coordY 1575)
   )

   ([CasaAuto24] of ViviendaVertical
       (id oAuto24)
       (precio 2176)
       (habitaciones 2)
       (superficie 78)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje no)
       (buenas_vistas yes)
       (terraza no)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1999)
       (coordX 1501)
       (coordY 1346)
       (planta 1)
       (atico yes)
   )

   ([CasaAuto25] of Vivienda
       (id oAuto25)
       (precio 1642)
       (habitaciones 2)
       (superficie 35)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas no)
       (terraza yes)
       (balcon no)
       (soleado no)
       (fechaEdificacion 2016)
       (coordX 1653)
       (coordY 1256)
   )

   ([CasaAuto26] of Vivienda
       (id oAuto26)
       (precio 1704)
       (habitaciones 1)
       (superficie 102)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje no)
       (buenas_vistas yes)
       (terraza no)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 2010)
       (coordX 1398)
       (coordY 194)
   )

   ([CasaAuto27] of Vivienda
       (id oAuto27)
       (precio 2198)
       (habitaciones 5)
       (superficie 77)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas yes)
       (terraza yes)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 2022)
       (coordX 1683)
       (coordY 1055)
   )

   ([CasaAuto28] of Vivienda
       (id oAuto28)
       (precio 1180)
       (habitaciones 1)
       (superficie 107)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas yes)
       (terraza no)
       (balcon no)
       (soleado no)
       (fechaEdificacion 1978)
       (coordX 1793)
       (coordY 1820)
   )

   ([CasaAuto29] of Vivienda
       (id oAuto29)
       (precio 1039)
       (habitaciones 4)
       (superficie 127)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas no)
       (terraza no)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 2007)
       (coordX 1422)
       (coordY 602)
   )

   ([CasaAuto30] of Vivienda
       (id oAuto30)
       (precio 508)
       (habitaciones 3)
       (superficie 44)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas no)
       (terraza yes)
       (balcon no)
       (soleado no)
       (fechaEdificacion 1978)
       (coordX 1870)
       (coordY 1462)
   )

   ([CasaAuto31] of ViviendaVertical
       (id oAuto31)
       (precio 717)
       (habitaciones 1)
       (superficie 115)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje no)
       (buenas_vistas yes)
       (terraza no)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 2001)
       (coordX 1654)
       (coordY 304)
       (planta 6)
       (atico no)
   )

   ([CasaAuto32] of Duplex
       (id oAuto32)
       (precio 2343)
       (habitaciones 2)
       (superficie 116)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje no)
       (buenas_vistas no)
       (terraza yes)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 1990)
       (coordX 1943)
       (coordY 1972)
       (planta 5)
       (numPlantas 2)
   )

   ([CasaAuto33] of ViviendaVertical
       (id oAuto33)
       (precio 2078)
       (habitaciones 5)
       (superficie 123)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas no)
       (terraza yes)
       (balcon no)
       (soleado no)
       (fechaEdificacion 1966)
       (coordX 1851)
       (coordY 1178)
       (planta 9)
       (atico yes)
   )

   ([CasaAuto34] of Duplex
       (id oAuto34)
       (precio 598)
       (habitaciones 1)
       (superficie 68)
       (ascensor yes)
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
       (fechaEdificacion 2010)
       (coordX 319)
       (coordY 857)
       (planta 7)
       (numPlantas 3)
   )

   ([CasaAuto35] of Vivienda
       (id oAuto35)
       (precio 949)
       (habitaciones 4)
       (superficie 82)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas no)
       (terraza yes)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 2014)
       (coordX 1645)
       (coordY 332)
   )

   ([CasaAuto36] of Duplex
       (id oAuto36)
       (precio 2030)
       (habitaciones 3)
       (superficie 128)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas yes)
       (terraza no)
       (balcon no)
       (soleado no)
       (fechaEdificacion 1966)
       (coordX 1621)
       (coordY 213)
       (planta 4)
       (numPlantas 2)
   )

   ([CasaAuto37] of Vivienda
       (id oAuto37)
       (precio 537)
       (habitaciones 4)
       (superficie 72)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas no)
       (terraza yes)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 1967)
       (coordX 1844)
       (coordY 75)
   )

   ([CasaAuto38] of ViviendaVertical
       (id oAuto38)
       (precio 2101)
       (habitaciones 3)
       (superficie 125)
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
       (fechaEdificacion 1975)
       (coordX 1443)
       (coordY 942)
       (planta 1)
       (atico yes)
   )

   ([CasaAuto39] of Vivienda
       (id oAuto39)
       (precio 1808)
       (habitaciones 4)
       (superficie 75)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas no)
       (terraza no)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 2019)
       (coordX 108)
       (coordY 926)
   )

   ([CasaAuto40] of Duplex
       (id oAuto40)
       (precio 2106)
       (habitaciones 4)
       (superficie 109)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas no)
       (terraza yes)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 1983)
       (coordX 1831)
       (coordY 174)
       (planta 12)
       (numPlantas 3)
   )

   ([CasaAuto41] of ViviendaVertical
       (id oAuto41)
       (precio 1640)
       (habitaciones 4)
       (superficie 106)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje no)
       (buenas_vistas yes)
       (terraza no)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 1976)
       (coordX 1439)
       (coordY 1004)
       (planta 6)
       (atico no)
   )

   ([CasaAuto42] of ViviendaVertical
       (id oAuto42)
       (precio 2443)
       (habitaciones 1)
       (superficie 130)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje no)
       (buenas_vistas no)
       (terraza no)
       (balcon no)
       (soleado no)
       (fechaEdificacion 2020)
       (coordX 190)
       (coordY 1102)
       (planta 8)
       (atico yes)
   )

   ([CasaAuto43] of Vivienda
       (id oAuto43)
       (precio 1136)
       (habitaciones 5)
       (superficie 47)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas no)
       (terraza yes)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 1982)
       (coordX 1210)
       (coordY 1888)
   )

   ([CasaAuto44] of ViviendaVertical
       (id oAuto44)
       (precio 1041)
       (habitaciones 5)
       (superficie 58)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas yes)
       (terraza yes)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 1986)
       (coordX 1459)
       (coordY 687)
       (planta 7)
       (atico yes)
   )

   ([CasaAuto45] of Duplex
       (id oAuto45)
       (precio 1609)
       (habitaciones 2)
       (superficie 83)
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
       (fechaEdificacion 1979)
       (coordX 1888)
       (coordY 140)
       (planta 8)
       (numPlantas 2)
   )

   ([CasaAuto46] of Vivienda
       (id oAuto46)
       (precio 1016)
       (habitaciones 5)
       (superficie 104)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas yes)
       (terraza yes)
       (balcon no)
       (soleado no)
       (fechaEdificacion 2013)
       (coordX 1490)
       (coordY 904)
   )

   ([CasaAuto47] of Vivienda
       (id oAuto47)
       (precio 2268)
       (habitaciones 3)
       (superficie 66)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas no)
       (terraza no)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 2020)
       (coordX 1008)
       (coordY 1311)
   )

   ([CasaAuto48] of Vivienda
       (id oAuto48)
       (precio 598)
       (habitaciones 5)
       (superficie 133)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas yes)
       (terraza yes)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 2005)
       (coordX 1228)
       (coordY 518)
   )

   ([CasaAuto49] of ViviendaVertical
       (id oAuto49)
       (precio 2466)
       (habitaciones 3)
       (superficie 123)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas no)
       (terraza no)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 1977)
       (coordX 802)
       (coordY 1182)
       (planta 11)
       (atico yes)
   )

   ([CasaAuto50] of Vivienda
       (id oAuto50)
       (precio 1302)
       (habitaciones 3)
       (superficie 145)
       (ascensor no)
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
       (fechaEdificacion 2006)
       (coordX 949)
       (coordY 256)
   )

   ([CasaAuto51] of ViviendaVertical
       (id oAuto51)
       (precio 2051)
       (habitaciones 2)
       (superficie 81)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas yes)
       (terraza yes)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 1975)
       (coordX 1215)
       (coordY 509)
       (planta 2)
       (atico yes)
   )

   ([CasaAuto52] of ViviendaVertical
       (id oAuto52)
       (precio 1837)
       (habitaciones 1)
       (superficie 49)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas yes)
       (terraza yes)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 1999)
       (coordX 816)
       (coordY 1410)
       (planta 8)
       (atico no)
   )

   ([CasaAuto53] of Vivienda
       (id oAuto53)
       (precio 621)
       (habitaciones 3)
       (superficie 97)
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
       (fechaEdificacion 1983)
       (coordX 642)
       (coordY 732)
   )

   ([CasaAuto54] of ViviendaVertical
       (id oAuto54)
       (precio 622)
       (habitaciones 2)
       (superficie 116)
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
       (fechaEdificacion 2002)
       (coordX 551)
       (coordY 1944)
       (planta 9)
       (atico yes)
   )

   ([CasaAuto55] of ViviendaVertical
       (id oAuto55)
       (precio 2338)
       (habitaciones 3)
       (superficie 133)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas yes)
       (terraza no)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 1981)
       (coordX 1767)
       (coordY 1368)
       (planta 10)
       (atico yes)
   )

   ([CasaAuto56] of Vivienda
       (id oAuto56)
       (precio 2441)
       (habitaciones 3)
       (superficie 30)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas no)
       (terraza yes)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 1997)
       (coordX 1700)
       (coordY 1660)
   )

   ([CasaAuto57] of Duplex
       (id oAuto57)
       (precio 1734)
       (habitaciones 5)
       (superficie 108)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje no)
       (buenas_vistas yes)
       (terraza no)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 1992)
       (coordX 461)
       (coordY 1989)
       (planta 6)
       (numPlantas 3)
   )

   ([CasaAuto58] of ViviendaVertical
       (id oAuto58)
       (precio 515)
       (habitaciones 2)
       (superficie 116)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas no)
       (terraza no)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1984)
       (coordX 1907)
       (coordY 741)
       (planta 10)
       (atico yes)
   )

   ([CasaAuto59] of ViviendaVertical
       (id oAuto59)
       (precio 1880)
       (habitaciones 4)
       (superficie 119)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje no)
       (buenas_vistas yes)
       (terraza yes)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 2002)
       (coordX 1880)
       (coordY 849)
       (planta 3)
       (atico no)
   )

   ([CasaAuto60] of Duplex
       (id oAuto60)
       (precio 1916)
       (habitaciones 3)
       (superficie 112)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas yes)
       (terraza yes)
       (balcon no)
       (soleado no)
       (fechaEdificacion 1993)
       (coordX 7)
       (coordY 1362)
       (planta 3)
       (numPlantas 2)
   )

   ([CasaAuto61] of Vivienda
       (id oAuto61)
       (precio 1635)
       (habitaciones 2)
       (superficie 49)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas yes)
       (terraza no)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1984)
       (coordX 1756)
       (coordY 1399)
   )

   ([CasaAuto62] of ViviendaVertical
       (id oAuto62)
       (precio 2304)
       (habitaciones 1)
       (superficie 56)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje no)
       (buenas_vistas no)
       (terraza no)
       (balcon no)
       (soleado no)
       (fechaEdificacion 2023)
       (coordX 11)
       (coordY 1324)
       (planta 11)
       (atico no)
   )

   ([CasaAuto63] of Duplex
       (id oAuto63)
       (precio 687)
       (habitaciones 4)
       (superficie 114)
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
       (soleado yes)
       (fechaEdificacion 2001)
       (coordX 1416)
       (coordY 1605)
       (planta 5)
       (numPlantas 2)
   )

   ([CasaAuto64] of ViviendaVertical
       (id oAuto64)
       (precio 1185)
       (habitaciones 4)
       (superficie 30)
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
       (soleado no)
       (fechaEdificacion 2000)
       (coordX 1274)
       (coordY 747)
       (planta 8)
       (atico no)
   )

   ([CasaAuto65] of Vivienda
       (id oAuto65)
       (precio 2423)
       (habitaciones 4)
       (superficie 116)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas yes)
       (terraza no)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 2010)
       (coordX 144)
       (coordY 1357)
   )

   ([CasaAuto66] of Duplex
       (id oAuto66)
       (precio 1706)
       (habitaciones 3)
       (superficie 50)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas yes)
       (terraza yes)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1997)
       (coordX 325)
       (coordY 1279)
       (planta 5)
       (numPlantas 3)
   )

   ([CasaAuto67] of Vivienda
       (id oAuto67)
       (precio 539)
       (habitaciones 1)
       (superficie 84)
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
       (fechaEdificacion 2022)
       (coordX 1807)
       (coordY 1361)
   )

   ([CasaAuto68] of ViviendaVertical
       (id oAuto68)
       (precio 1598)
       (habitaciones 1)
       (superficie 70)
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
       (fechaEdificacion 2015)
       (coordX 27)
       (coordY 212)
       (planta 10)
       (atico yes)
   )

   ([CasaAuto69] of ViviendaVertical
       (id oAuto69)
       (precio 2035)
       (habitaciones 1)
       (superficie 36)
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
       (fechaEdificacion 1963)
       (coordX 1471)
       (coordY 1160)
       (planta 7)
       (atico no)
   )

   ([CasaAuto70] of Vivienda
       (id oAuto70)
       (precio 1915)
       (habitaciones 3)
       (superficie 65)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje no)
       (buenas_vistas yes)
       (terraza yes)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 1969)
       (coordX 1444)
       (coordY 27)
   )

   ([CasaAuto71] of Vivienda
       (id oAuto71)
       (precio 1962)
       (habitaciones 5)
       (superficie 76)
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
       (soleado yes)
       (fechaEdificacion 1976)
       (coordX 903)
       (coordY 940)
   )

   ([CasaAuto72] of ViviendaVertical
       (id oAuto72)
       (precio 1450)
       (habitaciones 2)
       (superficie 146)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje no)
       (buenas_vistas no)
       (terraza yes)
       (balcon no)
       (soleado no)
       (fechaEdificacion 1998)
       (coordX 1610)
       (coordY 1802)
       (planta 9)
       (atico yes)
   )

   ([CasaAuto73] of ViviendaVertical
       (id oAuto73)
       (precio 2461)
       (habitaciones 1)
       (superficie 130)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas yes)
       (terraza yes)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 2006)
       (coordX 1921)
       (coordY 421)
       (planta 9)
       (atico yes)
   )

   ([CasaAuto74] of Duplex
       (id oAuto74)
       (precio 754)
       (habitaciones 3)
       (superficie 55)
       (ascensor yes)
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
       (fechaEdificacion 1985)
       (coordX 1737)
       (coordY 268)
       (planta 8)
       (numPlantas 2)
   )

   ([CasaAuto75] of ViviendaVertical
       (id oAuto75)
       (precio 1030)
       (habitaciones 5)
       (superficie 147)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje no)
       (buenas_vistas yes)
       (terraza yes)
       (balcon no)
       (soleado no)
       (fechaEdificacion 1997)
       (coordX 807)
       (coordY 1517)
       (planta 8)
       (atico yes)
   )

   ([CasaAuto76] of Vivienda
       (id oAuto76)
       (precio 1113)
       (habitaciones 4)
       (superficie 98)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas no)
       (terraza yes)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 1973)
       (coordX 1157)
       (coordY 1663)
   )

   ([CasaAuto77] of Vivienda
       (id oAuto77)
       (precio 803)
       (habitaciones 1)
       (superficie 137)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas yes)
       (terraza no)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 2009)
       (coordX 1617)
       (coordY 507)
   )

   ([CasaAuto78] of ViviendaVertical
       (id oAuto78)
       (precio 1169)
       (habitaciones 1)
       (superficie 63)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas no)
       (terraza yes)
       (balcon no)
       (soleado no)
       (fechaEdificacion 1988)
       (coordX 1415)
       (coordY 1154)
       (planta 8)
       (atico no)
   )

   ([CasaAuto79] of ViviendaVertical
       (id oAuto79)
       (precio 666)
       (habitaciones 3)
       (superficie 72)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas no)
       (terraza no)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 2012)
       (coordX 813)
       (coordY 1222)
       (planta 8)
       (atico no)
   )

   ([CasaAuto80] of ViviendaVertical
       (id oAuto80)
       (precio 624)
       (habitaciones 4)
       (superficie 116)
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
       (soleado no)
       (fechaEdificacion 1982)
       (coordX 603)
       (coordY 1279)
       (planta 10)
       (atico no)
   )

   ([CasaAuto81] of Vivienda
       (id oAuto81)
       (precio 846)
       (habitaciones 5)
       (superficie 94)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas yes)
       (terraza no)
       (balcon no)
       (soleado no)
       (fechaEdificacion 1988)
       (coordX 612)
       (coordY 596)
   )

   ([CasaAuto82] of Vivienda
       (id oAuto82)
       (precio 2031)
       (habitaciones 5)
       (superficie 133)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje no)
       (buenas_vistas no)
       (terraza no)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 2019)
       (coordX 331)
       (coordY 1146)
   )

   ([CasaAuto83] of Vivienda
       (id oAuto83)
       (precio 1045)
       (habitaciones 4)
       (superficie 147)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas no)
       (terraza yes)
       (balcon no)
       (soleado no)
       (fechaEdificacion 1968)
       (coordX 503)
       (coordY 523)
   )

   ([CasaAuto84] of ViviendaVertical
       (id oAuto84)
       (precio 2255)
       (habitaciones 4)
       (superficie 108)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas no)
       (terraza yes)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 2006)
       (coordX 204)
       (coordY 1340)
       (planta 9)
       (atico no)
   )

   ([CasaAuto85] of ViviendaVertical
       (id oAuto85)
       (precio 1429)
       (habitaciones 1)
       (superficie 116)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas yes)
       (terraza no)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 1979)
       (coordX 1903)
       (coordY 1712)
       (planta 12)
       (atico no)
   )

   ([CasaAuto86] of ViviendaVertical
       (id oAuto86)
       (precio 1832)
       (habitaciones 2)
       (superficie 112)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas yes)
       (terraza yes)
       (balcon no)
       (soleado no)
       (fechaEdificacion 1996)
       (coordX 144)
       (coordY 430)
       (planta 2)
       (atico no)
   )

   ([CasaAuto87] of Vivienda
       (id oAuto87)
       (precio 2463)
       (habitaciones 2)
       (superficie 127)
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
       (soleado no)
       (fechaEdificacion 1991)
       (coordX 212)
       (coordY 947)
   )

   ([CasaAuto88] of Duplex
       (id oAuto88)
       (precio 2431)
       (habitaciones 2)
       (superficie 89)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje no)
       (buenas_vistas no)
       (terraza yes)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 2023)
       (coordX 1751)
       (coordY 1319)
       (planta 9)
       (numPlantas 2)
   )

   ([CasaAuto89] of ViviendaVertical
       (id oAuto89)
       (precio 1709)
       (habitaciones 5)
       (superficie 138)
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
       (soleado yes)
       (fechaEdificacion 1973)
       (coordX 640)
       (coordY 1496)
       (planta 1)
       (atico no)
   )

   ([CasaAuto90] of ViviendaVertical
       (id oAuto90)
       (precio 731)
       (habitaciones 3)
       (superficie 120)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas yes)
       (terraza yes)
       (balcon no)
       (soleado no)
       (fechaEdificacion 1973)
       (coordX 127)
       (coordY 296)
       (planta 5)
       (atico yes)
   )

   ([CasaAuto91] of Vivienda
       (id oAuto91)
       (precio 629)
       (habitaciones 5)
       (superficie 125)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas no)
       (terraza yes)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 1997)
       (coordX 126)
       (coordY 1542)
   )

   ([CasaAuto92] of ViviendaVertical
       (id oAuto92)
       (precio 1607)
       (habitaciones 5)
       (superficie 137)
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
       (fechaEdificacion 1973)
       (coordX 1873)
       (coordY 38)
       (planta 3)
       (atico yes)
   )

   ([CasaAuto93] of Vivienda
       (id oAuto93)
       (precio 2117)
       (habitaciones 3)
       (superficie 48)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas no)
       (terraza yes)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 1969)
       (coordX 810)
       (coordY 545)
   )

   ([CasaAuto94] of Vivienda
       (id oAuto94)
       (precio 2367)
       (habitaciones 3)
       (superficie 51)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas no)
       (terraza yes)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 2011)
       (coordX 554)
       (coordY 1909)
   )

   ([CasaAuto95] of ViviendaVertical
       (id oAuto95)
       (precio 1614)
       (habitaciones 1)
       (superficie 143)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas yes)
       (terraza yes)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 2019)
       (coordX 345)
       (coordY 1582)
       (planta 12)
       (atico no)
   )

   ([CasaAuto96] of Vivienda
       (id oAuto96)
       (precio 1824)
       (habitaciones 3)
       (superficie 150)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas no)
       (terraza no)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 2022)
       (coordX 520)
       (coordY 1569)
   )

   ([CasaAuto97] of Vivienda
       (id oAuto97)
       (precio 995)
       (habitaciones 2)
       (superficie 125)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas yes)
       (terraza no)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1980)
       (coordX 1573)
       (coordY 897)
   )

   ([CasaAuto98] of ViviendaVertical
       (id oAuto98)
       (precio 1611)
       (habitaciones 5)
       (superficie 91)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas yes)
       (terraza yes)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 1981)
       (coordX 1606)
       (coordY 32)
       (planta 1)
       (atico yes)
   )

   ([CasaAuto99] of ViviendaVertical
       (id oAuto99)
       (precio 1164)
       (habitaciones 1)
       (superficie 106)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas no)
       (terraza no)
       (balcon no)
       (soleado no)
       (fechaEdificacion 1995)
       (coordX 1349)
       (coordY 816)
       (planta 5)
       (atico no)
   )

   ([CasaAuto100] of ViviendaVertical
       (id oAuto100)
       (precio 2427)
       (habitaciones 4)
       (superficie 53)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje no)
       (buenas_vistas no)
       (terraza yes)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 1989)
       (coordX 729)
       (coordY 904)
       (planta 6)
       (atico no)
   )
   ;; Servicios
   ([Hospital_1] of Servicio
       (tipo hospital) (coordX 1227) (coordY 1967)
   )

   ([Hospital_2] of Servicio
       (tipo hospital) (coordX 1316) (coordY 604)
   )

   ([Hospital_3] of Servicio
       (tipo hospital) (coordX 260) (coordY 1226)
   )

   ([Hospital_4] of Servicio
       (tipo hospital) (coordX 528) (coordY 68)
   )

   ([Hospital_5] of Servicio
       (tipo hospital) (coordX 634) (coordY 240)
   )

   ([Hospital_6] of Servicio
       (tipo hospital) (coordX 1619) (coordY 441)
   )

   ([Hospital_7] of Servicio
       (tipo hospital) (coordX 1822) (coordY 176)
   )

   ([Zonaverde_8] of Servicio
       (tipo zonaVerde) (coordX 1998) (coordY 2)
   )

   ([Zonaverde_9] of Servicio
       (tipo zonaVerde) (coordX 193) (coordY 1865)
   )

   ([Zonaverde_10] of Servicio
       (tipo zonaVerde) (coordX 69) (coordY 447)
   )

   ([Zonaverde_11] of Servicio
       (tipo zonaVerde) (coordX 540) (coordY 754)
   )

   ([Zonaverde_12] of Servicio
       (tipo zonaVerde) (coordX 188) (coordY 15)
   )

   ([Zonaverde_13] of Servicio
       (tipo zonaVerde) (coordX 1768) (coordY 38)
   )

   ([Zonaverde_14] of Servicio
       (tipo zonaVerde) (coordX 1711) (coordY 740)
   )

   ([Zonaverde_15] of Servicio
       (tipo zonaVerde) (coordX 1420) (coordY 464)
   )

   ([Zonaverde_16] of Servicio
       (tipo zonaVerde) (coordX 85) (coordY 1141)
   )

   ([Centro_17] of Servicio
       (tipo centro) (coordX 1397) (coordY 717)
   )

   ([Centro_18] of Servicio
       (tipo centro) (coordX 593) (coordY 247)
   )

   ([Centro_19] of Servicio
       (tipo centro) (coordX 467) (coordY 1834)
   )

   ([Centro_20] of Servicio
       (tipo centro) (coordX 196) (coordY 1636)
   )

   ([Centro_21] of Servicio
       (tipo centro) (coordX 436) (coordY 485)
   )

   ([Centro_22] of Servicio
       (tipo centro) (coordX 744) (coordY 1718)
   )

   ([Centro_23] of Servicio
       (tipo centro) (coordX 236) (coordY 831)
   )

   ([Centro_24] of Servicio
       (tipo centro) (coordX 1771) (coordY 725)
   )

   ([Ocio_nocturno_25] of Servicio
       (tipo ocio_nocturno) (coordX 915) (coordY 77)
   )

   ([Ocio_nocturno_26] of Servicio
       (tipo ocio_nocturno) (coordX 559) (coordY 251)
   )

   ([Ocio_nocturno_27] of Servicio
       (tipo ocio_nocturno) (coordX 1369) (coordY 1126)
   )

   ([Ocio_nocturno_28] of Servicio
       (tipo ocio_nocturno) (coordX 1507) (coordY 284)
   )

   ([Ocio_nocturno_29] of Servicio
       (tipo ocio_nocturno) (coordX 43) (coordY 624)
   )

   ([Ocio_nocturno_30] of Servicio
       (tipo ocio_nocturno) (coordX 1300) (coordY 1698)
   )

   ([Ocio_nocturno_31] of Servicio
       (tipo ocio_nocturno) (coordX 254) (coordY 992)
   )

   ([Ocio_nocturno_32] of Servicio
       (tipo ocio_nocturno) (coordX 155) (coordY 435)
   )

   ([Ocio_nocturno_33] of Servicio
       (tipo ocio_nocturno) (coordX 937) (coordY 148)
   )

   ([Ocio_nocturno_34] of Servicio
       (tipo ocio_nocturno) (coordX 1271) (coordY 186)
   )

   ([Transporte_publico_35] of Servicio
       (tipo transporte_publico) (coordX 388) (coordY 720)
   )

   ([Transporte_publico_36] of Servicio
       (tipo transporte_publico) (coordX 762) (coordY 778)
   )

   ([Transporte_publico_37] of Servicio
       (tipo transporte_publico) (coordX 1780) (coordY 583)
   )

   ([Transporte_publico_38] of Servicio
       (tipo transporte_publico) (coordX 592) (coordY 597)
   )

   ([Transporte_publico_39] of Servicio
       (tipo transporte_publico) (coordX 1671) (coordY 1588)
   )

   ([Transporte_publico_40] of Servicio
       (tipo transporte_publico) (coordX 733) (coordY 1356)
   )

   ([Transporte_publico_41] of Servicio
       (tipo transporte_publico) (coordX 1534) (coordY 1913)
   )

   ([Transporte_publico_42] of Servicio
       (tipo transporte_publico) (coordX 504) (coordY 1614)
   )

   ([Zona_comercial_43] of Servicio
       (tipo zona_comercial) (coordX 101) (coordY 1987)
   )

   ([Zona_comercial_44] of Servicio
       (tipo zona_comercial) (coordX 498) (coordY 1959)
   )

   ([Zona_comercial_45] of Servicio
       (tipo zona_comercial) (coordX 81) (coordY 1483)
   )

   ([Zona_comercial_46] of Servicio
       (tipo zona_comercial) (coordX 372) (coordY 220)
   )

   ([Zona_comercial_47] of Servicio
       (tipo zona_comercial) (coordX 1613) (coordY 1895)
   )

   ([Zona_comercial_48] of Servicio
       (tipo zona_comercial) (coordX 1391) (coordY 1563)
   )

   ([Zona_comercial_49] of Servicio
       (tipo zona_comercial) (coordX 542) (coordY 633)
   )

   ([Zona_comercial_50] of Servicio
       (tipo zona_comercial) (coordX 1303) (coordY 1782)
   )

   ([Zona_comercial_51] of Servicio
       (tipo zona_comercial) (coordX 152) (coordY 43)
   )

   ([Supermercado_52] of Servicio
       (tipo supermercado) (coordX 1657) (coordY 1569)
   )

   ([Supermercado_53] of Servicio
       (tipo supermercado) (coordX 962) (coordY 985)
   )

   ([Supermercado_54] of Servicio
       (tipo supermercado) (coordX 368) (coordY 1572)
   )

   ([Supermercado_55] of Servicio
       (tipo supermercado) (coordX 168) (coordY 1997)
   )

   ([Supermercado_56] of Servicio
       (tipo supermercado) (coordX 1487) (coordY 1917)
   )

   ([Supermercado_57] of Servicio
       (tipo supermercado) (coordX 383) (coordY 425)
   )

   ([Supermercado_58] of Servicio
       (tipo supermercado) (coordX 1872) (coordY 480)
   )

   ([Supermercado_59] of Servicio
       (tipo supermercado) (coordX 1275) (coordY 349)
   )

   ([Supermercado_60] of Servicio
       (tipo supermercado) (coordX 1770) (coordY 510)
   )

   ([Supermercado_61] of Servicio
       (tipo supermercado) (coordX 502) (coordY 1353)
   )

   ([Centro_educativo_62] of Servicio
       (tipo centro_educativo) (coordX 1807) (coordY 1851)
   )

   ([Centro_educativo_63] of Servicio
       (tipo centro_educativo) (coordX 1689) (coordY 239)
   )

   ([Centro_educativo_64] of Servicio
       (tipo centro_educativo) (coordX 125) (coordY 331)
   )

   ([Centro_educativo_65] of Servicio
       (tipo centro_educativo) (coordX 322) (coordY 565)
   )

   ([Centro_educativo_66] of Servicio
       (tipo centro_educativo) (coordX 802) (coordY 1605)
   )

   ([Centro_educativo_67] of Servicio
       (tipo centro_educativo) (coordX 1000) (coordY 1535)
   )

   ([Centro_educativo_68] of Servicio
       (tipo centro_educativo) (coordX 1256) (coordY 1242)
   )

   ([Ocio_69] of Servicio
       (tipo ocio) (coordX 1561) (coordY 1189)
   )

   ([Ocio_70] of Servicio
       (tipo ocio) (coordX 80) (coordY 662)
   )

   ([Ocio_71] of Servicio
       (tipo ocio) (coordX 1689) (coordY 1626)
   )

   ([Ocio_72] of Servicio
       (tipo ocio) (coordX 1271) (coordY 1711)
   )

   ([Ocio_73] of Servicio
       (tipo ocio) (coordX 97) (coordY 468)
   )

   ([Ocio_74] of Servicio
       (tipo ocio) (coordX 130) (coordY 781)
   )

   ([Ocio_75] of Servicio
       (tipo ocio) (coordX 1620) (coordY 1211)
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
      (bind ?cp (if (< ?p 1000) then bajo else (if (< ?p 1700) then medio else alto)))

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
      (bind ?cp (if (< ?p 1000) then bajo else (if (< ?p 1700) then medio else alto)))

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