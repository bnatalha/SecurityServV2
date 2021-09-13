import 'package:mobx/mobx.dart';
import 'package:securityservmap/src/api/models/ocorrencia.model.dart';
part 'home.controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  String apiVersionResponse = 'apiVersionResponse';

  @observable
  String entitiesResponse = 'entitiesResponse';

  @observable
  ObservableList<OcorrenciaModel> ocorrencias =
      <OcorrenciaModel>[].asObservable();
}
