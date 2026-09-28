import 'package:flutter/material.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),

      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Mi perfil',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            // Perfil principal
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF1976D2),
                    Color(0xFF42A5F5),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.20),
                    blurRadius: 15,
                    offset: const Offset(0, 7),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    width: 105,
                    height: 105,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 4,
                      ),
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 65,
                      color: Colors.blue,
                    ),
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    'Hugo Martínez',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  const Text(
                    'hugo.martinez@email.com',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),

                  const SizedBox(height: 18),

                  OutlinedButton.icon(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: const BorderSide(
                        color: Colors.white,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    icon: const Icon(Icons.edit_outlined),
                    label: const Text('Editar perfil'),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // Información personal
            _tituloSeccion(
              icono: Icons.person_outline,
              titulo: 'Información personal',
            ),

            const SizedBox(height: 12),

            _informacionCard(
              icono: Icons.person_outline,
              titulo: 'Nombre completo',
              valor: 'Hugo Martínez',
              color: Colors.blue,
            ),

            _informacionCard(
              icono: Icons.cake_outlined,
              titulo: 'Fecha de nacimiento',
              valor: '15 marzo 2005',
              color: Colors.pink,
            ),

            _informacionCard(
              icono: Icons.phone_outlined,
              titulo: 'Teléfono',
              valor: '771 123 4567',
              color: Colors.green,
            ),

            _informacionCard(
              icono: Icons.email_outlined,
              titulo: 'Correo electrónico',
              valor: 'hugo.martinez@email.com',
              color: Colors.orange,
            ),

            _informacionCard(
              icono: Icons.location_on_outlined,
              titulo: 'Dirección',
              valor: 'Pachuca, Hidalgo',
              color: Colors.purple,
            ),

            const SizedBox(height: 18),

            // Información médica
            _tituloSeccion(
              icono: Icons.medical_information_outlined,
              titulo: 'Información médica',
            ),

            const SizedBox(height: 12),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: Colors.grey.shade200,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Icon(
                      Icons.bloodtype_outlined,
                      color: Colors.red.shade600,
                      size: 30,
                    ),
                  ),

                  const SizedBox(width: 15),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tipo de sangre',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'O+',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'O+',
                      style: TextStyle(
                        color: Colors.red.shade700,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // Opciones
            _tituloSeccion(
              icono: Icons.settings_outlined,
              titulo: 'Opciones',
            ),

            const SizedBox(height: 12),

            _opcion(
              icono: Icons.notifications_outlined,
              titulo: 'Notificaciones',
              subtitulo: 'Configura tus recordatorios',
              color: Colors.blue,
              onTap: () {},
            ),

            _opcion(
              icono: Icons.lock_outline,
              titulo: 'Privacidad y seguridad',
              subtitulo: 'Administra la seguridad de tu cuenta',
              color: Colors.orange,
              onTap: () {},
            ),

            _opcion(
              icono: Icons.help_outline,
              titulo: 'Ayuda',
              subtitulo: 'Preguntas frecuentes y soporte',
              color: Colors.green,
              onTap: () {},
            ),

            const SizedBox(height: 10),

            // Cerrar sesión
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  _mostrarCerrarSesion(context);
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red,
                  side: BorderSide(
                    color: Colors.red.shade200,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                icon: const Icon(Icons.logout),
                label: const Text(
                  'Cerrar sesión',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tituloSeccion({
    required IconData icono,
    required String titulo,
  }) {
    return Row(
      children: [
        Icon(
          icono,
          color: Colors.blue,
          size: 23,
        ),
        const SizedBox(width: 9),
        Text(
          titulo,
          style: const TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1F2937),
          ),
        ),
      ],
    );
  }

  Widget _informacionCard({
    required IconData icono,
    required String titulo,
    required String valor,
    required Color color,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: color.withOpacity(0.10),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icono,
              color: color,
              size: 23,
            ),
          ),

          const SizedBox(width: 13),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  valor,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _opcion({
    required IconData icono,
    required String titulo,
    required String subtitulo,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 5,
        ),
        leading: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: color.withOpacity(0.10),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icono,
            color: color,
          ),
        ),
        title: Text(
          titulo,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(subtitulo),
        trailing: Icon(
          Icons.chevron_right,
          color: Colors.grey.shade400,
        ),
        onTap: onTap,
      ),
    );
  }

  void _mostrarCerrarSesion(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text(
            'Cerrar sesión',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const Text(
            '¿Estás seguro de que deseas cerrar sesión?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Sesión cerrada'),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              child: const Text('Cerrar sesión'),
            ),
          ],
        );
      },
    );
  }
}