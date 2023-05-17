import 'package:flutter/material.dart';
import 'package:womensafety/constants/CustomButton.dart';
import 'package:womensafety/constants/constantColor.dart';
import 'package:womensafety/constants/constantString.dart';
import 'package:womensafety/constants/customTxtf.dart';
import 'package:womensafety/screens/childregister.dart';
import 'package:womensafety/screens/parentregister.dart';
import 'package:womensafety/utils/Utils.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({Key? key}) : super(key: key);

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  @override
  bool isVisible = false;
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
            child: Column(
              children: [
                SizedBox(height: 20,),
                Text(
                  "USER LOGIN",
                  style: TextStyle(
                      color: ConstantColor.button,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Image.asset(
                  girl,
                ),
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
                  hintText: "Enter Username",
                  prefix: Icon(Icons.person),
                ),
                SizedBox(
                  height: 10,
                ),
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
                    prefix: Icon(Icons.lock),
                    suffix: GestureDetector(
                        onTap: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        child: Icon(isVisible
                            ? Icons.visibility_off
                            : Icons.visibility))),
                SizedBox(
                  height: 10,
                ),
                CustomButton(ontap: (){
                  if(_formkey.currentState!.validate()){
                    _onSubmit();
                  }
                }, txt: 'Login',),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Forgot Password?"),
                    TextButton(onPressed: (){}, child: Text("Click here ")),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Register as Child"),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ChildRegister()));
                    }, child: Text("Register")),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Register as Parent"),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ParentRegister()));
                    }, child: Text("Register")),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

   _onSubmit() {
    _formkey.currentState!.save();
    progressIndicator(context);
    print(_fornData['email']);
    print(_fornData['password']);
   }
}
