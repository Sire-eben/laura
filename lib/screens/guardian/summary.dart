import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:laura/utils/extension.dart';
import 'package:laura/utils/theme.dart';
import 'package:laura/widgets/base_scaffold.dart';
import 'package:laura/widgets/primary_btn.dart';
import 'package:laura/widgets/recent_transactions.dart';

class AccountList extends StatelessWidget {
  const AccountList({super.key});

  @override
  Widget build(BuildContext context) {
    final transfers = [
      "Laura",
      "David",
      "Kemi",
      "Ngozi",
    ];
    return BaseScaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: AppColors.primaryColor,
          // automaticallyImplyLeading: false,
          elevation: 0,
          title: Text(
            "Statement & Reports",
            style: AppStyles.general(16, FontWeight.w500, color: Colors.white),
          ),
        ),
        builder: (x) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: [
                  ListView.separated(
                      itemCount: transfers.length,
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => Divider(),
                      itemBuilder: (_, i) {
                        return GestureDetector(
                          onTap: () => context
                              .push(GuardianAccountSummary(name: transfers[i])),
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 8),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  backgroundImage:
                                      AssetImage("assets/image.png"),
                                ),
                                const Gap(8),
                                Text(
                                  transfers[i],
                                  style: AppStyles.general(18, FontWeight.w500,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        );
                      })
                ],
              ),
            ));
  }
}

class GuardianAccountSummary extends StatelessWidget {
  const GuardianAccountSummary({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: AppColors.primaryColor,
          centerTitle: false,
          elevation: 0,
          title: Text(
            name,
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
