import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageUploadField extends StatefulWidget {
  const ImageUploadField({Key key, this.setImageState}) : super(key: key);

  final Function setImageState;

  @override
  _ImageUploadFieldState createState() => _ImageUploadFieldState();
}

class _ImageUploadFieldState extends State<ImageUploadField> {
  File image;

  Future pickImage() async {
    final file = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      image = File(file.path);
      widget.setImageState(File(file.path));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          image != null
              ? Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  width: 90,
                  height: 90,
                  child: Image.file(image),
                )
              : Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  width: 90,
                  height: 90,
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      pickImage();
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(
                        Icons.add,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

          // gallery

          image != null
              ? Positioned(
                  top: 30,
                  right: 30,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        image = null;
                        // extractedText = null;
                        // sinhalaExtractedText = null;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey),
                      child: Icon(Icons.close_rounded),
                    ),
                  ))
              : Container()
        ],
      ),
    );
  }
}
