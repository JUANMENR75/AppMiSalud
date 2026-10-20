import 'package:flutter/material.dart';

class MedicamentosScreen extends StatefulWidget {
  const MedicamentosScreen({super.key});

  @override
  State<MedicamentosScreen> createState() => _MedicamentosScreenState();
}

class _MedicamentosScreenState extends State<MedicamentosScreen> {
  // Lista de prueba para los recordatorios de medicamentos
  final List<Map<String, dynamic>> _medicamentos = [
    {
      'nombre': 'Pastilla de la presión',
      'hora': '08:00 AM',
      'tomado': false,
    },
    {
      'nombre': 'Vitamina C',
      'hora': '09:00 AM',
      'tomado': true,
    },
    {
      'nombre': 'Ibuprofeno',
      'hora': '02:00 PM',
      'tomado': false,
    },
  ];

  Future<void> _mostrarFormulario({int? indice}) async {
    final nombreController = TextEditingController(
      text: indice != null ? _medicamentos[indice]['nombre'] : '',
    );

    String horaSeleccionada = indice != null ? _medicamentos[indice]['hora'] : '';

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
                  Expanded(
                    child: Text(
                      indice == null ? 'Nuevo medicamento' : 'Editar medicamento',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
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
                      controller: nombreController,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: InputDecoration(
                        labelText: 'Nombre del medicamento',
                        hintText: 'Ej. Paracetamol',
                        prefixIcon: const Icon(Icons.medication_liquid),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () async {
                        final TimeOfDay? hora = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );

                        if (hora != null) {
                          if (context.mounted) {
                            actualizarDialogo(() {
                              horaSeleccionada = hora.format(context);
                            });
                          }
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
                              Icons.access_time,
                              color: Colors.blue,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Hora de toma',
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
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                if (indice != null)
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _medicamentos.removeAt(indice);
                      });
                      Navigator.pop(context);
                    },
                    child: const Text('Eliminar', style: TextStyle(color: Colors.red)),
                  ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancelar', style: TextStyle(color: Colors.grey)),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (nombreController.text.trim().isEmpty || horaSeleccionada.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Por favor, completa todos los campos')),
                      );
                      return;
                    }

                    setState(() {
                      if (indice == null) {
                        // Agregar uno nuevo
                        _medicamentos.add({
                          'nombre': nombreController.text.trim(),
                          'hora': horaSeleccionada,
                          'tomado': false,
                        });
                      } else {
                        // Editar uno existente
                        _medicamentos[indice]['nombre'] = nombreController.text.trim();
                        _medicamentos[indice]['hora'] = horaSeleccionada;
                      }
                    });

                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(indice == null ? 'Guardar' : 'Actualizar'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicamentos'),
        centerTitle: true,
      ),
      body: _medicamentos.isEmpty
          ? const Center(
              child: Text(
                'Aquí aparecerán tus medicamentos 💊',
                style: TextStyle(fontSize: 22),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: _medicamentos.length,
              itemBuilder: (context, index) {
                final medicamento = _medicamentos[index];
                final bool tomado = medicamento['tomado'];

                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.only(bottom: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    onTap: () => _mostrarFormulario(indice: index), // Toque para editar
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    leading: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: tomado ? Colors.green.shade50 : Colors.blue.shade50,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.medication,
                        color: tomado ? Colors.green : Colors.blue,
                      ),
                    ),
                    title: Text(
                      medicamento['nombre'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        decoration: tomado ? TextDecoration.lineThrough : null,
                        color: tomado ? Colors.grey : Colors.black87,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            size: 16,
                            color: tomado ? Colors.grey : Colors.blueGrey,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            medicamento['hora'],
                            style: TextStyle(
                              color: tomado ? Colors.grey : Colors.blueGrey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    trailing: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _medicamentos[index]['tomado'] = !tomado;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            tomado ? Colors.grey.shade200 : Colors.blue.shade50,
                        foregroundColor: tomado ? Colors.grey : Colors.blue,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (tomado) ...[
                            const Icon(Icons.check, size: 16),
                            const SizedBox(width: 4),
                          ],
                          Text(tomado ? 'Tomado' : 'Marcar'),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _mostrarFormulario(),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: const Text(
          'Agregar medicamento',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
