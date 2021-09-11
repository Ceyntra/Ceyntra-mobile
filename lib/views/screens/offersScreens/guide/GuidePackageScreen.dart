import 'package:ceyntra_mobile/models/GuidePackageModel.dart';
import 'package:ceyntra_mobile/service/PackageService.dart';
import 'package:ceyntra_mobile/service/UserService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    );;
  }
}



class GuideOfferCard extends StatelessWidget {
  const GuideOfferCard({
    Key key,@required this.packageModel,
  }) : super(key: key);

  final GuidePackageModel packageModel;

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

    );
  }
}