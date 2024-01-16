import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:laura/utils/extension.dart';
import 'package:laura/utils/theme.dart';

class CardStack extends StatelessWidget {
  const CardStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            bottom: 0,
            child: MyCard(
              color: Colors.deepPurple.shade100,
              text: 'Card 1',
              width: MediaQuery.sizeOf(context).width * .8,
            ),
          ),
          Positioned(
            top: 0,
            bottom: 7.5,
            child: MyCard(color: Colors.deepPurple.shade200, text: 'Card 2'),
          ),
          Positioned(
            bottom: 15,
            top: 0,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 0.1,
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              color: AppColors.secondrayColor,
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(left: 20),
                // height: 120.0,
                width: MediaQuery.of(context).size.width * 0.95,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("Current Balance",
                              style: AppStyles.general(14, FontWeight.w300,
                                  color: Colors.white)),
                          const SizedBox(
                            width: 5,
                          ),
                          const Icon(
                            Icons.remove_red_eye_outlined,
                            color: Colors.white,
                            size: 14,
                          )
                        ],
                      ),
                      Text("₦1546.50",
                          style: AppStyles.general(24, FontWeight.bold,
                              color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Add more cards as needed
        ],
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  final Color color;
  final String text;
  final double? width;

  const MyCard({
    super.key,
    required this.color,
    required this.text,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 0.1,
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      color: color,
      child: Container(
        height: 120.0,
        width: width ?? MediaQuery.of(context).size.width * 0.9,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class ActionCard extends StatelessWidget {
  final IconData icon;
  final String text;

  const ActionCard({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 120,
      // height: 118,
      constraints: const BoxConstraints(
        minWidth: 100,
        minHeight: 100,
      ),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 21),
      decoration: BoxDecoration(
          color: AppColors.transparentPrimaryrimary,
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 32,
            color: AppColors.secondrayColor,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            text,
            textAlign: TextAlign.left,
            style: AppStyles.general(12, FontWeight.w500,
                color: AppColors.secondrayColor),
          ),
        ],
      ),
    );
  }
}

class ActionCard2 extends StatelessWidget {
  final IconData icon;
  final String text;
  final Widget page;

  const ActionCard2(
      {super.key, required this.icon, required this.text, required this.page});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(page),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
            color: AppColors.transparentPrimaryrimary,
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(color: AppColors.secondrayColor),
            ),
            const Gap(8),
            Transform.rotate(
              angle: 345,
              child: Icon(
                icon,
                size: 20,
                color: AppColors.secondrayColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
