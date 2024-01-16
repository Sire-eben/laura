import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:laura/screens/guardian/transactions.dart';
import 'package:laura/utils/extension.dart';
import 'package:laura/widgets/base_scaffold.dart';
import 'package:laura/widgets/cards.dart';
import 'package:laura/widgets/recent_transactions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      builder: (x) => Column(
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
                        "Hi, Laura",
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
                    backgroundImage: AssetImage("assets/image.png"),
                  )
                ],
              )),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const ActionCard(
                    icon: CupertinoIcons.wand_stars_inverse,
                    text: "Request\nfor Money"),
                const ActionCard(
                    icon: CupertinoIcons.bubble_left_bubble_right,
                    text: "Chat"),
                GestureDetector(
                  onTap: () => context.push(const RecentTransactionsPage()),
                  child: const ActionCard(
                      icon: Icons.history_toggle_off_outlined,
                      text: "Recent\nTransactions"),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(18.0),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Recent Transactions",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                )),
          ),
          Flexible(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: transactions.length,
                itemBuilder: ((context, index) {
                  final item = transactions[index];
                  return TransactionHistoryTile(item: item);
                })),
          )
        ],
      ),
    );
  }
}
