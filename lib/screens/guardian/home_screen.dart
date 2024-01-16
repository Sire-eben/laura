import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:laura/screens/guardian/transactions.dart';
import 'package:laura/screens/guardian/transfer.dart';
import 'package:laura/widgets/cards.dart';
import 'package:laura/widgets/recent_transactions.dart';

import '../../widgets/base_scaffold.dart';

class GuardianHomeScreen extends StatefulWidget {
  const GuardianHomeScreen({super.key});

  @override
  State<GuardianHomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<GuardianHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      builder: (x) => SingleChildScrollView(
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.all(15),
                child: const Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Good Morning🌤️"),
                        Text(
                          "Hi, Kingsley",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )
                      ],
                    ),
                    Spacer(),
                    Icon(
                      CupertinoIcons.question_circle,
                      color: Colors.blue,
                    ),
                    Gap(20),
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/kingsley.JPG"),
                    )
                  ],
                )),
            // Gap(22),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.17,
              child: const CardStack(),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(18.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Perform an action",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  )),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ActionCard2(
                  icon: Icons.send,
                  text: "Transfer",
                  page: TransferPage(),
                ),
                ActionCard2(
                  icon: Icons.history,
                  text: "Recent Transactions",
                  page: RecentTransactionsPage(),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(18.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Most Recent Transactions",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  )),
            ),
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
      ),
    );
  }
}
