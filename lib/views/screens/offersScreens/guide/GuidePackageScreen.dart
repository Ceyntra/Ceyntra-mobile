import 'package:ceyntra_mobile/models/GuidePackageModel.dart';
import 'package:ceyntra_mobile/service/PackageService.dart';
import 'package:ceyntra_mobile/service/UserService.dart';
import 'package:ceyntra_mobile/views/screens/offersScreens/guide/GuideOfferScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ceyntra_mobile/views/screens/offersScreens/guide/UpdateGuidePackages.dart';
import 'package:http/http.dart' as http;

class GuidePackageScreen extends StatefulWidget {
  const GuidePackageScreen({Key key}) : super(key: key);

  @override
  _GuidePackageScreenState createState() => _GuidePackageScreenState();
}

class _GuidePackageScreenState extends State<GuidePackageScreen> {


  List<GuidePackageModel> guidePackages= [];
  int userID;
  PackageService packageService=new PackageService();

  Future<void> loadData() async {

    UserService userService=new UserService();
    int id= await userService.getUserID();

    var packages=await packageService.loadGuidePackages(id);

    setState(() {
      userID=id;
      guidePackages=packages;
    });

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2F3546),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: guidePackages.length,
        itemBuilder: (context,index) => GuideOfferCard(packageModel: guidePackages[index]),
      ),
    );
  }
}



class GuideOfferCard extends StatelessWidget {
  const GuideOfferCard({
    Key key,@required this.packageModel,
  }) : super(key: key);

  final GuidePackageModel packageModel;

  void confirmDeleteDialog(BuildContext context){
    AlertDialog alert = AlertDialog(
      title: Column(
        children: [
          Icon(
            Icons.warning_amber_outlined,
            color: Colors.red,
            size: 80,
          ),
          Text("Are you sure?", style: GoogleFonts.montserrat(), textAlign: TextAlign.center)
        ],
      ),
      titlePadding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      content: Text("This action will delete your package permanently", style: GoogleFonts.montserrat(), textAlign: TextAlign.center),
      actions: [
        ElevatedButton(
          child: Text("Cancel", style: GoogleFonts.montserrat()),
          onPressed: () {
            Navigator.of(context).pop();
          }
        ),
        ElevatedButton(
          child: Text("OK", style: GoogleFonts.montserrat()),
          onPressed: () {
            Navigator.of(context).pop();
            deletePackage(packageModel.packageId);
            Navigator.push(context, 
            MaterialPageRoute(builder: (context)=> GuideOfferScreen()));
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
            onPrimary: Colors.white,
          )
        ),
        Padding(padding: EdgeInsets.symmetric(horizontal:5)),
      ],
    );

    showDialog(
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.9),
      context: context,
      builder: (BuildContext context) {
        return alert;
      }
    );
  }
  void confirmDialog(BuildContext context){
    AlertDialog alert = AlertDialog(
      scrollable: true,
      backgroundColor: Colors.blueGrey.shade800,
      title: Text("Package Details",style:TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),textAlign: TextAlign.center),
      titlePadding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children:[
          packageModel.packageName == null
          ? Row()
          : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Text("Package Name",style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                  Text(packageModel.packageName,style: TextStyle(color: Colors.white)),
                  Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Column(
                children: [
                  packageModel.packageDesc == null
                  ? Row()
                  :Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text("Package Description",style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                    Text(packageModel.packageDesc,style: TextStyle(color: Colors.white)),
                    Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                    ],
                    
                  ),
                    
                ],                
                  
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  packageModel.negotiable == true
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
        // ElevatedButton(
        //   child: Text("Cancel", style: GoogleFonts.montserrat()),
        //   onPressed: () {
        //     Navigator.of(context).pop();
        //   }
        // ),
        ElevatedButton(
          child: Text("Update", style: GoogleFonts.montserrat()),
          onPressed: () {
            Navigator.of(context).pop();
            // Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                   builder: (context) => ComplaintPage()));
            Navigator.push(context, 
            MaterialPageRoute(builder: (context)=> UpdateGuideScreen(guidePackageModel:packageModel)));
            // deleteAccount();
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.green,
            onPrimary: Colors.white,
          )
        ),
        ElevatedButton(
          child: Text("Delete", style: GoogleFonts.montserrat()),
          onPressed: () {
            Navigator.of(context).pop();
            confirmDeleteDialog(context);
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
      //barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.8),
      context: context,
      builder: (BuildContext context) {
        return alert;
      }
    );
  }
  Future<http.Response> deletePackage(int packageId) async {
  final http.Response response = await http.delete(
    Uri.parse('http://10.0.2.2:9092/deleteGuidePackage/$packageId'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  return response;
}
  @override
  Widget build(BuildContext context) {
    var fontStyle = GoogleFonts.montserrat(
      fontSize: 16,
      height: 1.5,
      color: Colors.white,
    );
    return GestureDetector(
      onTap: () {
        confirmDialog(context);
      },
      child:Container(
      margin: EdgeInsets.only(top:25,right: 20,left: 20),
      decoration: BoxDecoration(
        borderRadius:BorderRadius.all(
            Radius.circular(10)
        ),
        color: Colors.black38,
      ),
      height:250,
      width:double.infinity,

      child: Stack(
        children: [
          Container(
            height: 150,
            //margin: EdgeInsets.only(top:25,right: 20,left: 20),
            decoration: BoxDecoration(
                borderRadius:BorderRadius.only(topLeft:
                Radius.circular(10),topRight: Radius.circular(10)),

                image: DecorationImage(
                  image: NetworkImage(packageModel.imageURL),
                  fit: BoxFit.cover,
                )
            ),
          ),
          Container(
            //padding: EdgeInsets.only(bottom:20),
            margin: EdgeInsets.only(top:160,left:15,right:15),
            child: Row(

              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text( packageModel.places,
                        style:fontStyle,
                      ),

                      Text(packageModel.language,
                        style:fontStyle,
                      ),

                      Text("Max Group size ${packageModel.groupCapacity}",
                        style:fontStyle,
                      ),

                    ],
                  ),
                ),


                Container(
                  child:   Text(
                    'Price \n${packageModel.price} LKR',
                    style:GoogleFonts.montserrat(
                      fontSize: 16,
                      height: 1.5,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],

            ),
          )
        ],
      ),
    ),
    );
  }
}