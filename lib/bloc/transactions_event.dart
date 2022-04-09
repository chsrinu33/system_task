import 'package:equatable/equatable.dart';

abstract class TransactionsEvent extends Equatable {}
class FetchTransactionsEvent extends TransactionsEvent {
  FetchTransactionsEvent();
  @override
  List<Object> get props => [];
}