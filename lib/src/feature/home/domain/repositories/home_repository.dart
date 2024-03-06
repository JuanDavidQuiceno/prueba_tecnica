import 'package:prueba_tecnica/src/feature/home/domain/models/home_model.dart';

abstract class CatRepository {
  Future<List<CatModel>> getHome();
}
