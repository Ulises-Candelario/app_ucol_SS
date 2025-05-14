import 'package:flutter/material.dart';

class RegistroOrganizadorScreen extends StatefulWidget {
  const RegistroOrganizadorScreen({super.key});

  @override
  State<RegistroOrganizadorScreen> createState() => _RegistroOrganizadorScreenState();
}

class _RegistroOrganizadorScreenState extends State<RegistroOrganizadorScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nombreCtrl = TextEditingController();
  final _apellidosCtrl = TextEditingController();
  final _correoCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  final _telefonoCtrl = TextEditingController();
  final _actividadCtrl = TextEditingController();
  final _eventoCtrl = TextEditingController();
  final _programaCtrl = TextEditingController();
  final _lugarCtrl = TextEditingController();
  final _fechaHoraCtrl = TextEditingController();

  String? acreditaSeleccion;
  String? cuotaSeleccion;

  final List<String> opcionesSiNo = ['Sí', 'No'];

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
              const Icon(Icons.person, color: Color(0xFF2F2C79), size: 36),
              const SizedBox(height: 30),

              _input("Nombre(s)", _nombreCtrl),
              _input("Apellidos", _apellidosCtrl),
              _input("Correo electrónico", _correoCtrl),
              _input("Contraseña (8 caracteres mín.)", _passCtrl, obscure: true),
              _input("+52 Núm teléfono", _telefonoCtrl),
              _input("Actividad gestionada (Taller, curso, etc)", _actividadCtrl),

              const Divider(height: 40),
              _input("Nombre del evento", _eventoCtrl),
              _input("Programa", _programaCtrl),
              _input("Lugar", _lugarCtrl),
              _input("Fecha y horario", _fechaHoraCtrl),

              _dropdown("¿Acredita culturales y deportivas?", opcionesSiNo, acreditaSeleccion,
                  (val) => setState(() => acreditaSeleccion = val)),
              _dropdown("¿Requiere cuota de recuperación?", opcionesSiNo, cuotaSeleccion,
                  (val) => setState(() => cuotaSeleccion = val)),

              const SizedBox(height: 12),
              _botonSubirFlyer(),
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

  Widget _botonSubirFlyer() {
    return ElevatedButton.icon(
      onPressed: () {
        // TODO: Lógica para subir archivo
      },
      icon: const Icon(Icons.upload_file),
      label: const Text('Subir Flyer del evento'),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF2F2C79),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
