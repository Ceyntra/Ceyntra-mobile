
import 'package:ceyntra_mobile/models/GuidePackageModel.dart';
import 'package:ceyntra_mobile/service/PackageService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClickedGuidePackagesScreen extends StatefulWidget {
  const ClickedGuidePackagesScreen({Key key, this.guideId}) : super(key: key);

  final int guideId;

  @override
  _ClickedGuidePackagesScreenState createState() => _ClickedGuidePackagesScreenState();
}

class _ClickedGuidePackagesScreenState extends State<ClickedGuidePackagesScreen> {

  List<GuidePackageModel> packages=[];

  Future<void> loadPackages() async {
    PackageService packageService=new PackageService();

    List<GuidePackageModel> pkgs;
    pkgs=await packageService.loadGuidePackages(widget.guideId);

    setState(() {
      packages=pkgs;
    });

    print("Guide pkg");
    print(widget.guideId);

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
      itemBuilder: (context,index) => PackageWidget(guidePackage: packages[index]),
    );
  }
}


class PackageWidget extends StatelessWidget {

  final GuidePackageModel guidePackage;
  const PackageWidget({Key key, this.guidePackage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    image: NetworkImage(guidePackage.imageURL),
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
                          '${guidePackage.groupCapacity} Persons',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),

                        Text(
                          '${guidePackage.places}',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          '${guidePackage.language}',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                        
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
                            '${guidePackage.price} LKR',
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
                            guidePackage.perDay? 'Per day' : 'Per tour',
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
    );
  }
}



