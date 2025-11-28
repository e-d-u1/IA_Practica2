;;; ---------------------------------------------------------
;;; ontologiaMuySimple.clp
;;; Translated by owl2clips
;;; Translated to CLIPS from ontology ontologiaMuySimple.owl
;;; :Date 23/11/2025 15:34:41

(defclass Vivienda
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot cerca_de
        (type INSTANCE)
        (create-accessor read-write))
    (slot aireAcondicionado
        (type SYMBOL)
        (create-accessor read-write))
    (slot amueblado
        (type SYMBOL)
        (create-accessor read-write))
    (slot balcon
        (type SYMBOL)
        (create-accessor read-write))
    (slot calefaccion
        (type SYMBOL)
        (create-accessor read-write))
    (slot electrodomesticos
        (type SYMBOL)
        (create-accessor read-write))
    (slot garaje
        (type SYMBOL)
        (create-accessor read-write))
    (slot localizacion_x
        (type FLOAT)
        (create-accessor read-write))
    (slot localizacion_y
        (type FLOAT)
        (create-accessor read-write))
    (slot precio
        (type INTEGER)
        (create-accessor read-write))
    (slot superficie
        (type INTEGER)
        (create-accessor read-write))
    (slot terraza
        (type SYMBOL)
        (create-accessor read-write))
    (slot rangoPrecio
        (type SYMBOL)
        (create-accessor read-write))
)

(defclass Duplex
    (is-a Vivienda)
    (role concrete)
    (pattern-match reactive)
    (slot altura
        (type FLOAT)
        (create-accessor read-write))
    (slot ascensor
        (type SYMBOL)
        (create-accessor read-write))
    (slot numPiso
        (type INTEGER)
        (create-accessor read-write))
)

(defclass Piso
    (is-a Vivienda)
    (role concrete)
    (pattern-match reactive)
    (slot altura
        (type FLOAT)
        (create-accessor read-write))
    (slot ascensor
        (type SYMBOL)
        (create-accessor read-write))
    (slot numPiso
        (type INTEGER)
        (create-accessor read-write))
)

(defclass Unifamiliar
    (is-a Vivienda)
    (role concrete)
    (pattern-match reactive)
)

(defclass Servicio
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot localizacion_x
        (type FLOAT)
        (create-accessor read-write))
    (slot localizacion_y
        (type FLOAT)
        (create-accessor read-write))
)

(defclass Solicitante
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot edad
        (type INTEGER)
        (create-accessor read-write))
    (slot estudiante
        (type SYMBOL)
        (create-accessor read-write))
    (slot mascotas
        (type SYMBOL)
        (create-accessor read-write))
    (slot precioNegociable
        (type SYMBOL)
        (create-accessor read-write))
    (slot precioMax
        (type INTEGER)
        (create-accessor read-write))
    (slot precioMin
        (type INTEGER)
        (create-accessor read-write))
    (slot trabajador
        (type SYMBOL)
        (create-accessor read-write))
    (slot preferenciaAire
        (type SYMBOL)
        (create-accessor read-write))
)

(definstances instances 
    ([Jose] of Solicitante (precioMax 2700) (precioMin 1500) (trabajador "true") ) 
    ([Marta] of Solicitante (precioNegociable false) (precioMax 6000) (precioMin 300) (trabajador "true") )
    ([Arnau] of Solicitante (precioNegociable true) (precioMax 3500) (precioMin 600) (trabajador "true") ) 
    ([Pablo] of Solicitante (edad 27) (precioMax 1000) (precioMin 300) ) 
    ([Pepe] of Solicitante (edad 27) (precioMax 1000) (precioMin 300) (preferenciaAire "true") ) 
    ([casaIbiza] of Unifamiliar (cerca_de [escuela]) (aireAcondicionado "false") (amueblado "false") (balcon "true") (calefaccion "true") (electrodomesticos "true") (localizacion_x 10) (localizacion_y 10) (precio 2300) (superficie 120) ) 
    ([casaMarbella] of Unifamiliar (aireAcondicionado "true") (amueblado "true") (balcon "true") (electrodomesticos "true") (garaje "true") (precio 4000) (superficie 200) ) 
    ([escuela] of Servicio ) ([hospital] of Servicio ) 
    ([pisoBarcelona0] of Piso (rangoPrecio "nada") (ascensor "true") (numPiso 2) (localizacion_x 20) (localizacion_y 20) (precio 600) (superficie 70) ) 
    ([zonaVerde] of Servicio ) )