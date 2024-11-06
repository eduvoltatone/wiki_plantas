import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wiki_plantas/screens/plantas_list_page.dart';
import 'package:mockito/mockito.dart';
import 'package:wiki_plantas/services/planta_service.dart';
import 'package:wiki_plantas/models/planta.dart';
import 'package:mockito/annotations.dart';

import 'plantas_list_page_test.mocks.dart';

@GenerateMocks([PlantaService])
void main() {
  group('PlantasListPage', () {
    late MockPlantaService mockPlantaService;

    setUp(() {
      mockPlantaService = MockPlantaService();
    });

    testWidgets('exibe um indicador de carregamento e, após o carregamento, mostra a lista de plantas',
        (WidgetTester tester) async {
      when(mockPlantaService.getPlantas()).thenAnswer((_) async => [
            Planta(
              id: 1,
              nome: 'Rosa',
              especie: 'Rosa rubiginosa',
              cores: ['Vermelho', 'Branco'],
              modoCuidado: 'Regar regularmente e deixar em local com luz solar indireta.',
              fotos: [],
              regiaoOrigem: 'Europa',
            ),
          ]);

      await tester.pumpWidget(
        MaterialApp(
          home: PlantasListPage(),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      await tester.pumpAndSettle();

      expect(find.byType(ListTile), findsOneWidget);
      expect(find.text('Rosa'), findsOneWidget);
      expect(find.text('Rosa rubiginosa'), findsOneWidget);
    });
  });
}
