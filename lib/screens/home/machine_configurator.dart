import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:ams/constant.dart';
import 'package:ams/screens/login/sign_up.dart';

class MachineConfiguratorScreen extends StatefulWidget {
  const MachineConfiguratorScreen({super.key});

  @override
  State<MachineConfiguratorScreen> createState() =>
      _MachineConfiguratorScreenState();
}

class _MachineConfiguratorScreenState extends State<MachineConfiguratorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       drawer: Drawer(
            child: ListView(
          children: [
            ListTile(
              title: Text("item 1"),
            ),
            ListTile(
              title: Text("item 2"),
            )
          ],
        )),
      appBar:  AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0,
          shape: const Border(
              bottom: BorderSide(color: Color(0xFFf3f5f5), width: 1)),
          title: const Row(
            children: [
              Expanded(child: Text('AMB', style: TextStyle(color: Colors.black))),
            ],
          )),
      body: SafeArea(
        child: _splash(context)));
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
                  image: AssetImage(Constant.splashlogo),
                  fit: BoxFit.fill,
                  alignment: Alignment.center,
                ),
              ),
            )),
        Positioned.fill(
            child: Padding(
          padding: const EdgeInsets.only(top: 130.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black54, width: 3),
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Center(
                child: Text("Order",
                    style: 
                    // GoogleFonts.prociono(
                    //     textStyle: 
                        const TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w500,
                            color: Colors.black))
                            // ),
              ),
            ),
          ),
        )),
        Positioned.fill(
            child: Padding(
          padding: const EdgeInsets.only(bottom: 130.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black54, width: 3),
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Center(
                child: Text("Add",
                    style: 
                    // GoogleFonts.prociono(
                    //     textStyle: 
                        const TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w500,
                            color: Colors.black))
                            // ),
              ),
            ),
          ),
        )),
      ],
    );
  }
}
