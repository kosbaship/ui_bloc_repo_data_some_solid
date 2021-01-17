import 'package:dio/dio.dart';
import 'package:soild_restful/data/repository/repository.dart';

class APIProvider implements Repository {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://jsonplaceholder.typicode.com/",
    ),
  );

  @override
  Future<Response> fetchData() async {
    return await dio.get("posts");
  }
}
