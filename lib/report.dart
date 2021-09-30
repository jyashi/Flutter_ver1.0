import 'dart:convert';
import 'package:flutter/material.dart';



class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {

  List TodayTopics = [];

  _readData() async {
    await DefaultAssetBundle.of(context).loadString("json/detail.json").then((
        s) {
      setState(() {
        TodayTopics = json.decode(s);
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
              color: Color(0xFFffeaea),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                      child: Text(
                        "2021年 9月 30日 (木)",
                        style: TextStyle(
                          color: Color(0xFF555647),
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  ),
                  Divider(thickness: 1.5,),
                  SizedBox(height: 20,),
                  Container(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Row(
                      children: [
                        Text(
                          "Today's Topics",
                          style: TextStyle(
                              color: Color(0xFF1f2326),
                              fontSize: 20,
                              decoration: TextDecoration.none
                          ),
                        ),
                        Expanded(child: Container()),
                        Text(
                          "Show all",
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
                  _VerticalList(context, TodayTopics, width, Color(0xFFe6bfb2), Color(0xFFe8d3ca)),
                  SizedBox(height: 20,),
                  Container(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Row(
                      children: [
                        Text(
                          "Yours Buzzword",
                          style: TextStyle(
                              color: Color(0xFF1f2326),
                              fontSize: 20,
                              decoration: TextDecoration.none
                          ),
                        ),
                        Expanded(child: Container()),
                        Text(
                          "Show all",
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
                  _VerticalList(context, TodayTopics, width, Color(0xFFeedcb3), Color(0xFFe8c59c)),
                  SizedBox(height: 20,),
                  Container(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Row(
                      children: [
                        Text(
                          "Special Event",
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
                  SizedBox(height: 20,),

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
