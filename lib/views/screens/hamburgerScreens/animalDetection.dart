import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ceyntra_mobile/views/widgets/greenTagWidget.dart';

class AnimalDetectionScreen extends StatefulWidget {
  // const AnimalDetectionScreen({ Key? key }) : super(key: key);
  final Function pressed;
  final bool isPressed;
  final Function setNull;
  AnimalDetectionScreen({this.pressed, this.isPressed, this.setNull});

  @override
  _AnimalDetectionScreenState createState() => _AnimalDetectionScreenState();
}

class _AnimalDetectionScreenState extends State<AnimalDetectionScreen> {
  File imageFile;

  _imgFromCamera() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera, 
      imageQuality: 50, 
    );

    setState(() {
      imageFile = File(pickedFile.path);
    });
  }

  _imgFromGallery() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery, 
      imageQuality: 50, 
    );

    setState(() {
      imageFile = File(pickedFile.path);
    });
  }

void _showPicker(context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.photo_library),
                    title: new Text('Photo Library'),
                    onTap: () {
                      _imgFromGallery();
                      Navigator.of(context).pop();
                    }
                    ),
                new ListTile(
                  leading: new Icon(Icons.photo_camera),
                  title: new Text('Camera'),
                  onTap: () {
                    _imgFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      }
    );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff192537),
      appBar: AppBar(
        title: Text(
          "Ceyntra animal detection",
          style: GoogleFonts.montserrat(fontSize: 18),
        ),
        leading: widget.isPressed
            ? InkWell(
                onTap: () {
                  widget.setNull();

                  widget.pressed(0.0, 0.0, 1.0, false);
                },
                child: Icon(Icons.arrow_back))
            : InkWell(
                onTap: () {
                  widget.setNull();

                  widget.pressed((MediaQuery.of(context).size.width / 100) * 70,
                      70.0, 0.8, true);
                },
                child: Icon(
                  Icons.menu,
                )),
        backgroundColor: Color(0xff192537),        
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: GreenTagWidget(
                title: "Photo",
              ),
            ),

            imageFile != null 
            
            ? Container(
                margin: EdgeInsets.only(right: 10, left: 10),
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.lime,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  image: DecorationImage(
                    image: FileImage(imageFile),
                    fit: BoxFit.cover,
                  ),
                ),
              )

            : Container(
                margin: EdgeInsets.only(right: 10, left: 10),
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.lime,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                
                child: IconButton(
                  onPressed: () {_showPicker(context);}, 
                  icon: Icon(
                    Icons.add_photo_alternate_rounded, 
                    size: 80.0,
                  )
                ),
              ),
          ],
        ),
      ),
    );
  }
}
