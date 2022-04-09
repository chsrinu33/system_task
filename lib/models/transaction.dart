import 'package:flutter/material.dart';

class TransactionModel {
  String transactionName;
  String transactionStatus;
  String transactionDate;
  String subText;
  Color color;
  Color iconColor;
  TransactionModel(this.transactionName, this.transactionStatus,
      this.transactionDate, this.subText,this.color,this.iconColor);
}
