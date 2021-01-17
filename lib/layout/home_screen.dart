import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:soild_restful/shared/components.dart';

// layout screen
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> listOfData = List<dynamic>();

  @override
  void initState() {
    fetchData().then((value) {
      setState(() {
        print('======================== Hello From init State');
        print(value[0]);
        listOfData.addAll(value);
        // listOfData = value; //this also right
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // create list
    return listOfData.length != 0
        ? ListView.builder(
            // modify the list length
            itemCount: listOfData.length,
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
                        title: "${listOfData[index]['id']}",
                        fontFamily: "Pacifico",
                        fontWeight: FontWeight.normal,
                      ),
                      //two
                      title: defaultText(
                        title: "${listOfData[index]['title']}",
                        fontFamily: "Pacifico",
                        fontWeight: FontWeight.normal,
                      ),
                      //three
                      subtitle: defaultText(
                        title: "${listOfData[index]['body']}",
                      ),
                    )),
              );
            },
          )
        : Center(child: loadingDots());
  }
}

Future<List<dynamic>> fetchData() async {
  List<dynamic> list = List<dynamic>();
  try {
    Dio dio = Dio();
    String url = 'https://jsonplaceholder.typicode.com/';
    dio.options.baseUrl = url;
    await dio.get("posts").then((response) {
      list = response.data; // as List; is optional for me

      print('======================== Hello From fetch data Method');
      print(response.data[4]['title']);
    });
  } catch (e) {
    print('Ops Error');
    print('======================== Hello From fetch data Method');
    print(e.toString());
  }
  return list;
}
