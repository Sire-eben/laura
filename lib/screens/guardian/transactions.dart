import 'package:flutter/material.dart';
import 'package:laura/utils/theme.dart';
import 'package:laura/widgets/base_scaffold.dart';
import 'package:laura/widgets/recent_transactions.dart';

class RecentTransactionsPage extends StatelessWidget {
  const RecentTransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: AppColors.primaryColor,
          // automaticallyImplyLeading: false,
          centerTitle: false,
          elevation: 0,
          title: Text(
            "Recent Transactions",
            style: AppStyles.general(20, FontWeight.w500, color: Colors.white),
          ),
        ),
        builder: (x) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Column(
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: transactions.length,
                      itemBuilder: ((context, index) {
                        final item = transactions[index];
                        return TransactionHistoryTile(item: item);
                      }))
                ],
              ),
            ));
  }
}
