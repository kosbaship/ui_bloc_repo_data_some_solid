import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soild_restful/layout/cubit/home_cubit.dart';
import 'package:soild_restful/layout/home_screen.dart';
import 'package:soild_restful/shared/common_colors.dart';
import 'package:soild_restful/shared/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<HomeCubit>()..fetchData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
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
