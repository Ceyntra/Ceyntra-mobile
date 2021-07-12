import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClickedHotelPackagesScreen extends StatefulWidget {
  // const ClickedHotelPackagesScreen({ Key? key }) : super(key: key);

  @override
  _ClickedHotelPackagesScreenState createState() =>
      _ClickedHotelPackagesScreenState();
}

class _ClickedHotelPackagesScreenState
    extends State<ClickedHotelPackagesScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        PackageWidget(),
      ],
    );
  }
}


class PackageWidget extends StatelessWidget {

  final double price;
  final String description;
  final String pricePer;
  final String imagePath;

  const PackageWidget({Key key, this.price, this.description, this.pricePer, this.imagePath}) : super(key: key);

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
                    image: AssetImage("assets/images/package.jpg"),
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
                    child: Text(
                      '1 large bedroom \n3 beds \n1 bathroom \nfree breakfast ',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ),

                ),


                Expanded(
                  flex: 1,
                  child: Padding(

                    padding: EdgeInsets.only(top: 20.0),
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
                              '4250 LKR',
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
                              'person',
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

                ),
              ],
            ),
          ),


        ],
      ),
    );
  }
}

