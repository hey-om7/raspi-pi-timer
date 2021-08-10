import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: MainPage(),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Switch Timers',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: GridView.count(
              physics: BouncingScrollPhysics(),
              crossAxisCount: 2,
              children: [
                ButtonAlarms(
                  btnStat: true,
                ),
                ButtonAlarms(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonAlarms extends StatelessWidget {
  ButtonAlarms({this.btnStat});
  final bool? btnStat;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.33,
        height: MediaQuery.of(context).size.height * 0.30,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color(0xff1F1C22),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            MyCustomProgress(
              percent: 90,
            ),
            Spacer(),
            Container(
              height: 5,
              margin: EdgeInsets.only(bottom: 10),
              width: MediaQuery.of(context).size.width * 0.15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: btnStat != null || btnStat == false
                    ? [
                        BoxShadow(
                            color: Colors.yellow.withOpacity(0.5),
                            blurRadius: 2,
                            spreadRadius: 1),
                      ]
                    : [],
                gradient: LinearGradient(
                  colors: btnStat == null || btnStat == false
                      ? [Color(0xff452F2F), Color(0xff515151)]
                      : [Colors.yellow, Colors.orange],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyCustomProgress extends StatelessWidget {
  MyCustomProgress({required this.percent});
  int percent = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          child: Center(
            child: SleekCircularSlider(
              min: 0,
              max: 100,
              initialValue: percent.toDouble(),
              appearance: CircularSliderAppearance(
                startAngle: -90,
                angleRange: 360,
                customWidths: CustomSliderWidths(
                  trackWidth: 1,
                  progressBarWidth: 1,
                  shadowWidth: 15,
                ),
                customColors: CustomSliderColors(
                    dotColor: Colors.transparent,
                    progressBarColor: Colors.white,
                    trackColor: Colors.grey[700],
                    hideShadow: false,
                    shadowColor: Colors.blue,
                    shadowMaxOpacity: 0.05),
                infoProperties: InfoProperties(
                  mainLabelStyle: TextStyle(
                    color: Colors.transparent,
                  ),
                ),
                spinnerMode: false,
              ),
            ),
          ),
        ),
        Text(
          '04:35',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        )
      ],
    );
  }
}
