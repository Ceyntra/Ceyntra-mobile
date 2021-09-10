import 'dart:convert';

import 'package:ceyntra_mobile/models/PackageModel.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:image_picker/image_picker.dart';


class AddOfferScreen extends StatefulWidget {
  const AddOfferScreen({Key key,@required this.userId}) : super(key: key);

  final int userId;

  @override
  _AddOfferScreenState createState() => _AddOfferScreenState();
}

class _AddOfferScreenState extends State<AddOfferScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  PackageModel package;

  String _packageName;

  String _description;

  String _otherFacilities;

  int _numOfPassengers=1;

  double _price;

  bool _negotiable=true;

  bool _perDay= true;

  File image;

  var imageURL;

  //values for check boxes
  bool withDriver=false;
  bool fuel=false;
  bool fullDayService=false;
  bool ownRoutine=false;
  bool other=false;


  Widget Title(String title){
    return(
        Opacity(
          opacity: 0.64,
          child: Text(title,
            style: TextStyle(
                color: Colors.white
            ),
          ),
        )
    );
  }



  Future pickImage() async {
    final file = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      image = File(file.path);
    });
  }

  Future<void> uploadImage() async {

    final storage=FirebaseStorage.instance;

    if(image != null){

      var snapshot= await storage.ref()
          .child('offers/taxi/'+widget.userId.toString()+'/'+ image.path.split('/').last)
          .putFile(image);

      var downloadUrl = await snapshot.ref.getDownloadURL();

      setState(() {
        imageURL=downloadUrl;
        image=null;
      });
    }else{
      print('No Image Path Received');
    }
  }


  void setPackageName(String value){
    _packageName=value;
  }
  void setPackageDesc(String value){
    _description=value;
  }

  void setOtherFacility(String value){
    _otherFacilities=value;
  }







  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Title('Package Name'),

              SizedBox(height: 8,),

              //Input Package name field
              buildTextFormField("Package name can not be empty",setPackageName,1,1 ),

              SizedBox(height: 10,),
              Divider(color: Colors.white,),
              SizedBox(height: 10,),

              Title("Package Description"),

              SizedBox(height: 8,),
              //Package Description Input
              buildTextFormField("Package Description can not be empty",setPackageDesc,10,4 ),


              SizedBox(height: 10,),
              Divider(color: Colors.white,),
              SizedBox(height: 10,),

              Title("Image"),
              SizedBox(height: 8,),

              //Image Uploader
              Container(

                child: Stack(
                  children: [
                    image != null
                        ? Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      width: double.infinity,
                      height: 120,
                      child: Image.file(image),
                    )
                        : Container(

                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      width: double.infinity,
                      height: 120,
                      // child: Image.file(image),
                    ),

                    //gallery
                    Positioned(
                      bottom: 10,
                      right: 30,
                      child: Container(
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              // extractedText = null;
                              // sinhalaExtractedText = null;
                            });
                            pickImage();
                          },
                          child: Icon(
                            Icons.photo,
                            size: 30,
                            color: Colors.white,
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all<Color>(
                              Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
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
                                shape: BoxShape.circle,
                                color: Colors.grey),
                            child: Icon(Icons.close_rounded),
                          ),
                        ))
                        : Container()
                  ],
                ),
              ),

              SizedBox(height: 10,),
              Divider(color: Colors.white,),
              SizedBox(height: 10,),

              Title("Details"),
              SizedBox(height: 8,),

              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Checkbox(
                          value: withDriver,
                          checkColor: Colors.green,
                          onChanged: (value) {
                            setState(() {
                              // this.value = value;
                              withDriver=!withDriver;
                            });
                          },
                          fillColor: MaterialStateProperty.all(Colors.green),
                        ),
                        Title("With Driver"),
                      ],
                    ),
                  ),


                  Expanded(
                    child: Row(
                      children: [
                        Checkbox(
                          value: fullDayService,
                          checkColor: Colors.green,
                          onChanged: (value) {
                            setState(() {
                              // this.value = value;
                              fullDayService=!fullDayService;
                            });
                          },
                          fillColor: MaterialStateProperty.all(Colors.green),
                        ),
                        Title("Full Day service"),
                      ],
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Checkbox(
                          value: fuel,
                          checkColor: Colors.green,
                          onChanged: (value) {
                            setState(() {
                              // this.value = value;
                              fuel=!fuel;
                            });
                          },
                          fillColor: MaterialStateProperty.all(Colors.green),
                        ),
                        Title("Fuel"),
                      ],
                    ),
                  ),


                  Expanded(
                    child: Row(
                      children: [
                        Checkbox(
                          value: other,
                          checkColor: Colors.green,
                          onChanged: (value) {
                            setState(() {
                              // this.value = value;
                              other=!other;
                            });
                          },
                          fillColor: MaterialStateProperty.all(Colors.green),
                        ),
                        Title("Other"),
                      ],
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Checkbox(
                          value: ownRoutine,
                          checkColor: Colors.green,
                          onChanged: (value) {
                            setState(() {
                              // this.value = value;
                              ownRoutine=!ownRoutine;
                              print("Own routine ");
                              print(ownRoutine);
                            });
                          },
                          fillColor: MaterialStateProperty.all(Colors.green),
                        ),
                        Title("Own Routine"),
                      ],
                    ),
                  ),

                ],
              ),


              other ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  Divider(color: Colors.white,),
                  SizedBox(height: 10,),

                  Title("Other Facilities & Service"),

                  SizedBox(height: 8,),
                  //Package Description Input
                  buildTextFormField("Other Facilities can't leave blank",setOtherFacility,10,4 ),

                  SizedBox(height: 10,),
                ],
              ) : SizedBox(height: 10,),


              Divider(color: Colors.white,),
              SizedBox(height: 10,),



              //No of passengers
              Title("No of Passengers"),
              SizedBox(height: 8,),

              Row(

                children: [
                  Expanded(
                      child: Text("Maximum Passengers", style: TextStyle(color: Colors.white),)
                  ),

                  Container(
                    child: IconButton(
                      iconSize: 20.0,
                      splashRadius: 20.0,
                      icon: const Icon(Icons.remove_circle_outline,
                        color: Colors.white,
                        size: 25.0,
                      ),
                      onPressed: _numOfPassengers > 1 ? () {
                        setState(() {
                          _numOfPassengers--;
                        });
                      } : null,
                    ),
                  ),

                  Text(_numOfPassengers.toString(), style: TextStyle(color: Colors.white)),

                  Container(
                    child: IconButton(
                      iconSize: 20.0,
                      splashRadius: 20.0,
                      icon: const Icon(Icons.add_circle_outline, color: Colors.white, size: 25.0,),
                      onPressed: () {
                        setState(() {
                          _numOfPassengers++;
                        });
                      },
                    ),
                  ),
                ],
              ),


              SizedBox(height: 10,),
              Divider(color: Colors.white,),
              SizedBox(height: 10,),


              //Charging
              Title("Charging Preferances"),
              SizedBox(height: 8,),

              Row(
                children: [

                  Expanded(
                    child: Row(
                      children: [
                        Checkbox(
                          value: _perDay,
                          shape: CircleBorder(),
                          checkColor: Colors.green,
                          onChanged: (value) {
                            setState(() {
                              if(_perDay == false){
                                _perDay=!_perDay;
                              }
                            });
                          },
                          fillColor: MaterialStateProperty.all(Colors.green),
                        ),
                        Title("Per day"),
                      ],
                    ),
                  ),

                  Expanded(
                    child: Row(
                      children: [
                        Checkbox(
                          value: !_perDay,
                          shape: CircleBorder(),
                          checkColor: Colors.green,
                          onChanged: (value) {
                            setState(() {
                              if(_perDay == true){
                                _perDay=!_perDay;
                              }
                            });
                          },
                          fillColor: MaterialStateProperty.all(Colors.green),
                        ),
                        Title("Per Km"),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10,),
              Divider(color: Colors.white,),
              SizedBox(height: 10,),

            Title("Price"),
              SizedBox(height: 8,),
            TextFormField(
              style: TextStyle(color: Colors.black),

              validator: (name){
                double p = double.tryParse(name);
                if(name.isEmpty){
                  return "Price cannot be empty";
                }else if (p == null) {
                  return "Invalid value for a price";
                }
                else{
                  return null;
                }
              },
              onSaved: (name){
                setState(() {
                  _price=double.parse(name);
                });

              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                fillColor: Colors.white,
                filled: true,
                border:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),

            Row(
                children:[
                  Expanded(child: Title("Negotiable")),
                  Title("No"),

                  Transform.scale(
                    scale: 1,
                    child: Switch(
                      onChanged: (value){
                        setState(() {
                          _negotiable= !_negotiable;

                        });
                      },
                      value: _negotiable,
                      activeColor: Colors.green,
                      activeTrackColor: Colors.green,
                      inactiveThumbColor: Colors.white,
                      inactiveTrackColor: Colors.white,
                    )
                  ),
                  Title("Yes"),
                ],
            ),
              Divider(color: Colors.white,),
              SizedBox(height: 10,),



            Container(
                width: MediaQuery.of(context).size.width * 0.96,

                child: ElevatedButton(
                  style: ButtonStyle(
                    shape:  MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                        )
                    )
                  ) ,
                child: Text("Add Offer"),
                onPressed: (){
                  if(_formKey.currentState.validate()){
                    _formKey.currentState.save();
                    // print("Pressed & Saved! - "+ _packageName);
                    //Upload Image to firebase
                    uploadImage();

                    //Save Data in a model
                    createPackage();

                    //rest
                    _formKey.currentState.reset();
                  }
                },
              ),
            ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildTextFormField(String emptyMsg,Function setValue, int maxline, int minline) {

    return TextFormField(
              style: TextStyle(color: Colors.black),
              maxLines: maxline,
              minLines: minline,
              validator: (name){
                if(name.isEmpty){
                  return emptyMsg;
                }else{
                  return null;
                }
              },
              onSaved: setValue,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                fillColor: Colors.white,
                filled: true,
                border:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            );
  }

  void createPackage() async{

    PackageModel package=new PackageModel(_packageName,_description,imageURL,withDriver,fuel,fullDayService,ownRoutine,other,_otherFacilities,_numOfPassengers,_perDay,!_perDay,_price,_negotiable,1);
    print(package.toString());

    http.Response response = await http.post(
      Uri.parse('http://10.0.2.2:9092/createTaxiPackage'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(package.toJson()),
    );



    final messages = json.decode(response.body);
    print(messages);

  }


}
