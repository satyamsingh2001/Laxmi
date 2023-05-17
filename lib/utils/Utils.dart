import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:womensafety/constants/constantColor.dart';



class Utils{


  static void showToastMsg(String? msg, {bool isErrorType = false}) {

     Fluttertoast.showToast(
        msg: msg!,
        backgroundColor: isErrorType ? Colors.red : Colors.green,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5);
  }

  static Future<void> openMap(String location) async {

    String googleUrl = "https://www.google.com/maps/search/$location";
    final Uri _url = Uri.parse(googleUrl);


  try{

    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }catch(e){
    Utils.showToastMsg("Something went wrong");
  }
  }

  static Future<void> callNumber(String number) async{

    await FlutterPhoneDirectCaller.callNumber(number);
  }

}

progressIndicator(BuildContext context){
  showDialog(
      barrierDismissible: false,
      context: context, builder: (context)=>Center(child:CircularProgressIndicator(
    backgroundColor: ConstantColor.button,
  )));
}

DialogBox(BuildContext context ,String text){
  showDialog(context: context, builder: (context)=>AlertDialog(
    title: Text(text),
  ));
}