import re

def calcular_porcentajes(ruta_fichero):
    # Clases posibles
    clases = ["Muy_Recomendable", "Adecuado", "Parcialmente_Adecuado", "Sin-Clasificar"]
    conteo = {c: 0 for c in clases}

    # Leer todo el archivo
    with open(ruta_fichero, "r", encoding="utf-8") as f:
        texto = f.read()

    # Buscar la sección del resumen de fallos
    patron_seccion = r"=== RESUMEN DE FALLOS POR VIVIENDA ===(.*?)(?:\Z)"
    seccion = re.search(patron_seccion, texto, re.S)

    if not seccion:
        print("No se encontró la sección 'RESUMEN DE FALLOS POR VIVIENDA'.")
        return

    contenido = seccion.group(1)

    # Procesar línea a línea
    for linea in contenido.split("\n"):
        linea = linea.strip()
        if not linea:
            continue
        
        # Detectar la clase al inicio de cada línea
        for clase in clases:
            if linea.startswith(clase):
                conteo[clase] += 1
                break

    # Calcular totales
    total = sum(conteo.values())

    if total == 0:
        print("No se encontraron viviendas en el resumen.")
        return

    print("\n=== PORCENTAJES DE CLASIFICACIÓN ===")
    for clase, num in conteo.items():
        porcentaje = (num / total) * 100
        print(f"{clase}: {num} viviendas ({porcentaje:.2f}%)")



# ===========================
# Ejecución
# ===========================

ruta_archivo = "sortida.txt"   # <<--- pon el nombre de tu archivo
calcular_porcentajes(ruta_archivo)
