# Práctica de Sistemas Basados en el Conocimiento - Recomendación de viviendas -  CLIPS

Práctica de Sistemas Basados en el Conocimiento (SBC) donde se implementa un sistema experto que recomienda viviendas de alquiler a partir del perfil, restricciones y preferencias de un solicitante. 

## Objetivo

El sistema intenta imitar a un asesor inmobiliario: dado un usuario y un conjunto de pisos/casas, devuelve qué viviendas encajan mejor y por qué. 

- Pregunta al usuario por su perfil y restricciones (precio, habitaciones, ascensor, etc.). 
- Tiene conocimiento de la ciudad mediante servicios (hospitales, transporte, ocio, zonas verdes, etc.). 
- Combina todo con reglas heurísticas y etiqueta cada vivienda como:
  - `MuyRecomendable`
  - `Adecuado`
  - `ParcialmenteAdecuado`  
  - O indica que ninguna cumple. 

## Estructura del sistema

El código está organizado en módulos CLIPS siguiendo la metodología de la práctica. 

- **INPUT**  
  - Funciones genéricas de entrada (`ask-int`, `ask-number`, `ask-question`, `yes-or-no-p`, etc.). 
  - Clase `Solicitante` con slots de perfil, restricciones y preferencias (tipo de solicitante, edad, presupuesto, numHabitaciones, ascensor, piscina, servicios cerca/media/lejos, etc.). 
  - Clase `Vivienda` (+ `ViviendaVertical`, `Duplex`) con todos los atributos de los pisos (precio, superficie, ascensor, garaje, terraza, balcón, soleado, año, coordenadas, etc.). 
  - Clase `Servicio` con tipo y coordenadas (hospital, zonaVerde, ocio, transportepublico, centroeducativo, etc.) e instancias de ejemplo. 

- **ABSTRACCION**  
  - Cálculo de distancias vivienda–servicio y clasificación en `cercade`, `mediade` y `lejosde`. 
  - Creación de atributos abstractos:
    - Para viviendas: `precio-cat`, `tamano-cat`, `superficie-cat`, `fechaEdificacionAbs`, booleanos `ascensorAbs`, `piscinaAbs`, etc. 
    - Para solicitantes: `precio-cat`, `tamano-cat`, `edad-cat` y flags booleanos según lo que considera imprescindible.
  - Reglas de diálogo para preguntar solo lo necesario (restricciones obligatorias y preferencias sobre servicios). 

- **HEURISTICAS**  
  - Reglas que comparan solicitante y vivienda y rellenan:
    - `requisitos-fallados` (precio excedido, habitaciones insuficientes, falta de ascensor, etc.). 
    - `ventajas-extra` (precio ventajoso, habitaciones extra, piso soleado, vivienda moderna, ático, dúplex, servicios preferidos cerca, etc.). 
  - Reglas específicas por tipo de solicitante (estudiante, joven, parejaconhijos, movilidadreducida, soltero, anciano) que añaden ventajas si hay servicios típicos de su perfil sin que los haya pedido explícitamente. 
  - Clasificación final:
    - `MuyRecomendable`: sin fallos y con al menos una ventaja.  
    - `Adecuado`: sin fallos ni extras.  
    - `ParcialmenteAdecuado`: hasta 2 fallos. 

- **REFINAMIENTO**  
  - Crea hechos `vivienda-a-mostrar` con un `valor-orden` para ordenar la lista. 
  - Prioriza:
    - Primero las `MuyRecomendable` (más extras, más arriba).  
    - Si no hay, las `Adecuado`.  
    - Si tampoco, las `ParcialmenteAdecuado`, ordenadas por número de fallos. 

- **SALIDA**  
  - Imprime las viviendas en orden de recomendación mostrando:
    - ID de la vivienda.  
    - Grado de recomendación.  
    - Requisitos no cumplidos.  
    - Ventajas extra. 
  - Muestra también un “resumen de fallos por vivienda”.  
  - Si ninguna cumple, saca un mensaje indicando que no hay viviendas adecuadas. 

## Organización de ficheros (sugerida)

Aunque todo el código viene de un único texto CLIPS, una estructura típica del repo podría ser: 

- `src/`
  - `input.clp`
  - `abstraccion.clp`
  - `heuristicas.clp`
  - `refinamiento.clp`
  - `salida.clp`
  - `main.clp` (regla `MAINinicio` y cargas de módulos)
- `docs/`
  - `Informe.pdf` (memoria de la práctica). 
  - Ontología exportada de Protégé (si la tienes). 

Y un `practica-viviendas.clp` que haga los `load`/`require` de todos los módulos. 

## Cómo ejecutar

Requisitos: tener CLIPS instalado. 

1. Abrir CLIPS.  
2. Cargar el fichero principal, por ejemplo:  
