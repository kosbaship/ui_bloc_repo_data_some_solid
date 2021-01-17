import 'package:get_it/get_it.dart';
import 'package:soild_restful/data/data_source/api_provider.dart';
import 'package:soild_restful/layout/cubit/home_cubit.dart';

GetIt di = GetIt.I..allowReassignment = true;
Future init() async {
  di.registerFactory<HomeCubit>(
    () => HomeCubit(di<APIProvider>()),
  );

  di.registerLazySingleton<APIProvider>(
    () => APIProvider(),
  );
}
