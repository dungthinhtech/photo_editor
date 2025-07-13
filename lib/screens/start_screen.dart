import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:lindi/lindi.dart';
import 'package:photo_editor_vn/helper/app_image_picker.dart';
import 'package:photo_editor_vn/providers/app_image_provider.dart';
import 'package:provider/provider.dart';
// import 'package:photo_editor_vn/lindi/image_view_model.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  late AppImageProvider imageProvider;

  @override
  void initState() {
    // imageViewModel = LindiInjector.get<ImageViewModel>();
    imageProvider = Provider.of<AppImageProvider>(context, listen:false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child:Image.asset("assets/images/wallpaper.jpg",fit:BoxFit.cover)
          ),
          Column(
            children:  [
              const Expanded(
                  child: Center(
                    child: Text(
                      "Photo Editor",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 5,
                          wordSpacing: 10
                      ),
                    ),
                  ),
              ),
              Expanded(
                child: Container(),
              ),
              Expanded(
                  child: Center(
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                              onPressed: (){
                                AppImagePicker(source: ImageSource.gallery).pick(
                                    onPick: (File? image) {

                                      imageProvider.changeImage(image!);
                                      Navigator.of(context).pushReplacementNamed('/home');
                                    });
                              },
                              child: const Text("Gallery"),
                          ),
                          ElevatedButton(
                            onPressed: (){
                              AppImagePicker(source: ImageSource.camera).pick(
                                  onPick: (File? image) {

                                    imageProvider.changeImage(image!);
                                    Navigator.of(context).pushReplacementNamed('/home');
                                  });
                            },
                            child: const Text("Camera"),
                          )
                        ],
                      )))
            ],
          )
        ],
      )
    );
  }
}
