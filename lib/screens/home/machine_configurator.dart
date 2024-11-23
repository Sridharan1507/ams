// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:ams/model/get_user.dart';
import 'package:ams/screens/feedback/feedback_screen.dart';
import 'package:ams/screens/login/change_password.dart';
import 'package:ams/screens/login/sign_in.dart';
import 'package:ams/screens/vehicles/add_vehicle.dart';
import 'package:ams/screens/vehicles/get_vheciles.dart';
import 'package:ams/screens/vehicles/my_vehicles.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:ams/constant.dart';
import 'package:ams/screens/login/sign_up.dart';

class MachineConfiguratorScreen extends StatefulWidget {
  final GetUserResponseData? getUserResponseData;
  const MachineConfiguratorScreen({Key? key, this.getUserResponseData})
      : super(key: key);
  //  MachineConfiguratorScreen({super.key, this.getUserResponseData});

  @override
  State<MachineConfiguratorScreen> createState() =>
      _MachineConfiguratorScreenState();
}

class _MachineConfiguratorScreenState extends State<MachineConfiguratorScreen> {
  var currentPage = DrawerSections.dashboard;
  GetUserResponseData? getUserResponseData;
  @override
  void initState() {
    ;
    if (widget.getUserResponseData != null) {
      getUserResponseData = widget.getUserResponseData;
    }
    else{
      getUserResponseData =GetUserResponseData(user: User(name: "name",email: "email.com"),role: Role(name: ""));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  drawerHeader(),
                  drawerList(),
                ],
              ),
            ),
          ),
        ),
        appBar: AppBar(
            elevation: 0,
            shape: const Border(
                bottom: BorderSide(color: Color(0xFFf3f5f5), width: 1)),
            title: const Row(
              children: [
                Expanded(
                    child: Text('AMB', style: TextStyle(color: Colors.black))),
              ],
            )),
        body: SafeArea(child: _splash(context)));
  }

  Container drawerHeader() {
    return Container(
      color: Colors.green[700],
      width: double.infinity,
      height: 150,
      padding: const EdgeInsets.only(top: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            // margin: const EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.person,
              color: Colors.white,
              size: 50,
            ),
          ),
          Text(
            getUserResponseData!.user!.name ?? "",
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            getUserResponseData!.user!.email ?? "",
            style: TextStyle(
              color: Colors.grey[200],
              fontSize: 15,
            ),
          ),
        
        ],
      ),
    );
  }

  Widget drawerList() {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Home", Icons.dashboard_outlined,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, "Change Password", Icons.lock,
              currentPage == DrawerSections.changePassword ? true : false),
          menuItem(3, "FeedBack", Icons.feedback_outlined,
              currentPage == DrawerSections.FeedBack ? true : false),
               menuItem(5, "My Vehicles", Icons.bus_alert,
              currentPage == DrawerSections.Myvehicles ? true : false),
          menuItem(4, "Logout", Icons.logout_outlined,
              currentPage == DrawerSections.Logout ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              Navigator.pop(context);
            } else if (id == 2) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const ChangePasswordScreen()));
            } else if (id == 3) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const MyFeedback()));
            } else if (id == 4) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) =>
                      const SignInScreen()));
            }else if (id == 5) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) =>
                      const MyVehiclesScreen()));
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  dashboard,
  changePassword,
  FeedBack,
  Myvehicles,
  Logout,
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
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const GetVehicleScreen(),
            ),
          );
        },
        child: Container(
          height: 200,
          width: 300,
          decoration: BoxDecoration(
            // image: DecorationImage(
            //   image: AssetImage(Constant.orderImage),
            //   fit: BoxFit.scaleDown,
            //   alignment: Alignment.center,
            // ),
            border: Border.all(color: Colors.black54, width: 3),
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,  // Push items to top and bottom
            crossAxisAlignment: CrossAxisAlignment.center,  // Center horizontally
            children: [
              // Image part inside the container
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Constant.orderImage),
                      fit: BoxFit.scaleDown,  // Adjust the image's fit
                      alignment: Alignment.center,
                    ),
                  ),
                ),
              ),
              // Text part inside the container
              Padding(
                padding: const EdgeInsets.all(8.0),  // Optional padding for the text
                child: Text(
                  'Order',  // Replace with your desired text
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,  // Change text color as needed
                  ),
                  textAlign: TextAlign.center,  // Center text horizontally
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  ),
)


,
      Positioned.fill(
          child: Padding(
        padding: const EdgeInsets.only(bottom: 130.0),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const AddVehicleScrenn()));
            },
            child: Container(
          height: 200,
          width: 300,
          decoration: BoxDecoration(
            // image: DecorationImage(
            //   image: AssetImage(Constant.orderImage),
            //   fit: BoxFit.scaleDown,
            //   alignment: Alignment.center,
            // ),
            border: Border.all(color: Colors.black54, width: 3),
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,  // Push items to top and bottom
            crossAxisAlignment: CrossAxisAlignment.center,  // Center horizontally
            children: [
              // Image part inside the container
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Constant.addImage),
                      fit: BoxFit.scaleDown,  // Adjust the image's fit
                      alignment: Alignment.center,
                    ),
                  ),
                ),
              ),
              // Text part inside the container
              Padding(
                padding: const EdgeInsets.all(8.0),  // Optional padding for the text
                child: Text(
                  'Add',  // Replace with your desired text
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,  // Change text color as needed
                  ),
                  textAlign: TextAlign.center,  // Center text horizontally
                ),
              ),
            ],
          ),
        ),
          ),
        ),
      )),
    ],
  );
}
