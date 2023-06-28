
import 'package:aj_catering/pages/Home_page.dart';
import 'package:aj_catering/utils/colors.dart';
import 'package:aj_catering/utils/utils.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  _setCountry(CountryCode code) {
    print(code.toString());
  }

  String code = "TZ";
  String phone = "";
  String verificationCode = "";
  String firebaseToken = "";
  String baseUrl = "";
  bool loading = false;
  bool invalidCode = false;


 @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Container(
                // color: Colors.green,
                height: 120,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(16.0),
                margin: const EdgeInsets.only(bottom: 40, top: 70),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Image.asset("assets/icons/ubx.jpeg")],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Hi",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  RichText(
                      text: const TextSpan(children: <TextSpan>[
                    TextSpan(
                      text: "Please sign in here",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    TextSpan(
                        text: "*",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4FBA6F))),
                  ])),
             
                  Container(
                      padding: const EdgeInsets.only(top: 30),
                      child: const Text(
                        "Enter your phone",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.black),
                      ))
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  width: 150,
                  padding: const EdgeInsets.only(left: 20, top: 5),
                  child: CountryCodePicker(
                    flagWidth: 30,
                    onChanged: _setCountry,
                    initialSelection: code,
                    alignLeft: true,
                  ),
                ),
                Container(
                  width: 180,
                  padding: const EdgeInsets.only(
                    top: 5,
                  ),
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    decoration:
                        const InputDecoration(hintMaxLines: 1, hintText: "656725750"),
                    onChanged: (text) {
                      this.phone = text;
                    },
                  ),
                )
              ],
            ),
            Container(
                width: MediaQuery.of(context).size.width / 1.7,
                padding: const EdgeInsets.only(left: 25, top: 30),
                child: const Text(
                  "Tap next too get one time password",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.black),
                )),
            Container(
                width: MediaQuery.of(context).size.width / 1.7,
                padding: const EdgeInsets.only(left: 25, top: 30),
                child: const Row(children: [
                   Text(
                    "Use",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                 
                ])),
            Container(
              padding: const EdgeInsets.only(left: 5, top: 30),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    height: 45,
                    minWidth: Utils.displayWidth(context) * 0.45,
                    color: Colors.black87,
                    onPressed: () {
                      
                    },
                    child: const Text("SKIP",style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white))
                  
                  ),
                  const SizedBox(width: 1,),
                  MaterialButton(
                    color: Colors.black87,
                     height: 45,
                    minWidth: Utils.displayWidth(context) * 0.45,
                    onPressed: () {
                      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => AlertDialog(
              title: const Text("Enter verification code"),
              content: Container(
                height: Utils.displayHeight(context) * 0.1,
                child: Column(
                  children: [
                    TextField(
                      keyboardType: TextInputType.number,
                      maxLength: 6,
                      decoration: const InputDecoration(hintText: "******"),
                      onChanged: (text) {
                        this.verificationCode = text;
                      },
                    ),
                   
                   
                  ],
                ),
              ),
              actions: [
                MaterialButton(
                    color: Colors.white,
                    child: const Text(
                      "Cancel",
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                Visibility(
                  visible: !this.loading,
                  child: MaterialButton(
                      color: Colors.blue,
                      child: const Text(
                        "Sign in",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                       Navigator.pushReplacement(
            context,
            CupertinoPageRoute(
                builder: (context) =>  HomePage()));
                      }),
                ),
              ],
            ));
                        
                    },
                    child: const Text("Next",style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white))
                   
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Center(
                    child: Text(
                      "Don't have AJ Account",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(width: Utils.displayWidth(context) * 0.32),
                      const Text(
                        "Please",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      const SizedBox(width: 5),
                      InkWell(
                        onTap: () {
                         
                        },
                        child: Text(
                          "Signup Here",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColor.base),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
