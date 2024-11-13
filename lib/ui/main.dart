import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_debugging/reusable_widgets/colors.dart';
import 'package:flutter_debugging/reusable_widgets/side_bar.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import '../logger/logger.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final FlipCardController _flipCardController = FlipCardController();
  final List<Color> _colorsContainer = [darkBlue, darkBlue, darkBlue, darkBlue, darkBlue, darkBlue];
  List<Map<String, dynamic>>services =
  [{'title': 'Local Transfers', 'widget': const LocalTransfers(title: 'Local Transfers',)},
    {'title': 'Airtime/Data', 'widget': const AirtimeData(title: 'Airtime & Data',)},
    {'title': 'Open Account', 'widget': const OpenAccount(title: 'Open Account',)},
    {'title': 'Bill payment', 'widget': const BillPayment(title: 'Bill payment',)},
    {'title': 'BVN', 'widget': const BVN(title: 'BVN',)},
    {'title': 'Request for ATM', 'widget': const RequestATM(title: 'Request for ATM',)},
  ];

  void logError(String message) {
    logger.e(message);
  }

  void _toggleColor(int index) {
  setState(() {
    _colorsContainer[index] = _colorsContainer[index] == darkBlue ? lightBlue : darkBlue;
  });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      _flipCardController.toggleCard();
    });
    Future.delayed(const Duration(seconds: 3), () {
      _flipCardController.toggleCard();
    });
  }
  @override
  Widget build(BuildContext context) {
    var parser = EmojiParser();
    String greetings = parser.emojify(':wave: Hi MELVIS');
    logger.d('Home widget services: $services');
    return Scaffold(
      drawer: const SideMenu(),
      body: ListView(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          children: [
            Stack(
              children: [
                Container(
                  height: 370,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(50), bottomLeft: Radius.circular(50))
                  ),
                ),
                Positioned(
                  top: 170,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 190,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: const AlwaysScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        FlipCard(
                          controller: _flipCardController,
                          flipOnTouch: false,
                          fill: Fill.fillBack,
                            direction: FlipDirection.VERTICAL,
                            side: CardSide.FRONT,
                            front: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CreditCard(
                                  number: 9290, valid: 'VALID 20/24',
                                  image: 'mastercard.png',
                                  color: lightBlue),
                            ), back: const CreditCard(number: 9290, valid: 'VALID 20/24', image: 'visa.png', color: darkBlue),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0, top: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Builder(
                          builder: (context) => Column(
                            children: [
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  IconButton(
                                      icon: const Icon(Icons.dehaze, color: blueColor),
                                      onPressed: () {
                                        logger.i('');
                                        Scaffold.of(context).openDrawer();
                                      }
                                  ),
                                ],
                              ),
                            ],
                          )
                      ),
                      const SizedBox(height: 20),
                      AnimatedTextKit(animatedTexts: [
                        TyperAnimatedText(greetings,textStyle: const TextStyle(color: darkBlue, fontSize: 22, fontWeight: FontWeight.w700),)
                      ],
                        totalRepeatCount: 1,
                        )
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 15.0, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: darkBlue,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          boxShadow: [
                            BoxShadow(
                              color: lightBlue,
                              offset: Offset(3, 7),
                              blurRadius: 15,
                            ),
                          ],
                        ),
                        height: MediaQuery.of(context).size.height/10,
                        width: MediaQuery.of(context).size.width/2,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: AnimatedTextKit(
                              animatedTexts: [
                                TyperAnimatedText(' Balance \n N0.00',
                                  textStyle: const TextStyle(color: whiteColor, fontSize: 18, fontWeight: FontWeight.w600
                                  ),
                                ),
                              ]
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      ColorizeAnimatedText('Services',
                        textStyle: const TextStyle(color: lightBlue, fontSize: 30, fontWeight: FontWeight.w800,
                      ), colors:
                        colorizeColors,
                      ),
                    ],
                    isRepeatingAnimation: false,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child:Row(
                      children: services.map((service){
                        int index = services.indexOf(service);
                        return Center(
                          child: GestureDetector(
                            onTap: () {
                              _toggleColor(index);
                              Future.delayed(const Duration(seconds: 1), ()
                              {
                                try {
                                  logger.i('Navigating to ${service['title']}');
                              if(context.mounted) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => service['widget']),
                                );
                              }
                                  _toggleColor(index);
                                } catch (e) {
                                  logger.e('Error occured while navigating $e');
                                }
                              });
                            },
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    AnimatedContainer(
                                      height: MediaQuery.of(context).size.height/8, width: MediaQuery.of(context).size.width/3,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: _colorsContainer[index],
                                        borderRadius: const BorderRadius.all(Radius.circular(15)),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: lightBlue,
                                            offset: Offset(3, 7),
                                            blurRadius: 10,
                                          ),
                                        ],
                                      ),
                                      duration: const Duration(seconds: 1),
                                      curve: Curves.fastOutSlowIn,
                                      child: Text(service['title'], style: const TextStyle(color: whiteColor),),
                                    ),
                                  ],
                                )
                            ),
                          ),
                        );
                      }).toList(),
                    )
                )
              ],
            )
          ]
      ),

    );
  }
}

