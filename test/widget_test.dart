// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter001/Persona.dart';
import 'package:flutter001/main.dart';

void main() {
  var data = [
    {
      'nombre': 'John',
      'apellido': 'Peres',
      'resultado': 'Buenos dias John Peres'
    },
    {
      'nombre': 'Alejandro',
      'apellido': 'Diaz',
      'resultado': 'Buenos dias Alejandro Diaz'
    }
  ];

  Persona perso = new Persona();

  for (var i = 0; i < data.length; i++) {
    String resultado = perso.Saludo(
        data[i]['nombre'].toString(), data[i]['apellido'].toString());
    test('Saludo', () {
      print(
          "Test saludo ${data[i]['nombre'].toString()} ${data[i]['apellido'].toString()}");
      expect(data[i]['resultado'].toString(), resultado);
    });
  }

  testWidgets('prueba pag principal app movil', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    print("Test Widgets");

    final nombreTester = find.text("Alejandro Diaz");

    expect(nombreTester, findsOneWidget);
  });

  setUp(() async {
    //sucede antes de cada test - importante tener en cuenta BD
    print("Antes de cada test: abrir base de datos");
  });

  tearDown(() async {
    //sucede despes de cada test - importante tener en cuenta BD
    print("Despues de cada tetst: Cerrar base de datos");
  });

  setUpAll(() async {
    //sucede antes de cada test - importante tener en cuenta BD
    print("Antes de la Clase");
  });

  tearDownAll(() async {
    //sucede despes de cada test - importante tener en cuenta BD
    print("Despues de la clase");
  });
}
