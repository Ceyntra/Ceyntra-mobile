import 'package:ceyntra_mobile/models/HotelPackageModel.dart';
import 'package:ceyntra_mobile/service/PackageService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ClickedHotelPackagesScreen extends StatefulWidget {
 const ClickedHotelPackagesScreen({ Key key,@required this.hotelId }) : super(key: key);

 final int hotelId;

  @override
  _ClickedHotelPackagesScreenState createState() =>
      _ClickedHotelPackagesScreenState();
}

class _ClickedHotelPackagesScreenState
    extends State<ClickedHotelPackagesScreen> {

  List<HotelPackageModel> packages=[];

  Future<void> loadPackages() async {
    PackageService packageService=new PackageService();

    List<HotelPackageModel> pkgs;
    pkgs=await packageService.loadHotelPackages(widget.hotelId);

    setState(() {
      packages=pkgs;
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadPackages();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: packages.length,
      itemBuilder: (context,index) => PackageWidget(hotelPackage: packages[index]),
    );
  }
}



class PackageWidget extends StatelessWidget {

  final HotelPackageModel hotelPackage;
  const PackageWidget({Key key, this.hotelPackage}) : super(key: key);

 void confirmDialog(BuildContext context){
    AlertDialog alert = AlertDialog(
      scrollable: true,
      backgroundColor: Colors.blueGrey.shade800,
      title: Text("Package Details",style:TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),textAlign: TextAlign.center),
      titlePadding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children:[
          hotelPackage.packageName == null
          ? Row()
          : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Text("Package Name",style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                  Text(hotelPackage.packageName,style: TextStyle(color: Colors.white)),
                  Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Column(
                children: [
                  hotelPackage.packageDesc == null
                  ? Row()
                  :Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text("Package Description",style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                    Text(hotelPackage.packageDesc,style: TextStyle(color: Colors.white)),
                    Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                    ],
                    
                  ),
                    
                ],                
                  
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  hotelPackage.withAC == true
                  ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("With A/C",style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                      Text("Yes",style: TextStyle(color: Colors.white)),
                      Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                    ],
                  )
                  :Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text("With A/C",style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                    Text("No",style: TextStyle(color: Colors.white)),
                    Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                    ],
                  ),
                    
                ],                
                  
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  hotelPackage.other == false
                  ? Column()
                  :Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text("Other Facilities",style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                    Text(hotelPackage.otherFacility,style: TextStyle(color: Colors.white)),
                    Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                    ],
                  ),
                    
                ],                
                  
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  hotelPackage.negotiable == true
                  ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Negotiable",style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                      Text("Yes",style: TextStyle(color: Colors.white)),
                      Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                    ],
                  )
                  :Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text("Negotiable",style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                    Text("No",style: TextStyle(color: Colors.white)),
                    Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                    ],
                  ),
                    
                ],                
                  
              ),
                          
              ],
              ),
          
        ],
      ),
      
      actions: [
        ElevatedButton(
          child: Text("Cancel", style: GoogleFonts.montserrat()),
          onPressed: () {
            Navigator.of(context).pop();
          }
        ),
        ElevatedButton(
          child: Text("Book now", style: GoogleFonts.montserrat()),
          onPressed: () {
            Navigator.of(context).pop();
            // deleteAccount();
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
            onPrimary: Colors.white,
          )
        ),
        Padding(padding: EdgeInsets.symmetric(horizontal:5,)),
      ],
    );

    showDialog(
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.8),
      context: context,
      builder: (BuildContext context) {
        return alert;
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        confirmDialog(context);
      },
    child:Container(
      height: 250.0,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Color(0xff2F3546),
        // color: Colors.red,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),

      child: Column(
        children: [
          Container(
            height: 150.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft:Radius.circular(15),
                  topRight:Radius.circular(15),
                ),
                image: DecorationImage(
                    image: NetworkImage(hotelPackage.imageURL),
                    fit: BoxFit.fitWidth)
            ),
          ),

          Container(
            child: Row(
              children: [
                Expanded(
                  flex:1,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${hotelPackage.roomCapacity} Persons',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),

                        if(hotelPackage.withAC) ...[
                          Text(
                            'Air Condition',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                        ],

                        if(hotelPackage.meal) ...[
                          Text(
                            'With Meal',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                        ],

                        if(hotelPackage.swimPool) ...[
                          Text(
                            'Swim Pool',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),

                ),


                Padding(
                  padding: EdgeInsets.only(top: 20.0,right: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Price',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '${hotelPackage.price} LKR',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            ' / ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            hotelPackage.perDay? 'Per day' : 'Per Pkg',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    );
  }
}


