import 'package:flutter/material.dart';
import 'registro_estudiante.dart';
import 'registro_organizador.dart';
import 'registro_administrador.dart';

class SeleccionRolScreen extends StatelessWidget {
  const SeleccionRolScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color verde = const Color(0xFF7AA129);
    final Color azul = const Color(0xFF2F2C79);

    void navegar(Widget pantalla) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => pantalla),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              '¿A qué sector perteneces?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            _botonSector(
              context,
              label: 'Estudiante UCOL',
              color: azul,
              onTap: () => navegar(const RegistroEstudianteScreen()),
            ),
            _botonSector(context, label: 'Estudiante de otra institución'),
            _botonSector(context, label: 'Trabajador UCOL'),
            _botonSector(context, label: 'Docente UCOL'),
            _botonSector(context, label: 'Adulta mayor'),
            _botonSector(context, label: 'Persona con discapacidad'),
            _botonSector(context, label: 'Público general'),
            _botonSector(
              context,
              label: 'Grupo escolar (primaria y kinder)',
              onTap: () => navegar(const RegistroOrganizadorScreen()),
            ),
            _botonSector(
              context,
              label: 'Administrador',
              onTap: () => navegar(const RegistroAdministradorScreen()),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: verde,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              onPressed: () {
                // Puede agregar validación futura
              },
              child: const Text('Continuar', style: TextStyle(color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }

  Widget _botonSector(BuildContext context,
      {required String label, Color? color, void Function()? onTap}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
          decoration: BoxDecoration(
            color: color ?? Colors.grey.shade100,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: color != null ? Colors.white : Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
