from faker import Faker
import random

fake = Faker()

N = 100

def yesno():
    return random.choice(["yes", "no"])

def abs_from_yesno(val):
    # Puedes adaptar esto a tu ontología
    return "True" if val == "yes" else "False"

print("(definstances viviendas_auto")

for i in range(1, N + 1):

    # Elegir tipo de vivienda
    tipo = random.choices(
        ["Vivienda", "ViviendaVertical", "Duplex"],
        weights=[0.5, 0.4, 0.1]  # puedes ajustar las probabilidades
    )[0]

    id_name = f"CasaAuto{i}"
    id_symbol = f"oAuto{i}"

    # Atributos comunes
    precio = random.randint(500, 2500)
    habitaciones = random.randint(1, 5)
    superficie = random.randint(30, 150)

    ascensor = yesno()
    mascotas = yesno()
    amueblado = yesno()
    piscina = yesno()
    aire = yesno()
    calef = yesno()
    garaje = yesno()
    vistas = yesno()
    terraza = yesno()
    balcon = yesno()
    soleado = yesno()

    fecha = random.randint(1960, 2024)
    coordX = random.randint(0, 2000)
    coordY = random.randint(0, 2000)

    # Comienzo instancia
    print(f"   ([{id_name}] of {tipo}")
    print(f"       (id {id_symbol})")
    print(f"       (precio {precio})")
    print(f"       (habitaciones {habitaciones})")
    print(f"       (superficie {superficie})")
    print(f"       (ascensor {ascensor})")
    print(f"       (mascotasPermitidas {mascotas})")
    print(f"       (amueblado {amueblado})")
    print(f"       (piscina {piscina})")
    print(f"       (aire_acondicionado {aire})")
    print(f"       (calefaccion {calef})")
    print(f"       (garaje {garaje})")
    print(f"       (buenas_vistas {vistas})")
    print(f"       (terraza {terraza})")
    print(f"       (balcon {balcon})")
    print(f"       (soleado {soleado})")
    print(f"       (fechaEdificacion {fecha})")
    print(f"       (coordX {coordX})")
    print(f"       (coordY {coordY})")

    # --- Campos extra según clase ---
    if tipo == "ViviendaVertical":
        planta = random.randint(1, 12)
        print(f"       (planta {planta})")
        print(f"       (atico {yesno()})")

    elif tipo == "Duplex":
        planta = random.randint(1, 12)
        numPlantas = random.randint(2, 3)
        print(f"       (planta {planta})")  
        print(f"       (numPlantas {numPlantas})")

    print("   )")  # fin de instancia
    print()

print(")")
