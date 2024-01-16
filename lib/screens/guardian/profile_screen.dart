import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:laura/screens/auth/login_screen.dart';
import 'package:laura/screens/guardian/account.dart';
import 'package:laura/screens/guardian/summary.dart';
import 'package:laura/utils/extension.dart';
import 'package:laura/utils/theme.dart';
import 'package:laura/widgets/base_scaffold.dart';

class GuardianProfileScreen extends StatefulWidget {
  const GuardianProfileScreen({super.key});

  @override
  State<GuardianProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<GuardianProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      backgroundColor: AppColors.primaryColor,
      builder: (x) => SingleChildScrollView(
        child: Column(
          children: [
            const Gap(16),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Profile",
                  style: AppStyles.general(20, FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            ),
            const Gap(16),
            const CircleAvatar(
              radius: 32,
              backgroundImage: AssetImage("assets/kingsley.JPG"),
            ),
            const Gap(16),
            const Text("Okpara Kingsley",
                style: TextStyle(color: Colors.white, fontSize: 28)),
            const Text("@kingsley01",
                style: TextStyle(
                  color: Colors.white,
                )),
            const Gap(48),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Divider(),
            ),
            const Gap(34),
            GestureDetector(
              onTap: () =>
                  context.push(const AccountDetailsScreen(isStudent: false)),
              child: const ProfileOption(
                  "Account details", CupertinoIcons.profile_circled),
            ),
            GestureDetector(
              onTap: () => context.push(const AccountList()),
              child: const ProfileOption(
                  "Statements & Reports", Icons.file_copy_rounded),
            ),
            const ProfileOption("Account limits", Icons.lock_clock),
            const ProfileOption("Get Help", Icons.question_mark_rounded),
            const ProfileOption("Legal", Icons.edit_document),
            const Padding(
              padding: EdgeInsets.all(13.0),
              child: Divider(),
            ),
            ListTile(
              onTap: () {
                context.pushOff(const LoginScreen());
              },
              leading: const Icon(
                Icons.login_outlined,
                color: Colors.white,
              ),
              title: const Text(
                "Log out",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileOption extends StatelessWidget {
  final IconData icon;
  final String text;

  const ProfileOption(this.text, this.icon);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 4),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Icon(
          icon,
          color: Colors.white,
        ),
        title: Text(
          text,
          style: AppStyles.general(16, FontWeight.w400, color: Colors.white),
        ),
        trailing:
            const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 15),
      ),
    );
  }
}
