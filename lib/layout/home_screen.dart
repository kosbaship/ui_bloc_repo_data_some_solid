import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soild_restful/data/models/post_model.dart';
import 'package:soild_restful/layout/cubit/home_cubit.dart';
import 'package:soild_restful/layout/cubit/home_states.dart';
import 'package:soild_restful/shared/components.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        List<PostModel> listOfPosts = HomeCubit.get(context).listOfPosts;

        return ConditionalBuilder(
          condition: state is! HomeLoadingState,
          builder: (context) => ConditionalBuilder(
            condition: state is! HomeErrorState,
            builder: (context) => ListView.builder(
              // modify the list length
              itemCount: listOfPosts.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 8,
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      // this a good structure for a list item
                      child: ListTile(
                        // one
                        leading: defaultText(
                          title: "${listOfPosts[index].id}",
                          fontFamily: "Pacifico",
                          fontWeight: FontWeight.normal,
                        ),
                        //two
                        title: defaultText(
                          title: "${listOfPosts[index].title}",
                          fontFamily: "Pacifico",
                          fontWeight: FontWeight.normal,
                        ),
                        //three
                        subtitle: defaultText(
                          title: "${listOfPosts[index].body}",
                        ),
                      )),
                );
              },
            ),
            fallback: (context) => Center(
                child: Text(
              "No data found .. !",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            )),
          ),
          fallback: (context) => Center(child: loadingDots()),
        );
      },
    );
  }
}
