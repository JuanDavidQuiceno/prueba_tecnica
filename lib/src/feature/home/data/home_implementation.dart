import 'package:api_sdk/api_sdk.dart';
import 'package:prueba_tecnica/src/feature/home/domain/models/home_model.dart';
import 'package:prueba_tecnica/src/feature/home/domain/repositories/endpoint/home_endpoint.dart';
import 'package:prueba_tecnica/src/feature/home/domain/repositories/home_repository.dart';

class HomeImplementation extends CatRepository {
  HomeImplementation({required this.apiSdk});
  final ApiSdk apiSdk;

  @override
  Future<List<CatModel>> getHome() async {
    final data = await apiSdk.run(endpoint: HomeEndpoint());
    if (data.statusCode == 200) {
      final result = data.body?['data'] as List<dynamic>;
      return List<CatModel>.from(
        result.map(
          (e) {
            return CatModel.fromJson(e as Map<String, dynamic>);
          },
        ),
      );
    } else {
      throw Exception('Error al obtener los datos del home');
    }
  }
}
