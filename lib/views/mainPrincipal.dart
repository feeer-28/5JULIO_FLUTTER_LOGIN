import 'package:flutter/material.dart';
import 'package:flutter_application_junio5/views/medioPago.dart';
import 'package:flutter_application_junio5/views/menuDrawrs.dart';
import 'detalleVehiculo.dart'; 

class MenuPrincipal extends StatefulWidget {
  const MenuPrincipal({super.key});

  @override
  State<MenuPrincipal> createState() => _MenuPrincipalState();
}

class _MenuPrincipalState extends State<MenuPrincipal> {
  final Color fondo = const Color(0xFF60B5FF);
  final Color primario = Color(0xFF3A7DFF);
  final Color secundario = const Color(0xFFFFECDE);
  final Color detalle = const Color(0xFFFF9149);
  final Color texto = const Color(0xFF000000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fondo,
      appBar: AppBar(
        title: Text("alquiler de vehiculos"),
        backgroundColor: primario,
        foregroundColor: texto,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: texto),
                hintText: "Buscar vehiculo",
                // ignore: deprecated_member_use
                hintStyle: TextStyle(color: texto.withOpacity(0.5)),
                filled: true,
                fillColor: secundario,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: listaAutos.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Image.network(
                      listaAutos[index]["imageUrl"],
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      "${listaAutos[index]["marca"]} ${listaAutos[index]["modelo"]}",
                      style: TextStyle(color: texto, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Año: ${listaAutos[index]["anio"]}"),
                        Text("Precio por día: \$${listaAutos[index]["precio"]}"),
                        Text(
                          "Disponibilidad: ${listaAutos[index]["disponibilidad"] ? "Disponible" : "No disponible"}",
                          style: TextStyle(
                            color: listaAutos[index]["disponibilidad"]
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.arrow_forward),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetalleVehiculo(
                              marca: listaAutos[index]["marca"],
                              modelo: listaAutos[index]["modelo"],
                              anio: listaAutos[index]["anio"],
                              disponible: listaAutos[index]["disponibilidad"],
                              imagenUrl: listaAutos[index]["imageUrl"],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                  },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, 
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Usuario',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment),
            label: 'Pago',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.car_rental),
            label: 'Alquiler',
          ),
        ],
        onTap: (value) => {
          if (value == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MenuPrincipal()),
            )
          } else if (value == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PerfilUsuario()), 
            )
          } else if (value == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MedioPago()), 
            )
          } else if (value == 3) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Funcionalidad de Alquiler no implementada')),
            )
          }
        },
      ),
    );
  }
}

/// Lista de autos
final List<Map<String, dynamic>> listaAutos = [
  {
    "imageUrl": "https://picsum.photos/300/200?1",
    "marca": "Toyota",
    "modelo": "Corolla",
    "anio": 2020,
    "disponibilidad": true,
    "precio": 150.0,
  },
  {
    "imageUrl": "https://picsum.photos/300/200?2",
    "marca": "Honda",
    "modelo": "Civic",
    "anio": 2019,
    "disponibilidad": false,
    "precio": 140.0,
  },
  {
    "imageUrl": "https://picsum.photos/300/200?3",
    "marca": "Ford",
    "modelo": "Focus",
    "anio": 2018,
    "disponibilidad": true,
    "precio": 130.0,
  },
  {
    "imageUrl": "https://picsum.photos/300/200?4",
    "marca": "Chevrolet",
    "modelo": "Cruze",
    "anio": 2021,
    "disponibilidad": true,
    "precio": 160.0,
  },
  {
    "imageUrl": "https://picsum.photos/300/200?5",
    "marca": "Nissan",
    "modelo": "Sentra",
    "anio": 2017,
    "disponibilidad": false,
    "precio": 120.0,
  },
  {
    "imageUrl": "https://picsum.photos/300/200?6",
    "marca": "Mazda",
    "modelo": "3",
    "anio": 2022,
    "disponibilidad": true,
    "precio": 170.0,
  },
  {
    "imageUrl": "https://picsum.photos/300/200?7",
    "marca": "Volkswagen",
    "modelo": "Jetta",
    "anio": 2019,
    "disponibilidad": true,
    "precio": 145.0,
  },
  {
    "imageUrl": "https://picsum.photos/300/200?8",
    "marca": "Hyundai",
    "modelo": "Elantra",
    "anio": 2020,
    "disponibilidad": false,
    "precio": 135.0,
  },
  {
    "imageUrl": "https://picsum.photos/300/200?9",
    "marca": "Kia",
    "modelo": "Rio",
    "anio": 2018,
    "disponibilidad": true,
    "precio": 125.0,
  },
  {
    "imageUrl": "https://picsum.photos/300/200?10",
    "marca": "Renault",
    "modelo": "Logan",
    "anio": 2021,
    "disponibilidad": true,
    "precio": 155.0,
  },
  {
    "imageUrl": "https://picsum.photos/300/200?11",
    "marca": "Peugeot",
    "modelo": "208",
    "anio": 2017,
    "disponibilidad": false,
    "precio": 115.0,
  },
  {
    "imageUrl": "https://picsum.photos/300/200?12",
    "marca": "Fiat",
    "modelo": "Argo",
    "anio": 2022,
    "disponibilidad": true,
    "precio": 165.0,
  },
  {
    "imageUrl": "https://picsum.photos/300/200?13",
    "marca": "BMW",
    "modelo": "Serie 3",
    "anio": 2020,
    "disponibilidad": true,
    "precio": 250.0,
  },
  {
    "imageUrl": "https://picsum.photos/300/200?15",
    "marca": "Audi",
    "modelo": "A4",
    "anio": 2021,
    "disponibilidad": true,
    "precio": 260.0,
  },
];
