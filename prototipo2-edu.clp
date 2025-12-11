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
       (precio 1687)
       (habitaciones 3)
       (superficie 99)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas no)
       (terraza no)
       (balcon no)
       (soleado no)
       (fechaEdificacion 1992)
       (coordX 1778)
       (coordY 1438)
       (planta 3)
       (atico yes)
   )

   ([CasaAuto2] of Vivienda
       (id oAuto2)
       (precio 1478)
       (habitaciones 2)
       (superficie 55)
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
       (soleado yes)
       (fechaEdificacion 1999)
       (coordX 1722)
       (coordY 581)
   )

   ([CasaAuto3] of ViviendaVertical
       (id oAuto3)
       (precio 2149)
       (habitaciones 1)
       (superficie 51)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas no)
       (terraza yes)
       (balcon no)
       (soleado no)
       (fechaEdificacion 2000)
       (coordX 1119)
       (coordY 923)
       (planta 7)
       (atico no)
   )

   ([CasaAuto4] of Vivienda
       (id oAuto4)
       (precio 2043)
       (habitaciones 4)
       (superficie 94)
       (ascensor yes)
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
       (fechaEdificacion 1979)
       (coordX 814)
       (coordY 1288)
   )

   ([CasaAuto5] of Vivienda
       (id oAuto5)
       (precio 965)
       (habitaciones 3)
       (superficie 65)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas no)
       (terraza yes)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 2014)
       (coordX 1157)
       (coordY 552)
   )

   ([CasaAuto6] of Vivienda
       (id oAuto6)
       (precio 525)
       (habitaciones 3)
       (superficie 85)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas no)
       (terraza yes)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 1998)
       (coordX 1091)
       (coordY 1715)
   )

   ([CasaAuto7] of Vivienda
       (id oAuto7)
       (precio 2300)
       (habitaciones 3)
       (superficie 58)
       (ascensor yes)
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
       (fechaEdificacion 1965)
       (coordX 1522)
       (coordY 1943)
   )

   ([CasaAuto8] of ViviendaVertical
       (id oAuto8)
       (precio 1594)
       (habitaciones 3)
       (superficie 122)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje no)
       (buenas_vistas yes)
       (terraza yes)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 1976)
       (coordX 1599)
       (coordY 1128)
       (planta 10)
       (atico no)
   )

   ([CasaAuto9] of Vivienda
       (id oAuto9)
       (precio 577)
       (habitaciones 1)
       (superficie 95)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje no)
       (buenas_vistas no)
       (terraza yes)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 2005)
       (coordX 1341)
       (coordY 1747)
   )

   ([CasaAuto10] of Vivienda
       (id oAuto10)
       (precio 1721)
       (habitaciones 2)
       (superficie 45)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas no)
       (terraza no)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1982)
       (coordX 1239)
       (coordY 951)
   )

   ([CasaAuto11] of Vivienda
       (id oAuto11)
       (precio 1953)
       (habitaciones 4)
       (superficie 34)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas yes)
       (terraza no)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1995)
       (coordX 1766)
       (coordY 1516)
   )

   ([CasaAuto12] of Vivienda
       (id oAuto12)
       (precio 814)
       (habitaciones 1)
       (superficie 33)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas yes)
       (terraza no)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 1984)
       (coordX 26)
       (coordY 564)
   )

   ([CasaAuto13] of Vivienda
       (id oAuto13)
       (precio 2045)
       (habitaciones 1)
       (superficie 108)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas no)
       (terraza no)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1980)
       (coordX 780)
       (coordY 1999)
   )

   ([CasaAuto14] of Vivienda
       (id oAuto14)
       (precio 2014)
       (habitaciones 1)
       (superficie 98)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas no)
       (terraza yes)
       (balcon no)
       (soleado no)
       (fechaEdificacion 1967)
       (coordX 1895)
       (coordY 1280)
   )

   ([CasaAuto15] of Vivienda
       (id oAuto15)
       (precio 2172)
       (habitaciones 4)
       (superficie 88)
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
       (fechaEdificacion 1975)
       (coordX 1296)
       (coordY 200)
   )

   ([CasaAuto16] of Duplex
       (id oAuto16)
       (precio 1482)
       (habitaciones 2)
       (superficie 46)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje no)
       (buenas_vistas no)
       (terraza no)
       (balcon no)
       (soleado no)
       (fechaEdificacion 1995)
       (coordX 1712)
       (coordY 3)
       (planta 11)
       (numPlantas 3)
   )

   ([CasaAuto17] of ViviendaVertical
       (id oAuto17)
       (precio 1147)
       (habitaciones 4)
       (superficie 34)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas no)
       (terraza yes)
       (balcon no)
       (soleado no)
       (fechaEdificacion 1966)
       (coordX 421)
       (coordY 528)
       (planta 10)
       (atico yes)
   )

   ([CasaAuto18] of ViviendaVertical
       (id oAuto18)
       (precio 897)
       (habitaciones 3)
       (superficie 148)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas yes)
       (terraza no)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 2005)
       (coordX 1424)
       (coordY 733)
       (planta 8)
       (atico yes)
   )

   ([CasaAuto19] of Vivienda
       (id oAuto19)
       (precio 664)
       (habitaciones 4)
       (superficie 144)
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
       (soleado yes)
       (fechaEdificacion 1989)
       (coordX 62)
       (coordY 610)
   )

   ([CasaAuto20] of Vivienda
       (id oAuto20)
       (precio 919)
       (habitaciones 4)
       (superficie 143)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas no)
       (terraza yes)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 2020)
       (coordX 460)
       (coordY 798)
   )

   ([CasaAuto21] of Vivienda
       (id oAuto21)
       (precio 693)
       (habitaciones 5)
       (superficie 120)
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
       (soleado no)
       (fechaEdificacion 2014)
       (coordX 755)
       (coordY 206)
   )

   ([CasaAuto22] of ViviendaVertical
       (id oAuto22)
       (precio 1401)
       (habitaciones 2)
       (superficie 69)
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
       (fechaEdificacion 2005)
       (coordX 1360)
       (coordY 1207)
       (planta 11)
       (atico no)
   )

   ([CasaAuto23] of Duplex
       (id oAuto23)
       (precio 1110)
       (habitaciones 1)
       (superficie 104)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas no)
       (terraza no)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 1976)
       (coordX 1097)
       (coordY 25)
       (planta 9)
       (numPlantas 3)
   )

   ([CasaAuto24] of Vivienda
       (id oAuto24)
       (precio 1090)
       (habitaciones 1)
       (superficie 134)
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
       (soleado no)
       (fechaEdificacion 2009)
       (coordX 745)
       (coordY 1079)
   )

   ([CasaAuto25] of Vivienda
       (id oAuto25)
       (precio 725)
       (habitaciones 1)
       (superficie 88)
       (ascensor no)
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
       (fechaEdificacion 1990)
       (coordX 1006)
       (coordY 1228)
   )

   ([CasaAuto26] of Vivienda
       (id oAuto26)
       (precio 517)
       (habitaciones 1)
       (superficie 98)
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
       (fechaEdificacion 2005)
       (coordX 159)
       (coordY 312)
   )

   ([CasaAuto27] of Vivienda
       (id oAuto27)
       (precio 2327)
       (habitaciones 3)
       (superficie 92)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas no)
       (terraza no)
       (balcon no)
       (soleado no)
       (fechaEdificacion 2020)
       (coordX 1641)
       (coordY 462)
   )

   ([CasaAuto28] of Vivienda
       (id oAuto28)
       (precio 1096)
       (habitaciones 2)
       (superficie 40)
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
       (fechaEdificacion 1998)
       (coordX 1294)
       (coordY 835)
   )

   ([CasaAuto29] of ViviendaVertical
       (id oAuto29)
       (precio 2356)
       (habitaciones 1)
       (superficie 34)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas yes)
       (terraza no)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 2010)
       (coordX 1099)
       (coordY 172)
       (planta 4)
       (atico no)
   )

   ([CasaAuto30] of Vivienda
       (id oAuto30)
       (precio 675)
       (habitaciones 3)
       (superficie 70)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas no)
       (terraza no)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 1990)
       (coordX 1885)
       (coordY 189)
   )

   ([CasaAuto31] of Vivienda
       (id oAuto31)
       (precio 2155)
       (habitaciones 4)
       (superficie 87)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje no)
       (buenas_vistas no)
       (terraza no)
       (balcon no)
       (soleado no)
       (fechaEdificacion 1983)
       (coordX 1964)
       (coordY 299)
   )

   ([CasaAuto32] of Vivienda
       (id oAuto32)
       (precio 1403)
       (habitaciones 1)
       (superficie 76)
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
       (soleado yes)
       (fechaEdificacion 1968)
       (coordX 712)
       (coordY 1898)
   )

   ([CasaAuto33] of ViviendaVertical
       (id oAuto33)
       (precio 1308)
       (habitaciones 3)
       (superficie 62)
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
       (fechaEdificacion 1970)
       (coordX 425)
       (coordY 1404)
       (planta 1)
       (atico no)
   )

   ([CasaAuto34] of ViviendaVertical
       (id oAuto34)
       (precio 1045)
       (habitaciones 1)
       (superficie 118)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas no)
       (terraza yes)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 1992)
       (coordX 1556)
       (coordY 1885)
       (planta 1)
       (atico yes)
   )

   ([CasaAuto35] of Vivienda
       (id oAuto35)
       (precio 2298)
       (habitaciones 5)
       (superficie 61)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas yes)
       (terraza yes)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 2015)
       (coordX 1858)
       (coordY 1123)
   )

   ([CasaAuto36] of Vivienda
       (id oAuto36)
       (precio 1456)
       (habitaciones 4)
       (superficie 60)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas yes)
       (terraza no)
       (balcon no)
       (soleado no)
       (fechaEdificacion 1964)
       (coordX 84)
       (coordY 609)
   )

   ([CasaAuto37] of Vivienda
       (id oAuto37)
       (precio 2469)
       (habitaciones 4)
       (superficie 83)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas no)
       (terraza no)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 1971)
       (coordX 629)
       (coordY 1511)
   )

   ([CasaAuto38] of Vivienda
       (id oAuto38)
       (precio 2236)
       (habitaciones 5)
       (superficie 71)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje no)
       (buenas_vistas yes)
       (terraza no)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 1989)
       (coordX 652)
       (coordY 1389)
   )

   ([CasaAuto39] of Duplex
       (id oAuto39)
       (precio 2443)
       (habitaciones 2)
       (superficie 58)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas no)
       (terraza no)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 1987)
       (coordX 1367)
       (coordY 1856)
       (planta 1)
       (numPlantas 2)
   )

   ([CasaAuto40] of Vivienda
       (id oAuto40)
       (precio 1429)
       (habitaciones 5)
       (superficie 73)
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
       (soleado no)
       (fechaEdificacion 1972)
       (coordX 739)
       (coordY 1542)
   )

   ([CasaAuto41] of ViviendaVertical
       (id oAuto41)
       (precio 2140)
       (habitaciones 5)
       (superficie 40)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas yes)
       (terraza yes)
       (balcon no)
       (soleado no)
       (fechaEdificacion 1974)
       (coordX 510)
       (coordY 1041)
       (planta 4)
       (atico no)
   )

   ([CasaAuto42] of ViviendaVertical
       (id oAuto42)
       (precio 1660)
       (habitaciones 3)
       (superficie 81)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas no)
       (terraza yes)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 2021)
       (coordX 758)
       (coordY 1352)
       (planta 10)
       (atico no)
   )

   ([CasaAuto43] of Duplex
       (id oAuto43)
       (precio 1272)
       (habitaciones 1)
       (superficie 56)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje no)
       (buenas_vistas yes)
       (terraza yes)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 1999)
       (coordX 1873)
       (coordY 1564)
       (planta 2)
       (numPlantas 3)
   )

   ([CasaAuto44] of Vivienda
       (id oAuto44)
       (precio 867)
       (habitaciones 2)
       (superficie 84)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas no)
       (terraza no)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1970)
       (coordX 788)
       (coordY 127)
   )

   ([CasaAuto45] of Vivienda
       (id oAuto45)
       (precio 614)
       (habitaciones 3)
       (superficie 85)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas no)
       (terraza no)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1964)
       (coordX 948)
       (coordY 108)
   )

   ([CasaAuto46] of Vivienda
       (id oAuto46)
       (precio 1045)
       (habitaciones 4)
       (superficie 65)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas no)
       (terraza yes)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1984)
       (coordX 595)
       (coordY 1246)
   )

   ([CasaAuto47] of ViviendaVertical
       (id oAuto47)
       (precio 804)
       (habitaciones 1)
       (superficie 94)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas no)
       (terraza no)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 2021)
       (coordX 1510)
       (coordY 1595)
       (planta 7)
       (atico no)
   )

   ([CasaAuto48] of Vivienda
       (id oAuto48)
       (precio 2166)
       (habitaciones 3)
       (superficie 102)
       (ascensor yes)
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
       (fechaEdificacion 1975)
       (coordX 348)
       (coordY 897)
   )

   ([CasaAuto49] of Duplex
       (id oAuto49)
       (precio 2331)
       (habitaciones 5)
       (superficie 108)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas yes)
       (terraza yes)
       (balcon no)
       (soleado no)
       (fechaEdificacion 1960)
       (coordX 386)
       (coordY 1685)
       (planta 6)
       (numPlantas 3)
   )

   ([CasaAuto50] of Vivienda
       (id oAuto50)
       (precio 1232)
       (habitaciones 4)
       (superficie 100)
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
       (soleado yes)
       (fechaEdificacion 2018)
       (coordX 1570)
       (coordY 361)
   )

   ([CasaAuto51] of Vivienda
       (id oAuto51)
       (precio 979)
       (habitaciones 3)
       (superficie 76)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje no)
       (buenas_vistas no)
       (terraza no)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1974)
       (coordX 1626)
       (coordY 900)
   )

   ([CasaAuto52] of ViviendaVertical
       (id oAuto52)
       (precio 2078)
       (habitaciones 5)
       (superficie 146)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas yes)
       (terraza yes)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 1970)
       (coordX 586)
       (coordY 1709)
       (planta 4)
       (atico yes)
   )

   ([CasaAuto53] of Vivienda
       (id oAuto53)
       (precio 1030)
       (habitaciones 5)
       (superficie 42)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas yes)
       (terraza no)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1981)
       (coordX 352)
       (coordY 1438)
   )

   ([CasaAuto54] of Vivienda
       (id oAuto54)
       (precio 635)
       (habitaciones 1)
       (superficie 131)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas yes)
       (terraza no)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 2023)
       (coordX 1567)
       (coordY 1473)
   )

   ([CasaAuto55] of Vivienda
       (id oAuto55)
       (precio 864)
       (habitaciones 1)
       (superficie 48)
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
       (soleado yes)
       (fechaEdificacion 2003)
       (coordX 1040)
       (coordY 543)
   )

   ([CasaAuto56] of Vivienda
       (id oAuto56)
       (precio 1426)
       (habitaciones 1)
       (superficie 83)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas yes)
       (terraza no)
       (balcon no)
       (soleado no)
       (fechaEdificacion 1996)
       (coordX 658)
       (coordY 1515)
   )

   ([CasaAuto57] of Duplex
       (id oAuto57)
       (precio 1256)
       (habitaciones 3)
       (superficie 136)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas yes)
       (terraza yes)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 1991)
       (coordX 492)
       (coordY 794)
       (planta 2)
       (numPlantas 2)
   )

   ([CasaAuto58] of Vivienda
       (id oAuto58)
       (precio 618)
       (habitaciones 5)
       (superficie 116)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas yes)
       (terraza no)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 2002)
       (coordX 94)
       (coordY 1831)
   )

   ([CasaAuto59] of Vivienda
       (id oAuto59)
       (precio 1782)
       (habitaciones 3)
       (superficie 145)
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
       (fechaEdificacion 1990)
       (coordX 431)
       (coordY 803)
   )

   ([CasaAuto60] of Vivienda
       (id oAuto60)
       (precio 649)
       (habitaciones 5)
       (superficie 113)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas yes)
       (terraza no)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 1976)
       (coordX 1500)
       (coordY 861)
   )

   ([CasaAuto61] of ViviendaVertical
       (id oAuto61)
       (precio 2225)
       (habitaciones 5)
       (superficie 148)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas no)
       (terraza no)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1965)
       (coordX 1379)
       (coordY 1941)
       (planta 2)
       (atico no)
   )

   ([CasaAuto62] of ViviendaVertical
       (id oAuto62)
       (precio 2078)
       (habitaciones 5)
       (superficie 110)
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
       (soleado yes)
       (fechaEdificacion 1972)
       (coordX 452)
       (coordY 447)
       (planta 9)
       (atico no)
   )

   ([CasaAuto63] of Vivienda
       (id oAuto63)
       (precio 1496)
       (habitaciones 1)
       (superficie 38)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje no)
       (buenas_vistas no)
       (terraza no)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1961)
       (coordX 709)
       (coordY 1397)
   )

   ([CasaAuto64] of Vivienda
       (id oAuto64)
       (precio 1256)
       (habitaciones 1)
       (superficie 40)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas no)
       (terraza no)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 2002)
       (coordX 1515)
       (coordY 1275)
   )

   ([CasaAuto65] of Duplex
       (id oAuto65)
       (precio 2141)
       (habitaciones 1)
       (superficie 123)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas no)
       (terraza no)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1982)
       (coordX 778)
       (coordY 528)
       (planta 9)
       (numPlantas 3)
   )

   ([CasaAuto66] of Duplex
       (id oAuto66)
       (precio 747)
       (habitaciones 2)
       (superficie 119)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje no)
       (buenas_vistas yes)
       (terraza no)
       (balcon no)
       (soleado no)
       (fechaEdificacion 1970)
       (coordX 792)
       (coordY 1200)
       (planta 11)
       (numPlantas 3)
   )

   ([CasaAuto67] of Duplex
       (id oAuto67)
       (precio 944)
       (habitaciones 1)
       (superficie 88)
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
       (fechaEdificacion 1963)
       (coordX 659)
       (coordY 642)
       (planta 11)
       (numPlantas 2)
   )

   ([CasaAuto68] of Vivienda
       (id oAuto68)
       (precio 680)
       (habitaciones 1)
       (superficie 135)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas no)
       (terraza no)
       (balcon no)
       (soleado no)
       (fechaEdificacion 2023)
       (coordX 302)
       (coordY 508)
   )

   ([CasaAuto69] of ViviendaVertical
       (id oAuto69)
       (precio 1356)
       (habitaciones 1)
       (superficie 48)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas yes)
       (terraza no)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 2021)
       (coordX 1448)
       (coordY 841)
       (planta 8)
       (atico no)
   )

   ([CasaAuto70] of ViviendaVertical
       (id oAuto70)
       (precio 1703)
       (habitaciones 4)
       (superficie 37)
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
       (fechaEdificacion 2023)
       (coordX 1905)
       (coordY 1397)
       (planta 8)
       (atico no)
   )

   ([CasaAuto71] of Vivienda
       (id oAuto71)
       (precio 1415)
       (habitaciones 4)
       (superficie 136)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas yes)
       (terraza no)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1984)
       (coordX 1050)
       (coordY 694)
   )

   ([CasaAuto72] of Vivienda
       (id oAuto72)
       (precio 1185)
       (habitaciones 5)
       (superficie 97)
       (ascensor yes)
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
       (fechaEdificacion 2016)
       (coordX 265)
       (coordY 1645)
   )

   ([CasaAuto73] of ViviendaVertical
       (id oAuto73)
       (precio 2378)
       (habitaciones 1)
       (superficie 56)
       (ascensor yes)
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
       (fechaEdificacion 1960)
       (coordX 1215)
       (coordY 1481)
       (planta 7)
       (atico no)
   )

   ([CasaAuto74] of Duplex
       (id oAuto74)
       (precio 2325)
       (habitaciones 1)
       (superficie 108)
       (ascensor yes)
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
       (fechaEdificacion 1989)
       (coordX 121)
       (coordY 1081)
       (planta 6)
       (numPlantas 2)
   )

   ([CasaAuto75] of Vivienda
       (id oAuto75)
       (precio 725)
       (habitaciones 5)
       (superficie 77)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas yes)
       (terraza yes)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 2016)
       (coordX 931)
       (coordY 1929)
   )

   ([CasaAuto76] of Vivienda
       (id oAuto76)
       (precio 1347)
       (habitaciones 3)
       (superficie 65)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas yes)
       (terraza yes)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1975)
       (coordX 121)
       (coordY 941)
   )

   ([CasaAuto77] of ViviendaVertical
       (id oAuto77)
       (precio 1964)
       (habitaciones 3)
       (superficie 59)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas no)
       (terraza no)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 1995)
       (coordX 1501)
       (coordY 1899)
       (planta 9)
       (atico yes)
   )

   ([CasaAuto78] of ViviendaVertical
       (id oAuto78)
       (precio 897)
       (habitaciones 1)
       (superficie 122)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje no)
       (buenas_vistas no)
       (terraza no)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 1976)
       (coordX 1752)
       (coordY 1550)
       (planta 8)
       (atico no)
   )

   ([CasaAuto79] of ViviendaVertical
       (id oAuto79)
       (precio 2202)
       (habitaciones 5)
       (superficie 138)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas no)
       (terraza yes)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 1999)
       (coordX 625)
       (coordY 941)
       (planta 2)
       (atico yes)
   )

   ([CasaAuto80] of Vivienda
       (id oAuto80)
       (precio 867)
       (habitaciones 5)
       (superficie 83)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas no)
       (terraza yes)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 2003)
       (coordX 1926)
       (coordY 1732)
   )

   ([CasaAuto81] of ViviendaVertical
       (id oAuto81)
       (precio 586)
       (habitaciones 4)
       (superficie 53)
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
       (soleado no)
       (fechaEdificacion 1995)
       (coordX 659)
       (coordY 1118)
       (planta 11)
       (atico no)
   )

   ([CasaAuto82] of Vivienda
       (id oAuto82)
       (precio 2153)
       (habitaciones 1)
       (superficie 83)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas yes)
       (terraza no)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 2016)
       (coordX 1879)
       (coordY 1719)
   )

   ([CasaAuto83] of ViviendaVertical
       (id oAuto83)
       (precio 1346)
       (habitaciones 3)
       (superficie 78)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas no)
       (terraza yes)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 1993)
       (coordX 1690)
       (coordY 704)
       (planta 10)
       (atico yes)
   )

   ([CasaAuto84] of Vivienda
       (id oAuto84)
       (precio 1051)
       (habitaciones 1)
       (superficie 54)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje no)
       (buenas_vistas yes)
       (terraza yes)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 2006)
       (coordX 843)
       (coordY 1261)
   )

   ([CasaAuto85] of ViviendaVertical
       (id oAuto85)
       (precio 575)
       (habitaciones 5)
       (superficie 62)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas yes)
       (terraza yes)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 1984)
       (coordX 1726)
       (coordY 1711)
       (planta 8)
       (atico yes)
   )

   ([CasaAuto86] of Vivienda
       (id oAuto86)
       (precio 944)
       (habitaciones 3)
       (superficie 127)
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
       (soleado no)
       (fechaEdificacion 1970)
       (coordX 726)
       (coordY 1692)
   )

   ([CasaAuto87] of ViviendaVertical
       (id oAuto87)
       (precio 1069)
       (habitaciones 4)
       (superficie 110)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje no)
       (buenas_vistas no)
       (terraza no)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 1964)
       (coordX 1233)
       (coordY 1747)
       (planta 8)
       (atico no)
   )

   ([CasaAuto88] of ViviendaVertical
       (id oAuto88)
       (precio 2043)
       (habitaciones 5)
       (superficie 35)
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
       (fechaEdificacion 1963)
       (coordX 350)
       (coordY 1038)
       (planta 10)
       (atico yes)
   )

   ([CasaAuto89] of ViviendaVertical
       (id oAuto89)
       (precio 2476)
       (habitaciones 2)
       (superficie 92)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje no)
       (buenas_vistas no)
       (terraza no)
       (balcon no)
       (soleado no)
       (fechaEdificacion 1984)
       (coordX 1852)
       (coordY 1810)
       (planta 11)
       (atico no)
   )

   ([CasaAuto90] of Vivienda
       (id oAuto90)
       (precio 519)
       (habitaciones 2)
       (superficie 97)
       (ascensor yes)
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
       (fechaEdificacion 1979)
       (coordX 1106)
       (coordY 1715)
   )

   ([CasaAuto91] of Vivienda
       (id oAuto91)
       (precio 1825)
       (habitaciones 3)
       (superficie 70)
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
       (fechaEdificacion 1984)
       (coordX 975)
       (coordY 1114)
   )

   ([CasaAuto92] of Vivienda
       (id oAuto92)
       (precio 1237)
       (habitaciones 2)
       (superficie 90)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje no)
       (buenas_vistas no)
       (terraza no)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 1994)
       (coordX 842)
       (coordY 1959)
   )

   ([CasaAuto93] of Vivienda
       (id oAuto93)
       (precio 805)
       (habitaciones 2)
       (superficie 59)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje no)
       (buenas_vistas yes)
       (terraza no)
       (balcon yes)
       (soleado no)
       (fechaEdificacion 2011)
       (coordX 154)
       (coordY 1914)
   )

   ([CasaAuto94] of Vivienda
       (id oAuto94)
       (precio 620)
       (habitaciones 1)
       (superficie 76)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas yes)
       (terraza no)
       (balcon no)
       (soleado no)
       (fechaEdificacion 2004)
       (coordX 402)
       (coordY 862)
   )

   ([CasaAuto95] of Vivienda
       (id oAuto95)
       (precio 888)
       (habitaciones 4)
       (superficie 69)
       (ascensor no)
       (mascotasPermitidas no)
       (amueblado no)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion no)
       (garaje no)
       (buenas_vistas yes)
       (terraza yes)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 1983)
       (coordX 1704)
       (coordY 739)
   )

   ([CasaAuto96] of Vivienda
       (id oAuto96)
       (precio 2094)
       (habitaciones 4)
       (superficie 98)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado no)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje yes)
       (buenas_vistas yes)
       (terraza yes)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 2011)
       (coordX 598)
       (coordY 1479)
   )

   ([CasaAuto97] of ViviendaVertical
       (id oAuto97)
       (precio 1499)
       (habitaciones 3)
       (superficie 138)
       (ascensor yes)
       (mascotasPermitidas no)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado no)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas no)
       (terraza yes)
       (balcon no)
       (soleado no)
       (fechaEdificacion 1981)
       (coordX 1194)
       (coordY 1047)
       (planta 5)
       (atico yes)
   )

   ([CasaAuto98] of Duplex
       (id oAuto98)
       (precio 843)
       (habitaciones 1)
       (superficie 138)
       (ascensor no)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina yes)
       (aire_acondicionado no)
       (calefaccion no)
       (garaje yes)
       (buenas_vistas yes)
       (terraza yes)
       (balcon no)
       (soleado yes)
       (fechaEdificacion 1999)
       (coordX 1484)
       (coordY 966)
       (planta 6)
       (numPlantas 3)
   )

   ([CasaAuto99] of ViviendaVertical
       (id oAuto99)
       (precio 1411)
       (habitaciones 2)
       (superficie 95)
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
       (fechaEdificacion 1985)
       (coordX 1270)
       (coordY 1319)
       (planta 12)
       (atico no)
   )

   ([CasaAuto100] of Vivienda
       (id oAuto100)
       (precio 2287)
       (habitaciones 4)
       (superficie 129)
       (ascensor yes)
       (mascotasPermitidas yes)
       (amueblado yes)
       (piscina no)
       (aire_acondicionado yes)
       (calefaccion yes)
       (garaje no)
       (buenas_vistas yes)
       (terraza no)
       (balcon yes)
       (soleado yes)
       (fechaEdificacion 2016)
       (coordX 1768)
       (coordY 1266)
   )

    ([Hospital_1] of Servicio
       (tipo hospital) (coordX 976) (coordY 986)
   )

   ([Hospital_2] of Servicio
       (tipo hospital) (coordX 334) (coordY 973)
   )

   ([Hospital_3] of Servicio
       (tipo hospital) (coordX 822) (coordY 7)
   )

   ([Hospital_4] of Servicio
       (tipo hospital) (coordX 1505) (coordY 807)
   )

   ([Hospital_5] of Servicio
       (tipo hospital) (coordX 909) (coordY 307)
   )

   ([Hospital_6] of Servicio
       (tipo hospital) (coordX 1947) (coordY 1417)
   )

   ([Hospital_7] of Servicio
       (tipo hospital) (coordX 1968) (coordY 298)
   )

   ([Hospital_8] of Servicio
       (tipo hospital) (coordX 1263) (coordY 1661)
   )

   ([Hospital_9] of Servicio
       (tipo hospital) (coordX 565) (coordY 1224)
   )

   ([Hospital_10] of Servicio
       (tipo hospital) (coordX 1410) (coordY 1670)
   )

   ([Zonaverde_11] of Servicio
       (tipo zonaVerde) (coordX 519) (coordY 309)
   )

   ([Zonaverde_12] of Servicio
       (tipo zonaVerde) (coordX 1224) (coordY 92)
   )

   ([Zonaverde_13] of Servicio
       (tipo zonaVerde) (coordX 1231) (coordY 46)
   )

   ([Zonaverde_14] of Servicio
       (tipo zonaVerde) (coordX 497) (coordY 441)
   )

   ([Zonaverde_15] of Servicio
       (tipo zonaVerde) (coordX 1990) (coordY 799)
   )

   ([Zonaverde_16] of Servicio
       (tipo zonaVerde) (coordX 1304) (coordY 1162)
   )

   ([Zonaverde_17] of Servicio
       (tipo zonaVerde) (coordX 161) (coordY 1854)
   )

   ([Zonaverde_18] of Servicio
       (tipo zonaVerde) (coordX 27) (coordY 94)
   )

   ([Centro_19] of Servicio
       (tipo centro) (coordX 299) (coordY 295)
   )

   ([Centro_20] of Servicio
       (tipo centro) (coordX 1552) (coordY 780)
   )

   ([Centro_21] of Servicio
       (tipo centro) (coordX 579) (coordY 259)
   )

   ([Centro_22] of Servicio
       (tipo centro) (coordX 1063) (coordY 606)
   )

   ([Centro_23] of Servicio
       (tipo centro) (coordX 702) (coordY 481)
   )

   ([Centro_24] of Servicio
       (tipo centro) (coordX 1677) (coordY 943)
   )

   ([Centro_25] of Servicio
       (tipo centro) (coordX 1189) (coordY 1144)
   )

   ([Centro_26] of Servicio
       (tipo centro) (coordX 1276) (coordY 93)
   )

   ([Ocio_nocturno_27] of Servicio
       (tipo ocio_nocturno) (coordX 1245) (coordY 503)
   )

   ([Ocio_nocturno_28] of Servicio
       (tipo ocio_nocturno) (coordX 1402) (coordY 1241)
   )

   ([Ocio_nocturno_29] of Servicio
       (tipo ocio_nocturno) (coordX 1287) (coordY 734)
   )

   ([Ocio_nocturno_30] of Servicio
       (tipo ocio_nocturno) (coordX 246) (coordY 1465)
   )

   ([Ocio_nocturno_31] of Servicio
       (tipo ocio_nocturno) (coordX 273) (coordY 918)
   )

   ([Ocio_nocturno_32] of Servicio
       (tipo ocio_nocturno) (coordX 410) (coordY 1401)
   )

   ([Transporte_publico_33] of Servicio
       (tipo transporte_publico) (coordX 744) (coordY 623)
   )

   ([Transporte_publico_34] of Servicio
       (tipo transporte_publico) (coordX 1419) (coordY 1770)
   )

   ([Transporte_publico_35] of Servicio
       (tipo transporte_publico) (coordX 1433) (coordY 8)
   )

   ([Transporte_publico_36] of Servicio
       (tipo transporte_publico) (coordX 699) (coordY 1946)
   )

   ([Transporte_publico_37] of Servicio
       (tipo transporte_publico) (coordX 1596) (coordY 57)
   )

   ([Transporte_publico_38] of Servicio
       (tipo transporte_publico) (coordX 847) (coordY 1665)
   )

   ([Transporte_publico_39] of Servicio
       (tipo transporte_publico) (coordX 1873) (coordY 1083)
   )

   ([Transporte_publico_40] of Servicio
       (tipo transporte_publico) (coordX 1753) (coordY 1245)
   )

   ([Transporte_publico_41] of Servicio
       (tipo transporte_publico) (coordX 700) (coordY 1705)
   )

   ([Transporte_publico_42] of Servicio
       (tipo transporte_publico) (coordX 1397) (coordY 1576)
   )

   ([Zona_comercial_43] of Servicio
       (tipo zona_comercial) (coordX 1270) (coordY 1642)
   )

   ([Zona_comercial_44] of Servicio
       (tipo zona_comercial) (coordX 1508) (coordY 334)
   )

   ([Zona_comercial_45] of Servicio
       (tipo zona_comercial) (coordX 1855) (coordY 1646)
   )

   ([Zona_comercial_46] of Servicio
       (tipo zona_comercial) (coordX 415) (coordY 795)
   )

   ([Zona_comercial_47] of Servicio
       (tipo zona_comercial) (coordX 741) (coordY 729)
   )

   ([Supermercado_48] of Servicio
       (tipo supermercado) (coordX 312) (coordY 1532)
   )

   ([Supermercado_49] of Servicio
       (tipo supermercado) (coordX 1825) (coordY 1956)
   )

   ([Supermercado_50] of Servicio
       (tipo supermercado) (coordX 1543) (coordY 1837)
   )

   ([Supermercado_51] of Servicio
       (tipo supermercado) (coordX 1451) (coordY 582)
   )

   ([Supermercado_52] of Servicio
       (tipo supermercado) (coordX 1374) (coordY 1382)
   )

   ([Supermercado_53] of Servicio
       (tipo supermercado) (coordX 655) (coordY 218)
   )

   ([Supermercado_54] of Servicio
       (tipo supermercado) (coordX 1895) (coordY 54)
   )

   ([Supermercado_55] of Servicio
       (tipo supermercado) (coordX 1120) (coordY 1170)
   )

   ([Supermercado_56] of Servicio
       (tipo supermercado) (coordX 403) (coordY 1577)
   )

   ([Centro_educativo_57] of Servicio
       (tipo centro_educativo) (coordX 1420) (coordY 1340)
   )

   ([Centro_educativo_58] of Servicio
       (tipo centro_educativo) (coordX 1468) (coordY 322)
   )

   ([Centro_educativo_59] of Servicio
       (tipo centro_educativo) (coordX 1174) (coordY 1476)
   )

   ([Centro_educativo_60] of Servicio
       (tipo centro_educativo) (coordX 500) (coordY 1117)
   )

   ([Centro_educativo_61] of Servicio
       (tipo centro_educativo) (coordX 1002) (coordY 1321)
   )

   ([Centro_educativo_62] of Servicio
       (tipo centro_educativo) (coordX 1516) (coordY 837)
   )

   ([Centro_educativo_63] of Servicio
       (tipo centro_educativo) (coordX 561) (coordY 1989)
   )

   ([Centro_educativo_64] of Servicio
       (tipo centro_educativo) (coordX 1318) (coordY 1389)
   )

   ([Centro_educativo_65] of Servicio
       (tipo centro_educativo) (coordX 1154) (coordY 1981)
   )

   ([Ocio_66] of Servicio
       (tipo ocio) (coordX 1177) (coordY 940)
   )

   ([Ocio_67] of Servicio
       (tipo ocio) (coordX 263) (coordY 691)
   )

   ([Ocio_68] of Servicio
       (tipo ocio) (coordX 1524) (coordY 440)
   )

   ([Ocio_69] of Servicio
       (tipo ocio) (coordX 1520) (coordY 1816)
   )

   ([Ocio_70] of Servicio
       (tipo ocio) (coordX 1640) (coordY 663)
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

    ;función auxiliar para comprobar que existe al menos una instancia del tipo en la
    ;lista `lejos` y que NO existen instancias de ese tipo en `cerca` ni en `media`.
    (deffunction todos-servicios-lejos (?tipo_buscado ?lista_cerca ?lista_media ?lista_lejos)
        (bind ?encontrado-lejos FALSE)
        ;; buscar al menos una instancia en la lista de lejanos
        (foreach ?servicio ?lista_lejos
            (if (eq (send ?servicio get-tipo) ?tipo_buscado) then (bind ?encontrado-lejos TRUE) (break)))
        (if (not ?encontrado-lejos) then FALSE
            else
                ;; asegurar que NO hay instancias del tipo en cerca
                (foreach ?servicio ?lista_cerca
                    (if (eq (send ?servicio get-tipo) ?tipo_buscado) then (return FALSE)))
                ;; asegurar que NO hay instancias del tipo en media
                (foreach ?servicio ?lista_media
                    (if (eq (send ?servicio get-tipo) ?tipo_buscado) then (return FALSE)))
                TRUE)
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

defrule asociar-heuristica-piso
    ?s <- (object (is-a Solicitante)
                      (tipoVivienda ?tipoDeseado)
                      (altura-cat ?plantaSolicitada))
    ?v <- (object (is-a ViviendaVertical)
                      (ventajas-extra $?extras)
                      (planta_Abs ?plantaReal))
    =>
    ;; Si la altura solicitada coincide con la real, marcar como ventaja (no como fallo)
    (if (eq ?plantaSolicitada ?plantaReal) then
        (if (not (member$ planta-deseada ?extras)) then
            (slot-insert$ ?v ventajas-extra 1 planta-deseada)))

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

    ;; 3. Añadir ventaja si un servicio preferido "lejos" está lejos (estricto)
    ;; Se requiere que exista al menos una instancia en `lejos` y que NO haya instancias
    ;; del mismo tipo en `cerca` ni en `media`.
    (foreach ?tipo_req ?sl
        (if (todos-servicios-lejos ?tipo_req ?servicios_cercanos ?servicios_medios ?servicios_lejanos) then
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