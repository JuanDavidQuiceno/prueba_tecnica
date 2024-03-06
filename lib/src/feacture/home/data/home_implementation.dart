import 'package:api_sdk/api_sdk.dart';
import 'package:prueba_tecnica/src/feacture/home/domain/models/home_model.dart';
import 'package:prueba_tecnica/src/feacture/home/domain/repositories/endpoint/home_endpoint.dart';
import 'package:prueba_tecnica/src/feacture/home/domain/repositories/home_repository.dart';

class HomeImplementation extends HomeRepository {
  HomeImplementation({required this.apiSdk});
  final ApiSdk apiSdk;

  @override
  Future<List<HomeModel>> getHome() async {
    final data = await apiSdk.run(endpoint: HomeEndpoint());
    if (data.statusCode == 200) {
      final result = data.body?['data'] as List<dynamic>;
      return List<HomeModel>.from(
        result.map(
          (e) {
            return HomeModel.fromJson(e as Map<String, dynamic>);
          },
        ),
      );
    } else {
      throw Exception('Error al obtener los datos del home');
    }
  }
}
