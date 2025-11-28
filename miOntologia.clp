;;; ---------------------------------------------------------
;;; miOntologia.clp
;;; Translated by owl2clips
;;; Translated to CLIPS from ontology miOntologia.owl
;;; :Date 23/11/2025 14:44:19

(defclass Extra
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot Balcon
        (type SYMBOL)
        (create-accessor read-write))
    (multislot Garaje
        (type SYMBOL)
        (create-accessor read-write))
    (multislot Terraza
        (type SYMBOL)
        (create-accessor read-write))
)

(defclass Vivienda
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot dispone_de
        (type INSTANCE)
        (create-accessor read-write))
    (multislot precio
        (type INTEGER)
        (create-accessor read-write))
    (multislot superficie
        (type INTEGER)
        (create-accessor read-write))
    (multislot tipoVivienda
        (type STRING)
        (create-accessor read-write))
)

(definstances instances
    ([Balconcito] of Extra
         (Balcon  1)
    )

    ([Casa] of Vivienda
         (dispone_de  [Balconcito])
         (precio  450)
         (superficie  90)
    )

    ([CasaReformada] of Vivienda
    )

)
