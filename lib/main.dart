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
    descripcion: 'Tacos mexicanos jugosos con pollo marinado, perfectos para cualquier ocasión.',
    emoji: '🌮',
    tiempo: '30 min',
    dificultad: 'Fácil',
    ingredientes: [
      '500g de pechuga de pollo',
      '12 tortillas de maíz',
      '1 cebolla mediana',
      '1 manojo de cilantro',
      '2 limones',
      'Sal y pimienta al gusto',
      'Aceite para cocinar',
    ],
    pasos: [
      'Corta el pollo en tiras delgadas y sazona con sal y pimienta.',
      'Calienta aceite en un sartén a fuego medio-alto.',
      'Cocina el pollo por 8 minutos hasta que esté dorado.',
      'Pica finamente la cebolla y el cilantro.',
      'Calienta las tortillas en un comal por 30 segundos cada lado.',
      'Arma los tacos con el pollo, cebolla y cilantro.',
      'Exprime limón encima y sirve caliente.',
    ],
  ),
  Receta(
    nombre: 'Sopa de verduras',
    descripcion: 'Sopa nutritiva y reconfortante, ideal para días fríos y para cuidar la salud.',
    emoji: '🍲',
    tiempo: '45 min',
    dificultad: 'Fácil',
    ingredientes: [
      '2 zanahorias grandes',
      '3 papas medianas',
      '2 calabazas',
      '1 elote',
      '1 litro de caldo de pollo',
      '2 dientes de ajo',
      'Sal y hierbas al gusto',
    ],
    pasos: [
      'Pela y corta todas las verduras en cubos medianos.',
      'Hierve el caldo de pollo en una olla grande.',
      'Agrega el ajo picado y deja hervir 2 minutos.',
      'Añade las zanahorias y papas, cocina 10 minutos.',
      'Agrega el elote y las calabazas.',
      'Cocina 15 minutos más a fuego medio.',
      'Sazona con sal y hierbas, sirve caliente.',
    ],
  ),
  Receta(
    nombre: 'Guacamole',
    descripcion: 'El clásico guacamole mexicano, cremoso y fresco, perfecto como botana.',
    emoji: '🥑',
    tiempo: '15 min',
    dificultad: 'Muy fácil',
    ingredientes: [
      '3 aguacates maduros',
      '2 jitomates',
      '1/2 cebolla',
      '1 chile serrano',
      'Jugo de 1 limón',
      'Cilantro al gusto',
      'Sal al gusto',
    ],
    pasos: [
      'Parte los aguacates y quita el hueso.',
      'Aplasta la pulpa con un tenedor hasta obtener una mezcla cremosa.',
      'Pica finamente el jitomate, cebolla, chile y cilantro.',
      'Mezcla todo con el aguacate.',
      'Agrega el jugo de limón y sal al gusto.',
      'Mezcla bien y sirve inmediatamente con totopos.',
    ],
  ),
  Receta(
    nombre: 'Arroz rojo',
    descripcion: 'Arroz rojo estilo mexicano, esponjoso y lleno de sabor, el acompañamiento perfecto.',
    emoji: '🍚',
    tiempo: '35 min',
    dificultad: 'Media',
    ingredientes: [
      '2 tazas de arroz',
      '3 jitomates',
      '1/4 de cebolla',
      '2 dientes de ajo',
      '3 tazas de caldo de pollo',
      'Aceite para freír',
      'Sal al gusto',
    ],
    pasos: [
      'Licúa los jitomates con la cebolla y el ajo.',
      'Fríe el arroz en aceite caliente hasta que esté dorado.',
      'Agrega la salsa de jitomate licuada.',
      'Deja que se consuma un poco la salsa.',
      'Agrega el caldo de pollo y sal.',
      'Tapa y cocina a fuego bajo 20 minutos.',
      'Esponja con un tenedor y sirve.',
    ],
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
              title: Text(receta.nombre, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('${receta.tiempo} • ${receta.dificultad}\n${receta.descripcion}'),
              isThreeLine: true,
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
            const SizedBox(height: 8),
            Text(receta.descripcion, textAlign: TextAlign.center, style: const TextStyle(fontSize: 16, color: Colors.grey)),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Chip(label: Text('⏱️ ${receta.tiempo}')),
                const SizedBox(width: 8),
                Chip(label: Text('📊 ${receta.dificultad}')),
              ],
            ),
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
