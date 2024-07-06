import 'package:api_sdk/api_sdk.dart';
import 'package:prueba_tecnica/src/feature/home/data/repositories/endpoint/my_videos_endpoint.dart';
import 'package:prueba_tecnica/src/feature/home/data/repositories/endpoint/videos_endpoint.dart';
import 'package:prueba_tecnica/src/feature/home/domain/interfaces/i_home_repository.dart';
import 'package:prueba_tecnica/src/feature/home/data/repositories/mock/my_videos_mock.dart';
import 'package:prueba_tecnica/src/feature/home/data/repositories/mock/videos_mock.dart';

import 'package:prueba_tecnica/src/utils/environment.dart';

class HomeImplementation extends IHomeRepository {
  HomeImplementation({required this.apiSdk});
  final ApiSdk apiSdk;

  @override
  Future<ResponseApiSdk> myVideos() async {
    if (Environment.isMock) {
      await Future.delayed(const Duration(seconds: 2), () {
        return getMyVideosSuccessMock;
      });
    }
    return apiSdk.run(endpoint: MyVideosEndpoint());
  }

  @override
  Future<ResponseApiSdk> videos() async {
    if (Environment.isMock) {
      await Future.delayed(const Duration(seconds: 2), () {
        return getVideosSuccessMock;
      });
    }
    return apiSdk.run(endpoint: VideosEndpoint());
  }
}
