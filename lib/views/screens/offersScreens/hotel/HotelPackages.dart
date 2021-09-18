import 'package:ceyntra_mobile/models/HotelPackageModel.dart';
import 'package:ceyntra_mobile/service/PackageService.dart';
import 'package:ceyntra_mobile/service/UserService.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HotelPackageScreen extends StatefulWidget {
  HotelPackageScreen({Key key}) : super(key: key);

  @override
  _HotelPackageScreenState createState() => _HotelPackageScreenState();
}

class _HotelPackageScreenState extends State<HotelPackageScreen> {


  List<HotelPackageModel> hotelPackages= [];
  int userID;
  PackageService packageService=new PackageService();

  Future<void> loadData() async {

    UserService userService=new UserService();
    int id= await userService.getUserID();

    var packages=await packageService.loadHotelPackages(id);

    setState(() {
      userID=id;
      hotelPackages=packages;
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
        itemCount: hotelPackages.length,
        itemBuilder: (context,index) => HotelOfferCard(packageModel: hotelPackages[index]),
      ),
    );
  }
}

class HotelOfferCard extends StatelessWidget {
  const HotelOfferCard({
    Key key,@required this.packageModel,
  }) : super(key: key);

  final HotelPackageModel packageModel;

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

                    if(packageModel.withAC ) ...[
                      new Text("With AC",
                        style:fontStyle,
                      ),
                    ],

                    if(packageModel.meal ) ...[
                      new Text("Meal",
                        style:fontStyle,
                      ),
                    ],

                    if(packageModel.swimPool ) ...[
                      new Text("Swim Pool",
                        style:fontStyle,
                      ),
                    ],


                    Text("${ packageModel.roomCapacity} Person",
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