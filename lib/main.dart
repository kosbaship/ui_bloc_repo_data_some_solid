import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soild_restful/layout/cubit/home_cubit.dart';
import 'package:soild_restful/layout/home_screen.dart';
import 'package:soild_restful/shared/common_colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit()..fetchData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // basic theme and back ground
        theme: ThemeData(primarySwatch: kPrimaryColor),
        home: Scaffold(
          backgroundColor: kPrimaryColor,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'SOLID Restful',
            ),
          ),
          // go to home layout
          body: HomeScreen(),
        ),
      ),
    );
  }
}
