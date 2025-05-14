import 'package:flutter/material.dart';
import '../data/usuarios_demo.dart';
import 'registro/seleccion_rol_screen.dart';
import '../animations/fade_in_animation.dart';

enum UserType { publico, estudiante, organizador, administrador }

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  UserType selectedUser = UserType.publico;

  final Color primaryColor = const Color(0xFF2F2C79);
  final Color greenButton = const Color(0xFF7AA129);

  final TextEditingController nombreCtrl = TextEditingController();
  final TextEditingController correoCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();
  final TextEditingController cuentaCtrl = TextEditingController();

  String? errorMsg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 60),
        child: Column(
          children: [
            FadeInAnimation(
              child: const Text(
                'Inicia Sesión',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 30),
            FadeInAnimation(
              duration: const Duration(milliseconds: 600),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: UserType.values.map((type) {
                  final bool isSelected = selectedUser == type;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedUser = type;
                        errorMsg = null;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      width: isSelected ? 58 : 50,
                      height: isSelected ? 58 : 50,
                      decoration: BoxDecoration(
                        color: isSelected ? primaryColor : Colors.grey.shade200,
                        shape: BoxShape.circle,
                        boxShadow: isSelected
                            ? [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.15),
                                  blurRadius: 6,
                                  offset: const Offset(0, 3),
                                )
                              ]
                            : [],
                      ),
                      child: AnimatedScale(
                        duration: const Duration(milliseconds: 250),
                        scale: isSelected ? 1.15 : 1.0,
                        child: Icon(
                          _getIconForUserType(type),
                          color: isSelected ? Colors.white : Colors.black54,
                          size: 28,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 30),
            FadeInAnimation(
              duration: const Duration(milliseconds: 700),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                ),
                child: Center(
                  child: Text(
                    _getFormTitle(selectedUser),
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            FadeInAnimation(
              duration: const Duration(milliseconds: 750),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: const BorderRadius.vertical(bottom: Radius.circular(12)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    )
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: _buildForm(),
              ),
            ),
            const SizedBox(height: 30),
            FadeInAnimation(
              duration: const Duration(milliseconds: 800),
              child: _buildUserSelector(),
            ),
            if (errorMsg != null)
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Text(
                  errorMsg!,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            const SizedBox(height: 20),
            FadeInAnimation(
              duration: const Duration(milliseconds: 900),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: greenButton,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    bool isValid = false;

                    for (var user in usuariosDemo) {
                      if (user.rol.name == selectedUser.name) {
                        if (selectedUser == UserType.estudiante) {
                          if (user.numeroCuenta == cuentaCtrl.text.trim() &&
                              user.password == passwordCtrl.text.trim()) {
                            isValid = true;
                            break;
                          }
                        } else {
                          if (user.nombre == nombreCtrl.text.trim() &&
                              user.correo == correoCtrl.text.trim() &&
                              user.password == passwordCtrl.text.trim()) {
                            isValid = true;
                            break;
                          }
                        }
                      }
                    }

                    setState(() {
                      errorMsg = isValid ? null : 'Datos incorrectos o usuario no válido.';
                    });

                    if (isValid) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Inicio de sesión exitoso')),
                      );
                    }
                  },
                  child: const Text(
                    'Continuar',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            FadeInAnimation(
              duration: const Duration(milliseconds: 950),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("¿No tienes cuenta? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SeleccionRolScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Regístrate",
                      style: TextStyle(
                        color: Color(0xFF2F2C79),
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getIconForUserType(UserType type) {
    switch (type) {
      case UserType.estudiante:
        return Icons.school;
      case UserType.organizador:
        return Icons.event;
      case UserType.administrador:
        return Icons.admin_panel_settings;
      case UserType.publico:
      default:
        return Icons.groups;
    }
  }

  String _getFormTitle(UserType type) {
    switch (type) {
      case UserType.estudiante:
        return "Estudiantes";
      case UserType.organizador:
        return "Organizador de Eventos";
      case UserType.administrador:
        return "Administrador";
      case UserType.publico:
      default:
        return "Público General";
    }
  }

  Widget _buildUserSelector() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: UserType.values.map((type) {
          final bool isSelected = selectedUser == type;
          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedUser = type;
                  errorMsg = null;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: isSelected ? primaryColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: AnimatedScale(
                    scale: isSelected ? 1.1 : 1.0,
                    duration: const Duration(milliseconds: 250),
                    child: Text(
                      _getSelectorLabel(type),
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  String _getSelectorLabel(UserType type) {
    switch (type) {
      case UserType.publico:
        return "Público";
      case UserType.estudiante:
        return "Estudiante";
      case UserType.organizador:
        return "Organizador";
      case UserType.administrador:
        return "Administrador";
    }
  }

  Widget _buildForm() {
    switch (selectedUser) {
      case UserType.estudiante:
        return Column(
          children: [
            _customField("Número de cuenta"),
            _customField("Contraseña", obscure: true),
          ],
        );
      case UserType.organizador:
      case UserType.administrador:
      case UserType.publico:
      default:
        return Column(
          children: [
            _customField("Nombre"),
            _customField("Correo electrónico"),
            _customField("Contraseña", obscure: true),
          ],
        );
    }
  }

  Widget _customField(String hint, {bool obscure = false}) {
    final controller = hint == "Número de cuenta"
        ? cuentaCtrl
        : hint == "Correo electrónico"
            ? correoCtrl
            : hint == "Contraseña"
                ? passwordCtrl
                : nombreCtrl;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
