import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:system_task/bloc/transactions_bloc.dart';
import 'package:system_task/bloc/transactions_event.dart';
import 'package:system_task/bloc/transactions_state.dart';
import 'package:system_task/models/transaction.dart';

class TransactionSummaryScreen extends StatefulWidget {
  const TransactionSummaryScreen({Key? key}) : super(key: key);

  @override
  _TransactionSummaryScreenState createState() =>
      _TransactionSummaryScreenState();
}

class _TransactionSummaryScreenState extends State<TransactionSummaryScreen> {
  String cardNumber = '';
  String cardHolderName = '';
  String expiryDate = '';
  String cvv = '';
  bool showBack = false;
  final dataMap = <String, double>{
    "Bitcoin": 5,
    "Ethereum": 3,
    "Ripley": 2,
    "RUble": 2,
  };

  final colorList = <Color>[
    Colors.lightBlueAccent,
    Colors.orangeAccent,
    Colors.redAccent,
    Colors.green,
  ];

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
    // with extensions
    context.read<TransactionsBloc>().add(FetchTransactionsEvent());
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
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/image.jpeg'))),
                  ),
                  const Text(
                    'MY TRANSACTIONS',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                  const Icon(
                    Icons.notifications,
                    color: Colors.white,
                    size: 20,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: PieChart(
                legendOptions: const LegendOptions(
                  legendTextStyle: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                      fontSize: 12),
                ),
                dataMap: dataMap,
                chartType: ChartType.ring,
                baseChartColor: Colors.grey[50]!.withOpacity(0.15),
                colorList: colorList,
                chartValuesOptions: const ChartValuesOptions(
                  showChartValuesInPercentage: true,
                ),
                totalValue: 10,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              height: 400,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'My Transactions',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.apps_sharp,
                          color: Color(0xFF3267A7),
                          size: 25,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocBuilder<TransactionsBloc, FetchTransactionsState>(
                      builder: (context, state) {
                    if (state is FetchTransacLoadingState ||
                        state is FetchTransacInitialState) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is FetchTransacSuccess) {
                      print('transactionsList: ${state.transactionsList}');
                      return Flexible(
                        child: ListView.builder(
                          itemCount: state.transactionsList.length,
                          itemBuilder: (context, i) {
                            return buildRowItem(state.transactionsList[i]);
                          },
                        ),
                      );
                    } else {
                      return const Center(child: Text('Something went wrong.'));
                    }
                  }),
                ],
              ),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0))),
            )
          ],
        ),
      ),
    );
  }

  Padding buildRowItem(TransactionModel transactionModel) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            //width: 50.0,
            //height: 50.0,
            padding: const EdgeInsets.all(15.0),
            //I used some padding without fixed width and height
            decoration:  BoxDecoration(
              shape: BoxShape.circle,
              // You can use like this way or like the below line
              //borderRadius: new BorderRadius.circular(30.0),
              color: transactionModel.iconColor,
            ),
            child:  Text(transactionModel.transactionName[0],
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight
                        .bold)), // You can add a Icon instead of text also, like below.
            //child: new Icon(Icons.arrow_forward, size: 50.0, color: Colors.black38)),
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              transactionModel.transactionName,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
             Text(
              transactionModel.subText,
              style:const TextStyle(
                  color: Colors.grey,
                  fontSize: 11,
                  fontWeight: FontWeight.bold),
            ),
          ]),
          Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Text(
              transactionModel.transactionDate,
              style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 11,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              transactionModel.transactionStatus,
              style:  TextStyle(
                  color: transactionModel.color,
                  fontSize: 10,
                  fontWeight: FontWeight.bold),
            ),
          ]),
        ],
      ),
    );
  }
}
