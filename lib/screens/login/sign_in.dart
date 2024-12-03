import 'package:ams/screens/home/machine_configurator.dart';
import 'package:ams/screens/login/login.dart';
import 'package:ams/screens/login/storeregis.dart';
import 'package:flutter/material.dart';
import 'package:ams/constant.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:ams/screens/login/sign_up.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: _splash(context)));
  }

  Widget _splash(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
            alignment: Alignment.center,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                image: DecorationImage(
                  image: AssetImage(Constant.cartoon),
                  fit: BoxFit.fill,
                  alignment: Alignment.center,
                ),
              ),
            )),
        const Positioned.fill(
            child: Padding(
          padding: EdgeInsets.only(top: 150.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: Text("AMB",
                style:
                //  GoogleFonts.prociono(
                //     textStyle: 
                    TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w500,
                        color: Colors.black))
                        // ),
          ),
        )),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25)),
                color: Colors.grey.shade100),
            height: MediaQuery.of(context).size.height * 0.30,
            width: MediaQuery.of(context).size.width,
            child: Padding(
                padding: const EdgeInsets.only(top:20),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                            const StoreUser()));

                        //      Navigator.of(context).push(MaterialPageRoute(
                        // builder: (BuildContext context) =>
                        //      const MachineConfiguratorScreen()));

                      },
                      child: Container(
                          width: 300,
                          height: 40,
                          decoration: const BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(40),
                                  left: Radius.circular(40))),
                          child: const Center(child: Text("STORE USER",style:
                          // GoogleFonts.sourceCodePro(textStyle:
                          TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600,),) )
                        //  ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    GestureDetector(
                      onTap: (){
                       Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                         const SignUpScreen()));

                    //      Navigator.of(context).push(MaterialPageRoute(
                    // builder: (BuildContext context) =>
                    //      const MachineConfiguratorScreen()));
                 
                      },
                      child: Container(
                        width: 300,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                            borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(40),
                                left: Radius.circular(40))),
                        child: const Center(child: Text("SIGN UP",style:
                        // GoogleFonts.sourceCodePro(textStyle:
                        TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600,),) )
                        //  ),
                      ),
                    ),
                    const SizedBox(height: 20,),

                    GestureDetector(
                      onTap: (){
                         Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                         const LoginScreen()));
                    // Navigator.of(context).push(MaterialPageRoute(
                    // builder: (BuildContext context) =>
                    //      const MachineConfiguratorScreen()));
                        
                      },
                      child: Container(
                         width: 300,
                         height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black,width: 1),
                          color: Colors.grey.shade200,
                            borderRadius: const BorderRadius.horizontal(
                                right: Radius.circular(40),
                                left: Radius.circular(40))),
                        child: const Center(child: Text("LOGIN",style: 
                        // GoogleFonts.sourceCodePro(textStyle:
                        TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600),overflow: TextOverflow.ellipsis,
                        ),)
                        // ),
                      ),
                    )
                  ],
                )),
          ),
        ),
      ],
    );
  }

}
