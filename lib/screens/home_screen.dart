import 'package:flutter/material.dart';
import 'package:womensafety/widgets/home_widgets/emergency.dart';
import 'package:womensafety/widgets/home_widgets/livesfe/livesafe.dart';
import 'package:womensafety/widgets/sharelocations/shareloc.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 200,),
            Text("Emergency"
            , style: TextStyle(
                  fontWeight: FontWeight.bold,
                  // fontSize: MediaQuery.of(context).size.width*0.06,
                  color: Colors.black
              ),
            ),
            SizedBox(height: 5,),
            Emergency(),
            SizedBox(height: 5,),
            Text("Explore Livesafe"
              , style: TextStyle(
                  fontWeight: FontWeight.bold,
                  // fontSize: MediaQuery.of(context).size.width*0.06,
                  color: Colors.black
              ),
            ),
            SizedBox(height: 5,),
            Livesafe(),
            // SizedBox(height: 5,),
            ShareLocation()
          ],
        ),
      ),
    );
  }
}
