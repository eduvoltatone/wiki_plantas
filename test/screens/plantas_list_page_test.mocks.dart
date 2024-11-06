void main() {
  group('PlantaService', () {
    late MockPlantaService mockPlantaService;

    setUp(() {
      mockPlantaService = MockPlantaService();
    });

    test('retorna lista de plantas corretamente', () async {
      // Configura o mock para retornar uma lista de plantas
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

      // Chama o método e verifica o resultado
      final plantas = await mockPlantaService.getPlantas();
      expect(plantas.length, 1);
      expect(plantas[0].nome, 'Rosa');
      expect(plantas[0].especie, 'Rosa rubiginosa');
    });
  });
}
