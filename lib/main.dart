import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:gulu_flutter_intro_app/test_page.dart';

void main() {
  runApp(MyApp());
}

const white = Colors.white;
const grey = Colors.grey;
const green = Color(0xFF4C9776);
const background = Color(0xFFF9F8F8);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:
          HouseManagementPage() /*Scaffold(
        appBar: AppBar(
          title: Text(
            "Title",
          ),
        ),
        body: Center(
          child: Container(
              color: Colors.blue,
              height: 200,
              width: 200,
              child: ListView.separated(
                itemCount: 5,
                separatorBuilder: (context, index) => Divider(
                  color: Colors.red,
                  height: 10,
                  thickness: 5,
                ),
                itemBuilder: (context, index) => TextWithState(),
              )),
        ),
      )*/
      ,
    );
  }
}

class HouseManagementPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HouseManagementPageState();
  }
}

class RoomType {
  String name;
  int id;
  RoomType({required this.name, required this.id});
}

class Device {
  RoomType roomType;
  String name;
  IconData icon;

  Device({required this.roomType, required this.name, required this.icon});
}

class _HouseManagementPageState extends State<HouseManagementPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late PageController pageController;
  late PageController navigationController;

  static List<RoomType> room_types = [
    RoomType(name: "Living Room", id: 1),
    RoomType(name: "Meeting Room", id: 2),
  ];

  static List<Device> devices = [
    Device(roomType: room_types[0], name: "Tv", icon: Entypo.monitor),
    Device(roomType: room_types[0], name: "Fan", icon: FontAwesome5.fan),
    Device(
        roomType: room_types[1], name: "Home theater", icon: FontAwesome5.fan),
    Device(roomType: room_types[0], name: "Lights", icon: FontAwesome5.fan),
    Device(roomType: room_types[1], name: "Whatever", icon: FontAwesome5.fan),
    Device(roomType: room_types[1], name: "Radio", icon: FontAwesome5.fan),
  ];

  int selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    pageController = PageController(initialPage: 0);
    navigationController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    tabController.dispose();
    pageController.dispose();
    navigationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
          child: ExpandablePageView(
        controller: navigationController,
        onPageChanged: (i) {
          setState(() {
            selectedIndex = i;
          });
        },
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Mercy's House",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(Icons.keyboard_arrow_down_outlined),
                    Spacer(),
                    Icon(Icons.notifications),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(Icons.menu),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0), color: white),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Saturday, 11 Feb 2023",
                                style: TextStyle(color: grey),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "29",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 50,
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "o",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 35,
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "C",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Cloudy",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Icon(
                            Icons.cloudy_snowing,
                            size: 80,
                            color: green,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          WeatherInfoTile(title: "Humidity", info: "56.9 %"),
                          WeatherInfoTile(
                              title: "Air Pressure", info: "904 hPa"),
                          WeatherInfoTile(title: "Wind Speed", info: "5.6 m/s"),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TabBar(
                  controller: tabController,
                  labelStyle: TextStyle(color: Colors.black),
                  onTap: (index) {
                    pageController.jumpToPage(index);
                  },
                  tabs: [
                    Tab(
                      text: "All Devices",
                    ),
                    Tab(
                      text: "Living Room",
                    ),
                    Tab(
                      text: "Meeting Room",
                    ),
                  ],
                  labelColor: Colors.black,
                  indicatorColor: green,
                ),
                ExpandablePageView(
                  controller: pageController,
                  onPageChanged: (index) {
                    tabController.animateTo(index);
                  },
                  children: [
                    Container(
                      height: 300,
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3),
                          itemCount: devices.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => TestPage(),
                                      ));
                                },
                                child: DeviceWidget(device: devices[index]));
                          }),
                    ),
                    Container(
                      height: 300,
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3),
                          itemCount: devices
                              .where((element) => element.roomType.id == 1)
                              .length,
                          itemBuilder: (context, index) {
                            return DeviceWidget(
                                device: devices
                                    .where(
                                        (element) => element.roomType.id == 1)
                                    .toList()[index]);
                          }),
                    ),
                    Container(
                      height: 300,
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3),
                          itemCount: devices
                              .where((element) => element.roomType.id == 2)
                              .length,
                          itemBuilder: (context, index) {
                            return DeviceWidget(
                                device: devices
                                    .where(
                                        (element) => element.roomType.id == 2)
                                    .toList()[index]);
                          }),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            child: Center(
              child: Text("My Home"),
            ),
          ),
          Container(
            child: Center(
              child: Text("My Devices"),
            ),
          ),
          Container(
            child: Center(
              child: Text("Reports"),
            ),
          ),
          Container(
            child: Center(
              child: Text("Profile"),
            ),
          )
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: green,
        unselectedItemColor: grey,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });

          navigationController.jumpToPage(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_city),
            label: "My Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mic),
            label: "Devices",
          ),
          BottomNavigationBarItem(
            icon: Icon(Typicons.chart_bar),
            label: "Reports",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          )
        ],
      ),
    );
  }
}

class DeviceWidget extends StatefulWidget {
  Device device;

  DeviceWidget({required this.device});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DeviceWidgetState();
  }
}

class _DeviceWidgetState extends State<DeviceWidget> {
  bool isOn = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(8),
      decoration:
          BoxDecoration(color: white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Icon(
            widget.device.icon,
            color: isOn ? green : grey,
          ),
          Text(
            widget.device.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            widget.device.roomType.name,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          ),
          Switch(
            value: isOn,
            onChanged: (b) {
              setState(() {
                isOn = b;
              });
            },
            activeColor: green,
          )
        ],
      ),
    );
  }
}

class WeatherInfoTile extends StatelessWidget {
  String title, info;

  WeatherInfoTile({required this.title, required this.info});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$title",
          style: TextStyle(
            fontWeight: FontWeight.w200,
            fontSize: 14,
          ),
        ),
        Text(
          "$info",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ],
    );
  }
}
/*

Widget OurTextWidget(index) {
  return Text(
    "Textweww $index",
    style: TextStyle(
      fontSize: 20,
    ),
  );
}

class MyTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text("Our Text");
  }
}

class TextWithState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TextWidgetState();
  }
}

class _TextWidgetState extends State<TextWithState> {
  int pressed = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () {
        print("this has been pressed");

        setState(() {
          pressed += 1;
        });
      },
      child: Text(
        "Press $pressed",
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
*/
