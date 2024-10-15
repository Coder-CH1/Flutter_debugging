import 'package:flutter/material.dart';
import 'package:flutter_debugging/logger.dart';
import 'package:flutter_debugging/reusable_widgets/colors.dart';
import 'package:flutter_debugging/reusable_widgets/side_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> countries = ["Local Transfers", "Airtime/Data", "Open Account", "Bill payment", "BVN", "Request for ATM"];
  @override
  Widget build(BuildContext context) {
    logger.d('Home widget');
    return Scaffold(
      drawer: const Drawer2(),
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
                  top: 150,
                  child: SizedBox(
                    width: 900,
                    height: 190,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: const AlwaysScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: const [
                        CreditCard(number: 9290, valid: 'VALID 20/24', image: 'mastercard.png', color: lightBlue),
                        CreditCard(number: 9290, valid: 'VALID 20/24', image: 'visa.png', color: darkBlue),
                        CreditCard(number: 9290, valid: 'VALID 20/24', image: 'mastercard.png', color: lightBlue),
                        CreditCard(number: 9290, valid: 'VALID 20/24', image: 'visa.png', color: darkBlue),
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
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.filter_list, color: Colors.blueAccent,),
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
                      const Text('Good Day,', style: TextStyle(color: lightBlue, fontSize: 16, fontWeight: FontWeight.w900),),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text('Melvis Chi', style: TextStyle(color: darkBlue, fontSize: 22, fontWeight: FontWeight.w700),),
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
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: const BorderRadius.all(Radius.circular(15)),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.lightBlue,
                              offset: Offset(3, 7),
                              blurRadius: 15,
                            ),
                          ],
                        ),
                        height: 70.0,
                        width: 200,
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(' Balance \n \$444', style: TextStyle(color: darkBlue, fontSize: 22, fontWeight: FontWeight.w800
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
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text('Services', style: TextStyle(color: darkBlue, fontSize: 22, fontWeight: FontWeight.w800
                  ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child:Row(
                      children: countries.map((country){
                        return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 100, width:150,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: darkBlue,
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                                boxShadow: [
                                  BoxShadow(
                                    color: lightBlue,
                                    offset: Offset(3, 7),
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: Text(country, style: const TextStyle(color: Colors.white),),
                            )
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
        height: 190,
        width: 300,
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
                  const Icon(Icons.more_vert, color: Colors.white,)
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
                    const TextSpan(text: 'Melvis Chi\n', style: TextStyle(fontSize: 22, color: Colors.grey),),
                    TextSpan(text: '**** **** **** ${number.toString()}\n', style: const TextStyle(fontSize: 22),),
                    TextSpan(text: valid, style: const TextStyle(fontSize: 14, color: Colors.white60, fontWeight: FontWeight.w300,
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
