
import 'package:ceyntra_mobile/models/TaxiPackageModel.dart';
import 'package:ceyntra_mobile/service/PackageService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClickedTaxiPackageScreen extends StatefulWidget {
  const ClickedTaxiPackageScreen({Key key, this.taxiId}) : super(key: key);

  final int taxiId;

  @override
  _ClickedTaxiPackageScreenState createState() => _ClickedTaxiPackageScreenState();
}

class _ClickedTaxiPackageScreenState extends State<ClickedTaxiPackageScreen> {

  List<TaxiPackageModel> packages=[];

  Future<void> loadPackages() async {
    PackageService packageService=new PackageService();

    List<TaxiPackageModel> pkgs;
    pkgs=await packageService.loadTaxiPackages(widget.taxiId);

    setState(() {
      packages=pkgs;
    });

    print("Taxi id");
    print(widget.taxiId);

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
      itemBuilder: (context,index) => PackageWidget(taxiPackage: packages[index]),
    );
  }
}


class PackageWidget extends StatelessWidget {

  final TaxiPackageModel taxiPackage;
  const PackageWidget({Key key, this.taxiPackage}) : super(key: key);

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
                    image: NetworkImage(taxiPackage.imageURL),
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
                          '${taxiPackage.numberOfPassengers} Persons',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),

                        if(taxiPackage.withDriver) ...[
                          Text(
                            'With Driver',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                        ],

                        if(taxiPackage.fuel) ...[
                          Text(
                            'With Fuel',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                        ],

                        if(taxiPackage.fullDayService) ...[
                          Text(
                            'Full Day',
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
                            '${taxiPackage.price} LKR',
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
                            taxiPackage.perDay? 'Per day' : 'Per KM',
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




