import '../../models/student/data_student.dart';

abstract class IEstudanteRepository {
  Future<DataStudent> fetchStudents(String bi, int id, String token);
}
