import 'package:equatable/equatable.dart';

abstract class FetchTransactionsState extends Equatable {
  @override
  List<Object> get props => [];
}



class FetchTransacInitialState extends FetchTransactionsState {}

class FetchTransacLoadingState extends FetchTransactionsState {}

class FetchTransacSuccess extends FetchTransactionsState {
  final List transactionsList;
  FetchTransacSuccess(this.transactionsList);
}

class FetchTransacError extends FetchTransactionsState {
  final String errorMessage;
  FetchTransacError(this.errorMessage);
}
