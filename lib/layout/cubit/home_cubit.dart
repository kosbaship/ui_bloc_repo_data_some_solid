import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soild_restful/data/data_source/api_provider.dart';
import 'package:soild_restful/data/models/post_model.dart';
import 'package:soild_restful/layout/cubit/home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  List<PostModel> listOfPosts = List<PostModel>();

  fetchData() {
    emit(HomeLoadingState());

    APIProvider.getInstance.fetchData().then((value) {
      listOfPosts =
          (value.data as List).map((json) => PostModel(json)).toList();

      emit(HomeSuccessState());
    }).catchError((onError) {
      emit(HomeErrorState(onError));
    });
  }
}
