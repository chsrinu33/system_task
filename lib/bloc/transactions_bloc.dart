import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/transaction.dart';
import 'transactions_event.dart';
import 'transactions_state.dart';

class TransactionsBloc extends Bloc<TransactionsEvent, FetchTransactionsState> {
  final transactionsList = [
    TransactionModel('BitCoin', 'Sent', '05 Sep 2019','-0.30533 BTC',Colors.red,const Color(0XFFFFBC4C)),
    TransactionModel('Ethereum', 'Recieved', '04 Sep 2019','-0.30533 ETH',Colors.green,const Color(0xff9e78f3)),
    TransactionModel('BitCoin', 'Recieved', '04 Sep 2019','-0.30533 BTC',Colors.green,const Color(0XFFFFBC4C)),
    TransactionModel('Ripley', 'Sent', '04 Sep 2019','-0.30533 XRP',Colors.red,const Color(0xffff9dd2)),
    TransactionModel('Ruble', 'Sent', '03 Sep 2019','-0.30533 RUB',Colors.red,const Color(0XFF64c7ff))
  ];
  TransactionsBloc() : super(FetchTransacInitialState()) {
    on<TransactionsEvent>((event, emit) {
      emit(FetchTransacLoadingState());
      Future.delayed(const Duration(seconds: 3));
      emit(FetchTransacSuccess(transactionsList));
    });
  }
}
