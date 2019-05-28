import 'dart:async';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Image Picker Demo',
      home: MyHomePage(title: 'Image Picker Example'),
      debugShowCheckedModeBanner: false,
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File _image;

  Future getImageFromCam() async{
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState((){
      _image = image;
    });
  }

  Future getImageFromGallery() async{
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState((){
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200.0,
            child: Center(
              child: _image == null? Text('No image selected.'):Image.file(_image),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FloatingActionButton(
                onPressed: getImageFromCam,
                tooltip: 'Pick Image',
                child: Icon(Icons.add_a_photo),
              ),
              FloatingActionButton(
                onPressed: getImageFromGallery,
                tooltip: 'Pick Image',
                child: Icon(Icons.wallpaper),
              ),
            ]
          )
        ]
      ),
    );
  }
}
