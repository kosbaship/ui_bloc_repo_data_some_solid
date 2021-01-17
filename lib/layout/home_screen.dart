import 'package:flutter/material.dart';
import 'package:soild_restful/data/data_source/api_provider.dart';
import 'package:soild_restful/data/models/post_model.dart';
import 'package:soild_restful/shared/components.dart';

// layout screen
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PostModel> listOfData = List<PostModel>();

  @override
  void initState() {
    APIProvider.getAPIProviderInstance.fetchData().then((value) {
      setState(() {
        listOfData =
            (value.data as List).map((json) => PostModel(json)).toList();
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
                        title: "${listOfData[index].id}",
                        fontFamily: "Pacifico",
                        fontWeight: FontWeight.normal,
                      ),
                      //two
                      title: defaultText(
                        title: "${listOfData[index].title}",
                        fontFamily: "Pacifico",
                        fontWeight: FontWeight.normal,
                      ),
                      //three
                      subtitle: defaultText(
                        title: "${listOfData[index].body}",
                      ),
                    )),
              );
            },
          )
        : Center(child: loadingDots());
  }
}
