import 'package:flutter/material.dart';

class TransactionHistoryTile extends StatelessWidget {
  final TransactionModel item;
  const TransactionHistoryTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.label),
      leading: CircleAvatar(
        backgroundImage: AssetImage(item.image),
      ),
      trailing: Text("₦${item.amount}"),
    );
  }
}

class TransactionModel {
  final String image;
  final String label;
  final String amount;

  TransactionModel(this.image, this.label, this.amount);
}

final List<TransactionModel> transactions = [
  TransactionModel("assets/netflix.png", "Netflix", "3500"),
  TransactionModel("assets/spotify icon.png", "Spotify premium", "1200"),
  TransactionModel("assets/netflix.png", "Netflix", "3500"),
  TransactionModel("assets/spotify icon.png", "Spotify premium", "1200"),
  TransactionModel("assets/netflix.png", "Netflix", "3500"),
];
