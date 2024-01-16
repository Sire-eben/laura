import 'package:flutter/material.dart';
import 'package:laura/utils/theme.dart';
import 'package:laura/widgets/base_scaffold.dart';
import 'package:laura/widgets/primary_btn.dart';
import 'package:laura/widgets/recent_transactions.dart';

class StudentAccountSummary extends StatelessWidget {
  const StudentAccountSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: AppColors.primaryColor,
          centerTitle: false,
          elevation: 0,
          title: Text(
            "Statements & Summary",
            style: AppStyles.general(
              16,
              FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
        builder: (x) => Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: transactions.length,
                      itemBuilder: ((context, index) {
                        final item = transactions[index];
                        return TransactionHistoryTile(item: item);
                      })),
                  Spacer(),
                  PrimaryButton(
                    backgroundColor: AppColors.primaryColor,
                    onPressed: () {},
                    width: x.width,
                    child: Text(
                      "Generate report",
                      style: AppStyles.general(14, FontWeight.bold,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            ));
  }
}

class StatementReport {
  final String name;
  final String amount;
  final String place;

  StatementReport(this.name, this.amount, this.place);
}

List<StatementReport> statements = [
  StatementReport("Laura", "₦2,500", "Chicken Republic"),
  StatementReport("David", "₦3,500", "H-Medix"),
  StatementReport("David", "₦6,000", "Books"),
];
