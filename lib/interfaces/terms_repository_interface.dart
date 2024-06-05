abstract class ITermsRepository {
  // Future<DataStudent> fetchStudents(String bi, int id);
  Future<dynamic> fetchTerms(String bi);
  Future<dynamic> fetchTermsCurrentUser();
  Future<bool> registerTerms(
      int termoDeUsoId, String bi, String device, String ip, double versao,);
}
