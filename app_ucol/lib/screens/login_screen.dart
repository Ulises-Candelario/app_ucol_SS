import 'package:flutter/material.dart';

enum UserType { publico, estudiante, organizador }

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  UserType selectedUser = UserType.publico;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 60),
        child: Column(
          children: [
            const Text(
              'Inicia Sesión',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),

            // 🔘 Selector de íconos (por ahora solo círculos de color)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: UserType.values.map((type) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedUser = type;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: selectedUser == type
                          ? const Color(0xFF6A993F)
                          : Colors.green.shade100,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      _getIconForUserType(type),
                      color: selectedUser == type ? Colors.white : Colors.green,
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 30),

            // 📋 Formulario dinámico
            _buildForm(),

            const SizedBox(height: 30),

            // 🔁 Toggle para seleccionar rol (texto)
            _buildUserSelector(),

            const SizedBox(height: 20),

            // ✅ Botón de continuar
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6A993F),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  // TODO: lógica de login
                },
                child: const Text(
                  'Continuar',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            )
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
        return Icons.person;
      case UserType.publico:
      default:
        return Icons.group;
    }
  }

  Widget _buildUserSelector() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
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
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFF6A993F) : Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    _getLabel(type),
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black87,
                      fontWeight: FontWeight.bold,
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

  String _getLabel(UserType type) {
    switch (type) {
      case UserType.publico:
        return "Público";
      case UserType.estudiante:
        return "Estudiante";
      case UserType.organizador:
        return "Organizador";
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextField(
        obscureText: obscure,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.grey.shade100,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
