import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:laura/screens/guardian/transfer_details.dart';
import 'package:laura/utils/extension.dart';
import 'package:laura/utils/theme.dart';
import 'package:laura/widgets/base_scaffold.dart';

class TransferPage extends StatelessWidget {
  const TransferPage({super.key});

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
          centerTitle: false,
          elevation: 0,
          title: Text(
            "Transfer",
            style: AppStyles.general(20, FontWeight.w500, color: Colors.white),
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
                              .push(TransferDetailsPage(name: transfers[i])),
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
