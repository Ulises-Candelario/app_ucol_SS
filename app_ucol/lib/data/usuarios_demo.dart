// lib/data/usuarios_demo.dart

enum UserRole { publico, estudiante, organizador, administrador }

class UsuarioDemo {
  final String nombre;
  final String correo;
  final String password;
  final UserRole rol;
  final String? numeroCuenta; // solo para estudiantes

  UsuarioDemo({
    required this.nombre,
    required this.correo,
    required this.password,
    required this.rol,
    this.numeroCuenta,
  });
}

final List<UsuarioDemo> usuariosDemo = [
  UsuarioDemo(
    nombre: 'Juan Pérez',
    correo: 'juan@correo.com',
    password: '1234',
    rol: UserRole.publico,
  ),
  UsuarioDemo(
    nombre: 'Ana López',
    correo: 'ana@estudiantes.ucol.mx',
    password: '5678',
    rol: UserRole.estudiante,
    numeroCuenta: '2023123456',
  ),
  UsuarioDemo(
    nombre: 'Luis García',
    correo: 'lgarcia@ucol.mx',
    password: 'admin123',
    rol: UserRole.organizador,
  ),
  UsuarioDemo(
    nombre: 'Admin General',
    correo: 'admin@ucol.mx',
    password: 'admin2024',
    rol: UserRole.administrador,
  ),
];
