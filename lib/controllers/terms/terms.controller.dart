import 'package:mobx/mobx.dart';

import '../../models/terms/term.dart';
import '../../repositories/terms_repository.dart';

part 'terms.controller.g.dart';

class TermsController = TermsControllerBase with _$TermsController;

abstract class TermsControllerBase with Store {
  final TermsRepository _termsRepository = TermsRepository();

  @observable
  Term? term;

  @observable
  bool loading = false;

  @observable
  bool isTerm = false;

  @action
  Future<void> fetchTermo(String bi) async {
    loading = true;
    term = await _termsRepository.fetchTerms(bi);
    loading = false;
  }

  @action
  Future<void> fetchTermoCurrentUser() async {
    loading = true;
    term = await _termsRepository.fetchTermsCurrentUser();
    loading = false;
  }

  @action
  Future<void> registerTerms(int termoDeUsoId, String bi, String device, String ip, double versao) async {
    loading = true;
    await _termsRepository.registerTerms(termoDeUsoId, bi, device, ip, versao);
    loading = false;
  }
}
