import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:laura/screens/guardian/guardian_dashboard.dart';
import 'package:laura/utils/extension.dart';
import 'package:laura/utils/theme.dart'; 
import 'package:laura/widgets/base_scaffold.dart';
import 'package:laura/widgets/primary_btn.dart';
import 'package:laura/widgets/text_field.dart';

class TransferDetailsPage extends StatefulWidget {
  const TransferDetailsPage({super.key, required this.name});
  final String name;

  @override
  State<TransferDetailsPage> createState() => _TransferDetailsPageState();
}

class _TransferDetailsPageState extends State<TransferDetailsPage> {
  final _key = GlobalKey<FormState>();
  final amountCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: AppColors.primaryColor,
          // automaticallyImplyLeading: false,
          elevation: 0,
          title: Text(
            widget.name,
            style: AppStyles.general(16, FontWeight.w500, color: Colors.white),
          ),
        ),
        builder: (x) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
              child: Form(
                key: _key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppTextField(
                      hintText: "Amount",
                      labelText: "Amount",
                      controller: amountCon,
                      keyboardType: TextInputType.number,
                      // validator: Validators.validateString(),
                    ),
                    // Container(
                    //   width: x.width,
                    //   padding: EdgeInsets.all(16),
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(12),
                    //       border: Border.all(
                    //         width: 1,
                    //         color: AppColors.secondrayColor,
                    //       )),
                    //   child: AppTextField(),
                    // )
                    const Gap(40),
                    PrimaryButton(
                      backgroundColor: AppColors.primaryColor,
                      onPressed: () {
                        if (!_key.currentState!.validate()) return;
                        context.pushOff(const SuceesPage());
                      },
                      width: x.width,
                      label: "Send Money",
                      child: Text(
                        "Send money",
                        style: AppStyles.general(14, FontWeight.bold,
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}

class SuceesPage extends StatelessWidget {
  const SuceesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        onWillPop: () {
          context.pushOff(const GuardianDashboard());
        },
        safeTop: false,
        backgroundColor: AppColors.primaryColor,
        builder: (x) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    CupertinoIcons.check_mark_circled_solid,
                    color: Colors.white,
                    size: 200,
                  ),
                  const Gap(16),
                  Text(
                    "Transfer Successful",
                    style: AppStyles.general(16, FontWeight.bold,
                        color: Colors.white),
                  ),
                  const Gap(16),
                  ElevatedButton(
                      onPressed: () {
                        context.pushOff(const GuardianDashboard());
                      },
                      child: const Text("Go Home"))
                ],
              ),
            ));
  }
}
