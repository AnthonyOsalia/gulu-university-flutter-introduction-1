import 'package:flutter/material.dart';

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

class _HouseManagementPageState extends State<HouseManagementPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Container(
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
                        WeatherInfoTile(title: "Air Pressure", info: "904 hPa"),
                        WeatherInfoTile(title: "Wind Speed", info: "5.6 m/s"),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
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
