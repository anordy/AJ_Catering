import 'package:aj_catering/utils/colors.dart';
import 'package:aj_catering/utils/utils.dart';
import 'package:flutter/material.dart';

class SampleLogin extends StatelessWidget {
  const SampleLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.OrangeColor,
        body:  SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 150.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Sign in'.toUpperCase(),style: const TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w700),),
               const SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Container(
                    height: 55,
                    width: Utils.displayWidth(context) * 0.8,
                    decoration: BoxDecoration(
                      color: AppColor.OrangeColor,
                      borderRadius: BorderRadius.circular(7.0),
                      border: Border.all(color: Colors.white)
                      ),
                    child: TextFormField(
                        decoration: const InputDecoration(label: Text("Phone Number",style: TextStyle(color: Colors.white),),border: OutlineInputBorder(borderSide: BorderSide.none))
                      ),
                  ),
                ),
                 const SizedBox(height: 35,),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Container(
                    height: 55,
                    width: Utils.displayWidth(context) * 0.8,
                    decoration: BoxDecoration(
                      color: AppColor.OrangeColor,
                      borderRadius: BorderRadius.circular(7.0),
                      border: Border.all(color: Colors.white)
                      ),
                    child: TextFormField(
                      obscureText: true,
                        decoration: const InputDecoration(label: Text("Password",style: TextStyle(color: Colors.white),),border: OutlineInputBorder(borderSide: BorderSide.none))
                      ),
                  ),
                ),
                const SizedBox(height: 20,),
                TextButton.icon(
                  onPressed: () {}, icon: const Icon(Icons.open_in_full_outlined,color: Colors.blue,), label: const Text('Reset Password?',style: TextStyle(color: Colors.blue),),),

                  const SizedBox(height: 20.0,),

                  Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: Container(
                      height: 55,
                      width: Utils.displayWidth(context) * 0.8,
                      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(5)),
                      child: Center(child: Text('Sign In',style: TextStyle(color: AppColor.OrangeColor,fontSize: 18, fontWeight: FontWeight.bold),)),
                    ),
                  )
                  // ElevatedButton(onPressed: () {}, child: Text('Sign In',style: TextStyle(color: AppColor.OrangeColor),))
              ],),
          )),
      ),
    );
  }
}
