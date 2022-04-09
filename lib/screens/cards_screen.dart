import 'package:awesome_card/credit_card.dart';
import 'package:awesome_card/style/card_background.dart';
import 'package:flutter/material.dart';

class CardsScreen extends StatefulWidget {

  @override
  _CardsScreenState createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  String cardNumber = '';
  String cardHolderName = '';
  String expiryDate = '';
  String cvv = '';
  bool showBack = false;

  late FocusNode _focusNode;
  TextEditingController cardNumberCtrl = TextEditingController();
  TextEditingController expiryFieldCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _focusNode.hasFocus ? showBack = true : showBack = false;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF021D41),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30,),
            Padding(
              padding:const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 40.0,
                    height: 40.0,
                    decoration:  const BoxDecoration(
                        shape: BoxShape.circle,
                        image:  DecorationImage(
                            fit: BoxFit.cover, image: AssetImage('assets/images/image.jpeg'))),
                  ),
                  const Text(
                    'MY WALLET',
                    style: TextStyle(color: Colors.white, fontSize: 13,fontWeight: FontWeight.bold),
                  ),
                  const Icon(
                    Icons.notifications,
                    color: Colors.white,
                    size: 20,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  Text(
                    'Available Balance',
                    style: TextStyle(color: Colors.white, fontSize: 9,fontWeight: FontWeight.normal),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    '\$ 18 420.81',
                    style: TextStyle(color: Colors.white, fontSize: 25,fontWeight: FontWeight.bold),
                  ),

                ],),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: 135,
                      child: RaisedButton(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(5.0))),
                          onPressed: () {
                            print('Button Clicked.');
                          },
                          textColor: Colors.white,
                          color: Colors.lightBlue,
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Padding(
                              padding:const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(10, 4, 4, 4),
                                    child: Icon(
                                      Icons.arrow_upward,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                  ),
                                  Container(
                                    color: Colors.lightBlue,
                                    padding: const EdgeInsets.fromLTRB(4, 0, 10, 0),
                                    child:const Text(
                                      'Pay',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 13),
                                    ),
                                  ),
                                ],
                              )))),
                  Container(
                      width: 135,
                      child: RaisedButton(
                          shape:const RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(5.0))),
                          onPressed: () {
                            print('Button Clicked.');
                          },
                          textColor: Colors.black,
                          color: Colors.white,
                          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  const  Padding(
                                    padding: EdgeInsets.fromLTRB(10, 4, 4, 4),
                                    child: Icon(
                                      Icons.arrow_downward,
                                      color: Colors.black,
                                      size: 18,
                                    ),
                                  ),
                                  Container(
                                    color: Colors.white,
                                    padding: const EdgeInsets.fromLTRB(4, 0, 10, 0),
                                    child: const Text(
                                      'Request',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 13),
                                    ),
                                  ),
                                ],
                              ))))
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'My Cards',
                          style: TextStyle(
                              color: Colors.black, fontSize: 17,fontWeight: FontWeight.bold),
                        ),

                        Icon(
                          Icons.add_circle_outlined,
                          color: Color(0xFF3267A7),
                          size: 25,
                        ),


                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),

                  CreditCard(
                    cardNumber: cardNumber,
                    cardExpiry: expiryDate,
                    cardHolderName: cardHolderName,
                    cvv: cvv,
                    bankName: 'Axis Bank',
                    showBackSide: showBack,
                    frontBackground: Container(
                      width: double.maxFinite,
                      height: double.maxFinite,
                      color: Colors.blueAccent,
                    ),
                    backBackground: CardBackgrounds.white,
                    showShadow: true,
                    // mask: getCardTypeMask(cardType: CardType.americanExpress),
                  ),
                  const SizedBox(height: 20,),
                  CreditCard(
                    cardNumber: cardNumber,
                    cardExpiry: expiryDate,
                    cardHolderName: cardHolderName,
                    cvv: cvv,
                    bankName: 'ICICI Bank',
                    showBackSide: showBack,
                    frontBackground: Container(
                      width: double.maxFinite,
                      height: double.maxFinite,
                      color: Colors.redAccent,
                    ),
                    backBackground: CardBackgrounds.white,
                    showShadow: true,
                    // mask: getCardTypeMask(cardType: CardType.americanExpress),
                  ),
                  const SizedBox(height: 20,),

                ],
              ),
              decoration:const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0)
                  )
              ),
            )

          ],
        ),
      ),
    );


  }
}
