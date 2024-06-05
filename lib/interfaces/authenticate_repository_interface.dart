import '../models/index.dart';

abstract class IAuthenticateRepository {
  Future<UsuarioDataModel> loginUser(String bi, String password);
}
