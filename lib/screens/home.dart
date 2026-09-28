import 'package:flutter/material.dart';
import 'citas.dart';
import 'medicamentos.dart';
import 'historial.dart';
import 'perfil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _irA(BuildContext context, Widget pantalla) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => pantalla,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text(
          'SmartHealth Connect',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              _irA(context, const PerfilScreen());
            },
            icon: const Icon(Icons.person_outline),
            tooltip: 'Perfil',
          ),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(18, 20, 18, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Encabezado de bienvenida
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
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
                child: Row(
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Image.asset(
                        'assets/images/logo2.png',
                        fit: BoxFit.contain,
                      ),
                    ),

                    const SizedBox(width: 16),

                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hola, Hugo 👋',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            'Cuida tu salud, estés donde estés.',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // Título
              const Text(
                '¿Cómo te sientes hoy?',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F2937),
                ),
              ),

              const SizedBox(height: 8),

              Text(
                'Administra fácilmente tu información de salud.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                ),
              ),

              const SizedBox(height: 22),

              // Resumen de salud
              Row(
                children: [
                  Expanded(
                    child: _resumenCard(
                      icono: Icons.calendar_month_outlined,
                      titulo: 'Citas',
                      valor: '2',
                      color: Colors.blue,
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: _resumenCard(
                      icono: Icons.medication_outlined,
                      titulo: 'Medicamentos',
                      valor: '3',
                      color: Colors.green,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              const Text(
                'Accesos rápidos',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F2937),
                ),
              ),

              const SizedBox(height: 14),

              // Citas
              _opcionMenu(
                context: context,
                icono: Icons.calendar_month_outlined,
                titulo: 'Citas médicas',
                descripcion: 'Gestiona tus consultas y citas',
                color: Colors.blue,
                pantalla: const CitasScreen(),
              ),

              const SizedBox(height: 14),

              // Medicamentos
              _opcionMenu(
                context: context,
                icono: Icons.medication_outlined,
                titulo: 'Medicamentos',
                descripcion: 'Controla tus medicamentos',
                color: Colors.green,
                pantalla: const MedicamentosScreen(),
              ),

              const SizedBox(height: 14),

              // Historial
              _opcionMenu(
                context: context,
                icono: Icons.description_outlined,
                titulo: 'Historial médico',
                descripcion: 'Consulta tus registros médicos',
                color: Colors.orange,
                pantalla: const HistorialScreen(),
              ),

              const SizedBox(height: 14),

              // Perfil
              _opcionMenu(
                context: context,
                icono: Icons.person_outline,
                titulo: 'Mi perfil',
                descripcion: 'Administra tu información personal',
                color: Colors.purple,
                pantalla: const PerfilScreen(),
              ),

              const SizedBox(height: 25),

              // Mensaje inferior
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
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.green.shade50,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.favorite_outline,
                        color: Colors.green.shade600,
                      ),
                    ),

                    const SizedBox(width: 14),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Tu salud es importante',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Mantén tu información médica actualizada.',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _resumenCard({
    required IconData icono,
    required String titulo,
    required String valor,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.10),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icono,
              color: color,
              size: 24,
            ),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  valor,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  titulo,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _opcionMenu({
    required BuildContext context,
    required IconData icono,
    required String titulo,
    required String descripcion,
    required Color color,
    required Widget pantalla,
  }) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () => _irA(context, pantalla),
        child: Container(
          padding: const EdgeInsets.all(17),
          decoration: BoxDecoration(
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
                  color: color.withOpacity(0.10),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(
                  icono,
                  color: color,
                  size: 29,
                ),
              ),

              const SizedBox(width: 15),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      titulo,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      descripcion,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),

              Icon(
                Icons.chevron_right,
                color: Colors.grey.shade400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}