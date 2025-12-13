import random

# Lista de tipos de servicios
tipos_servicio = [
    "hospital",
    "zonaVerde",
    "centro",
    "ocio_nocturno",
    "transporte_publico",
    "zona_comercial",
    "supermercado",
    "centro_educativo",
    "ocio"
]

# Número de instancias por tipo (1 a 3)
min_inst = 7
max_inst = 10

# Rango de coordenadas similar a las viviendas
coord_min = 0
coord_max = 2000

# Generar instancias
print("(definstances INPUT::servicios_auto\n")

servicio_id = 1
for tipo in tipos_servicio:
    num_instancias = random.randint(min_inst, max_inst)
    for i in range(num_instancias):
        nombre = f"{tipo.capitalize()}_{servicio_id}"
        coordX = random.randint(coord_min, coord_max)
        coordY = random.randint(coord_min, coord_max)
        print(f"   ([{nombre}] of INPUT::Servicio")
        print(f"       (tipo {tipo}) (coordX {coordX}) (coordY {coordY})")
        print("   )\n")
        servicio_id += 1

print(")")
