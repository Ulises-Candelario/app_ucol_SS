import 'package:flutter/material.dart';


class RegistroAdministradorScreen extends StatefulWidget {
  const RegistroAdministradorScreen({super.key});

  @override
  State<RegistroAdministradorScreen> createState() => _RegistroAdministradorScreenState();
}

class _RegistroAdministradorScreenState extends State<RegistroAdministradorScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nombreCtrl = TextEditingController();
  final _apellidosCtrl = TextEditingController();
  final _correoCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  String? rolSeleccionado;
  final List<String> rolesAdmin = [
    'Administrador Principal',
    'Invitado',
    'Gestor',
    'Tallerista'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 60),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text('Registro de información',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Icon(Icons.admin_panel_settings, color: Color(0xFF2F2C79), size: 36),
              const SizedBox(height: 30),

              _input("Nombre(s)", _nombreCtrl),
              _input("Apellidos", _apellidosCtrl),
              _input("Correo electrónico institucional", _correoCtrl),
              _input("Contraseña (8 caracteres mín.)", _passCtrl, obscure: true),

              _dropdown("Rol administrativo", rolesAdmin, rolSeleccionado,
                  (val) => setState(() => rolSeleccionado = val)),

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
