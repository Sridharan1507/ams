import 'package:ams/bloc/vehicle/vehicle_bloc.dart';
import 'package:ams/bloc/vehicle/vehicle_event.dart';
import 'package:ams/bloc/vehicle/vehicle_state.dart';
import 'package:ams/model/vehicle/get_vechiles.dart';
import 'package:ams/model/vehicle/vehicle_sub_cat.dart';
import 'package:ams/screens/vehicles/order_vehicle_screen.dart';
import 'package:ams/theme/theme.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart' as geo;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetVehicleScreen extends StatefulWidget {
  const GetVehicleScreen({super.key});

  @override
  _GetVehicleScreenState createState() => _GetVehicleScreenState();
}

class _GetVehicleScreenState extends State<GetVehicleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        shape: const Border(
          bottom: BorderSide(color: Color(0xFFf3f5f5), width: 1),
        ),
        title: const Row(
          children: [
            Expanded(
              child: Text(
                'Vehicles',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
      body: ImageGrid(), // Assuming ImageGrid is defined elsewhere
    );
  }
}

class ImageGrid extends StatefulWidget {
  @override
  _ImageGridState createState() => _ImageGridState();
}

class _ImageGridState extends State<ImageGrid> {
  final List<Map<String, String>> items = [
    {
      'title': 'SEEDER',
      'description': 'Description for image 1',
      'image': 'lib/assets/images/close-up-seeder-attached-tractor-field.jpg',
    },
    {
      'title': 'LOADER',
      'description': 'Description for image 2',
      'image': 'lib/assets/images/loader.jpg',
    },
    {
      'title': 'EXCAVATOR',
      'description': 'Description for image 3',
      'image': 'lib/assets/images/excavator.jpg',
    },
    {
      'title': 'TRACTOR',
      'description': 'Description for image 4',
      'image': 'lib/assets/images/tractor-cultivating-field.jpg',
    },
    {
      'title': 'TRAILER',
      'description': 'Description for image 4',
      'image': 'lib/assets/images/trailer.png',
    },
      {
      'title': 'HARVESTER',
      'description': 'Description for image 4',
      'image': 'lib/assets/images/harvesting-combine-field.jpg',
    },
    {
      'title': 'PLOUGH',
      'description': 'Description for image 4',
      'image': 'lib/assets/images/plough.jpg',
    },
    {
      'title': 'SPRAYER',
      'description': 'Description for image 4',
      'image': 'lib/assets/images/sprayer.jpg',
    },
    
    
    
    // Add more items as needed
  ];
  String subCatCode = '';
  VehicleBloc vehicleBloc = VehicleBloc();
  VehicleBloc vehicleBloc2 = VehicleBloc();
  List<VehicleSubCatResponseData> itemsinve = [];
   geo.Position? geoposition ;

  @override
  void initState() {
   getLocation();
    // TODO: implement initState
    vehicleBloc.add(GetVehicleSubCategoryEvent());
    geoposition!.latitude;
    geoposition!.longitude;
    vehicleBloc2.add(GetAllVechiclesEvent(GetVehiclesRequestBody(catCode: "NA",subCatCode: "NA",location: "40.712776,-74.005974")));
    super.initState();
  }

  getLocation()async{
 geoposition = await geo.Geolocator.getCurrentPosition(
                desiredAccuracy: geo.LocationAccuracy.medium);
  }

  _listenerGetUserBloc(context, state) {
    if (state is GetVehicleSubCategoryLoadingState) {
      print('GetVehicleSubCategoryLoadingState');
    } else if (state is GetVehicleSubCategoryLoadedState) {
      // _toast(context, "GetVehicleSubCategoryLoadedState Got");
      itemsinve = state.vehicleSubCatResponseData!;
      print("itemsinve ${itemsinve.length}");
      print("itemsinve ${itemsinve.map((e) => e.name)}");
    } else if (state is GetVehicleSubCategoryErrorState) {
      print('GetVehicleSubCategoryErrorState');
      // _toast(context, state.error);
    }
  }
  _listenerGetUserBloc2(context, state) {
    if (state is GetVehicleSubCategoryLoadingState) {
      print('GetVehicleSubCategoryLoadingState');
    } else if (state is GetAllVechilesLoadedState) {
      // _toast(context, "GetVehicleSubCategoryLoadedState Got");
      state.getAllVehiclesResponseData!;
      print("itemsinve ${itemsinve.length}");
      print("itemsinve ${itemsinve.map((e) => e.name)}");
    } else if (state is GetVehicleSubCategoryErrorState) {
      print('GetVehicleSubCategoryErrorState');
      // _toast(context, state.error);
    }
  }

  buildElevatedButtonLarge(
      btnText, btnTextColor, btnColor, btnBorderColor, Function? onPress) {
    return Visibility(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 40,
        margin: const EdgeInsets.only(left: 10),
        child: ElevatedButton(
          onPressed: onPress as void Function()?,
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(btnColor),
              padding: MaterialStateProperty.all(EdgeInsets.zero),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(width: 1, color: btnBorderColor)),
              )),
          child: Center(
            child: Text(btnText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: btnTextColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                )),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Column(
        children: [
         BlocConsumer<VehicleBloc, VehicleState>(
    listener: (context, state) {
    _listenerGetUserBloc(context, state);
    },
    bloc: vehicleBloc2,
    builder: (context, VehicleState state) {
    if (state is GetAllVechilesLoadedState) {
     
print("state.getAllVehiclesResponseData.vechileList ${state.getAllVehiclesResponseData.vechileList!.length}");
      
    return      Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 columns per row
                childAspectRatio: 0.8, // Adjust for card aspect ratio
                crossAxisSpacing: 8.0, // Space between columns
                mainAxisSpacing: 8.0, // Space between rows
              ),
              itemCount: state.getAllVehiclesResponseData.vechileList?.length??0,
              itemBuilder: (context, index) {
                 String assetImagepath='';

      for(int i =0;i<items.length;i++){
        if(items[i]['title']==state.getAllVehiclesResponseData.vechileList![index].categoryCode){
          assetImagepath=items[i]['image']!;
        }
      }
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                OrderConfirmationScreen(vehicleSubCatResponseData: state.getAllVehiclesResponseData.vechileList![index],assetImagepath: assetImagepath,)));
                  },
                  child: Card(
                    surfaceTintColor: Colors.grey.shade100,
                    elevation: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            state.getAllVehiclesResponseData.vechileList![index].name??'',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  8), // Rounded corners (optional)
                              image: DecorationImage(
                                image: AssetImage(assetImagepath),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "₹ ${state.getAllVehiclesResponseData.vechileList![index].amount??''} ${state.getAllVehiclesResponseData.vechileList![index].amountType!.replaceAll("_", " ")??''}",
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );}
    return const SizedBox();
    }),
        ],
      ),
    );
  }
}
