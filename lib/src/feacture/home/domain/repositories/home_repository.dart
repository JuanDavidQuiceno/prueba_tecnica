import 'package:prueba_tecnica/src/feacture/home/domain/models/home_model.dart';

abstract class HomeRepository {
  Future<List<HomeModel>> getHome();
}
