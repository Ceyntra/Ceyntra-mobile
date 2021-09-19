import 'package:ceyntra_mobile/models/TaxiPackageModel.dart';
import 'package:ceyntra_mobile/service/PackageService.dart';
import 'package:ceyntra_mobile/service/UserService.dart';
import 'package:ceyntra_mobile/views/screens/complaints.dart';
import 'package:ceyntra_mobile/views/screens/offersScreens/taxi/AddTaxiOfferScreen.dart';
import 'package:ceyntra_mobile/views/screens/offersScreens/taxi/UpdateTaxiPackages.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaxiPackageScreen extends StatefulWidget {
  TaxiPackageScreen({Key key}) : super(key: key);

  @override
  _TaxiPackageScreenState createState() => _TaxiPackageScreenState();
}

class _TaxiPackageScreenState extends State<TaxiPackageScreen> {

  int userID;
  List<TaxiPackageModel> taxiPackages= [];
  PackageService packageService=new PackageService();

  Future<void> loadData() async {

    UserService userService=new UserService();
    int id= await userService.getUserID();

    var packages=await packageService.loadTaxiPackages(id);

    setState(() {
      userID=id;
      taxiPackages=packages;
    });
    print(taxiPackages);
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
         itemCount: taxiPackages.length,
         itemBuilder: (context,index) => TaxiOfferCard(packageModel: taxiPackages[index]),
       ),
    );
  }
}

class TaxiOfferCard extends StatelessWidget {
  const TaxiOfferCard({
    Key key,@required this.packageModel,
  }) : super(key: key);

  final TaxiPackageModel packageModel;
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
                  packageModel.fullDayService == true
                  ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Full Day Service",style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                      Text("Yes",style: TextStyle(color: Colors.white)),
                      Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                    ],
                  )
                  :Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text("Full Day Service",style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                    Text("No",style: TextStyle(color: Colors.white)),
                    Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                    ],
                  ),
                    
                ],                
                  
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  packageModel.other == false
                  ? Column()
                  :Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text("Other Facilities",style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                    Text(packageModel.otherFacility,style: TextStyle(color: Colors.white)),
                    Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                    ],
                  ),
                    
                ],                
                  
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  packageModel.ownRoutine == true
                  ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Own Routine",style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                      Text("Yes",style: TextStyle(color: Colors.white)),
                      Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                    ],
                  )
                  :Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text("Own Routine",style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                    Text("No",style: TextStyle(color: Colors.white)),
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
            MaterialPageRoute(builder: (context)=> UpdateTaxiPackageScreen(taxiPackageModel:packageModel)));
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
      //barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.8),
      context: context,
      builder: (BuildContext context) {
        return alert;
      }
    );
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
      child: Container(
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
                Radius.circular(10),topRight: Radius.circular(10)

            ),
              //color:Colors.black,
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
                  flex:1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [

                      if(packageModel.withDriver)...[
                        Text("With Driver",
                          style:fontStyle,
                        ),
                      ] else if(packageModel.fullDayService)...[
                        Text("Full Day Service",
                          style:fontStyle,
                        )
                      ],

                      if(packageModel.fuel)...[
                        Text("With Fuel",
                          style:fontStyle,
                        ),
                      ] else if(packageModel.ownRoutine)...[
                        Text("Own Routine",
                          style:fontStyle,
                        )
                      ],
                     Text("${ packageModel.numberOfPassengers} Passengers",
                        style:fontStyle,
                      ),

                    ],
                  ),
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Price',
                      //textAlign: TextAlign.right,
                      style:GoogleFonts.montserrat(
                        fontSize: 16,
                        height: 1.5,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    Text(
                      '${packageModel.price} LKR',
                      //textAlign: TextAlign.right,
                      style:GoogleFonts.montserrat(
                        fontSize: 16,
                        height: 1.5,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    )

                  ],
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