abstract class IRelatorioRaaRepository {
  Future<bool> solicitarRelatorioRaa({
    required String dreCodigo,
    required String ueCodigo,
    required int trimestre,
    required String turmaCodigo,
    required int anoLetivo,
    required int modalidadeCodigo,
    required String alunoCodigo,
  });
}
