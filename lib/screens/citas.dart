import 'package:flutter/material.dart';

class CitasScreen extends StatefulWidget {
  const CitasScreen({super.key});

  @override
  State<CitasScreen> createState() => _CitasScreenState();
}

class _CitasScreenState extends State<CitasScreen> {
  final List<String> especialidades = [
    'Cardiología',
    'Nutrición',
    'Pediatría',
    'Dermatología',
    'Psicología',
    'Medicina General',
  ];

  final List<Map<String, String>> citas = [
    {
      'doctor': 'Dr. Juan Pérez',
      'especialidad': 'Cardiología',
      'fecha': '20 junio 2026',
      'hora': '10:30 AM',
    },
    {
      'doctor': 'Dra. Ana López',
      'especialidad': 'Nutrición',
      'fecha': '25 junio 2026',
      'hora': '12:00 PM',
    },
  ];

  Future<void> mostrarFormulario({int? indice}) async {
    final doctorController = TextEditingController(
      text: indice != null ? citas[indice]['doctor'] : '',
    );

    String especialidadSeleccionada =
        indice != null ? citas[indice]['especialidad']! : especialidades.first;

    String fechaSeleccionada =
        indice != null ? citas[indice]['fecha']! : '';

    String horaSeleccionada =
        indice != null ? citas[indice]['hora']! : '';

    await showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, actualizarDialogo) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              title: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      indice == null
                          ? Icons.add_circle_outline
                          : Icons.edit_outlined,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    indice == null ? 'Nueva cita' : 'Editar cita',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 10),

                    TextField(
                      controller: doctorController,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        labelText: 'Nombre del doctor',
                        hintText: 'Ej. Dr. Juan Pérez',
                        prefixIcon: const Icon(Icons.person_outline),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    DropdownButtonFormField<String>(
                      value: especialidadSeleccionada,
                      decoration: InputDecoration(
                        labelText: 'Especialidad',
                        prefixIcon: const Icon(Icons.medical_services_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      items: especialidades.map((especialidad) {
                        return DropdownMenuItem<String>(
                          value: especialidad,
                          child: Text(especialidad),
                        );
                      }).toList(),
                      onChanged: (valor) {
                        if (valor != null) {
                          actualizarDialogo(() {
                            especialidadSeleccionada = valor;
                          });
                        }
                      },
                    ),

                    const SizedBox(height: 16),

                    InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () async {
                        final fecha = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2035),
                        );

                        if (fecha != null) {
                          const meses = [
                            'enero',
                            'febrero',
                            'marzo',
                            'abril',
                            'mayo',
                            'junio',
                            'julio',
                            'agosto',
                            'septiembre',
                            'octubre',
                            'noviembre',
                            'diciembre',
                          ];

                          actualizarDialogo(() {
                            fechaSeleccionada =
                                '${fecha.day} ${meses[fecha.month - 1]} ${fecha.year}';
                          });
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.calendar_month_outlined,
                              color: Colors.blue,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Fecha',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    fechaSeleccionada.isEmpty
                                        ? 'Seleccionar fecha'
                                        : fechaSeleccionada,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: fechaSeleccionada.isEmpty
                                          ? Colors.grey.shade600
                                          : Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(
                              Icons.chevron_right,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () async {
                        final hora = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );

                        if (hora != null) {
                          actualizarDialogo(() {
                            horaSeleccionada = hora.format(context);
                          });
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.access_time_outlined,
                              color: Colors.orange,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Hora',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    horaSeleccionada.isEmpty
                                        ? 'Seleccionar hora'
                                        : horaSeleccionada,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: horaSeleccionada.isEmpty
                                          ? Colors.grey.shade600
                                          : Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(
                              Icons.chevron_right,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              actionsPadding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancelar'),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    if (doctorController.text.trim().isEmpty ||
                        fechaSeleccionada.isEmpty ||
                        horaSeleccionada.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Completa todos los campos.',
                          ),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                      return;
                    }

                    setState(() {
                      final nuevaCita = {
                        'doctor': doctorController.text.trim(),
                        'especialidad': especialidadSeleccionada,
                        'fecha': fechaSeleccionada,
                        'hora': horaSeleccionada,
                      };

                      if (indice == null) {
                        citas.add(nuevaCita);
                      } else {
                        citas[indice] = nuevaCita;
                      }
                    });

                    Navigator.pop(context);

                    ScaffoldMessenger.of(this.context).showSnackBar(
                      SnackBar(
                        content: Text(
                          indice == null
                              ? 'Cita agregada correctamente'
                              : 'Cita actualizada correctamente',
                        ),
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.green.shade600,
                      ),
                    );
                  },
                  icon: const Icon(Icons.save_outlined),
                  label: const Text('Guardar'),
                ),
              ],
            );
          },
        );
      },
    );

    doctorController.dispose();
  }

  Future<void> eliminarCita(int index) async {
    final doctor = citas[index]['doctor'];

    final confirmar = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text(
            'Eliminar cita',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Text(
            '¿Deseas eliminar la cita de $doctor?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Eliminar'),
            ),
          ],
        );
      },
    );

    if (confirmar == true) {
      setState(() {
        citas.removeAt(index);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Cita eliminada correctamente'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  Widget construirCitaCard(
    Map<String, String> cita,
    int index,
  ) {
    return Card(
      elevation: 2,
      shadowColor: Colors.black12,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.person,
                    color: Colors.blue,
                    size: 30,
                  ),
                ),

                const SizedBox(width: 14),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cita['doctor']!,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        cita['especialidad']!,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),

                PopupMenuButton<String>(
                  onSelected: (valor) {
                    if (valor == 'editar') {
                      mostrarFormulario(indice: index);
                    } else if (valor == 'eliminar') {
                      eliminarCita(index);
                    }
                  },
                  itemBuilder: (context) => const [
                    PopupMenuItem(
                      value: 'editar',
                      child: Row(
                        children: [
                          Icon(Icons.edit_outlined),
                          SizedBox(width: 10),
                          Text('Editar'),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 'eliminar',
                      child: Row(
                        children: [
                          Icon(
                            Icons.delete_outline,
                            color: Colors.red,
                          ),
                          SizedBox(width: 10),
                          Text('Eliminar'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 18),

            const Divider(),

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: _datoCita(
                    Icons.calendar_month_outlined,
                    'Fecha',
                    cita['fecha']!,
                    Colors.green,
                  ),
                ),
                Container(
                  height: 45,
                  width: 1,
                  color: Colors.grey.shade300,
                ),
                Expanded(
                  child: _datoCita(
                    Icons.access_time_outlined,
                    'Hora',
                    cita['hora']!,
                    Colors.orange,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _datoCita(
    IconData icono,
    String titulo,
    String valor,
    Color color,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Icon(
            icono,
            color: color,
            size: 22,
          ),
          const SizedBox(width: 10),
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
                    fontSize: 14,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mis citas',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Gestiona tus citas médicas',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),

      body: citas.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.calendar_month_outlined,
                        size: 60,
                        color: Colors.blue.shade400,
                      ),
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      'No tienes citas registradas',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      'Agrega una nueva cita para comenzar.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
            )
          : ListView(
              padding: const EdgeInsets.all(18),
              children: [
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF1976D2),
                        Color(0xFF42A5F5),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        color: Colors.white,
                        size: 35,
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Tus citas médicas',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${citas.length} ${citas.length == 1 ? 'cita registrada' : 'citas registradas'}',
                              style: const TextStyle(
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 22),

                const Text(
                  'Próximas citas',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 14),

                ...List.generate(
                  citas.length,
                  (index) => construirCitaCard(
                    citas[index],
                    index,
                  ),
                ),
              ],
            ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => mostrarFormulario(),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: const Text(
          'Nueva cita',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}