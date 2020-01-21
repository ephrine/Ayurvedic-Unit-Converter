import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;
import "package:flare_flutter/flare_actor.dart";
import 'weightvalues.dart';
import 'SelectedCategory.dart';

class WeightConvertScreen extends StatefulWidget {
  final SelectedCategory ggg;
  WeightConvertScreen({Key key, @required this.ggg}) : super(key: key);

  @override
  _WeightConvertScreen createState() => _WeightConvertScreen();
}

class _WeightConvertScreen extends State<WeightConvertScreen> {
  String dropdownValue = 'Ayurvedic Unit';
  String dropdownSciValue = 'Scientific Unit';
  String finalValue;
  final valueController = TextEditingController();
  String animationNameDumbell = "dumbell";
  String animationNameArrow;
  FlareControls flarecontrols = FlareControls();
  bool isReverse = false;
  String arrowimage;
  String ayurDescTitle;
  String sciDescTitle;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    valueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (finalValue != null) {
    } else {
      finalValue = "-";
    }

    if (animationNameArrow != null) {
    } else {
      animationNameArrow = 'LTR';
    }

    if (arrowimage != null) {
    } else {
      arrowimage = 'img/baseline_arrow_forward_black_48dp.png';
    }

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Weight Convert"),
      ),
      body: Column(children: <Widget>[
        Center(
            child: Column(
          children: <Widget>[
            //  Image(image: AssetImage('img/weight100px.png'), width: 90.0),
            Container(
              height: 100.0,
              width: 100.0,
              child: FlareActor(
                "assets/dumbell_lifting.flr",
                animation: animationNameDumbell,
                isPaused: false,
              ),
            ),

            Padding(
                padding: EdgeInsets.only(left: 10, right: 10, top: 40),
                child: TextField(
                  controller: valueController,

                  onChanged: (text) {
                    calculate();
                  },
                  keyboardType: TextInputType.number,
                  //obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Value',
                  ),
                )),
            Row(
              children: <Widget>[
                Expanded(
                  child: dropdownWeight(),
                ),
                /*       Container(
                height: 50.0,
                width: 50.0,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      // animationNameArrow='RTL';
                      //   flarecontrols.play(animationNameArrow);
                      onAnimButtonTap();
                    });
                  },
                  child: FlareActor(
                    "assets/arrow.flr",
                    animation: animationNameArrow,
                    fit: BoxFit.fitWidth,
                    //   controller: flarecontrols,
                  ),
                ),
              ),
*/
                //  const Icon(Icons.arrow_forward),
                Container(
                  height: 50,
                  width: 50,
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isReverse) {
                            isReverse = false;

                            arrowimage =
                                "img/baseline_arrow_forward_black_48dp.png";
                          } else {
                            arrowimage =
                                "img/baseline_arrow_back_black_48dp.png";
                            isReverse = true;
                          }
                          developer.log(isReverse.toString());
                          calculate();
                        });
                      },
                      child: Image(image: AssetImage(arrowimage))),
                ),
                dropdownSci()
              ],
            ),
            /*Text(
            finalValue,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),*/

            Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Center(
                    child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: finalValue,
                      //  style: DefaultTextStyle.of(context).style,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                          fontSize: 25.0)),
                ))),
            // buttonCalculate(),
          ],
        )),
        Padding(
          padding: EdgeInsets.only(left: 5.0, right: 5.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                  text: "Details",
                  //  style: DefaultTextStyle.of(context).style,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 15)),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 5.0, right: 5.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                  text: dropdownValue + ":",

                  //  style: DefaultTextStyle.of(context).style,
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      fontStyle: FontStyle.italic)),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 5.0, right: 5.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                  text: ayurDescTitle,
                  //  style: DefaultTextStyle.of(context).style,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  )),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 10.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                  text: dropdownSciValue + ":",
                  //  style: DefaultTextStyle.of(context).style,
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      fontStyle: FontStyle.italic)),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 5.0, right: 5.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                  text: sciDescTitle,
                  //  style: DefaultTextStyle.of(context).style,
                  style: TextStyle(
                      fontWeight: FontWeight.normal, color: Colors.black)),
            ),
          ),
        )
      ]),
    );
  }

  void onAnimButtonTap() {
    var f;
    if (animationNameArrow == 'LTR') {
      f = 'RTL';
      developer.log("animationNameArrow= " + animationNameArrow);
    } else {
      f = 'LTR';
      developer.log("animationNameArrow= " + animationNameArrow);
      //   flarecontrols.play(_animationNameArrow);
    }
    setState(() {
      animationNameArrow = f;
      //flarecontrols.play(animationNameArrow);
    });
  }

  Widget dropdownWeight() {
//    EdgeInsets.only(left: 10.0,right:10.0);

    return DropdownButton<String>(
      hint: new Text(dropdownValue),
      items: <String>[
        weightList[0],
        weightList[1],
        weightList[2],
        weightList[3],
        weightList[4],
        weightList[5],
        weightList[6],
        weightList[7],
        weightList[8],
        weightList[9],
        weightList[10],
        weightList[11],
        weightList[12],
        weightList[13],
        weightList[14],
        weightList[15],
        weightList[16],
        weightList[17],
        weightList[18],
        weightList[19],
        weightList[20],
        weightList[21],
        weightList[22],
        weightList[23],
        weightList[24],
        weightList[25],
        weightList[26],
        weightList[27],
        weightList[28],
        weightList[29],
        weightList[30],
        weightList[31],
        weightList[32],
        weightList[33],
        weightList[34],
        weightList[35],
        weightList[36],
        weightList[37],
        weightList[38],
        weightList[39],
        weightList[40],
        weightList[41],
        weightList[42],
        weightList[43],
        weightList[44],
        weightList[45],
        weightList[46],
        weightList[47]
      ].map((String value) {
        return new DropdownMenuItem<String>(
          value: value,
          child: new Text(value),
        );
      }).toList(),
      onChanged: (String val) {
        setState(() {
          dropdownValue = val;
          developer.log("Drop Down1: " + val);
        });
        if (dropdownSciValue != null) {
          calculate();
        }
      },
    );
  }

  Widget dropdownSci() {
//    EdgeInsets.only(left: 10.0,right:10.0);

    return DropdownButton<String>(
      hint: new Text(dropdownSciValue),
      items: <String>[
        sciValueList[0],
        sciValueList[1],
        sciValueList[2],
        sciValueList[3],
        sciValueList[4],
        sciValueList[5],
        sciValueList[6],
        sciValueList[7],
        sciValueList[8],
        sciValueList[9],
        sciValueList[10],
        sciValueList[11],
        sciValueList[12],
        sciValueList[13],
        sciValueList[14],
        sciValueList[15],
        sciValueList[16],
        sciValueList[17],
        sciValueList[18],
        sciValueList[19],
        sciValueList[20],
        sciValueList[21],
        sciValueList[22],
        sciValueList[23],
        sciValueList[24],
        sciValueList[25]
      ].map((String value) {
        return new DropdownMenuItem<String>(
          value: value,
          child: new Text(value),
        );
      }).toList(),
      onChanged: (String val) {
        setState(() {
          dropdownSciValue = val;
          developer.log("Drop Down: " + val);
        });
        if (dropdownValue != null) {
          calculate();
        }
      },
    );
  }

  Widget buttonCalculate() {
    return RaisedButton(
      onPressed: () {
        calculate();
      },
      textColor: Colors.white,
      padding: const EdgeInsets.all(0.0),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              Color(0xFF0D47A1),
              Color(0xFF1976D2),
              Color(0xFF42A5F5),
            ],
          ),
        ),
        padding: const EdgeInsets.all(10.0),
        child: const Text('Calculate', style: TextStyle(fontSize: 20)),
      ),
    );
  }

  void calculate() {
    String val;
    double oneUnit;
    String unit;

//Ratti
    if (dropdownValue == weightList[0]) {
      unit = weightList[0];
      ayurDescTitle = ayurValDesc[0];

      if (dropdownSciValue == sciValueList[0]) {
        sciDescTitle = sciDesc[0];
        if (isReverse) {
          oneUnit = 248.8278144;
          developer.log("Calculated Ratti <- Ounce(troy)");
        } else {
          oneUnit = 0.0040188433210785;
          unit = sciValueList[0];
          developer.log("Calculated Ratti -> Ounce(troy)");
        }
      } else if (dropdownSciValue == sciValueList[1]) {
        if (isReverse) {
          oneUnit = 3628.73896;
          developer.log("Calculated Ratti <- Ounce(avdp)");
        } else {
          oneUnit = 0.0002755778277311;
          unit = sciValueList[1];
          developer.log("Calculated Ratti -> Ounce(avdp)");
        }
      } else if (dropdownSciValue == sciValueList[2]) {
        if (isReverse) {
          oneUnit = 2985.9337728;
          developer.log("Calculated Ratti <- Pound(Troy)");
        } else {
          oneUnit = 0.00033490361008987;
          unit = sciValueList[2];
          developer.log("Calculated Ratti -> Pound(Troy)");
        }
      } else if (dropdownSciValue == sciValueList[3]) {
        if (isReverse) {
          oneUnit = 3628.74184;
          developer.log("Calculated Ratti <- Pound(avdp)");
        } else {
          oneUnit = 0.00027557760901503;
          unit = sciValueList[3];
          developer.log("Calculated Ratti -> Pound(avdp)");
        }
      } else if (dropdownSciValue == sciValueList[4]) {
        if (isReverse) {
          oneUnit = 4000;
          developer.log("Calculated Ratti <- Pound(metric)");
        } else {
          oneUnit = 0.00025;
          unit = sciValueList[4];
          developer.log("Calculated Ratti -> Pound(metric)");
        }
      } else if (dropdownSciValue == sciValueList[5]) {
        if (isReverse) {
          oneUnit = 12.44139072;
          developer.log("Calculated Ratti <- Penny ");
        } else {
          oneUnit = 0.08037686642157;
          unit = sciValueList[5];
          developer.log("Calculated Ratti -> Penny");
        }
      } else if (dropdownSciValue == sciValueList[6]) {
        if (isReverse) {
          oneUnit = 8;
          developer.log("Calculated Ratti <- Grams");
        } else {
          oneUnit = 0.125;
          unit = sciValueList[6];
          developer.log("Calculated Ratti -> Grams");
        }
      } else if (dropdownSciValue == sciValueList[7]) {
        if (isReverse) {
          oneUnit = 8000;
          developer.log("Calculated Ratti <- Kilogram ");
        } else {
          oneUnit = 0.000125;
          unit = sciValueList[7];
          developer.log("Calculated Ratti -> Kilogram");
        }
      } else if (dropdownSciValue == sciValueList[8]) {
        if (isReverse) {
          oneUnit = 0.008;
          developer.log("Calculated Ratti <- MiliGram ");
        } else {
          oneUnit = 125;
          unit = sciValueList[8];
          developer.log("Calculated Ratti -> MiliGram");
        }
      } else if (dropdownSciValue == sciValueList[9]) {
        if (isReverse) {
          oneUnit = 0.000008;
          developer.log("Calculated Ratti <- MicroGram ");
        } else {
          oneUnit = 125000;
          unit = sciValueList[9];
          developer.log("Calculated Ratti -> MicroGram");
        }
      } else if (dropdownSciValue == sciValueList[10]) {
        if (isReverse) {
          oneUnit = 8000000;
          developer.log("Calculated Ratti <- Megagram ");
        } else {
          oneUnit = 0.000000125;
          unit = sciValueList[10];
          developer.log("Calculated Ratti -> Megagram");
        }
      } else if (dropdownSciValue == sciValueList[11]) {
        if (isReverse) {
          oneUnit = 116751.224;
          developer.log("Calculated Ratti <- Slug ");
        } else {
          oneUnit = 0.000008565220695245131;
          unit = sciValueList[11];
          developer.log("Calculated Ratti -> Slug");
        }
      } else if (dropdownSciValue == sciValueList[12]) {
        if (isReverse) {
          oneUnit = 50802.34544;
          developer.log("Calculated Ratti <- Stone ");
        } else {
          oneUnit = 0.000019684130552221215;
          unit = sciValueList[12];
          developer.log("Calculated Ratti -> Stone");
        }
      } else if (dropdownSciValue == sciValueList[13]) {
        if (isReverse) {
          oneUnit = 261.333336;
          developer.log("Calculated Ratti <- ton-assay(long)");
        } else {
          oneUnit = 0.003826530573198668;
          unit = sciValueList[13];
          developer.log("Calculated Ratti -> ton-assay(long)");
        }
      } else if (dropdownSciValue == sciValueList[14]) {
        if (isReverse) {
          oneUnit = 233.333336;
          developer.log("Calculated Ratti <- ton-assay(short)");
        } else {
          oneUnit = 0.004285714236734695;
          unit = sciValueList[14];
          developer.log("Calculated Ratti -> ton-assay(short)");
        }
      } else if (dropdownSciValue == sciValueList[15]) {
        if (isReverse) {
          oneUnit = 8128375.272;
          developer.log("Calculated Ratti <- ton(long)");
        } else {
          oneUnit = 0.00000012302581592716602;
          unit = sciValueList[15];
          developer.log("Calculated Ratti -> ton(long)");
        }
      } else if (dropdownSciValue == sciValueList[16]) {
        if (isReverse) {
          oneUnit = 7257477.92;
          developer.log("Calculated Ratti <- ton(short) ");
        } else {
          oneUnit = 0.0000001377889138655485;
          unit = sciValueList[16];
          developer.log("Calculated Ratti -> ton(short)");
        }
      } else if (dropdownSciValue == sciValueList[17]) {
        if (isReverse) {
          oneUnit = 8000000;
          developer.log("Calculated Ratti <- ton metric");
        } else {
          oneUnit = 0.000000125;
          unit = sciValueList[17];
          developer.log("Calculated Ratti -> ton metric");
        }
      } else if (dropdownSciValue == sciValueList[18]) {
        if (isReverse) {
          oneUnit = 406418.76352;
          developer.log("Calculated Ratti <- Hundredweight(long) ");
        } else {
          oneUnit = 0.000002460516319027652;
          unit = sciValueList[18];
          developer.log("Calculated Ratti -> Hundredweight(long)");
        }
      } else if (dropdownSciValue == sciValueList[19]) {
        if (isReverse) {
          oneUnit = 362873.896;
          developer.log("Calculated Ratti <- Hundredweight(short)");
        } else {
          oneUnit = 0.0000027557782773109697;
          unit = sciValueList[19];
          developer.log("Calculated Ratti -> Hundredweight(short)");
        }
      } else if (dropdownSciValue == sciValueList[20]) {
        if (isReverse) {
          oneUnit = 1.6;
          developer.log("Calculated Ratti <- Carat ");
        } else {
          oneUnit = 0.625;
          unit = sciValueList[20];
          developer.log("Calculated Ratti -> Carat");
        }
      } else if (dropdownSciValue == sciValueList[21]) {
        if (isReverse) {
          oneUnit = 0.016;
          developer.log("Calculated Ratti <- Point ");
        } else {
          oneUnit = 62.5;
          unit = sciValueList[21];
          developer.log("Calculated Ratti -> Point");
        }
      } else if (dropdownSciValue == sciValueList[22]) {
        if (isReverse) {
          oneUnit = 14.17476156;
          developer.log("Calculated Ratti <- dram(avdp)");
        } else {
          oneUnit = 0.07054792391160335;
          unit = sciValueList[22];
          developer.log("Calculated Ratti -> dram(avdp)");
        }
      } else if (dropdownSciValue == sciValueList[23]) {
        if (isReverse) {
          oneUnit = 31.1034768;
          developer.log("Calculated Ratti <- dram(troy)");
        } else {
          oneUnit = 0.03215074656862798;
          unit = sciValueList[23];
          developer.log("Calculated Ratti -> dram(troy)");
        }
      } else if (dropdownSciValue == sciValueList[24]) {
        if (isReverse) {
          oneUnit = 0.4;
          developer.log("Calculated Ratti <- Grain(metric)");
        } else {
          oneUnit = 2.5;
          unit = sciValueList[24];
          developer.log("Calculated Ratti -> Grain(metric)");
        }
      } else if (dropdownSciValue == sciValueList[25]) {
        if (isReverse) {
          oneUnit = 0.51839128;
          developer.log("Calculated Ratti <- Grain(troy)");
        } else {
          oneUnit = 1.9290447941176787;
          unit = sciValueList[25];
          developer.log("Calculated Ratti -> Grain(troy)");
        }
      }
    }

    // Gunja
    else if (dropdownValue == weightList[1]) {
      unit = weightList[1];
      ayurDescTitle = ayurValDesc[1];

      if (dropdownSciValue == sciValueList[0]) {
        if (isReverse) {
          oneUnit = 248.8278144;
          developer.log("Calculated Gunja <- Ounce(troy)");
        } else {
          oneUnit = 0.004018843321078497;
          unit = sciValueList[0];
          developer.log("Calculated Gunja -> Ounce(troy)");
        }
      } else if (dropdownSciValue == sciValueList[1]) {
        if (isReverse) {
          oneUnit = 3628.73896;
          developer.log("Calculated Gunja <- Ounce(avdp)");
        } else {
          oneUnit = 0.000275577827731097;
          unit = sciValueList[1];
          developer.log("Calculated Gunja -> Ounce(avdp)");
        }
      } else if (dropdownSciValue == sciValueList[2]) {
        if (isReverse) {
          oneUnit = 2985.9337728;
          developer.log("Calculated Gunja <- Pound(Troy)");
        } else {
          oneUnit = 0.00033490361008987;
          unit = sciValueList[2];
          developer.log("Calculated Gunja -> Pound(Troy)");
        }
      } else if (dropdownSciValue == sciValueList[3]) {
        if (isReverse) {
          oneUnit = 3628.74184;
          developer.log("Calculated Gunja <- Pound(avdp)");
        } else {
          oneUnit = 0.00027557760901503;
          unit = sciValueList[3];
          developer.log("Calculated Gunja -> Pound(avdp)");
        }
      } else if (dropdownSciValue == sciValueList[4]) {
        if (isReverse) {
          oneUnit = 4000;
          developer.log("Calculated Gunja <- Pound(metric)");
        } else {
          oneUnit = 0.00025;
          unit = sciValueList[4];
          developer.log("Calculated Gunja -> Pound(metric)");
        }
      } else if (dropdownSciValue == sciValueList[5]) {
        if (isReverse) {
          oneUnit = 12.44139072;
          developer.log("Calculated Gunja <- Penny ");
        } else {
          oneUnit = 0.08037686642157;
          unit = sciValueList[5];
          developer.log("Calculated Gunja -> Penny");
        }
      } else if (dropdownSciValue == sciValueList[6]) {
        if (isReverse) {
          oneUnit = 8;
          developer.log("Calculated Gunja <- Grams");
        } else {
          oneUnit = 0.125;
          unit = sciValueList[6];
          developer.log("Calculated Gunja -> Grams");
        }
      } else if (dropdownSciValue == sciValueList[7]) {
        if (isReverse) {
          oneUnit = 8000;
          developer.log("Calculated Gunja <- Kilogram ");
        } else {
          oneUnit = 0.000125;
          unit = sciValueList[7];
          developer.log("Calculated Gunja -> Kilogram");
        }
      } else if (dropdownSciValue == sciValueList[8]) {
        if (isReverse) {
          oneUnit = 0.008;
          developer.log("Calculated Gunja <- MiliGram ");
        } else {
          oneUnit = 125;
          unit = sciValueList[8];
          developer.log("Calculated Gunja -> MiliGram");
        }
      } else if (dropdownSciValue == sciValueList[9]) {
        if (isReverse) {
          oneUnit = 0.000008;
          developer.log("Calculated Gunja <- MicroGram ");
        } else {
          oneUnit = 125000;
          unit = sciValueList[9];
          developer.log("Calculated Gunja -> MicroGram");
        }
      } else if (dropdownSciValue == sciValueList[10]) {
        if (isReverse) {
          oneUnit = 8000000;
          developer.log("Calculated Gunja <- Megagram ");
        } else {
          oneUnit = 0.000000125;
          unit = sciValueList[10];
          developer.log("Calculated Gunja -> Megagram");
        }
      } else if (dropdownSciValue == sciValueList[11]) {
        if (isReverse) {
          oneUnit = 116751.224;
          developer.log("Calculated Gunja <- Slug ");
        } else {
          oneUnit = 0.000008565220695245131;
          unit = sciValueList[11];
          developer.log("Calculated Gunja -> Slug");
        }
      } else if (dropdownSciValue == sciValueList[12]) {
        if (isReverse) {
          oneUnit = 50802.34544;
          developer.log("Calculated Gunja <- Stone ");
        } else {
          oneUnit = 0.000019684130552221215;
          unit = sciValueList[12];
          developer.log("Calculated Gunja -> Stone");
        }
      } else if (dropdownSciValue == sciValueList[13]) {
        if (isReverse) {
          oneUnit = 261.333336;
          developer.log("Calculated Gunja <- ton-assay(long)");
        } else {
          oneUnit = 0.003826530573198668;
          unit = sciValueList[13];
          developer.log("Calculated Gunja -> ton-assay(long)");
        }
      } else if (dropdownSciValue == sciValueList[14]) {
        if (isReverse) {
          oneUnit = 233.333336;
          developer.log("Calculated Gunja <- ton-assay(short)");
        } else {
          oneUnit = 0.004285714236734695;
          unit = sciValueList[14];
          developer.log("Calculated Gunja -> ton-assay(short)");
        }
      } else if (dropdownSciValue == sciValueList[15]) {
        if (isReverse) {
          oneUnit = 8128375.272;
          developer.log("Calculated Gunja <- ton(long)");
        } else {
          oneUnit = 0.00000012302581592716602;
          unit = sciValueList[15];
          developer.log("Calculated Gunja -> ton(long)");
        }
      } else if (dropdownSciValue == sciValueList[16]) {
        if (isReverse) {
          oneUnit = 7257477.92;
          developer.log("Calculated Gunja <- ton(short) ");
        } else {
          oneUnit = 0.0000001377889138655485;
          unit = sciValueList[16];
          developer.log("Calculated Gunja -> ton(short)");
        }
      } else if (dropdownSciValue == sciValueList[17]) {
        if (isReverse) {
          oneUnit = 8000000;
          developer.log("Calculated Gunja <- ton metric");
        } else {
          oneUnit = 0.000000125;
          unit = sciValueList[17];
          developer.log("Calculated Gunja -> ton metric");
        }
      } else if (dropdownSciValue == sciValueList[18]) {
        if (isReverse) {
          oneUnit = 406418.76352;
          developer.log("Calculated Gunja <- Hundredweight(long) ");
        } else {
          oneUnit = 0.000002460516319027652;
          unit = sciValueList[18];
          developer.log("Calculated Gunja -> Hundredweight(long)");
        }
      } else if (dropdownSciValue == sciValueList[19]) {
        if (isReverse) {
          oneUnit = 362873.896;
          developer.log("Calculated Gunja <- Hundredweight(short)");
        } else {
          oneUnit = 0.0000027557782773109697;
          unit = sciValueList[19];
          developer.log("Calculated Gunja -> Hundredweight(short)");
        }
      } else if (dropdownSciValue == sciValueList[20]) {
        if (isReverse) {
          oneUnit = 1.6;
          developer.log("Calculated Gunja <- Carat ");
        } else {
          oneUnit = 0.625;
          unit = sciValueList[20];
          developer.log("Calculated Gunja -> Carat");
        }
      } else if (dropdownSciValue == sciValueList[21]) {
        if (isReverse) {
          oneUnit = 0.016;
          developer.log("Calculated Gunja <- Point ");
        } else {
          oneUnit = 62.5;
          unit = sciValueList[21];
          developer.log("Calculated Gunja -> Point");
        }
      } else if (dropdownSciValue == sciValueList[22]) {
        if (isReverse) {
          oneUnit = 14.17476156;
          developer.log("Calculated Gunja <- dram(avdp)");
        } else {
          oneUnit = 0.07054792391160335;
          unit = sciValueList[22];
          developer.log("Calculated Gunja -> dram(avdp)");
        }
      } else if (dropdownSciValue == sciValueList[23]) {
        if (isReverse) {
          oneUnit = 31.1034768;
          developer.log("Calculated Gunja <- dram(troy)");
        } else {
          oneUnit = 0.03215074656862798;
          unit = sciValueList[23];
          developer.log("Calculated Gunja -> dram(troy)");
        }
      } else if (dropdownSciValue == sciValueList[24]) {
        if (isReverse) {
          oneUnit = 0.4;
          developer.log("Calculated Gunja <- Grain(metric)");
        } else {
          oneUnit = 2.5;
          unit = sciValueList[24];
          developer.log("Calculated Gunja -> Grain(metric)");
        }
      } else if (dropdownSciValue == sciValueList[25]) {
        if (isReverse) {
          oneUnit = 0.51839128;
          developer.log("Calculated Gunja <- Grain(troy)");
        } else {
          oneUnit = 1.9290447941176787;
          unit = sciValueList[25];
          developer.log("Calculated Gunja -> Grain(troy)");
        }
      }
    }

    //Masa
    else if (dropdownValue == weightList[2]) {
      unit = weightList[2];
      ayurDescTitle = ayurValDesc[2];

      if (dropdownSciValue == sciValueList[0]) {
        if (isReverse) {
          oneUnit = 32.06544;
          developer.log("Calculated Masa <- Ounce(troy)");
        } else {
          oneUnit = 0.03118622417156914;
          unit = sciValueList[0];
          developer.log("Calculated Masa -> Ounce(troy)");
        }
      } else if (dropdownSciValue == sciValueList[1]) {
        if (isReverse) {
          oneUnit = 467.6210000000001;
          developer.log("Calculated Masa <- Ounce(avdp)");
        } else {
          oneUnit = 0.0021384839431933126;
          unit = sciValueList[1];
          developer.log("Calculated Masa -> Ounce(avdp)");
        }
      } else if (dropdownSciValue == sciValueList[2]) {
        if (isReverse) {
          oneUnit = 384.78528000000006;
          developer.log("Calculated Masa <- Pound(Troy)");
        } else {
          oneUnit = 0.0025988520142974283;
          unit = sciValueList[2];
          developer.log("Calculated Masa -> Pound(Troy)");
        }
      } else if (dropdownSciValue == sciValueList[3]) {
        if (isReverse) {
          oneUnit = 467.6213711340207;
          developer.log("Calculated Masa <- Pound(avdp)");
        } else {
          oneUnit = 0.0021384822459566315;
          unit = sciValueList[3];
          developer.log("Calculated Masa -> Pound(avdp)");
        }
      } else if (dropdownSciValue == sciValueList[4]) {
        if (isReverse) {
          oneUnit = 515.4639175257732;
          developer.log("Calculated Masa <- Pound(metric)");
        } else {
          oneUnit = 0.0019399999999999999;
          unit = sciValueList[4];
          developer.log("Calculated Masa -> Pound(metric)");
        }
      } else if (dropdownSciValue == sciValueList[5]) {
        if (isReverse) {
          oneUnit = 1.603272;
          developer.log("Calculated Masa <- Penny ");
        } else {
          oneUnit = 0.6237244834313828;
          unit = sciValueList[5];
          developer.log("Calculated Masa -> Penny");
        }
      } else if (dropdownSciValue == sciValueList[6]) {
        if (isReverse) {
          oneUnit = 1.0309278350515465;
          developer.log("Calculated Masa <- Grams");
        } else {
          oneUnit = 0.97;
          unit = sciValueList[6];
          developer.log("Calculated Masa -> Grams");
        }
      } else if (dropdownSciValue == sciValueList[7]) {
        if (isReverse) {
          oneUnit = 1030.9278350515465;
          developer.log("Calculated Masa <- Kilogram ");
        } else {
          oneUnit = 0.0009699999999999999;
          unit = sciValueList[7];
          developer.log("Calculated Masa -> Kilogram");
        }
      } else if (dropdownSciValue == sciValueList[8]) {
        if (isReverse) {
          oneUnit = 0.0010309278350515466;
          developer.log("Calculated Masa <- MiliGram ");
        } else {
          oneUnit = 970;
          unit = sciValueList[8];
          developer.log("Calculated Masa -> MiliGram");
        }
      } else if (dropdownSciValue == sciValueList[9]) {
        if (isReverse) {
          oneUnit = 0.0000010309278350515464;
          developer.log("Calculated Masa <- MicroGram ");
        } else {
          oneUnit = 970000;
          unit = sciValueList[9];
          developer.log("Calculated Masa -> MicroGram");
        }
      } else if (dropdownSciValue == sciValueList[10]) {
        if (isReverse) {
          oneUnit = 1030927.8350515465;
          developer.log("Calculated Masa <- Megagram ");
        } else {
          oneUnit = 0.00000097;
          unit = sciValueList[10];
          developer.log("Calculated Masa -> Megagram");
        }
      } else if (dropdownSciValue == sciValueList[11]) {
        if (isReverse) {
          oneUnit = 15045.26082474227;
          developer.log("Calculated Masa <- Slug ");
        } else {
          oneUnit = 0.00006646611259510221;
          unit = sciValueList[11];
          developer.log("Calculated Masa -> Slug");
        }
      } else if (dropdownSciValue == sciValueList[12]) {
        if (isReverse) {
          oneUnit = 6546.694;
          developer.log("Calculated Masa <- Stone ");
        } else {
          oneUnit = 0.00015274885308523662;
          unit = sciValueList[12];
          developer.log("Calculated Masa -> Stone");
        }
      } else if (dropdownSciValue == sciValueList[13]) {
        if (isReverse) {
          oneUnit = 33.676976288659795;
          developer.log("Calculated Masa <- ton-assay(long)");
        } else {
          oneUnit = 0.029693877248021663;
          unit = sciValueList[13];
          developer.log("Calculated Masa -> ton-assay(long)");
        }
      } else if (dropdownSciValue == sciValueList[14]) {
        if (isReverse) {
          oneUnit = 30.068728865979384;
          developer.log("Calculated Masa <- ton-assay(short)");
        } else {
          oneUnit = 0.03325714247706123;
          unit = sciValueList[14];
          developer.log("Calculated Masa -> ton-assay(short)");
        }
      } else if (dropdownSciValue == sciValueList[15]) {
        if (isReverse) {
          oneUnit = 1047471.0402061857;
          developer.log("Calculated Masa <- ton(long)");
        } else {
          oneUnit = 0.00000095468;
          unit = sciValueList[15];
          developer.log("Calculated Masa -> ton(long)");
        }
      } else if (dropdownSciValue == sciValueList[16]) {
        if (isReverse) {
          oneUnit = 935242.0000000001;
          developer.log("Calculated Masa <- ton(short) ");
        } else {
          oneUnit = 0.0000010692419715966563;
          unit = sciValueList[16];
          developer.log("Calculated Masa -> ton(short)");
        }
      } else if (dropdownSciValue == sciValueList[17]) {
        if (isReverse) {
          oneUnit = 1030927.8350515465;
          developer.log("Calculated Masa <- ton metric");
        } else {
          oneUnit = 0.00000097;
          unit = sciValueList[17];
          developer.log("Calculated Masa -> ton metric");
        }
      } else if (dropdownSciValue == sciValueList[18]) {
        if (isReverse) {
          oneUnit = 52373.552;
          developer.log("Calculated Masa <- Hundredweight(long) ");
        } else {
          oneUnit = 0.000019093606635654577;
          unit = sciValueList[18];
          developer.log("Calculated Masa -> Hundredweight(long)");
        }
      } else if (dropdownSciValue == sciValueList[19]) {
        if (isReverse) {
          oneUnit = 46762.100000000006;
          developer.log("Calculated Masa <- Hundredweight(short)");
        } else {
          oneUnit = 0.000021384839431933124;
          unit = sciValueList[19];
          developer.log("Calculated Masa -> Hundredweight(short)");
        }
      } else if (dropdownSciValue == sciValueList[20]) {
        if (isReverse) {
          oneUnit = 0.20618556701030932;
          developer.log("Calculated Masa <- Carat ");
        } else {
          oneUnit = 4.85;
          unit = sciValueList[20];
          developer.log("Calculated Masa -> Carat");
        }
      } else if (dropdownSciValue == sciValueList[21]) {
        if (isReverse) {
          oneUnit = 0.0020618556701030933;
          developer.log("Calculated Masa <- Point ");
        } else {
          oneUnit = 485;
          unit = sciValueList[21];
          developer.log("Calculated Masa -> Point");
        }
      } else if (dropdownSciValue == sciValueList[22]) {
        if (isReverse) {
          oneUnit = 1.8266445309278352;
          developer.log("Calculated Masa <- dram(avdp)");
        } else {
          oneUnit = 0.547451889554042;
          unit = sciValueList[22];
          developer.log("Calculated Masa -> dram(avdp)");
        }
      } else if (dropdownSciValue == sciValueList[23]) {
        if (isReverse) {
          oneUnit = 4.00818;
          developer.log("Calculated Masa <- dram(troy)");
        } else {
          oneUnit = 0.24948979337255311;
          unit = sciValueList[23];
          developer.log("Calculated Masa -> dram(troy)");
        }
      } else if (dropdownSciValue == sciValueList[24]) {
        if (isReverse) {
          oneUnit = 0.05154639175257733;
          developer.log("Calculated Masa <- Grain(metric)");
        } else {
          oneUnit = 19.4;
          unit = sciValueList[24];
          developer.log("Calculated Masa -> Grain(metric)");
        }
      } else if (dropdownSciValue == sciValueList[25]) {
        if (isReverse) {
          oneUnit = 0.06680300000000002;
          developer.log("Calculated Masa <- Grain(troy)");
        } else {
          oneUnit = 14.969387602353187;
          unit = sciValueList[25];
          developer.log("Calculated Masa -> Grain(troy)");
        }
      }
    }

    //Karsa
    else if (dropdownValue == weightList[3]) {
      unit = weightList[3];
      ayurDescTitle = ayurValDesc[3];

      if (dropdownSciValue == sciValueList[0]) {
        if (isReverse) {
          oneUnit = 2.5919564;
          developer.log("Calculated Karsa <- Ounce(troy)");
        } else {
          oneUnit = 0.3858089588235357;
          unit = sciValueList[0];
          developer.log("Calculated Karsa -> Ounce(troy)");
        }
      } else if (dropdownSciValue == sciValueList[1]) {
        if (isReverse) {
          oneUnit = 37.79936416666666;
          developer.log("Calculated Karsa <- Ounce(avdp)");
        } else {
          oneUnit = 0.026455471462185312;
          unit = sciValueList[1];
          developer.log("Calculated Karsa -> Ounce(avdp)");
        }
      } else if (dropdownSciValue == sciValueList[2]) {
        if (isReverse) {
          oneUnit = 31.1034768;
          developer.log("Calculated Karsa <- Pound(Troy)");
        } else {
          oneUnit = 0.03215074656862798;
          unit = sciValueList[2];
          developer.log("Calculated Karsa -> Pound(Troy)");
        }
      } else if (dropdownSciValue == sciValueList[3]) {
        if (isReverse) {
          oneUnit = 37.799394166666666;
          developer.log("Calculated Karsa <- Pound(avdp)");
        } else {
          oneUnit = 0.026455450465442867;
          unit = sciValueList[3];
          developer.log("Calculated Karsa -> Pound(avdp)");
        }
      } else if (dropdownSciValue == sciValueList[4]) {
        if (isReverse) {
          oneUnit = 41.666666666666664;
          developer.log("Calculated Karsa <- Pound(metric)");
        } else {
          oneUnit = 0.024;
          unit = sciValueList[4];
          developer.log("Calculated Karsa -> Pound(metric)");
        }
      } else if (dropdownSciValue == sciValueList[5]) {
        if (isReverse) {
          oneUnit = 0.12959781999999997;
          developer.log("Calculated Karsa <- Penny ");
        } else {
          oneUnit = 7.716179176470716;
          unit = sciValueList[5];
          developer.log("Calculated Karsa -> Penny");
        }
      } else if (dropdownSciValue == sciValueList[6]) {
        if (isReverse) {
          oneUnit = 0.08333333333333333;
          developer.log("Calculated Karsa <- Grams");
        } else {
          oneUnit = 12;
          unit = sciValueList[6];
          developer.log("Calculated Karsa -> Grams");
        }
      } else if (dropdownSciValue == sciValueList[7]) {
        if (isReverse) {
          oneUnit = 83.33333333333333;
          developer.log("Calculated Karsa <- Kilogram ");
        } else {
          oneUnit = 0.012;
          unit = sciValueList[7];
          developer.log("Calculated Karsa -> Kilogram");
        }
      } else if (dropdownSciValue == sciValueList[8]) {
        if (isReverse) {
          oneUnit = 0.000083333;
          developer.log("Calculated Karsa <- MiliGram ");
        } else {
          oneUnit = 12000;
          unit = sciValueList[8];
          developer.log("Calculated Karsa -> MiliGram");
        }
      } else if (dropdownSciValue == sciValueList[9]) {
        if (isReverse) {
          oneUnit = 0.000000083333;
          developer.log("Calculated Karsa <- MicroGram ");
        } else {
          oneUnit = 12000000;
          unit = sciValueList[9];
          developer.log("Calculated Karsa -> MicroGram");
        }
      } else if (dropdownSciValue == sciValueList[10]) {
        if (isReverse) {
          oneUnit = 83333.33333333333;
          developer.log("Calculated Karsa <- Megagram ");
        } else {
          oneUnit = 0.000012;
          unit = sciValueList[10];
          developer.log("Calculated Karsa -> Megagram");
        }
      } else if (dropdownSciValue == sciValueList[11]) {
        if (isReverse) {
          oneUnit = 1216.1585833333334;
          developer.log("Calculated Karsa <- Slug ");
        } else {
          oneUnit = 0.0008222611867435327;
          unit = sciValueList[11];
          developer.log("Calculated Karsa -> Slug");
        }
      } else if (dropdownSciValue == sciValueList[12]) {
        if (isReverse) {
          oneUnit = 529.1910983333332;
          developer.log("Calculated Karsa <- Stone ");
        } else {
          oneUnit = 0.0018896765330132367;
          unit = sciValueList[12];
          developer.log("Calculated Karsa -> Stone");
        }
      } else if (dropdownSciValue == sciValueList[13]) {
        if (isReverse) {
          oneUnit = 2.7222222499999997;
          developer.log("Calculated Karsa <- ton-assay(long)");
        } else {
          oneUnit = 0.36734693502707216;
          unit = sciValueList[13];
          developer.log("Calculated Karsa -> ton-assay(long)");
        }
      } else if (dropdownSciValue == sciValueList[14]) {
        if (isReverse) {
          oneUnit = 2.430555583333333;
          developer.log("Calculated Karsa <- ton-assay(short)");
        } else {
          oneUnit = 0.4114285667265307;
          unit = sciValueList[14];
          developer.log("Calculated Karsa -> ton-assay(short)");
        }
      } else if (dropdownSciValue == sciValueList[15]) {
        if (isReverse) {
          oneUnit = 84670.57574999999;
          developer.log("Calculated Karsa <- ton(long)");
        } else {
          oneUnit = 0.00001181;
          unit = sciValueList[15];
          developer.log("Calculated Karsa -> ton(long)");
        }
      } else if (dropdownSciValue == sciValueList[16]) {
        if (isReverse) {
          oneUnit = 75598.72833333333;
          developer.log("Calculated Karsa <- ton(short) ");
        } else {
          oneUnit = 0.000013228;
          unit = sciValueList[16];
          developer.log("Calculated Karsa -> ton(short)");
        }
      } else if (dropdownSciValue == sciValueList[17]) {
        if (isReverse) {
          oneUnit = 83333.33333333333;
          developer.log("Calculated Karsa <- ton metric");
        } else {
          oneUnit = 0.000012;
          unit = sciValueList[17];
          developer.log("Calculated Karsa -> ton metric");
        }
      } else if (dropdownSciValue == sciValueList[18]) {
        if (isReverse) {
          oneUnit = 4233.528786666666;
          developer.log("Calculated Karsa <- Hundredweight(long) ");
        } else {
          oneUnit = 0.0002362095666266546;
          unit = sciValueList[18];
          developer.log("Calculated Karsa -> Hundredweight(long)");
        }
      } else if (dropdownSciValue == sciValueList[19]) {
        if (isReverse) {
          oneUnit = 3779.9364166666664;
          developer.log("Calculated Karsa <- Hundredweight(short)");
        } else {
          oneUnit = 0.0002645547146218531;
          unit = sciValueList[19];
          developer.log("Calculated Karsa -> Hundredweight(short)");
        }
      } else if (dropdownSciValue == sciValueList[20]) {
        if (isReverse) {
          oneUnit = 0.016666666666666666;
          developer.log("Calculated Karsa <- Carat ");
        } else {
          oneUnit = 60;
          unit = sciValueList[20];
          developer.log("Calculated Karsa -> Carat");
        }
      } else if (dropdownSciValue == sciValueList[21]) {
        if (isReverse) {
          oneUnit = 0.00016666666666666666;
          developer.log("Calculated Karsa <- Point ");
        } else {
          oneUnit = 6000;
          unit = sciValueList[21];
          developer.log("Calculated Karsa -> Point");
        }
      } else if (dropdownSciValue == sciValueList[22]) {
        if (isReverse) {
          oneUnit = 0.14765376624999998;
          developer.log("Calculated Karsa <- dram(avdp)");
        } else {
          oneUnit = 6.772600695513921;
          unit = sciValueList[22];
          developer.log("Calculated Karsa -> dram(avdp)");
        }
      } else if (dropdownSciValue == sciValueList[23]) {
        if (isReverse) {
          oneUnit = 0.32399455;
          developer.log("Calculated Karsa <- dram(troy)");
        } else {
          oneUnit = 3.0864716705882858;
          unit = sciValueList[23];
          developer.log("Calculated Karsa -> dram(troy)");
        }
      } else if (dropdownSciValue == sciValueList[24]) {
        if (isReverse) {
          oneUnit = 0.004166666666666667;
          developer.log("Calculated Karsa <- Grain(metric)");
        } else {
          oneUnit = 240;
          unit = sciValueList[24];
          developer.log("Calculated Karsa -> Grain(metric)");
        }
      } else if (dropdownSciValue == sciValueList[25]) {
        if (isReverse) {
          oneUnit = 0.005399909166666666;
          developer.log("Calculated Karsa <- Grain(troy)");
        } else {
          oneUnit = 185.18830023529716;
          unit = sciValueList[25];
          developer.log("Calculated Karsa -> Grain(troy)");
        }
      }
    }

    //Sukti
    else if (dropdownValue == weightList[4]) {
      unit = weightList[4];
      ayurDescTitle = ayurValDesc[4];

      if (dropdownSciValue == sciValueList[0]) {
        if (isReverse) {
          oneUnit = 1.2959782;
          developer.log("Calculated Sukti <- Ounce(troy)");
        } else {
          oneUnit = 0.7716179176470714;
          unit = sciValueList[0];
          developer.log("Calculated Sukti -> Ounce(troy)");
        }
      } else if (dropdownSciValue == sciValueList[1]) {
        if (isReverse) {
          oneUnit = 18.89968208333333;
          developer.log("Calculated Sukti <- Ounce(avdp)");
        } else {
          oneUnit = 0.052910942924370624;
          unit = sciValueList[1];
          developer.log("Calculated Sukti -> Ounce(avdp)");
        }
      } else if (dropdownSciValue == sciValueList[2]) {
        if (isReverse) {
          oneUnit = 15.5517384;
          developer.log("Calculated Sukti <- Pound(Troy)");
        } else {
          oneUnit = 0.06430149313725596;
          unit = sciValueList[2];
          developer.log("Calculated Sukti -> Pound(Troy)");
        }
      } else if (dropdownSciValue == sciValueList[3]) {
        if (isReverse) {
          oneUnit = 18.899697083333333;
          developer.log("Calculated Sukti <- Pound(avdp)");
        } else {
          oneUnit = 0.05291090093088573;
          unit = sciValueList[3];
          developer.log("Calculated Sukti -> Pound(avdp)");
        }
      } else if (dropdownSciValue == sciValueList[4]) {
        if (isReverse) {
          oneUnit = 20.833333333333332;
          developer.log("Calculated Sukti <- Pound(metric)");
        } else {
          oneUnit = 0.048;
          unit = sciValueList[4];
          developer.log("Calculated Sukti -> Pound(metric)");
        }
      } else if (dropdownSciValue == sciValueList[5]) {
        if (isReverse) {
          oneUnit = 0.06479890999999999;
          developer.log("Calculated Sukti <- Penny ");
        } else {
          oneUnit = 15.432358352941431;
          unit = sciValueList[5];
          developer.log("Calculated Sukti -> Penny");
        }
      } else if (dropdownSciValue == sciValueList[6]) {
        if (isReverse) {
          oneUnit = 0.041666666666666664;
          developer.log("Calculated Sukti <- Grams");
        } else {
          oneUnit = 24;
          unit = sciValueList[6];
          developer.log("Calculated Sukti -> Grams");
        }
      } else if (dropdownSciValue == sciValueList[7]) {
        if (isReverse) {
          oneUnit = 41.666666666666664;
          developer.log("Calculated Sukti <- Kilogram ");
        } else {
          oneUnit = 0.024;
          unit = sciValueList[7];
          developer.log("Calculated Sukti -> Kilogram");
        }
      } else if (dropdownSciValue == sciValueList[8]) {
        if (isReverse) {
          oneUnit = 0.000041666666666666665;
          developer.log("Calculated Sukti <- MiliGram ");
        } else {
          oneUnit = 24000;
          unit = sciValueList[8];
          developer.log("Calculated Sukti -> MiliGram");
        }
      } else if (dropdownSciValue == sciValueList[9]) {
        if (isReverse) {
          oneUnit = 0.000000041666666666666667;
          developer.log("Calculated Sukti <- MicroGram ");
        } else {
          oneUnit = 24000000;
          unit = sciValueList[9];
          developer.log("Calculated Sukti -> MicroGram");
        }
      } else if (dropdownSciValue == sciValueList[10]) {
        if (isReverse) {
          oneUnit = 41666.666666666664;
          developer.log("Calculated Sukti <- Megagram ");
        } else {
          oneUnit = 0.000024;
          unit = sciValueList[10];
          developer.log("Calculated Sukti -> Megagram");
        }
      } else if (dropdownSciValue == sciValueList[11]) {
        if (isReverse) {
          oneUnit = 608.0792916666667;
          developer.log("Calculated Sukti <- Slug ");
        } else {
          oneUnit = 0.0016445223734870653;
          unit = sciValueList[11];
          developer.log("Calculated Sukti -> Slug");
        }
      } else if (dropdownSciValue == sciValueList[12]) {
        if (isReverse) {
          oneUnit = 264.5955491666666;
          developer.log("Calculated Sukti <- Stone ");
        } else {
          oneUnit = 0.0037793530660264734;
          unit = sciValueList[12];
          developer.log("Calculated Sukti -> Stone");
        }
      } else if (dropdownSciValue == sciValueList[13]) {
        if (isReverse) {
          oneUnit = 1.3611111249999999;
          developer.log("Calculated Sukti <- ton-assay(long)");
        } else {
          oneUnit = 0.7346938700541443;
          unit = sciValueList[13];
          developer.log("Calculated Sukti -> ton-assay(long)");
        }
      } else if (dropdownSciValue == sciValueList[14]) {
        if (isReverse) {
          oneUnit = 1.2152777916666666;
          developer.log("Calculated Sukti <- ton-assay(short)");
        } else {
          oneUnit = 0.8228571334530614;
          unit = sciValueList[14];
          developer.log("Calculated Sukti -> ton-assay(short)");
        }
      } else if (dropdownSciValue == sciValueList[15]) {
        if (isReverse) {
          oneUnit = 42335.287874999995;
          developer.log("Calculated Sukti <- ton(long)");
        } else {
          oneUnit = 0.000023620956658016;
          unit = sciValueList[15];
          developer.log("Calculated Sukti -> ton(long)");
        }
      } else if (dropdownSciValue == sciValueList[16]) {
        if (isReverse) {
          oneUnit = 37799.364166667;
          developer.log("Calculated Sukti <- ton(short) ");
        } else {
          oneUnit = 0.000026455471462185;
          unit = sciValueList[16];
          developer.log("Calculated Sukti -> ton(short)");
        }
      } else if (dropdownSciValue == sciValueList[17]) {
        if (isReverse) {
          oneUnit = 41666.666666667;
          developer.log("Calculated Sukti <- ton metric");
        } else {
          oneUnit = 0.000024;
          unit = sciValueList[17];
          developer.log("Calculated Sukti -> ton metric");
        }
      } else if (dropdownSciValue == sciValueList[18]) {
        if (isReverse) {
          oneUnit = 2116.764393333333;
          developer.log("Calculated Sukti <- Hundredweight(long) ");
        } else {
          oneUnit = 0.00047241913325331;
          unit = sciValueList[18];
          developer.log("Calculated Sukti -> Hundredweight(long)");
        }
      } else if (dropdownSciValue == sciValueList[19]) {
        if (isReverse) {
          oneUnit = 1889.9682083333332;
          developer.log("Calculated Sukti <- Hundredweight(short)");
        } else {
          oneUnit = 0.0005291094292437062;
          unit = sciValueList[19];
          developer.log("Calculated Sukti -> Hundredweight(short)");
        }
      } else if (dropdownSciValue == sciValueList[20]) {
        if (isReverse) {
          oneUnit = 0.008333333333333333;
          developer.log("Calculated Sukti <- Carat ");
        } else {
          oneUnit = 120;
          unit = sciValueList[20];
          developer.log("Calculated Sukti -> Carat");
        }
      } else if (dropdownSciValue == sciValueList[21]) {
        if (isReverse) {
          oneUnit = 0.00008333333333333333;
          developer.log("Calculated Sukti <- Point ");
        } else {
          oneUnit = 12000;
          unit = sciValueList[21];
          developer.log("Calculated Sukti -> Point");
        }
      } else if (dropdownSciValue == sciValueList[22]) {
        if (isReverse) {
          oneUnit = 0.07382688312499999;
          developer.log("Calculated Sukti <- dram(avdp)");
        } else {
          oneUnit = 13.545201391028;
          unit = sciValueList[22];
          developer.log("Calculated Sukti -> dram(avdp)");
        }
      } else if (dropdownSciValue == sciValueList[23]) {
        if (isReverse) {
          oneUnit = 0.161997275;
          developer.log("Calculated Sukti <- dram(troy)");
        } else {
          oneUnit = 6.1729433411766;
          unit = sciValueList[23];
          developer.log("Calculated Sukti -> dram(troy)");
        }
      } else if (dropdownSciValue == sciValueList[24]) {
        if (isReverse) {
          oneUnit = 0.0020833333333333333;
          developer.log("Calculated Sukti <- Grain(metric)");
        } else {
          oneUnit = 480;
          unit = sciValueList[24];
          developer.log("Calculated Sukti -> Grain(metric)");
        }
      } else if (dropdownSciValue == sciValueList[25]) {
        if (isReverse) {
          oneUnit = 0.002699954583333333;
          developer.log("Calculated Sukti <- Grain(troy)");
        } else {
          oneUnit = 370.37660047059;
          unit = sciValueList[25];
          developer.log("Calculated Sukti -> Grain(troy)");
        }
      }
    }

    //Palam
    else if (dropdownValue == weightList[5]) {
      unit = weightList[5];
      ayurDescTitle = ayurValDesc[5];

      if (dropdownSciValue == sciValueList[0]) {
        if (isReverse) {
          oneUnit = 0.6479891;
          developer.log("Calculated Palam <- Ounce(troy)");
        } else {
          oneUnit = 1.5432358352941;
          unit = sciValueList[0];
          developer.log("Calculated Palam -> Ounce(troy)");
        }
      } else if (dropdownSciValue == sciValueList[1]) {
        if (isReverse) {
          oneUnit = 9.4498410416667;
          developer.log("Calculated Palam <- Ounce(avdp)");
        } else {
          oneUnit = 0.10582188584874;
          unit = sciValueList[1];
          developer.log("Calculated Palam -> Ounce(avdp)");
        }
      } else if (dropdownSciValue == sciValueList[2]) {
        if (isReverse) {
          oneUnit = 7.7758692;
          developer.log("Calculated Palam <- Pound(Troy)");
        } else {
          oneUnit = 0.12860298627451;
          unit = sciValueList[2];
          developer.log("Calculated Palam -> Pound(Troy)");
        }
      } else if (dropdownSciValue == sciValueList[3]) {
        if (isReverse) {
          oneUnit = 9.4498485416667;
          developer.log("Calculated Palam <- Pound(avdp)");
        } else {
          oneUnit = 0.10582180186177;
          unit = sciValueList[3];
          developer.log("Calculated Palam -> Pound(avdp)");
        }
      } else if (dropdownSciValue == sciValueList[4]) {
        if (isReverse) {
          oneUnit = 10.416666666666666;
          developer.log("Calculated Palam <- Pound(metric)");
        } else {
          oneUnit = 0.096;
          unit = sciValueList[4];
          developer.log("Calculated Palam -> Pound(metric)");
        }
      } else if (dropdownSciValue == sciValueList[5]) {
        if (isReverse) {
          oneUnit = 0.032399455;
          developer.log("Calculated Palam <- Penny ");
        } else {
          oneUnit = 30.864716705883;
          unit = sciValueList[5];
          developer.log("Calculated Palam -> Penny");
        }
      } else if (dropdownSciValue == sciValueList[6]) {
        if (isReverse) {
          oneUnit = 0.020833333333333332;
          developer.log("Calculated Palam <- Grams");
        } else {
          oneUnit = 48;
          unit = sciValueList[6];
          developer.log("Calculated Palam -> Grams");
        }
      } else if (dropdownSciValue == sciValueList[7]) {
        if (isReverse) {
          oneUnit = 20.833333333333332;
          developer.log("Calculated Palam <- Kilogram ");
        } else {
          oneUnit = 0.048;
          unit = sciValueList[7];
          developer.log("Calculated Palam -> Kilogram");
        }
      } else if (dropdownSciValue == sciValueList[8]) {
        if (isReverse) {
          oneUnit = 0.000020833333333333;
          developer.log("Calculated Palam <- MiliGram ");
        } else {
          oneUnit = 48000;
          unit = sciValueList[8];
          developer.log("Calculated Palam -> MiliGram");
        }
      } else if (dropdownSciValue == sciValueList[9]) {
        if (isReverse) {
          oneUnit = 0.000000020833333333333;
          developer.log("Calculated Palam <- MicroGram ");
        } else {
          oneUnit = 48000000;
          unit = sciValueList[9];
          developer.log("Calculated Palam -> MicroGram");
        }
      } else if (dropdownSciValue == sciValueList[10]) {
        if (isReverse) {
          oneUnit = 20833.333333333332;
          developer.log("Calculated Palam <- Megagram ");
        } else {
          oneUnit = 0.000048;
          unit = sciValueList[10];
          developer.log("Calculated Palam -> Megagram");
        }
      } else if (dropdownSciValue == sciValueList[11]) {
        if (isReverse) {
          oneUnit = 304.03964583333;
          developer.log("Calculated Palam <- Slug ");
        } else {
          oneUnit = 0.0032890447469741;
          unit = sciValueList[11];
          developer.log("Calculated Palam -> Slug");
        }
      } else if (dropdownSciValue == sciValueList[12]) {
        if (isReverse) {
          oneUnit = 132.29777458333;
          developer.log("Calculated Palam <- Stone ");
        } else {
          oneUnit = 0.007558706132052947;
          unit = sciValueList[12];
          developer.log("Calculated Palam -> Stone");
        }
      } else if (dropdownSciValue == sciValueList[13]) {
        if (isReverse) {
          oneUnit = 0.6805555625;
          developer.log("Calculated Palam <- ton-assay(long)");
        } else {
          oneUnit = 1.4693877401082887;
          unit = sciValueList[13];
          developer.log("Calculated Palam -> ton-assay(long)");
        }
      } else if (dropdownSciValue == sciValueList[14]) {
        if (isReverse) {
          oneUnit = 0.60763889583333;
          developer.log("Calculated Palam <- ton-assay(short)");
        } else {
          oneUnit = 1.6457142669061229;
          unit = sciValueList[14];
          developer.log("Calculated Palam -> ton-assay(short)");
        }
      } else if (dropdownSciValue == sciValueList[15]) {
        if (isReverse) {
          oneUnit = 21167.6439375;
          developer.log("Calculated Palam <- ton(long)");
        } else {
          oneUnit = 0.000047241913316032;
          unit = sciValueList[15];
          developer.log("Calculated Palam -> ton(long)");
        }
      } else if (dropdownSciValue == sciValueList[16]) {
        if (isReverse) {
          oneUnit = 18899.682083333;
          developer.log("Calculated Palam <- ton(short) ");
        } else {
          oneUnit = 0.000052910942924371;
          unit = sciValueList[16];
          developer.log("Calculated Palam -> ton(short)");
        }
      } else if (dropdownSciValue == sciValueList[17]) {
        if (isReverse) {
          oneUnit = 20833.333333333;
          developer.log("Calculated Palam <- ton metric");
        } else {
          oneUnit = 0.000048;
          unit = sciValueList[17];
          developer.log("Calculated Palam -> ton metric");
        }
      } else if (dropdownSciValue == sciValueList[18]) {
        if (isReverse) {
          oneUnit = 1058.3821966667;
          developer.log("Calculated Palam <- Hundredweight(long) ");
        } else {
          oneUnit = 0.00094483826650662;
          unit = sciValueList[18];
          developer.log("Calculated Palam -> Hundredweight(long)");
        }
      } else if (dropdownSciValue == sciValueList[19]) {
        if (isReverse) {
          oneUnit = 944.98410416667;
          developer.log("Calculated Palam <- Hundredweight(short)");
        } else {
          oneUnit = 0.0010582188584874;
          unit = sciValueList[19];
          developer.log("Calculated Palam -> Hundredweight(short)");
        }
      } else if (dropdownSciValue == sciValueList[20]) {
        if (isReverse) {
          oneUnit = 0.0041666666666667;
          developer.log("Calculated Palam <- Carat ");
        } else {
          oneUnit = 240;
          unit = sciValueList[20];
          developer.log("Calculated Palam -> Carat");
        }
      } else if (dropdownSciValue == sciValueList[21]) {
        if (isReverse) {
          oneUnit = 0.000041666666666667;
          developer.log("Calculated Palam <- Point ");
        } else {
          oneUnit = 24000;
          unit = sciValueList[21];
          developer.log("Calculated Palam -> Point");
        }
      } else if (dropdownSciValue == sciValueList[22]) {
        if (isReverse) {
          oneUnit = 0.036913441562499996;
          developer.log("Calculated Palam <- dram(avdp)");
        } else {
          oneUnit = 27.090402782056;
          unit = sciValueList[22];
          developer.log("Calculated Palam -> dram(avdp)");
        }
      } else if (dropdownSciValue == sciValueList[23]) {
        if (isReverse) {
          oneUnit = 0.0809986375;
          developer.log("Calculated Palam <- dram(troy)");
        } else {
          oneUnit = 12.345886682353;
          unit = sciValueList[23];
          developer.log("Calculated Palam -> dram(troy)");
        }
      } else if (dropdownSciValue == sciValueList[24]) {
        if (isReverse) {
          oneUnit = 0.0010416666666667;
          developer.log("Calculated Palam <- Grain(metric)");
        } else {
          oneUnit = 960;
          unit = sciValueList[24];
          developer.log("Calculated Palam -> Grain(metric)");
        }
      } else if (dropdownSciValue == sciValueList[25]) {
        if (isReverse) {
          oneUnit = 0.0013499772916667;
          developer.log("Calculated Palam <- Grain(troy)");
        } else {
          oneUnit = 740.75320094119;
          unit = sciValueList[25];
          developer.log("Calculated Palam -> Grain(troy)");
        }
      }
    }

//Prasrti
    else if (dropdownValue == weightList[6]) {
      unit = weightList[6];
      ayurDescTitle = ayurValDesc[6];

      if (dropdownSciValue == sciValueList[0]) {
        if (isReverse) {
          oneUnit = 0.32399455;
          developer.log("Calculated Prasrti <- Ounce(troy)");
        } else {
          oneUnit = 3.0864716705882858;
          unit = sciValueList[0];
          developer.log("Calculated Prasrti -> Ounce(troy)");
        }
      } else if (dropdownSciValue == sciValueList[1]) {
        if (isReverse) {
          oneUnit = 4.724920520833333;
          developer.log("Calculated Prasrti <- Ounce(avdp)");
        } else {
          oneUnit = 0.2116437716974825;
          unit = sciValueList[1];
          developer.log("Calculated Prasrti -> Ounce(avdp)");
        }
      } else if (dropdownSciValue == sciValueList[2]) {
        if (isReverse) {
          oneUnit = 3.8879346;
          developer.log("Calculated Prasrti <- Pound(Troy)");
        } else {
          oneUnit = 0.25720597254902383;
          unit = sciValueList[2];
          developer.log("Calculated Prasrti -> Pound(Troy)");
        }
      } else if (dropdownSciValue == sciValueList[3]) {
        if (isReverse) {
          oneUnit = 4.724924270833333;
          developer.log("Calculated Prasrti <- Pound(avdp)");
        } else {
          oneUnit = 0.21164360372354293;
          unit = sciValueList[3];
          developer.log("Calculated Prasrti -> Pound(avdp)");
        }
      } else if (dropdownSciValue == sciValueList[4]) {
        if (isReverse) {
          oneUnit = 5.208333333333333;
          developer.log("Calculated Prasrti <- Pound(metric)");
        } else {
          oneUnit = 0.192;
          unit = sciValueList[4];
          developer.log("Calculated Prasrti -> Pound(metric)");
        }
      } else if (dropdownSciValue == sciValueList[5]) {
        if (isReverse) {
          oneUnit = 0.016199727499999997;
          developer.log("Calculated Prasrti <- Penny ");
        } else {
          oneUnit = 61.729433411765726;
          unit = sciValueList[5];
          developer.log("Calculated Prasrti -> Penny");
        }
      } else if (dropdownSciValue == sciValueList[6]) {
        if (isReverse) {
          oneUnit = 0.010416666666666666;
          developer.log("Calculated Prasrti <- Grams");
        } else {
          oneUnit = 96;
          unit = sciValueList[6];
          developer.log("Calculated Prasrti -> Grams");
        }
      } else if (dropdownSciValue == sciValueList[7]) {
        if (isReverse) {
          oneUnit = 10.416666666666666;
          developer.log("Calculated Prasrti <- Kilogram ");
        } else {
          oneUnit = 0.096;
          unit = sciValueList[7];
          developer.log("Calculated Prasrti -> Kilogram");
        }
      } else if (dropdownSciValue == sciValueList[8]) {
        if (isReverse) {
          oneUnit = 0.000010416666666666666;
          developer.log("Calculated Prasrti <- MiliGram ");
        } else {
          oneUnit = 96000;
          unit = sciValueList[8];
          developer.log("Calculated Prasrti -> MiliGram");
        }
      } else if (dropdownSciValue == sciValueList[9]) {
        if (isReverse) {
          oneUnit = 0.000000010416666666667;
          developer.log("Calculated Prasrti <- MicroGram ");
        } else {
          oneUnit = 96000000;
          unit = sciValueList[9];
          developer.log("Calculated Prasrti -> MicroGram");
        }
      } else if (dropdownSciValue == sciValueList[10]) {
        if (isReverse) {
          oneUnit = 10416.666666667;
          developer.log("Calculated Prasrti <- Megagram ");
        } else {
          oneUnit = 0.000096;
          unit = sciValueList[10];
          developer.log("Calculated Prasrti -> Megagram");
        }
      } else if (dropdownSciValue == sciValueList[11]) {
        if (isReverse) {
          oneUnit = 152.01982291667;
          developer.log("Calculated Prasrti <- Slug ");
        } else {
          oneUnit = 0.006578089493948261;
          unit = sciValueList[11];
          developer.log("Calculated Prasrti -> Slug");
        }
      } else if (dropdownSciValue == sciValueList[12]) {
        if (isReverse) {
          oneUnit = 66.148887291667;
          developer.log("Calculated Prasrti <- Stone ");
        } else {
          oneUnit = 0.015117412264105894;
          unit = sciValueList[12];
          developer.log("Calculated Prasrti -> Stone");
        }
      } else if (dropdownSciValue == sciValueList[13]) {
        if (isReverse) {
          oneUnit = 0.34027778125;
          developer.log("Calculated Prasrti <- ton-assay(long)");
        } else {
          oneUnit = 2.9387754802165773;
          unit = sciValueList[13];
          developer.log("Calculated Prasrti -> ton-assay(long)");
        }
      } else if (dropdownSciValue == sciValueList[14]) {
        if (isReverse) {
          oneUnit = 0.30381944791667;
          developer.log("Calculated Prasrti <- ton-assay(short)");
        } else {
          oneUnit = 3.2914285338122458;
          unit = sciValueList[14];
          developer.log("Calculated Prasrti -> ton-assay(short)");
        }
      } else if (dropdownSciValue == sciValueList[15]) {
        if (isReverse) {
          oneUnit = 10583.82196875;
          developer.log("Calculated Prasrti <- ton(long)");
        } else {
          oneUnit = 0.000094483826632063;
          unit = sciValueList[15];
          developer.log("Calculated Prasrti -> ton(long)");
        }
      } else if (dropdownSciValue == sciValueList[16]) {
        if (isReverse) {
          oneUnit = 9449.8410416667;
          developer.log("Calculated Prasrti <- ton(short) ");
        } else {
          oneUnit = 0.00010582188584874;
          unit = sciValueList[16];
          developer.log("Calculated Prasrti -> ton(short)");
        }
      } else if (dropdownSciValue == sciValueList[17]) {
        if (isReverse) {
          oneUnit = 10416.666666667;
          developer.log("Calculated Prasrti <- ton metric");
        } else {
          oneUnit = 0.000096;
          unit = sciValueList[17];
          developer.log("Calculated Prasrti -> ton metric");
        }
      } else if (dropdownSciValue == sciValueList[18]) {
        if (isReverse) {
          oneUnit = 529.19109833333;
          developer.log("Calculated Prasrti <- Hundredweight(long) ");
        } else {
          oneUnit = 0.0018896765330132367;
          unit = sciValueList[18];
          developer.log("Calculated Prasrti -> Hundredweight(long)");
        }
      } else if (dropdownSciValue == sciValueList[19]) {
        if (isReverse) {
          oneUnit = 472.49205208333;
          developer.log("Calculated Prasrti <- Hundredweight(short)");
        } else {
          oneUnit = 0.0021164377169748247;
          unit = sciValueList[19];
          developer.log("Calculated Prasrti -> Hundredweight(short)");
        }
      } else if (dropdownSciValue == sciValueList[20]) {
        if (isReverse) {
          oneUnit = 0.0020833333333333;
          developer.log("Calculated Prasrti <- Carat ");
        } else {
          oneUnit = 480;
          unit = sciValueList[20];
          developer.log("Calculated Prasrti -> Carat");
        }
      } else if (dropdownSciValue == sciValueList[21]) {
        if (isReverse) {
          oneUnit = 0.000020833333333333;
          developer.log("Calculated Prasrti <- Point ");
        } else {
          oneUnit = 48000;
          unit = sciValueList[21];
          developer.log("Calculated Prasrti -> Point");
        }
      } else if (dropdownSciValue == sciValueList[22]) {
        if (isReverse) {
          oneUnit = 0.01845672078125;
          developer.log("Calculated Prasrti <- dram(avdp)");
        } else {
          oneUnit = 54.18080556411137;
          unit = sciValueList[22];
          developer.log("Calculated Prasrti -> dram(avdp)");
        }
      } else if (dropdownSciValue == sciValueList[23]) {
        if (isReverse) {
          oneUnit = 0.04049931875;
          developer.log("Calculated Prasrti <- dram(troy)");
        } else {
          oneUnit = 24.691773364706286;
          unit = sciValueList[23];
          developer.log("Calculated Prasrti -> dram(troy)");
        }
      } else if (dropdownSciValue == sciValueList[24]) {
        if (isReverse) {
          oneUnit = 0.00052083333333333;
          developer.log("Calculated Prasrti <- Grain(metric)");
        } else {
          oneUnit = 1920;
          unit = sciValueList[24];
          developer.log("Calculated Prasrti -> Grain(metric)");
        }
      } else if (dropdownSciValue == sciValueList[25]) {
        if (isReverse) {
          oneUnit = 0.00067498864583333;
          developer.log("Calculated Prasrti <- Grain(troy)");
        } else {
          oneUnit = 1481.5064018823773;
          unit = sciValueList[25];
          developer.log("Calculated Prasrti -> Grain(troy)");
        }
      }
    }

//Kudava
    else if (dropdownValue == weightList[7]) {
      unit = weightList[7];
      ayurDescTitle = ayurValDesc[7];

      if (dropdownSciValue == sciValueList[0]) {
        if (isReverse) {
          oneUnit = 0.161997275;
          developer.log("Calculated Kudava <- Ounce(troy)");
        } else {
          oneUnit = 6.1729433411765715;
          unit = sciValueList[0];
          developer.log("Calculated Kudava -> Ounce(troy)");
        }
      } else if (dropdownSciValue == sciValueList[1]) {
        if (isReverse) {
          oneUnit = 2.3624602604166665;
          developer.log("Calculated Kudava <- Ounce(avdp)");
        } else {
          oneUnit = 0.423287543394965;
          unit = sciValueList[1];
          developer.log("Calculated Kudava -> Ounce(avdp)");
        }
      } else if (dropdownSciValue == sciValueList[2]) {
        if (isReverse) {
          oneUnit = 1.9439673;
          developer.log("Calculated Kudava <- Pound(Troy)");
        } else {
          oneUnit = 0.5144119450980477;
          unit = sciValueList[2];
          developer.log("Calculated Kudava -> Pound(Troy)");
        }
      } else if (dropdownSciValue == sciValueList[3]) {
        if (isReverse) {
          oneUnit = 2.3624621354166666;
          developer.log("Calculated Kudava <- Pound(avdp)");
        } else {
          oneUnit = 0.42328720744708587;
          unit = sciValueList[3];
          developer.log("Calculated Kudava -> Pound(avdp)");
        }
      } else if (dropdownSciValue == sciValueList[4]) {
        if (isReverse) {
          oneUnit = 2.6041666666666665;
          developer.log("Calculated Kudava <- Pound(metric)");
        } else {
          oneUnit = 0.384;
          unit = sciValueList[4];
          developer.log("Calculated Kudava -> Pound(metric)");
        }
      } else if (dropdownSciValue == sciValueList[5]) {
        if (isReverse) {
          oneUnit = 0.008099863749999998;
          developer.log("Calculated Kudava <- Penny ");
        } else {
          oneUnit = 123.45886682353145;
          unit = sciValueList[5];
          developer.log("Calculated Kudava -> Penny");
        }
      } else if (dropdownSciValue == sciValueList[6]) {
        if (isReverse) {
          oneUnit = 0.005208333333333333;
          developer.log("Calculated Kudava <- Grams");
        } else {
          oneUnit = 192;
          unit = sciValueList[6];
          developer.log("Calculated Kudava -> Grams");
        }
      } else if (dropdownSciValue == sciValueList[7]) {
        if (isReverse) {
          oneUnit = 5.208333333333333;
          developer.log("Calculated Kudava <- Kilogram ");
        } else {
          oneUnit = 0.192;
          unit = sciValueList[7];
          developer.log("Calculated Kudava -> Kilogram");
        }
      } else if (dropdownSciValue == sciValueList[8]) {
        if (isReverse) {
          oneUnit = 0.0000052083333333333;
          developer.log("Calculated Kudava <- MiliGram ");
        } else {
          oneUnit = 192000;
          unit = sciValueList[8];
          developer.log("Calculated Kudava -> MiliGram");
        }
      } else if (dropdownSciValue == sciValueList[9]) {
        if (isReverse) {
          oneUnit = 0.0000000052083333333333;
          developer.log("Calculated Kudava <- MicroGram ");
        } else {
          oneUnit = 192000000;
          unit = sciValueList[9];
          developer.log("Calculated Kudava -> MicroGram");
        }
      } else if (dropdownSciValue == sciValueList[10]) {
        if (isReverse) {
          oneUnit = 5208.3333333333;
          developer.log("Calculated Kudava <- Megagram ");
        } else {
          oneUnit = 0.000192;
          unit = sciValueList[10];
          developer.log("Calculated Kudava -> Megagram");
        }
      } else if (dropdownSciValue == sciValueList[11]) {
        if (isReverse) {
          oneUnit = 76.009911458333;
          developer.log("Calculated Kudava <- Slug ");
        } else {
          oneUnit = 0.013156178987896523;
          unit = sciValueList[11];
          developer.log("Calculated Kudava -> Slug");
        }
      } else if (dropdownSciValue == sciValueList[12]) {
        if (isReverse) {
          oneUnit = 33.074443645833;
          developer.log("Calculated Kudava <- Stone ");
        } else {
          oneUnit = 0.030234824528211787;
          unit = sciValueList[12];
          developer.log("Calculated Kudava -> Stone");
        }
      } else if (dropdownSciValue == sciValueList[13]) {
        if (isReverse) {
          oneUnit = 0.170138890625;
          developer.log("Calculated Kudava <- ton-assay(long)");
        } else {
          oneUnit = 5.877550960433155;
          unit = sciValueList[13];
          developer.log("Calculated Kudava -> ton-assay(long)");
        }
      } else if (dropdownSciValue == sciValueList[14]) {
        if (isReverse) {
          oneUnit = 0.15190972395833;
          developer.log("Calculated Kudava <- ton-assay(short)");
        } else {
          oneUnit = 6.5828570676244915;
          unit = sciValueList[14];
          developer.log("Calculated Kudava -> ton-assay(short)");
        }
      } else if (dropdownSciValue == sciValueList[15]) {
        if (isReverse) {
          oneUnit = 5291.910984375;
          developer.log("Calculated Kudava <- ton(long)");
        } else {
          oneUnit = 0.000188967653264127;
          unit = sciValueList[15];
          developer.log("Calculated Kudava -> ton(long)");
        }
      } else if (dropdownSciValue == sciValueList[16]) {
        if (isReverse) {
          oneUnit = 4724.9205208333;
          developer.log("Calculated Kudava <- ton(short) ");
        } else {
          oneUnit = 0.0002116437716974825;
          unit = sciValueList[16];
          developer.log("Calculated Kudava -> ton(short)");
        }
      } else if (dropdownSciValue == sciValueList[17]) {
        if (isReverse) {
          oneUnit = 5208.3333333333;
          developer.log("Calculated Kudava <- ton metric");
        } else {
          oneUnit = 0.000192;
          unit = sciValueList[17];
          developer.log("Calculated Kudava -> ton metric");
        }
      } else if (dropdownSciValue == sciValueList[18]) {
        if (isReverse) {
          oneUnit = 264.59554916667;
          developer.log("Calculated Kudava <- Hundredweight(long) ");
        } else {
          oneUnit = 0.0037793530660264734;
          unit = sciValueList[18];
          developer.log("Calculated Kudava -> Hundredweight(long)");
        }
      } else if (dropdownSciValue == sciValueList[19]) {
        if (isReverse) {
          oneUnit = 236.24602604167;
          developer.log("Calculated Kudava <- Hundredweight(short)");
        } else {
          oneUnit = 0.004232875433949649;
          unit = sciValueList[19];
          developer.log("Calculated Kudava -> Hundredweight(short)");
        }
      } else if (dropdownSciValue == sciValueList[20]) {
        if (isReverse) {
          oneUnit = 0.0010416666666667;
          developer.log("Calculated Kudava <- Carat ");
        } else {
          oneUnit = 960;
          unit = sciValueList[20];
          developer.log("Calculated Kudava -> Carat");
        }
      } else if (dropdownSciValue == sciValueList[21]) {
        if (isReverse) {
          oneUnit = 0.000010416666666667;
          developer.log("Calculated Kudava <- Point ");
        } else {
          oneUnit = 96000;
          unit = sciValueList[21];
          developer.log("Calculated Kudava -> Point");
        }
      } else if (dropdownSciValue == sciValueList[22]) {
        if (isReverse) {
          oneUnit = 0.009228360390624999;
          developer.log("Calculated Kudava <- dram(avdp)");
        } else {
          oneUnit = 108.36161112822273;
          unit = sciValueList[22];
          developer.log("Calculated Kudava -> dram(avdp)");
        }
      } else if (dropdownSciValue == sciValueList[23]) {
        if (isReverse) {
          oneUnit = 0.020249659375;
          developer.log("Calculated Kudava <- dram(troy)");
        } else {
          oneUnit = 49.38354672941257;
          unit = sciValueList[23];
          developer.log("Calculated Kudava -> dram(troy)");
        }
      } else if (dropdownSciValue == sciValueList[24]) {
        if (isReverse) {
          oneUnit = 0.00026041666666666666;
          developer.log("Calculated Kudava <- Grain(metric)");
        } else {
          oneUnit = 3840;
          unit = sciValueList[24];
          developer.log("Calculated Kudava -> Grain(metric)");
        }
      } else if (dropdownSciValue == sciValueList[25]) {
        if (isReverse) {
          oneUnit = 0.00033749432291666664;
          developer.log("Calculated Kudava <- Grain(troy)");
        } else {
          oneUnit = 2963.0128037647546;
          unit = sciValueList[25];
          developer.log("Calculated Kudava -> Grain(troy)");
        }
      }
    }

//Manika
    else if (dropdownValue == weightList[8]) {
      unit = weightList[8];
      ayurDescTitle = ayurValDesc[8];

      if (dropdownSciValue == sciValueList[0]) {
        if (isReverse) {
          oneUnit = 0.0809986375;
          developer.log("Calculated Manika <- Ounce(troy)");
        } else {
          oneUnit = 12.345886682353143;
          unit = sciValueList[0];
          developer.log("Calculated Manika -> Ounce(troy)");
        }
      } else if (dropdownSciValue == sciValueList[1]) {
        if (isReverse) {
          oneUnit = 1.1812301302083;
          developer.log("Calculated Manika <- Ounce(avdp)");
        } else {
          oneUnit = 0.84657508678993;
          unit = sciValueList[1];
          developer.log("Calculated Manika -> Ounce(avdp)");
        }
      } else if (dropdownSciValue == sciValueList[2]) {
        if (isReverse) {
          oneUnit = 0.97198365;
          developer.log("Calculated Manika <- Pound(Troy)");
        } else {
          oneUnit = 1.0288238901961;
          unit = sciValueList[2];
          developer.log("Calculated Manika -> Pound(Troy)");
        }
      } else if (dropdownSciValue == sciValueList[3]) {
        if (isReverse) {
          oneUnit = 1.1812310677083;
          developer.log("Calculated Manika <- Pound(avdp)");
        } else {
          oneUnit = 0.84657441489417;
          unit = sciValueList[3];
          developer.log("Calculated Manika -> Pound(avdp)");
        }
      } else if (dropdownSciValue == sciValueList[4]) {
        if (isReverse) {
          oneUnit = 1.3020833333333;
          developer.log("Calculated Manika <- Pound(metric)");
        } else {
          oneUnit = 0.768;
          unit = sciValueList[4];
          developer.log("Calculated Manika -> Pound(metric)");
        }
      } else if (dropdownSciValue == sciValueList[5]) {
        if (isReverse) {
          oneUnit = 0.004049931875;
          developer.log("Calculated Manika <- Penny ");
        } else {
          oneUnit = 246.91773364706;
          unit = sciValueList[5];
          developer.log("Calculated Manika -> Penny");
        }
      } else if (dropdownSciValue == sciValueList[6]) {
        if (isReverse) {
          oneUnit = 0.0026041666666667;
          developer.log("Calculated Manika <- Grams");
        } else {
          oneUnit = 384;
          unit = sciValueList[6];
          developer.log("Calculated Manika -> Grams");
        }
      } else if (dropdownSciValue == sciValueList[7]) {
        if (isReverse) {
          oneUnit = 2.6041666666667;
          developer.log("Calculated Manika <- Kilogram ");
        } else {
          oneUnit = 0.384;
          unit = sciValueList[7];
          developer.log("Calculated Manika -> Kilogram");
        }
      } else if (dropdownSciValue == sciValueList[8]) {
        if (isReverse) {
          oneUnit = 0.0000026041666666666666;
          developer.log("Calculated Manika <- MiliGram ");
        } else {
          oneUnit = 384000;
          unit = sciValueList[8];
          developer.log("Calculated Manika -> MiliGram");
        }
      } else if (dropdownSciValue == sciValueList[9]) {
        if (isReverse) {
          oneUnit = 0.0000000026041666666667;
          developer.log("Calculated Manika <- MicroGram ");
        } else {
          oneUnit = 384000000;
          unit = sciValueList[9];
          developer.log("Calculated Manika -> MicroGram");
        }
      } else if (dropdownSciValue == sciValueList[10]) {
        if (isReverse) {
          oneUnit = 2604.1666666667;
          developer.log("Calculated Manika <- Megagram ");
        } else {
          oneUnit = 0.000384;
          unit = sciValueList[10];
          developer.log("Calculated Manika -> Megagram");
        }
      } else if (dropdownSciValue == sciValueList[11]) {
        if (isReverse) {
          oneUnit = 38.004955729167;
          developer.log("Calculated Manika <- Slug ");
        } else {
          oneUnit = 0.026312357975793;
          unit = sciValueList[11];
          developer.log("Calculated Manika -> Slug");
        }
      } else if (dropdownSciValue == sciValueList[12]) {
        if (isReverse) {
          oneUnit = 16.537221822917;
          developer.log("Calculated Manika <- Stone ");
        } else {
          oneUnit = 0.060469649056424;
          unit = sciValueList[12];
          developer.log("Calculated Manika -> Stone");
        }
      } else if (dropdownSciValue == sciValueList[13]) {
        if (isReverse) {
          oneUnit = 0.0850694453125;
          developer.log("Calculated Manika <- ton-assay(long)");
        } else {
          oneUnit = 11.755101920866;
          unit = sciValueList[13];
          developer.log("Calculated Manika -> ton-assay(long)");
        }
      } else if (dropdownSciValue == sciValueList[14]) {
        if (isReverse) {
          oneUnit = 0.075954861979167;
          developer.log("Calculated Manika <- ton-assay(short)");
        } else {
          oneUnit = 13.165714135249;
          unit = sciValueList[14];
          developer.log("Calculated Manika -> ton-assay(short)");
        }
      } else if (dropdownSciValue == sciValueList[15]) {
        if (isReverse) {
          oneUnit = 2645.9554921875;
          developer.log("Calculated Manika <- ton(long)");
        } else {
          oneUnit = 0.00037793530652825;
          unit = sciValueList[15];
          developer.log("Calculated Manika -> ton(long)");
        }
      } else if (dropdownSciValue == sciValueList[16]) {
        if (isReverse) {
          oneUnit = 2362.4602604167;
          developer.log("Calculated Manika <- ton(short) ");
        } else {
          oneUnit = 0.00042328754339496;
          unit = sciValueList[16];
          developer.log("Calculated Manika -> ton(short)");
        }
      } else if (dropdownSciValue == sciValueList[17]) {
        if (isReverse) {
          oneUnit = 2604.1666666667;
          developer.log("Calculated Manika <- ton metric");
        } else {
          oneUnit = 0.000384;
          unit = sciValueList[17];
          developer.log("Calculated Manika -> ton metric");
        }
      } else if (dropdownSciValue == sciValueList[18]) {
        if (isReverse) {
          oneUnit = 132.29777458333;
          developer.log("Calculated Manika <- Hundredweight(long) ");
        } else {
          oneUnit = 0.0075587061320529;
          unit = sciValueList[18];
          developer.log("Calculated Manika -> Hundredweight(long)");
        }
      } else if (dropdownSciValue == sciValueList[19]) {
        if (isReverse) {
          oneUnit = 118.12301302083;
          developer.log("Calculated Manika <- Hundredweight(short)");
        } else {
          oneUnit = 0.0084657508678993;
          unit = sciValueList[19];
          developer.log("Calculated Manika -> Hundredweight(short)");
        }
      } else if (dropdownSciValue == sciValueList[20]) {
        if (isReverse) {
          oneUnit = 0.00052083333333333;
          developer.log("Calculated Manika <- Carat ");
        } else {
          oneUnit = 1920;
          unit = sciValueList[20];
          developer.log("Calculated Manika -> Carat");
        }
      } else if (dropdownSciValue == sciValueList[21]) {
        if (isReverse) {
          oneUnit = 0.0000052083333333333;
          developer.log("Calculated Manika <- Point ");
        } else {
          oneUnit = 192000;
          unit = sciValueList[21];
          developer.log("Calculated Manika -> Point");
        }
      } else if (dropdownSciValue == sciValueList[22]) {
        if (isReverse) {
          oneUnit = 0.0046141801953125;
          developer.log("Calculated Manika <- dram(avdp)");
        } else {
          oneUnit = 216.72322225644547;
          unit = sciValueList[22];
          developer.log("Calculated Manika -> dram(avdp)");
        }
      } else if (dropdownSciValue == sciValueList[23]) {
        if (isReverse) {
          oneUnit = 0.0101248296875;
          developer.log("Calculated Manika <- dram(troy)");
        } else {
          oneUnit = 98.767093458825;
          unit = sciValueList[23];
          developer.log("Calculated Manika -> dram(troy)");
        }
      } else if (dropdownSciValue == sciValueList[24]) {
        if (isReverse) {
          oneUnit = 0.00013020833333333;
          developer.log("Calculated Manika <- Grain(metric)");
        } else {
          oneUnit = 7680;
          unit = sciValueList[24];
          developer.log("Calculated Manika -> Grain(metric)");
        }
      } else if (dropdownSciValue == sciValueList[25]) {
        if (isReverse) {
          oneUnit = 0.00016874716145833;
          developer.log("Calculated Manika <- Grain(troy)");
        } else {
          oneUnit = 5926.0256075295;
          unit = sciValueList[25];
          developer.log("Calculated Manika -> Grain(troy)");
        }
      }
    }

//Prastha
    else if (dropdownValue == weightList[9]) {
      unit = weightList[9];
      ayurDescTitle = ayurValDesc[9];

      if (dropdownSciValue == sciValueList[0]) {
        if (isReverse) {
          oneUnit = 0.04049931875;
          developer.log("Calculated Prastha  <- Ounce(troy)");
        } else {
          oneUnit = 24.691773364706;
          unit = sciValueList[0];
          developer.log("Calculated Prastha  -> Ounce(troy)");
        }
      } else if (dropdownSciValue == sciValueList[1]) {
        if (isReverse) {
          oneUnit = 0.5906150651041666;
          developer.log("Calculated Prastha  <- Ounce(avdp)");
        } else {
          oneUnit = 1.6931501735799;
          unit = sciValueList[1];
          developer.log("Calculated Prastha  -> Ounce(avdp)");
        }
      } else if (dropdownSciValue == sciValueList[2]) {
        if (isReverse) {
          oneUnit = 0.485991825;
          developer.log("Calculated Prastha  <- Pound(Troy)");
        } else {
          oneUnit = 2.0576477803922;
          unit = sciValueList[2];
          developer.log("Calculated Prastha  -> Pound(Troy)");
        }
      } else if (dropdownSciValue == sciValueList[3]) {
        if (isReverse) {
          oneUnit = 0.5906155338541667;
          developer.log("Calculated Prastha  <- Pound(avdp)");
        } else {
          oneUnit = 1.6931488297883;
          unit = sciValueList[3];
          developer.log("Calculated Prastha  -> Pound(avdp)");
        }
      } else if (dropdownSciValue == sciValueList[4]) {
        if (isReverse) {
          oneUnit = 0.6510416666666666;
          developer.log("Calculated Prastha  <- Pound(metric)");
        } else {
          oneUnit = 1.536;
          unit = sciValueList[4];
          developer.log("Calculated Prastha  -> Pound(metric)");
        }
      } else if (dropdownSciValue == sciValueList[5]) {
        if (isReverse) {
          oneUnit = 0.0020249659374999996;
          developer.log("Calculated Prastha  <- Penny ");
        } else {
          oneUnit = 493.83546729413;
          unit = sciValueList[5];
          developer.log("Calculated Prastha  -> Penny");
        }
      } else if (dropdownSciValue == sciValueList[6]) {
        if (isReverse) {
          oneUnit = 0.0013020833333333333;
          developer.log("Calculated Prastha  <- Grams");
        } else {
          oneUnit = 768;
          unit = sciValueList[6];
          developer.log("Calculated Prastha  -> Grams");
        }
      } else if (dropdownSciValue == sciValueList[7]) {
        if (isReverse) {
          oneUnit = 1.3020833333333333;
          developer.log("Calculated Prastha  <- Kilogram ");
        } else {
          oneUnit = 0.768;
          unit = sciValueList[7];
          developer.log("Calculated Prastha  -> Kilogram");
        }
      } else if (dropdownSciValue == sciValueList[8]) {
        if (isReverse) {
          oneUnit = 0.0000013021;
          developer.log("Calculated Prastha  <- MiliGram ");
        } else {
          oneUnit = 768000;
          unit = sciValueList[8];
          developer.log("Calculated Prastha  -> MiliGram");
        }
      } else if (dropdownSciValue == sciValueList[9]) {
        if (isReverse) {
          oneUnit = 0.0000000013021;
          developer.log("Calculated Prastha  <- MicroGram ");
        } else {
          oneUnit = 768000000;
          unit = sciValueList[9];
          developer.log("Calculated Prastha  -> MicroGram");
        }
      } else if (dropdownSciValue == sciValueList[10]) {
        if (isReverse) {
          oneUnit = 1302.0833333333;
          developer.log("Calculated Prastha  <- Megagram ");
        } else {
          oneUnit = 0.000768;
          unit = sciValueList[10];
          developer.log("Calculated Prastha  -> Megagram");
        }
      } else if (dropdownSciValue == sciValueList[11]) {
        if (isReverse) {
          oneUnit = 19.002477864583;
          developer.log("Calculated Prastha  <- Slug ");
        } else {
          oneUnit = 0.052624715951586;
          unit = sciValueList[11];
          developer.log("Calculated Prastha  -> Slug");
        }
      } else if (dropdownSciValue == sciValueList[12]) {
        if (isReverse) {
          oneUnit = 8.2686109114583;
          developer.log("Calculated Prastha  <- Stone ");
        } else {
          oneUnit = 0.12093929811285;
          unit = sciValueList[12];
          developer.log("Calculated Prastha  -> Stone");
        }
      } else if (dropdownSciValue == sciValueList[13]) {
        if (isReverse) {
          oneUnit = 0.04253472265625;
          developer.log("Calculated Prastha  <- ton-assay(long)");
        } else {
          oneUnit = 23.510203841733;
          unit = sciValueList[13];
          developer.log("Calculated Prastha  -> ton-assay(long)");
        }
      } else if (dropdownSciValue == sciValueList[14]) {
        if (isReverse) {
          oneUnit = 0.037977430989583;
          developer.log("Calculated Prastha  <- ton-assay(short)");
        } else {
          oneUnit = 26.331428270498;
          unit = sciValueList[14];
          developer.log("Calculated Prastha  -> ton-assay(short)");
        }
      } else if (dropdownSciValue == sciValueList[15]) {
        if (isReverse) {
          oneUnit = 1322.9777460937;
          developer.log("Calculated Prastha  <- ton(long)");
        } else {
          oneUnit = 0.00075587061305651;
          unit = sciValueList[15];
          developer.log("Calculated Prastha  -> ton(long)");
        }
      } else if (dropdownSciValue == sciValueList[16]) {
        if (isReverse) {
          oneUnit = 1181.2301302083;
          developer.log("Calculated Prastha  <- ton(short) ");
        } else {
          oneUnit = 0.00084657508678993;
          unit = sciValueList[16];
          developer.log("Calculated Prastha  -> ton(short)");
        }
      } else if (dropdownSciValue == sciValueList[17]) {
        if (isReverse) {
          oneUnit = 1302.0833333333;
          developer.log("Calculated Prastha  <- ton metric");
        } else {
          oneUnit = 0.000768;
          unit = sciValueList[17];
          developer.log("Calculated Prastha  -> ton metric");
        }
      } else if (dropdownSciValue == sciValueList[18]) {
        if (isReverse) {
          oneUnit = 66.148887291667;
          developer.log("Calculated Prastha  <- Hundredweight(long) ");
        } else {
          oneUnit = 0.015117412264106;
          unit = sciValueList[18];
          developer.log("Calculated Prastha  -> Hundredweight(long)");
        }
      } else if (dropdownSciValue == sciValueList[19]) {
        if (isReverse) {
          oneUnit = 59.061506510417;
          developer.log("Calculated Prastha  <- Hundredweight(short)");
        } else {
          oneUnit = 0.016931501735799;
          unit = sciValueList[19];
          developer.log("Calculated Prastha  -> Hundredweight(short)");
        }
      } else if (dropdownSciValue == sciValueList[20]) {
        if (isReverse) {
          oneUnit = 0.00026041666666667;
          developer.log("Calculated Prastha  <- Carat ");
        } else {
          oneUnit = 3840;
          unit = sciValueList[20];
          developer.log("Calculated Prastha  -> Carat");
        }
      } else if (dropdownSciValue == sciValueList[21]) {
        if (isReverse) {
          oneUnit = 0.0000026042666666667;
          developer.log("Calculated Prastha  <- Point ");
        } else {
          oneUnit = 384000;
          unit = sciValueList[21];
          developer.log("Calculated Prastha  -> Point");
        }
      } else if (dropdownSciValue == sciValueList[22]) {
        if (isReverse) {
          oneUnit = 0.0023070900976562;
          developer.log("Calculated Prastha  <- dram(avdp)");
        } else {
          oneUnit = 433.44644451289;
          unit = sciValueList[22];
          developer.log("Calculated Prastha  -> dram(avdp)");
        }
      } else if (dropdownSciValue == sciValueList[23]) {
        if (isReverse) {
          oneUnit = 0.00506241484375;
          developer.log("Calculated Prastha  <- dram(troy)");
        } else {
          oneUnit = 197.53418691765;
          unit = sciValueList[23];
          developer.log("Calculated Prastha  -> dram(troy)");
        }
      } else if (dropdownSciValue == sciValueList[24]) {
        if (isReverse) {
          oneUnit = 0.000065104166666667;
          developer.log("Calculated Prastha  <- Grain(metric)");
        } else {
          oneUnit = 15360;
          unit = sciValueList[24];
          developer.log("Calculated Prastha  -> Grain(metric)");
        }
      } else if (dropdownSciValue == sciValueList[25]) {
        if (isReverse) {
          oneUnit = 0.000084374580729167;
          developer.log("Calculated Prastha  <- Grain(troy)");
        } else {
          oneUnit = 11852.051215059;
          unit = sciValueList[25];
          developer.log("Calculated Prastha  -> Grain(troy)");
        }
      }
    }

//Adhaka
    else if (dropdownValue == weightList[9]) {
      unit = weightList[9];
      ayurDescTitle = ayurValDesc[9];

      if (dropdownSciValue == sciValueList[0]) {
        if (isReverse) {
          oneUnit = 0.0101248296875;
          developer.log("Calculated Adhaka   <- Ounce(troy)");
        } else {
          oneUnit = 98.767093458825;
          unit = sciValueList[0];
          developer.log("Calculated Adhaka   -> Ounce(troy)");
        }
      } else if (dropdownSciValue == sciValueList[1]) {
        if (isReverse) {
          oneUnit = 0.14765376627604;
          developer.log("Calculated Adhaka   <- Ounce(avdp)");
        } else {
          oneUnit = 6.7726006943194;
          unit = sciValueList[1];
          developer.log("Calculated Adhaka   -> Ounce(avdp)");
        }
      } else if (dropdownSciValue == sciValueList[2]) {
        if (isReverse) {
          oneUnit = 0.12149795625;
          developer.log("Calculated Adhaka   <- Pound(Troy)");
        } else {
          oneUnit = 8.2305911215688;
          unit = sciValueList[2];
          developer.log("Calculated Adhaka   -> Pound(Troy)");
        }
      } else if (dropdownSciValue == sciValueList[3]) {
        if (isReverse) {
          oneUnit = 0.14765388346354;
          developer.log("Calculated Adhaka   <- Pound(avdp)");
        } else {
          oneUnit = 6.7725953191534;
          unit = sciValueList[3];
          developer.log("Calculated Adhaka   -> Pound(avdp)");
        }
      } else if (dropdownSciValue == sciValueList[4]) {
        if (isReverse) {
          oneUnit = 0.16276041666667;
          developer.log("Calculated Adhaka   <- Pound(metric)");
        } else {
          oneUnit = 6.144;
          unit = sciValueList[4];
          developer.log("Calculated Adhaka   -> Pound(metric)");
        }
      } else if (dropdownSciValue == sciValueList[5]) {
        if (isReverse) {
          oneUnit = 0.000506241484375;
          developer.log("Calculated Adhaka   <- Penny ");
        } else {
          oneUnit = 1975.3418691765;
          unit = sciValueList[5];
          developer.log("Calculated Adhaka   -> Penny");
        }
      } else if (dropdownSciValue == sciValueList[6]) {
        if (isReverse) {
          oneUnit = 0.00032552083333333;
          developer.log("Calculated Adhaka   <- Grams");
        } else {
          oneUnit = 3072;
          unit = sciValueList[6];
          developer.log("Calculated Adhaka   -> Grams");
        }
      } else if (dropdownSciValue == sciValueList[7]) {
        if (isReverse) {
          oneUnit = 0.32552083333333;
          developer.log("Calculated Adhaka   <- Kilogram ");
        } else {
          oneUnit = 3.072;
          unit = sciValueList[7];
          developer.log("Calculated Adhaka   -> Kilogram");
        }
      } else if (dropdownSciValue == sciValueList[8]) {
        if (isReverse) {
          oneUnit = 0.00000032552083333333;
          developer.log("Calculated Adhaka   <- MiliGram ");
        } else {
          oneUnit = 3072000;
          unit = sciValueList[8];
          developer.log("Calculated Adhaka   -> MiliGram");
        }
      } else if (dropdownSciValue == sciValueList[9]) {
        if (isReverse) {
          oneUnit = 0.00000000032552083333333;
          developer.log("Calculated Adhaka   <- MicroGram ");
        } else {
          oneUnit = 3072000000;
          unit = sciValueList[9];
          developer.log("Calculated Adhaka   -> MicroGram");
        }
      } else if (dropdownSciValue == sciValueList[10]) {
        if (isReverse) {
          oneUnit = 325.52083333333;
          developer.log("Calculated Adhaka   <- Megagram ");
        } else {
          oneUnit = 0.003072;
          unit = sciValueList[10];
          developer.log("Calculated Adhaka   -> Megagram");
        }
      } else if (dropdownSciValue == sciValueList[11]) {
        if (isReverse) {
          oneUnit = 4.7506194661458;
          developer.log("Calculated Adhaka   <- Slug ");
        } else {
          oneUnit = 0.21049886380634;
          unit = sciValueList[11];
          developer.log("Calculated Adhaka   -> Slug");
        }
      } else if (dropdownSciValue == sciValueList[12]) {
        if (isReverse) {
          oneUnit = 2.0671527278646;
          developer.log("Calculated Adhaka   <- Stone ");
        } else {
          oneUnit = 0.48375719245139;
          unit = sciValueList[12];
          developer.log("Calculated Adhaka   -> Stone");
        }
      } else if (dropdownSciValue == sciValueList[13]) {
        if (isReverse) {
          oneUnit = 0.010633680664062;
          developer.log("Calculated Adhaka   <- ton-assay(long)");
        } else {
          oneUnit = 94.04081536693;
          unit = sciValueList[13];
          developer.log("Calculated Adhaka   -> ton-assay(long)");
        }
      } else if (dropdownSciValue == sciValueList[14]) {
        if (isReverse) {
          oneUnit = 0.0094943577473958;
          developer.log("Calculated Adhaka   <- ton-assay(short)");
        } else {
          oneUnit = 105.32571308199;
          unit = sciValueList[14];
          developer.log("Calculated Adhaka   -> ton-assay(short)");
        }
      } else if (dropdownSciValue == sciValueList[15]) {
        if (isReverse) {
          oneUnit = 330.74443652344;
          developer.log("Calculated Adhaka   <- ton(long)");
        } else {
          oneUnit = 0.003023482452226;
          unit = sciValueList[15];
          developer.log("Calculated Adhaka   -> ton(long)");
        }
      } else if (dropdownSciValue == sciValueList[16]) {
        if (isReverse) {
          oneUnit = 295.30753255208;
          developer.log("Calculated Adhaka   <- ton(short) ");
        } else {
          oneUnit = 0.0033863003471597;
          unit = sciValueList[16];
          developer.log("Calculated Adhaka   -> ton(short)");
        }
      } else if (dropdownSciValue == sciValueList[17]) {
        if (isReverse) {
          oneUnit = 325.52083333333;
          developer.log("Calculated Adhaka   <- ton metric");
        } else {
          oneUnit = 0.003072;
          unit = sciValueList[17];
          developer.log("Calculated Adhaka   -> ton metric");
        }
      } else if (dropdownSciValue == sciValueList[18]) {
        if (isReverse) {
          oneUnit = 16.537221822917;
          developer.log("Calculated Adhaka   <- Hundredweight(long) ");
        } else {
          oneUnit = 0.060469649056424;
          unit = sciValueList[18];
          developer.log("Calculated Adhaka   -> Hundredweight(long)");
        }
      } else if (dropdownSciValue == sciValueList[19]) {
        if (isReverse) {
          oneUnit = 14.765376627604;
          developer.log("Calculated Adhaka   <- Hundredweight(short)");
        } else {
          oneUnit = 0.067726006943194;
          unit = sciValueList[19];
          developer.log("Calculated Adhaka   -> Hundredweight(short)");
        }
      } else if (dropdownSciValue == sciValueList[20]) {
        if (isReverse) {
          oneUnit = 0.000065104166666667;
          developer.log("Calculated Adhaka   <- Carat ");
        } else {
          oneUnit = 15360;
          unit = sciValueList[20];
          developer.log("Calculated Adhaka   -> Carat");
        }
      } else if (dropdownSciValue == sciValueList[21]) {
        if (isReverse) {
          oneUnit = 0.00000065104166666667;
          developer.log("Calculated Adhaka   <- Point ");
        } else {
          oneUnit = 1536000;
          unit = sciValueList[21];
          developer.log("Calculated Adhaka   -> Point");
        }
      } else if (dropdownSciValue == sciValueList[22]) {
        if (isReverse) {
          oneUnit = 0.00057677252441406;
          developer.log("Calculated Adhaka   <- dram(avdp)");
        } else {
          oneUnit = 1733.7857780516;
          unit = sciValueList[22];
          developer.log("Calculated Adhaka   -> dram(avdp)");
        }
      } else if (dropdownSciValue == sciValueList[23]) {
        if (isReverse) {
          oneUnit = 0.0012656037109375;
          developer.log("Calculated Adhaka   <- dram(troy)");
        } else {
          oneUnit = 790.1367476706;
          unit = sciValueList[23];
          developer.log("Calculated Adhaka   -> dram(troy)");
        }
      } else if (dropdownSciValue == sciValueList[24]) {
        if (isReverse) {
          oneUnit = 0.000016276041666667;
          developer.log("Calculated Adhaka   <- Grain(metric)");
        } else {
          oneUnit = 61440;
          unit = sciValueList[24];
          developer.log("Calculated Adhaka   -> Grain(metric)");
        }
      } else if (dropdownSciValue == sciValueList[25]) {
        if (isReverse) {
          oneUnit = 0.000021093395182292;
          developer.log("Calculated Adhaka   <- Grain(troy)");
        } else {
          oneUnit = 47408.204860236;
          unit = sciValueList[25];
          developer.log("Calculated Adhaka   -> Grain(troy)");
        }
      }
    }
    //----

    String f = valueController.text;
    if (f != "-" || f != null) {
      double g = double.parse(f);
      double l = g * oneUnit;
      val = l.toString();

      setState(() {
        finalValue = unit + ": " + val;
      });
      developer.log("Calculated Value " + finalValue);
    }
  }
}
