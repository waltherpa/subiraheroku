import 'package:flutter/material.dart';
import 'package:citas1/mainscreen.dart';
import 'package:citas1/inputscreen.dart';
import 'package:citas1/resumescree.dart';

void main() {
  runApp(const MisCitas());
}

class MisCitas extends StatelessWidget {
  const MisCitas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mis Citas',
      initialRoute: '/',
      routes: {
        '/': (context) => const LandingScreen(),
        '/main': (context) => const MainScreen(),
        '/inputdata': (context) => const InputScreen(),
        '/managerMatrix': (context) => const ResumeScreen(),
        // '/managerTable':(context) => ManagerTScreen(),
      },
    );
  }
}

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'CITAS DE MOTOS',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 30),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'ingreso',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(300, 10, 300, 0),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'nombre ususario'),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(300, 10, 300, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'contraseña'),
              ),
            ),
            TextButton(
              onPressed: () {
                // algo pasa aqui
              },
              child: const Text('olvidaste contraseña'),
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(300, 10, 300, 0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/main');
                },
                child: const Text('ingresar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
