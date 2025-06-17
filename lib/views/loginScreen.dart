import 'package:flutter/material.dart';
import 'package:flutter_application_junio5/views/mainPrincipal.dart';
import 'registroUsuario.dart'; 

class LoginScreen extends StatefulWidget {
    const LoginScreen({super.key});

    @override
    State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
    final Color fondo = const Color(0xFF60B5FF);
    final Color encabezado = Color(0xFF3A7DFF);
    final Color campos = const Color(0xFFFFECDE);
    final Color botones = const Color(0xFFFF9149);
    final Color texto = const Color(0xFF000000);
    

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: fondo,
            body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView(
                shrinkWrap: true,
                children: [
                Icon(Icons.person_pin, size: 100, color: botones),
                SizedBox(height: 20),
                Text("Bienvenido", 
                    style: TextStyle(
                        fontSize: 30, 
                        color: campos, 
                        fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text("inicia sesion para continuar", 
                    style: TextStyle(
                        fontSize: 20, 
                        color: texto, 
                        fontWeight: FontWeight.w400
                    ),
                    textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                TextField(
                    style: TextStyle(color: texto),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: campos,
                        labelText: "Correo Electronico",
                        labelStyle: TextStyle(color: texto),
                        prefixIcon: Icon(Icons.email, color: texto),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                        ),
                        
                    )
                    ,
                    ),
                SizedBox(height: 20),
                TextField(
                    obscureText: true,
                    style: TextStyle(color: texto),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: campos,
                        labelText: "Contraseña",
                        labelStyle: TextStyle(color: texto),
                        prefixIcon: Icon(Icons.lock, color: texto),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                        ),
                    ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => MenuPrincipal()
                        ));},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: botones,
                        minimumSize: Size(double.infinity, 50),
                    ),
                    child: Text(
                        "Iniciar Sesion",
                        style: TextStyle(
                        color: texto,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        ),
                    ),
                ),
                SizedBox(height: 20),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                            Text(
                                "¿olvidaste tu contraseña?",
                                style: TextStyle(
                                    color: texto,
                                    fontSize: 16,
                                ),
                            ),
                            /*GestureDetector(
                                onTap: () {
                                },
                                child: Text(
                                    " Recuperar",
                                    style: TextStyle(
                                        color: botones,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                    ),
                                ),
                            ),*/
                            TextButton(
                                onPressed: () {
                                    
                                },
                                child: Text(
                                    " Recuperar",
                                    style: TextStyle(
                                        color: botones,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                    ),
                                ),
                            ),
                                SizedBox(width: 20,),
                            ],
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                Text(
                                    "¿No tienes una cuenta?",
                                    style: TextStyle(
                                        color: texto,
                                        fontSize: 16,
                                    ),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const RegistroScreen(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                        " Registrate",
                                        style: TextStyle(
                                            color: botones,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                        ),
                                    ),
                                ),
                            ],
                        ),
                SizedBox(height: 20),
                    ],
                ),
            ),
        );
    }
    }