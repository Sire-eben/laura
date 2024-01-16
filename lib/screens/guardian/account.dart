import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:laura/utils/theme.dart';
import 'package:laura/widgets/base_scaffold.dart';
import 'package:laura/widgets/text_field.dart';

class AccountDetailsScreen extends StatelessWidget {
  const AccountDetailsScreen({super.key, this.isStudent = true});
  final bool isStudent;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: AppColors.primaryColor,
          // automaticallyImplyLeading: false,
          elevation: 0,
          title: Text(
            "Account Details",
            style: AppStyles.general(
              16,
              FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
        builder: (x) => const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  Gap(12),
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage("assets/kingsley.JPG"),
                  ),
                  AppTextField(
                    enabled: false,
                    hintText: "Okpara Kingsley",
                    labelText: "Account name",
                    keyboardType: TextInputType.number,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  AppTextField(
                    enabled: false,
                    hintText: "kingsley@gmail.com",
                    labelText: "Email",
                    keyboardType: TextInputType.number,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  AppTextField(
                    enabled: false,
                    hintText: "okparakingsley01",
                    labelText: "Username",
                    keyboardType: TextInputType.number,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  AppTextField(
                    enabled: false,
                    hintText: "00288911",
                    labelText: "ID Number",
                    keyboardType: TextInputType.number,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  AppTextField(
                    enabled: false,
                    hintText: "No 1, Okpara street. Lagos.",
                    labelText: "Address",
                    keyboardType: TextInputType.number,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  AppTextField(
                    enabled: false,
                    hintText: "5",
                    labelText: "No. of dependees",
                    keyboardType: TextInputType.number,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                ],
              ),
            ));
  }
}
