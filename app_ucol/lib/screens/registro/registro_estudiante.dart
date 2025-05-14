import 'package:flutter/material.dart';

class RegistroEstudianteScreen extends StatefulWidget {
  const RegistroEstudianteScreen({super.key});

  @override
  State<RegistroEstudianteScreen> createState() => _RegistroEstudianteScreenState();
}

class _RegistroEstudianteScreenState extends State<RegistroEstudianteScreen> {
  final _formKey = GlobalKey<FormState>();
  String? generoSeleccionado;

  final _nombreCtrl = TextEditingController();
  final _apellidosCtrl = TextEditingController();
  final _cuentaCtrl = TextEditingController();
  final _correoCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  final List<String> generos = ['Hombre', 'Mujer', 'Prefiero no decir'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 60),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text('Registro de información', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Icon(Icons.school, color: Color(0xFF2F2C79), size: 36),
              const SizedBox(height: 30),
              _input("Nombre(s)", _nombreCtrl),
              _input("Apellidos", _apellidosCtrl),
              _dropdown("Género", generos, generoSeleccionado, (val) => setState(() => generoSeleccionado = val)),
              _input("Número de cuenta", _cuentaCtrl),
              _input("Correo electrónico UCOL", _correoCtrl),
              _input("Contraseña (8 caracteres mín.)", _passCtrl, obscure: true),
              const SizedBox(height: 20),
              _botonContinuar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _input(String label, TextEditingController controller, {bool obscure = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: TextFormField(
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
    );
  }

  Widget _dropdown(String label, List<String> items, String? value, Function(String?) onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: DropdownButtonFormField<String>(
        value: value,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        ),
        items: items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
        onChanged: onChanged,
      ),
    );
  }

  Widget _botonContinuar() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF7AA129),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          // TODO: lógica de envío
        }
      },
      child: const Text('Continuar', style: TextStyle(color: Colors.white)),
    );
  }
}
