import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:intl/intl.dart";
import 'package:charts_flutter/flutter.dart' as charts;




class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {

  List TodayTopics = [];
  List MyTrend = [];

  _readData() async {
    await DefaultAssetBundle.of(context).loadString("json/TodayNews.json").then((s) {
      setState(() {
        TodayTopics = json.decode(s);
      });
    });

    await DefaultAssetBundle.of(context).loadString("json/MyTrend.json").then((s) {
      setState(() {
        MyTrend = json.decode(s);
      });
    });
  }

  @override
  void initState() {
    _readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    int _currentIndex = 0;

    return
      Scaffold(
          // appBar: AppBar(
          //     backgroundColor: Color(0xFFbd6856),
          // ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(top: 50),
              color: Color(0xFFefefef),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                      child: Text(
                        DateFormat('yyyy年 M月 d日').format(Get.arguments),
                        style: TextStyle(
                          color: Color(0xFF555647),
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  ),
                  Divider(thickness: 1.5,),
                  SizedBox(height: 10,),
                  Container(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Row(
                      children: [
                        Text(
                          "スクリーンタイム",
                          style: TextStyle(
                              color: Color(0xFF1f2326),
                              fontSize: 20,
                              decoration: TextDecoration.none
                          ),
                        ),
                        Expanded(child: Container()),
                        Text(
                          "Detail",
                          style: TextStyle(
                              color: Color(0xFFffa07a),
                              fontSize: 15,
                              decoration: TextDecoration.none
                          ),
                        ),

                        SizedBox(width: 5,),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xFFffa07a)
                          ),
                          child: GestureDetector(
                              child: Icon(
                                  Icons.arrow_forward_ios, color: Colors.white)
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    height: 200,
                    width: 350,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "よく使った言葉",
                      style: TextStyle(
                          color: Color(0xFF1f2326),
                          fontSize: 20,
                          decoration: TextDecoration.none
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  //list
                  Container(
                      height: 180,
                      width: width,
                      child:   MediaQuery.removePadding(context: context,
                          removeTop: true,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: MyTrend.length,
                              itemBuilder: (_, i){
                                return Container(
                                  width: width,
                                  height: 60,
                                  margin: const EdgeInsets.only(left: 25, right: 20, bottom: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color:Color(0xFFdcd6d2),
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 20, right: 20),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      MyTrend[i]['title'],
                                      style: TextStyle(
                                          color:Color(0xFF1f2326),
                                          fontSize: 18,
                                          decoration: TextDecoration.none
                                      ),
                                    ),
                                  ),
                                );
                              })

                      )

                  ),
                  // _VerticalList(context, MyTrend, width, Color(0xFFe6bfb2), Color(0xFFe8d3ca)),
                  SizedBox(height: 20,),
                  Container(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Row(
                      children: [
                        Text(
                          "今日のニュース",
                          style: TextStyle(
                              color: Color(0xFF1f2326),
                              fontSize: 20,
                              decoration: TextDecoration.none
                          ),
                        ),
                        Expanded(child: Container()),
                        Text(
                          "Detail",
                          style: TextStyle(
                              color: Color(0xFFffa07a),
                              fontSize: 15,
                              decoration: TextDecoration.none
                          ),
                        ),

                        SizedBox(width: 5,),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xFFffa07a)
                          ),
                          child: GestureDetector(
                              child: Icon(
                                  Icons.arrow_forward_ios, color: Colors.white)
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  //list
                  _VerticalList(context, TodayTopics, width, Color(0xFF8fbc8f), Color(0xFF54917f)),
                  SizedBox(height: 20,),
                  Container(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Row(
                      children: [
                        Text(
                          "ヘルスケア",
                          style: TextStyle(
                            color: Color(0xFF1f2326),
                            fontSize: 20,
                            decoration: TextDecoration.none
                          ),
                        ),
                        Expanded(child: Container()),
                      ]
                    )
                  ),
                  SizedBox(height: 10,),
                  Container(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    height: 100,
                    width: width,
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius:40,
                          backgroundImage: AssetImage(
                            "img/5.jpg"
                          ),
                        ),
                        SizedBox(width: 30,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "歩数",
                              style: TextStyle(
                                  color:Color(0xFF3b3f42),
                                  fontSize: 18,
                                  decoration: TextDecoration.none
                              ),
                            ),
                            SizedBox(height: 5,),
                            Text(
                              "Number of steps",
                              style: TextStyle(
                                  color:Colors.black,
                                  fontSize: 12,
                                  decoration: TextDecoration.none
                              ),
                            ),
                          ]
                        ),
                        SizedBox(width: 30,),
                        Text(
                          "121",
                          style: TextStyle(
                              color:Colors.black,
                              fontSize: 20,
                              decoration: TextDecoration.none
                          ),
                        ),
                      ],
                    )
                  ),
                  SizedBox(height: 10,),
                  Container(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      height: 100,
                      width: width,
                      child: Row(
                        children: [
                          SizedBox(
                            height:80,
                            width: 80,
                            child: Image.asset(
                                "img/6.png"
                            ),
                          ),
                          SizedBox(width: 30,),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "移動距離",
                                  style: TextStyle(
                                      color:Color(0xFF3b3f42),
                                      fontSize: 18,
                                      decoration: TextDecoration.none
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text(
                                  "Moving distance",
                                  style: TextStyle(
                                      color:Colors.black,
                                      fontSize: 12,
                                      decoration: TextDecoration.none
                                  ),
                                ),
                              ]
                          ),
                          SizedBox(width: 30,),
                          Text(
                            "2021 km",
                            style: TextStyle(
                                color:Colors.black,
                                fontSize: 20,
                                decoration: TextDecoration.none
                            ),
                          ),
                        ],
                      )
                  ),
                  SizedBox(height: 10,),
                ],
              )
            )
          )
      );
  }
}

Widget _VerticalList(BuildContext context, List list, double width,
    Color color1, Color color2) {
  return Container(
      height: 320,
      child: PageView.builder(
          controller: PageController(viewportFraction: 0.88),
          itemCount: list.length,
          itemBuilder: (_, i) {
            return GestureDetector(
              child: Container(
                padding: const EdgeInsets.only(
                    left: 20, top: 20),
                height: 320,
                width: MediaQuery
                    .of(context)
                    .size
                    .width - 20,
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: i.isEven ? color1 : color2
                ),
                child: Column(
                  children: [
                    Container(
                        child: Row(
                          children: [
                            Text(
                              list[i]['title'],
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white
                              ),
                            ),
                            Expanded(child: Container())
                          ],
                        )
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: width,
                      child: Text(
                        list[i]['text'],
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Divider(thickness: 1.0,),
                    SizedBox(height: 5,),
                    Container(

                      width: 200,
                      height: 150,
                      child: Container(
                        decoration: BoxDecoration(
                          //borderRadius: BorderRadius.circular(25),
                            image: DecorationImage(
                                image: AssetImage(
                                    list[i]['img']
                                ),
                                fit: BoxFit.cover
                            )
                        ),
                      ),
                    ),
                  ],
                ),

              ),
            );
          }
      )
  );
}


