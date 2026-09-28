import 'package:flutter/material.dart';

class HistorialScreen extends StatelessWidget {
  const HistorialScreen({super.key});

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
          'Historial médico',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(18, 20, 18, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Resumen
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
              child: const Row(
                children: [
                  Icon(
                    Icons.folder_shared_outlined,
                    color: Colors.white,
                    size: 48,
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mi historial médico',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Consulta tus registros y antecedentes médicos.',
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

            const SizedBox(height: 25),

            // Resumen de registros
            const Text(
              'Resumen',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F2937),
              ),
            ),

            const SizedBox(height: 14),

            Row(
              children: [
                Expanded(
                  child: _resumenCard(
                    icono: Icons.medical_services_outlined,
                    titulo: 'Consultas',
                    valor: '4',
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _resumenCard(
                    icono: Icons.science_outlined,
                    titulo: 'Estudios',
                    valor: '2',
                    color: Colors.green,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            const Text(
              'Registros recientes',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F2937),
              ),
            ),

            const SizedBox(height: 14),

            _registroCard(
              icono: Icons.medical_services_outlined,
              titulo: 'Consulta médica general',
              descripcion: 'Revisión general y seguimiento médico',
              fecha: '18 septiembre 2026',
              doctor: 'Dr. Carlos Ramírez',
              color: Colors.blue,
            ),

            _registroCard(
              icono: Icons.science_outlined,
              titulo: 'Análisis de sangre',
              descripcion: 'Estudio de laboratorio',
              fecha: '10 septiembre 2026',
              doctor: 'Laboratorio clínico',
              color: Colors.green,
            ),

            _registroCard(
              icono: Icons.favorite_outline,
              titulo: 'Consulta de cardiología',
              descripcion: 'Evaluación cardiovascular',
              fecha: '25 agosto 2026',
              doctor: 'Dra. Laura Hernández',
              color: Colors.red,
            ),

            _registroCard(
              icono: Icons.medication_outlined,
              titulo: 'Control de medicamentos',
              descripcion: 'Seguimiento del tratamiento actual',
              fecha: '12 agosto 2026',
              doctor: 'Dr. Carlos Ramírez',
              color: Colors.orange,
            ),

            const SizedBox(height: 25),

            // Antecedentes
            const Text(
              'Información médica',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F2937),
              ),
            ),

            const SizedBox(height: 14),

            _informacionCard(
              icono: Icons.bloodtype_outlined,
              titulo: 'Tipo de sangre',
              valor: 'O+',
              color: Colors.red,
            ),

            _informacionCard(
              icono: Icons.warning_amber_outlined,
              titulo: 'Alergias',
              valor: 'No registradas',
              color: Colors.orange,
            ),

            _informacionCard(
              icono: Icons.sick_outlined,
              titulo: 'Antecedentes médicos',
              valor: 'Sin antecedentes registrados',
              color: Colors.purple,
            ),

            const SizedBox(height: 25),

            // Botón
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Función para agregar un registro próximamente.',
                      ),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                icon: const Icon(Icons.add),
                label: const Text(
                  'Agregar registro',
                  style: TextStyle(
                    fontSize: 16,
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
        border: Border.all(
          color: Colors.grey.shade200,
        ),
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

  Widget _registroCard({
    required IconData icono,
    required String titulo,
    required String descripcion,
    required String fecha,
    required String doctor,
    required Color color,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: color.withOpacity(0.10),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              icono,
              color: color,
              size: 26,
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2937),
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

                const SizedBox(height: 10),

                Row(
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      size: 14,
                      color: Colors.grey.shade500,
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        fecha,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 5),

                Row(
                  children: [
                    Icon(
                      Icons.person_outline,
                      size: 14,
                      color: Colors.grey.shade500,
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        doctor,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ],
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
}