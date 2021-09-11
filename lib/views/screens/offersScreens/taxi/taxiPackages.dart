import 'package:ceyntra_mobile/models/PackageModel.dart';
import 'package:ceyntra_mobile/service/PackageService.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaxiPackageScreen extends StatefulWidget {
  TaxiPackageScreen({Key key,@required this.userID}) : super(key: key);

  final int userID;

  @override
  _TaxiPackageScreenState createState() => _TaxiPackageScreenState();
}

class _TaxiPackageScreenState extends State<TaxiPackageScreen> {

  List<PackageModel> taxiPackages= [];
  PackageService packageService=new PackageService();

  Future<void> loadData() async {

    var packages=await packageService.loadTaxiPackages(widget.userID);

    setState(() {
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

  final PackageModel packageModel;

  @override
  Widget build(BuildContext context) {
    var fontStyle = GoogleFonts.montserrat(
                        fontSize: 16,
                        height: 1.5,
                        color: Colors.white,
                      );
    return Container(
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

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [


                    packageModel.withDriver ? Text("With Driver",
                    style:fontStyle,
                    ) : packageModel.fullDayService ? Text("Full Day Service",
                      style:fontStyle,
                    ) : '',

                    packageModel.withDriver ? Text("With Fuel",
                      style:fontStyle,
                    ) : packageModel.ownRoutine ? Text("Own Routine",
                      style:fontStyle,
                    ) : '',

                   Text("${ packageModel.numberOfPassengers} Passengers",
                      style:fontStyle,
                    ),

                  ],
                ),

                Text(
                  '\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tPrice\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t${packageModel.price} LKR',
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
          )
        ],
      ),

    );
  }
}