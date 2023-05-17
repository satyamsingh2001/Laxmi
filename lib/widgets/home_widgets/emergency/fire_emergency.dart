import 'package:flutter/material.dart';
import 'package:womensafety/constants/constantColor.dart';
import 'package:womensafety/constants/constantString.dart';
import 'package:womensafety/constants/constant_image.dart';

class FireEmergency extends StatelessWidget {
  const FireEmergency({Key? key})  : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        height: 150,
        width: MediaQuery.of(context).size.width*0.68,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
                colors:[
                  ConstantColor.con1,
                  ConstantColor.con2,
                  ConstantColor.con3,
                ]
            )
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 30,
                // backgroundColor: Colors.white,
                backgroundImage: AssetImage(alert),
              ),
              Text("Active Emergency",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width*0.06,
                    color: Colors.white
                ),),
              Text("Call 123 for emergency",
                style: TextStyle(
                  // fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width*0.035,
                    color: Colors.white
                ),),

              Padding(
                padding: const EdgeInsets.fromLTRB(80, 10, 0, 5),
                child: GestureDetector(
                  onTap: (){},
                  child: Container(
                    height: 25,
                    width: MediaQuery.of(context).size.width/5,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Center(child: Text("1-2-3",
                      style: TextStyle(color: ConstantColor.textC),
                    )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
