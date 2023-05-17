import 'package:flutter/material.dart';
import 'package:womensafety/constants/CustomButton.dart';
import 'package:womensafety/constants/constantColor.dart';
import 'package:womensafety/constants/constantString.dart';
import 'package:womensafety/constants/customTxtf.dart';
import 'package:womensafety/screens/loginscreen.dart';
import 'package:womensafety/utils/Utils.dart';

class ChildRegister extends StatefulWidget {
  const ChildRegister({Key? key}) : super(key: key);

  @override
  State<ChildRegister> createState() => _ChildRegisterState();
}

class _ChildRegisterState extends State<ChildRegister> {
  bool isVisible = false;
  bool isVisibleR = false;
  final _formkey = GlobalKey<FormState>();
  final _fornData =Map<String ,Object>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,


      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formkey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "REGISTER AS CHILD",
                    style: TextStyle(
                        color: ConstantColor.button,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Image.asset(
                    girl,
                  ),
                  CustomTextField(

                    validate: (name){
                      if(name!.isEmpty ){
                        return "Name can't be null";
                      }else{
                        return null;
                      }
                    },
                    isPassword: false,
                    hintText: "Enter Your Name",
                    prefix: Icon(Icons.person),
                  ),
                  SizedBox(height: 8,),
                  CustomTextField(
                    onsave: (phone) {
                      _fornData['phone'] = phone ?? "";
                    },
                    validate: (phone){
                      if(phone!.isEmpty || phone.length<11 ){
                        return "Enter valid number";
                      }else{
                        return null;
                      }
                    },
                    maxLength: 10,
                    isPassword: false,
                    keyboard: TextInputType.phone,
                    hintText: "Enter Your Mobile Number",
                    prefix: Icon(Icons.phone),
                  ),
                  SizedBox(height: 8,),
                  CustomTextField(
                    onsave: (email) {
                      _fornData['email'] = email ?? "";
                    },
                    validate: (email){
                      if(email!.isEmpty || email.length<5 || !email.contains("@")){
                        return "Enter valid email address";
                      }else{
                        return null;
                      }
                    },
                    isPassword: false,
                    hintText: "Enter Your Email address",
                    prefix: Icon(Icons.email_outlined),
                  ),
                  SizedBox(height: 8,),
                  CustomTextField(
                    onsave: (gemail) {
                      _fornData['gemail'] = gemail ?? "";
                    },
                    validate: (email){
                      if(email!.isEmpty || email.length<5 || !email.contains("@")){
                        return "Enter valid email address";
                      }else{
                        return null;
                      }
                    },
                    isPassword: false,
                    hintText: "Enter Your Parent Email address",
                    prefix: Icon(Icons.email_outlined),
                  ),
                  SizedBox(height: 8,),
                  CustomTextField(
                      onsave: (password) {
                        _fornData['password'] = password ?? "";
                      },
                      validate: (password){
                        if(password!.isEmpty || password.length<7){
                          return "Enter min 7 digits";
                        }else{
                          return null;
                        }
                      },

                      isPassword: !isVisible,
                      hintText: "Enter Password",
                      prefix: Icon(Icons.key),
                      suffix: GestureDetector(
                          onTap: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                          child: Icon(isVisible
                              ? Icons.visibility_off
                              : Icons.visibility))),
                  SizedBox(height: 8,),
                  CustomTextField(
                      onsave: (password) {
                        _fornData['rpassword'] = password ?? "";
                      },
                      validate: (password){
                        if(password!.isEmpty || password.length<7){
                          return "Enter min 7 digits";
                        }else{
                          return null;
                        }
                      },

                      isPassword: !isVisibleR,
                      hintText: "Re-Enter Password",
                      prefix: Icon(Icons.key),
                      suffix: GestureDetector(
                          onTap: () {
                            setState(() {
                              isVisibleR = !isVisibleR;
                            });
                          },
                          child: Icon(isVisible
                              ? Icons.visibility_off
                              : Icons.visibility))),
                  SizedBox(height: 8,),
                  CustomButton(ontap: (){
                    if(_formkey.currentState!.validate()){
                      _onSubmit();
                    }
                  }, txt: 'Register',),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already Member?"),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Login_Screen()));
                      }, child: Text("Login")),
                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  _onSubmit() {
    _formkey.currentState!.save();

    if(_fornData['password'] != _fornData['rpassword']){
      DialogBox(context , "Password and Re-entered Password is not same");
    }
    progressIndicator(context);

    print(_fornData['email']);
    print(_fornData['password']);
  }
}
