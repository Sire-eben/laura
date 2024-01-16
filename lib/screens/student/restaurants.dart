import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:laura/utils/extension.dart';
import 'package:laura/utils/theme.dart';
import 'package:laura/widgets/base_scaffold.dart';

import 'transfer_details.dart';

class AllRestaurants extends StatelessWidget {
  const AllRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    final transfers = [
      "Brim",
      "w-sauce",
      "Sizzles",
      "Paparim2",
      "Terminal",
      "Chicken Republic",
    ];
    return BaseScaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: AppColors.primaryColor,
          // automaticallyImplyLeading: false,
          centerTitle: false,
          elevation: 0,
          title: Text(
            "Restaurants",
            style: AppStyles.general(16, FontWeight.w500, color: Colors.white),
          ),
        ),
        builder: (x) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
              child: Column(
                children: [
                  ListView.separated(
                      itemCount: transfers.length,
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => Divider(),
                      itemBuilder: (_, i) {
                        return GestureDetector(
                          onTap: () => context.push(
                              StudentTransferDetailsPage(name: transfers[i])),
                          child: Row(
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("assets/white.png"))),
                              ),
                              const Gap(8),
                              Text(
                                transfers[i],
                                style: AppStyles.general(18, FontWeight.w500),
                              ),
                            ],
                          ),
                        );
                      })
                ],
              ),
            ));
  }
}
