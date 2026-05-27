import 'package:flutter/material.dart';

void main() {
  runApp(const RecetasApp());
}

class Receta {
  final String nombre;
  final String descripcion;
  final List<String> ingredientes;
  final List<String> pasos;
  final String emoji;
  final String tiempo;
  final String dificultad;

  Receta({
    required this.nombre,
    required this.descripcion,
    required this.ingredientes,
    required this.pasos,
    required this.emoji,
    required this.tiempo,
    required this.dificultad,
  });
}

final List<Receta> recetas = [
  Receta(
    nombre: 'Tacos de pollo',
    descripcion: 'Deliciosos tacos mexicanos',
    emoji: '🌮',
    tiempo: '30 min',
    dificultad: 'Fácil',
    ingredientes: ['Pollo', 'Tortillas', 'Cebolla', 'Cilantro', 'Limón'],
    pasos: ['Cocina el pollo', 'Pica la cebolla', 'Calienta las tortillas', 'Arma los tacos'],
  ),
  Receta(
    nombre: 'Sopa de verduras',
    descripcion: 'Sopa nutritiva y caliente',
    emoji: '🍲',
    tiempo: '45 min',
    dificultad: 'Fácil',
    ingredientes: ['Zanahoria', 'Papa', 'Caldo', 'Sal', 'Ajo'],
    pasos: ['Hierve el caldo', 'Agrega las verduras', 'Cocina 20 minutos', 'Sazona al gusto'],
  ),
];

class RecetasApp extends StatelessWidget {
  const RecetasApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mis Recetas',
      theme: ThemeData(colorSchemeSeed: Colors.orange),
      home: const ListaRecetas(),
    );
  }
}

class ListaRecetas extends StatelessWidget {
  const ListaRecetas({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mis Recetas 🍽️')),
      body: ListView.builder(
        itemCount: recetas.length,
        itemBuilder: (context, index) {
          final receta = recetas[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: Text(receta.emoji, style: const TextStyle(fontSize: 36)),
              title: Text(receta.nombre),
              subtitle: Text('${receta.tiempo} • ${receta.dificultad}'),
              onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => DetalleReceta(receta: receta))),
            ),
          );
        },
      ),
    );
  }
}

class DetalleReceta extends StatelessWidget {
  final Receta receta;
  const DetalleReceta({super.key, required this.receta});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(receta.nombre)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Text(receta.emoji, style: const TextStyle(fontSize: 60), textAlign: TextAlign.center),
            const SizedBox(height: 16),
            const Text('Ingredientes', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ...receta.ingredientes.map((i) => ListTile(leading: const Icon(Icons.circle, size: 8), title: Text(i))),
            const SizedBox(height: 16),
            const Text('Pasos', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ...receta.pasos.asMap().entries.map((e) =>
              ListTile(leading: CircleAvatar(child: Text('${e.key + 1}')), title: Text(e.value))),
          ],
        ),
      ),
    );
  }
}