import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soild_restful/data/models/post_model.dart';
import 'package:soild_restful/data/repository/repository.dart';
import 'package:soild_restful/layout/cubit/home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  Repository repository;
  HomeCubit(this.repository) : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  List<PostModel> listOfPosts = List<PostModel>();

  fetchData() {
    emit(HomeLoadingState());

    repository.fetchData(path: 'posts').then((value) {
      listOfPosts =
          (value.data as List).map((json) => PostModel(json)).toList();

      emit(HomeSuccessState());
    }).catchError((onError) {
      emit(HomeErrorState(onError));
    });
  }
}
