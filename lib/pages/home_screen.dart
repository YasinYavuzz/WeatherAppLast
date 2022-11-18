import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_ui/pages/detail_screen.dart';
import 'package:weather_ui/providers/weather_provider.dart';

const List<String> list = ['Tanjungsiang, Subang', 'Selasa, Hujan petir'];

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isVisible = false;
  TextEditingController controller = TextEditingController();
  String dropdownValue = list.first;

  bool isLoading = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey _first = GlobalKey();
  final GlobalKey _second = GlobalKey();

  WeatherProvider? wetProvider;
  HourlyWeatherProvider? hourlyWeatherProvider;
  int? statusCode;


  @override
  void initState() {
    super.initState();
    wetProvider = Provider.of<WeatherProvider>(context, listen: false);
    hourlyWeatherProvider =
        Provider.of<HourlyWeatherProvider>(context, listen: false);
    wetProvider!.getWeatherData(context);
    hourlyWeatherProvider!.getHourlyWeatherData(context);
    // WidgetsBinding.instance.addPostFrameCallback(
    //   (_) => ShowCaseWidget.of(context).startShowCase([
    //     _first,
    //   ]),
    // );
    //statusCode = wetProvider!.statusCode;

  //   showDialog<void>(
  //   context: context,
  //   //barrierDismissible: false, // user must tap button!
  //   builder: (BuildContext context) {
  //     return AlertDialog(
  //       title: const Text('AlertDialog Title'),
  //       content: SingleChildScrollView(
  //         child: ListBody(
  //           children: const <Widget>[
  //             Text('This is a demo alert dialog.'),
  //             Text('Would you like to approve of this message?'),
  //           ],
  //         ),
  //       ),
  //       actions: <Widget>[
  //         TextButton(
  //           child: const Text('Approve'),
  //           onPressed: () {
  //             Navigator.of(context).pop();
  //           },
  //         ),
  //       ],
  //     );
  //   },
  // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body : FadeInUp(
        duration: Duration(seconds: 3),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 50, left: 20),
                    width: 193,
                    height: 24,
                    // color: Colors.amber,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset("assets/coolicon.png"),
                        DropdownButton<String>(
                          value: dropdownValue,
                          icon: Image.asset("assets/caret_down.png"),
                          elevation: 16,
                          style:
                              const TextStyle(color: Colors.black, fontSize: 14),
                          // underline:
                          //     Container(height: 1, color: Colors.deepPurpleAccent),
                          items:
                              list.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            // This is called when the user selects an item.
                            setState(() {
                              dropdownValue = value!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(top: 50, right: 25),
                      width: 120,
                      height: 24,
                      decoration: BoxDecoration(
                          color: isVisible == false
                              ? Colors.white
                              : Colors.grey[200],
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          isVisible
                              ? Container(
                                  margin: EdgeInsets.only(right: 16),
                                  width: 75,
                                  height: 24,
                                  child: TextField(
                                    controller: controller,
                                    autofocus: false,
                                    decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.transparent),
                                      ),
                                    ),
                                  ))
                              : SizedBox(
                                  width: 50,
                                  height: 50,
                                ),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  isVisible = !isVisible;
                                });
                              },
                              child: Image.asset(
                                "assets/search.png",
                                width: 25,
                              ))
                        ],
                      )),
                ],
              ),
              Consumer(
                builder:
                    (BuildContext context, WeatherProvider value, Widget? child) {
                  return Container(
                    width: 350,
                    height: 193,
                    margin: EdgeInsets.only(top: 24, left: 20),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Color(0xff4F7FFA), Color(0xff335FD1)]),
                        borderRadius: BorderRadius.circular(14)),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 24, left: 24),
                          width: 295,
                          height: 17,
                          child: FadeInLeft(
          
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  " , 20 December 2021",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text("3.30 PM",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400))
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 250,
                          height: 90,
                          margin: EdgeInsets.only(top: 24, right: 90),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                      child: FadeInDown(
                                          child: Image.asset("assets/1.png"))),
                              Container(
                                margin: EdgeInsets.only(top: 12),
                                child: FadeInLeft(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          "${value.response.main!.temp!.toInt()} °C",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400)),
                                      Container(
                                          margin: EdgeInsets.only(top: 8),
                                          child: Text("${value.response.name}",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600)))
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: 155,
                          height: 17,
                          margin: EdgeInsets.only(left: 24),
                          child: FadeInLeft(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Terakhir update 3.00 PM",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400)),
                                Image.asset("assets/refresh.png")
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              Container(
                margin: EdgeInsets.only(top: 24, left: 20),
                child: Text(
                  "Cuaca Per Jam",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Consumer(
                builder: (context, HourlyWeatherProvider value, child) {
                  return Container(
                    height: 115,
                    margin: EdgeInsets.only(left: 20),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 24,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            hourlyWeatherProvider!.getChangeIndex(index);
                            Navigator.push<void>(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) => DetailScreen(),
                              ),
                            );
                          },
                          child: Container(
                            //color: Colors.red,
                            margin: EdgeInsets.only(top: 16, right: 10),
                            width: 78,
                            height: 115,
                            decoration: BoxDecoration(
                                color: Color(0xffFBFBFB),
                                borderRadius: BorderRadius.circular(4)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    width: 40,
                                    height: 40,
                                    margin: EdgeInsets.only(top: 8),
          
                                    //color: Colors.red,
                                    child: Image.asset("assets/1.png",
                                        fit: BoxFit.cover)),
                                Container(
                                    margin: EdgeInsets.only(top: 4),
                                    child: Text(
                                      "${value.hourlyWeatherResponse.list![index].main!.temp!.round().toString()} °C",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    )),
                                Container(
                                    margin: EdgeInsets.only(top: 8),
                                    child: Text(
                                      "${value.hourlyWeatherResponse.list![index].dtTxt!.hour.toString()} : ${value.hourlyWeatherResponse.list![index].dtTxt!.minute.toString()}${value.hourlyWeatherResponse.list![index].dtTxt!.second.toString()}",
                                      //value.hourlyWeatherResponse.list![index].dtTxt!.toString().split(" ").last.substring(0,5),
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ))
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
              Container(
                margin: EdgeInsets.only(left: 20, top: 24),
                width: 60,
                height: 24,
                child: Text(
                  "Harian",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                width: 343,
                height: 90,
                margin: EdgeInsets.only(left: 20, top: 16),
                decoration: BoxDecoration(
                    color: Color(0xffF37E7E).withOpacity(0.2),
                    image: DecorationImage(
                        image: AssetImage("assets/pink-style.png"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    Container(
                        width: 40,
                        height: 40,
                        margin: EdgeInsets.only(left: 16),
                        child: Image.asset(
                          "assets/heavy-showers-line.png",
                          fit: BoxFit.cover,
                        )),
                    Column(
                      children: [
                        Container(
                          width: 200,
                          height: 36,
                          margin: EdgeInsets.only(left: 16, top: 16),
                          child: Text(
                            "Cuaca esok hari kemungkinan akan terjadi hujan di siang hari",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Container(
                            width: 200,
                            height: 16,
                            margin: EdgeInsets.only(left: 16, top: 4),
                            child: Text(
                              "Jangan lupa bawa payung ya",
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w400),
                              textAlign: TextAlign.start,
                            )),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: 200,
                margin: EdgeInsets.only(left: 20, right: 27, top: 16),
                child: ListView.builder(
                  // physics: NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  shrinkWrap: true,
                  padding: EdgeInsets.all(0),
                  itemBuilder: (context, index) {
                    return Container(
                      width: 343,
                      height: 72,
                      margin: EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                          color: Color(0xffD2DFFF),
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              left: 16,
                            ),
                            alignment: Alignment.center,
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/1.png")),
                                shape: BoxShape.circle,
                                color: Color(0xff9AB6FF)),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 16, top: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Selesa",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Container(
                                    margin: EdgeInsets.only(top: 4),
                                    child: Text("Hujan petir"))
                              ],
                            ),
                          ),
                          Container(
                              width: 65,
                              height: 20,
                              margin: EdgeInsets.only(left: 115),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "19º C",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14),
                                  ),
                                  Image.asset("assets/coolicon-right.png")
                                ],
                              ))
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