class CreditCard extends StatelessWidget {
  final int number;
  final String valid;
  final String image;
  final Color color;

  const CreditCard({super.key, required this.number, required this.valid, required this.image, required this.color});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.width/6,
        width: MediaQuery.of(context).size.width/1.1,
        decoration: BoxDecoration(
          color: color,
          boxShadow: const [
            BoxShadow(
              color: lightBlue,
              offset: Offset(3, 7),
              blurRadius: 10,
            ),
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/images/$image', width: 50,),
                  ),
                  const Icon(Icons.more_vert, color: whiteColor)
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(text: TextSpan(children: [
                    const TextSpan(text: 'Agbachi Chidiogo Melvis\n', style: TextStyle(fontSize: 22, color: Colors.blueAccent),),
                    TextSpan(text: '**** **** **** ${number.toString()}\n', style: const TextStyle(fontSize: 22),),
                    TextSpan(text: valid, style: const TextStyle(fontSize: 14, color: Colors.blueAccent, fontWeight: FontWeight.w300,
                    ),
                    ),
                  ]
                  )
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class LocalTransfers extends StatefulWidget {
  final String title;
  const LocalTransfers({super.key, required this.title});

  @override
  State<LocalTransfers> createState() => _LocalTransfersState();
}

class _LocalTransfersState extends State<LocalTransfers> {
  @override
  Widget build(BuildContext context) {
    logger.d('Building local transfer screen');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: const TextStyle(color: darkBlue)),
        leading: IconButton(
            onPressed: () {
              logger.i('Navigating back from Local transfer screen');
              Navigator.pop(context);
            },
            icon: const
            Icon(Icons.arrow_back_ios_new_sharp, color: darkBlue)
        ),
        backgroundColor: lightBlue,
      ),
      body: ListView(
        children: const [
          ListTile(title: Text(''))
        ],
      ),
    );
  }
}

class AirtimeData extends StatefulWidget {
  final String title;
  const AirtimeData({super.key, required this.title});

  @override
  State<AirtimeData> createState() => _AirtimeDataState();
}

class _AirtimeDataState extends State<AirtimeData> {
  @override
  Widget build(BuildContext context) {
    logger.d('Building airtime & data screen');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: const TextStyle(color: darkBlue)),
        leading: IconButton(
            onPressed: () {
              logger.i('Navigating back from airtime & data screen');
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_sharp, color: darkBlue)
        ),
        backgroundColor: lightBlue,
      ),
      body: ListView(
        children: const [
          ListTile(title: Text(''))
        ],
      ),
    );
  }
}

class OpenAccount extends StatefulWidget {
  final String title;
  const OpenAccount({super.key, required this.title});

  @override
  State<OpenAccount> createState() => _OpenAccountState();
}

class _OpenAccountState extends State<OpenAccount> {
  @override
  Widget build(BuildContext context) {
    logger.d('Building open account screen');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: const TextStyle(color: darkBlue)),
        leading: IconButton(
            onPressed: () {
              logger.i('Navigating back from open account screen');
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_sharp, color: darkBlue)
        ),
        backgroundColor: lightBlue,
      ),
      body: ListView(
        children: const [
          ListTile(title: Text(''))
        ],
      ),
    );
  }
}

class BillPayment extends StatefulWidget {
  final String title;
  const BillPayment({super.key, required this.title});

  @override
  State<BillPayment> createState() => _BillPaymentState();
}

class _BillPaymentState extends State<BillPayment> {
  @override
  Widget build(BuildContext context) {
    logger.d('Building bill payment screen');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: const TextStyle(color: darkBlue)),
        leading: IconButton(
            onPressed: () {
              logger.i('Navigating back from bill payment screen');
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_sharp, color: darkBlue)
        ),
        backgroundColor: lightBlue,
      ),
      body: ListView(
        children: const [
          ListTile(title: Text(''))
        ],
      ),
    );
  }
}

class BVN extends StatefulWidget {
  final String title;
  const BVN({super.key, required this.title});

  @override
  State<BVN> createState() => _BVNState();
}

class _BVNState extends State<BVN> {
  @override
  Widget build(BuildContext context) {
    logger.d('Building bvn screen');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: const TextStyle(color: darkBlue)),
        leading: IconButton(
            onPressed: () {
              logger.i('Navigating back from bvn screen');
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_sharp, color: darkBlue)
        ),
        backgroundColor: lightBlue,
      ),
      body: ListView(
        children: const [
          ListTile(title: Text(''))
        ],
      ),
    );
  }
}

class RequestATM extends StatefulWidget {
  final String title;
  const RequestATM({super.key, required this.title});

  @override
  State<RequestATM> createState() => _RequestATMState();
}

class _RequestATMState extends State<RequestATM> {
  @override
  Widget build(BuildContext context) {
    logger.d('Building request atm screen');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: const TextStyle(color: darkBlue)),
        leading: IconButton(
          onPressed: () {
            logger.i('Navigating back from request atm screen');
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_sharp, color: darkBlue),
        ),
        backgroundColor: lightBlue,
      ),
      body: ListView(
        children: const [
          ListTile(title: Text(''))
        ],
      ),
    );
  }
}

