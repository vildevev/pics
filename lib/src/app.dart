// Import flutter helper library
import 'dart:convert';
import 'widgets/image_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'models/image_model.dart';

class App extends StatefulWidget {
  createState() {
    return AppState();
  }
}

// Create a class that will be our custom widget
// extend the 'StatelessWidget' base class
class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async {
    counter += 1;
    final response = await get("https://jsonplaceholder.typicode.com/photos/$counter");
    final imageModel = ImageModel.fromJson(json.decode(response.body));
    
    setState(() {
      images.add(imageModel);
    });
  }

  Widget build(context) {
    return MaterialApp(
    home: Scaffold(
      body: ImageList(images),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: fetchImage,
      ),
      appBar: AppBar(
        title: Text("Let's see some images!"),
      ),
    ),
  );
  }
}

// Must define a build method method that returns the
// widgets that this widget will show