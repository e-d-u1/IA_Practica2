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

   (slot coord_x
      (type INTEGER)
      (create-accessor read-write))

   (slot coord_y
      (type INTEGER)
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

   (slot numHabitaciones
      (type INTEGER)
      (create-accessor read-write))

    ;; ABSTRACTOS
    (slot rangoPrecio
      (type SYMBOL)
      (create-accessor read-write))


    ;; De Solicitante    
    (slot SePermitenMascotas
      (type SYMBOL)
      (create-accessor read-write))
)

(defclass Servicio
   (is-a USER)
   (role concrete)
   (pattern-match reactive)

   (slot tipoServicio
      (type SYMBOL)
      (create-accessor read-write))

   (slot coord_x
      (type INTEGER)
      (create-accessor read-write))

   (slot coord_y
      (type INTEGER)
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

   (slot trabajador
      (type SYMBOL)
      (create-accessor read-write))

   (slot precioMax
      (type INTEGER)
      (create-accessor read-write))

   (slot precioNegociable
      (type SYMBOL)
      (create-accessor read-write))

   (slot mascotas
      (type SYMBOL)
      (create-accessor read-write))

   (slot numIndividuos
      (type INTEGER)
      (create-accessor read-write))
   
   (slot rangoPrecio
      (type SYMBOL)
      (create-accessor read-write))

)


(definstances instances

   ;; Solicitantes
   ([Ana] of Solicitante (edad 30) (trabajador "true") (precioMax 2000) (numIndividuos 3))
   ([Luis] of Solicitante (edad 22) (estudiante "true") (precioMax 900))
   ([Sara] of Solicitante (edad 40) (trabajador "true") (mascotas "true") (precioMax 3000))

   ;; Servicios
   ([Escuela] of Servicio (tipoServicio escuela) (coord_x 5) (coord_y 10))
   ([Hospital] of Servicio (tipoServicio hospital) (coord_x 12) (coord_y 8))
   ([Parque] of Servicio (tipoServicio parque) (coord_x 20) (coord_y 15))

   ;; Viviendas
   ([Vivienda1] of Vivienda (precio 800) (balcon true) (coord_x 4) (coord_y 9))
   ([Vivienda2] of Vivienda (precio 1500) (numHabitaciones 4) (coord_x 12) (coord_y 7))
   ([Vivienda3] of Vivienda (precio 2500) (coord_x 21) (coord_y 16))
)
