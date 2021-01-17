import 'package:dio/dio.dart';

class APIProvider {
  static APIProvider getAPIProviderInstance = APIProvider();

  Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://jsonplaceholder.typicode.com/",
    ),
  );

  Future<Response> fetchData() async {
    return await dio.get("posts");
  }
}
