import 'package:flutter/material.dart';

class Historial extends StatelessWidget {
  const Historial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: 3, // Número de transacciones (modificar según sea necesario)
          itemBuilder: (context, index) {
            final transaccion = _obtenerTransaccion(index); // Obtener la transacción
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaccion.tipo,
                      style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Monto: \$${transaccion.monto}',
                      style: const TextStyle(fontSize: 16.0),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Saldo: \$${transaccion.saldo}',
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Transaccion _obtenerTransaccion(int index) {
    switch (index) {
      case 0:
        return Transaccion(tipo: 'Retiro', monto: 30.0, saldo: 450.0);
      case 1:
        return Transaccion(tipo: 'Pago', monto: 100.0, saldo: 350.0);
      case 2:
        return Transaccion(tipo: 'Transferencia', monto: 50.0, saldo: 300.0);
      default:
        return Transaccion(tipo: 'Desconocido', monto: 0.0, saldo: 0.0);
    }
  }
}

class Transaccion {
  final String tipo;
  final double monto;
  final double saldo;

  Transaccion({required this.tipo, required this.monto, required this.saldo});
}
