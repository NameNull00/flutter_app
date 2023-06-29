import 'package:app/utils/Enums.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter/material.dart';
import 'package:app/ui/main.dart';
import 'package:app/ui/User_LoginScreen.dart';
import 'package:app/ui/model/partido.dart';
import 'package:app/ui/model/equipo.dart';
import 'package:app/ui/model/torneo.dart';


void main () {
    group("Pruebas de Log in TC.1", () {
      testWidgets('Log in correctamente TC1.1', (WidgetTester tester) async {
        // Build our app and trigger a frame.
        await tester.pumpWidget(MyApp());

        // Verify that widget exits
        expect(find.widgetWithText(ElevatedButton, "Log in"), findsOneWidget);

        await tester.tap(find.widgetWithText(ElevatedButton, "Log in"));
        await tester.pumpAndSettle();

        await tester.enterText(find.widgetWithText(TextField, 'Usuario'), 'admin');
        await tester.enterText(find.widgetWithText(TextField, 'Contraseña'), '1234');
        await tester.tap(find.widgetWithText(ElevatedButton, 'Iniciar sesión'));
        await tester.pumpAndSettle();

        // Comprobamos que ha pasado de página
        expect(find.text('Tipo de torneo:'), findsOneWidget);
      });

      testWidgets('Log in incorrecto TC 1.2', (WidgetTester tester) async {
        // Build our app and trigger a frame.
        await tester.pumpWidget(MyApp());

        // Verify that widget exits
        expect(find.widgetWithText(ElevatedButton, "Log in"), findsOneWidget);

        await tester.tap(find.widgetWithText(ElevatedButton, "Log in"));
        await tester.pumpAndSettle();

        await tester.enterText(find.widgetWithText(TextField, 'Usuario'), 'pepe');
        await tester.enterText(find.widgetWithText(TextField, 'Contraseña'), '1111');
        await tester.tap(find.widgetWithText(ElevatedButton, 'Iniciar sesión'));
        await tester.pumpAndSettle();

        // Comprobamos que ha pasado de página
        expect(find.text('Error') , findsOneWidget);
      });

    });


    group("Pruebas de gestion de torneos ", () {
      // Creacion de un torneo y sus equipos
      Equipo local = new Equipo ('local',['pepe', 'paco'],'manolo', 'jefe');
      Equipo visitante = new Equipo ('local',['pepe', 'paco'],'manolo', 'jefe');
      Torneo torneo = new Torneo (TiposTorneo.LIGA, 1, 'PEPE', 'Champions',true, Sports.FUTBOL,  [local, visitante]);
      test('Comprobacion de datos de un torneo', () {
        expect(torneo.getId, 1);
        expect(torneo.getName,'Champions');
        expect(torneo.getSport, Sports.FUTBOL);
        expect(torneo.getAdmin, 'PEPE');
        expect(torneo.getTiposTorneo, TiposTorneo.LIGA);

      });
    });


    group('Pruebas de visualizacion de un torneo', () {
      testWidgets('Visualizacion de calendario TC4', (WidgetTester tester) async {
        // Build our app and trigger a frame.
        await tester.pumpWidget(MyApp());

        await tester.tap(find.byType(Expanded));
        await tester.pumpAndSettle();

        expect(find.text('Selecciona el deporte'), findsOneWidget);

        await tester.tap(find.byType(SizedBox).at(2));
        await tester.pumpAndSettle();

        await tester.tap(find.byType(Expanded).at(1));
        await tester.pumpAndSettle();

        expect(find.byType(ListView), findsOneWidget);
      });

      testWidgets('Visuacizacion de torneos activos TC7', (WidgetTester tester) async {
        await tester.pumpWidget(MyApp());

        await tester.tap(find.byType(Expanded));
        await tester.pumpAndSettle();

        expect(find.text('Selecciona el deporte'), findsOneWidget);

        await tester.tap(find.byType(SizedBox).at(2));
        await tester.pumpAndSettle();

        //expect(find.byType(Expanded), findsOneWidget);
        //await tester.pumpAndSettle();
      });
    });

    group('Pruebas de actualizacion de datos TC3', () {

      // Iniciamos equipos y partido
      Equipo local = new Equipo ('local',['pepe', 'paco'],'manolo', 'jefe');
      Equipo visitante = new Equipo ('local',['pepe', 'paco'],'manolo', 'jefe');
      Partido partido = new Partido (local, visitante);

      test('Puntos deberian empezar en -1 ', () {

        expect (partido.getGolesL, -1);
        expect (partido.getGolesV, -1);
      });

      test('Resultado del partido deberia cambiar ', () {

        partido.setResultado(2, 5);
        expect (partido.getGolesL, 2);
        expect (partido.getGolesV, 5);
      });
    });


    group('Pruebas de gestión de equipos', () {
      test('Comprobacion de datos del equipo TC13', () {
        // Iniciamos un equipo
        Equipo local = new Equipo ('local',['pepe', 'paco'],'manolo', 'jefe');
        expect (local.administrador, 'jefe');
        expect(local.entrenador, 'manolo');
        expect(local.jugadores, ['pepe', 'paco']);
        expect(local.nombreEquipo,'local');
      });
    });
}