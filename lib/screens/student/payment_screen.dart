import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:laura/screens/student/restaurants.dart';
import 'package:laura/utils/extension.dart';

import '../../utils/theme.dart';
import '../../widgets/base_scaffold.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: false,
        title: Text(
          "Pay",
          style: AppStyles.general(20, FontWeight.w500, color: Colors.white),
        ),
      ),
      builder: (x) => SingleChildScrollView(
        padding: const EdgeInsets.all(11.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.transparentPrimaryrimary,
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Money Transfer",
                      style: AppStyles.general(14, FontWeight.w500),
                    ),
                  ),
                  const Gap(18),
                  GridView(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, // Number of columns
                      ),
                      children: [
                        ActionCard(Icons.house_siding_outlined, Colors.blue,
                            "To Bank"),
                        ActionCard(Icons.wallet, Colors.blue, "To L Wallet"),
                        ActionCard(Icons.shopping_cart_outlined, Colors.green,
                            "Pay Shop"),
                      ]),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.transparentPrimaryrimary,
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "My Services",
                      style: AppStyles.general(14, FontWeight.w500),
                    ),
                  ),
                  const Gap(18),
                  GridView(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 0,
                      ),
                      children: [
                        ActionCard(Icons.phone_callback, Colors.red, "Airtime"),
                        ActionCard(Icons.wifi, Colors.red, "Internet"),
                        ActionCard(
                            Icons.cast_for_education, Colors.blue, "Education"),
                        ActionCard(Icons.tv, Colors.green, "Tv"),
                        ActionCard(
                            Icons.car_crash_outlined, Colors.red, "Transport"),
                        ActionCard(Icons.travel_explore_outlined, Colors.red,
                            "Travels"),
                        GestureDetector(
                          onTap: () => context.push(const AllRestaurants()),
                          child: ActionCard(
                              Icons.food_bank_outlined, Colors.blue, "Food"),
                        ),
                        ActionCard(
                            Icons.food_bank_outlined, Colors.green, "Hospital"),
                        ActionCard(
                            Icons.local_hospital, Colors.green, "Religion"),
                        ActionCard(
                            Icons.business, Colors.green, "Merchant Payment"),
                        ActionCard(Icons.arrow_forward, Colors.blue, "Others"),
                      ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ActionCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String text;

  ActionCard(this.icon, this.iconColor, this.text);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: Colors.white,
          child: Icon(
            icon,
            size: 24,
            color: iconColor,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: AppStyles.general(14, FontWeight.w400),
        ),
      ],
    );
  }
}
