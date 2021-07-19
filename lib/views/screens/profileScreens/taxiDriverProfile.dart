import 'package:ceyntra_mobile/views/widgets/dividerWidget.dart';
import 'package:ceyntra_mobile/views/widgets/profileDetailsWidget.dart';
import 'package:flutter/material.dart';

class TaxiDriverProfileScreen extends StatelessWidget {

  Function deleteAccount(){

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff031925),
      appBar: AppBar(
        // elevation: 20,
        brightness: Brightness.dark,
        // leading: Icon(Icons.arrow_back),
        leading: InkWell(
          onTap: null,
          child: Icon(Icons.arrow_back),
        ),
        title: Center(
          child: Text('Profile'),
        ),
        actions: [
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.edit,
              color: Colors.white,
            ),
          )
        ],
        backgroundColor: Color(0xff031925),
      ),
      body: SingleChildScrollView(
        child:Column(
          children: [
            Center(
              child: Container(
                alignment: Alignment.bottomRight,
                margin: EdgeInsets.only(top: 20, bottom: 5),
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.brown,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/g4.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: Ink(
                    decoration: ShapeDecoration(
                      color: Colors.white.withOpacity(0.5),
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.camera_alt,
                        color: Colors.black,
                      ),
                      onPressed: null,
                    ),
                  ),
                ),
              ),
            ),
            
            Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: Text(
                'Nuwan Vithanage',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            ProfileDetailsWidget('DrivingLicense No.', '975-353'),
            DividerWidget(),
            ProfileDetailsWidget('Email', 'nuwanwithana@gmail.com'),
            DividerWidget(),
            ProfileDetailsWidget('Phone', '011 6193417'),
            DividerWidget(),
            ProfileDetailsWidget('Working Location', '--'),
            DividerWidget(),
            ProfileDetailsWidget('Account Type', 'Taxi Driver'),

            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              width: 300.0,
              height: 40.0,
              child: ElevatedButton(
                onPressed: deleteAccount,
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  onPrimary: Colors.white,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(15.0),
                  ),
                ),
                child: Text(
                  'Delete account',
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
