import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laura/utils/theme.dart';
import 'package:laura/widgets/base_scaffold.dart';

class GuardianNotificationScreen extends StatefulWidget {
  const GuardianNotificationScreen({super.key});

  @override
  State<GuardianNotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<GuardianNotificationScreen> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: false,
        title: Text(
          "Notification",
          style: AppStyles.general(20, FontWeight.w500, color: Colors.white),
        ),
      ),
      builder: (x) => SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.blueAccent,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none),
                fillColor: const Color.fromARGB(255, 234, 238, 240),
                filled: true,
                // labelText: 'Search',
                hintText: 'Search',
              ),
            ),
            const Gap(8),
            const Text(
              "You can check your\nnotifications here",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            ListView.separated(
              itemCount: 5,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return const NotificationCard(
                  text: 'Angela just sent you ₦2000',
                  subtext: "Angela yol",
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Divider(),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String text;
  final String subtext;
  // final String image;

  const NotificationCard({
    super.key,
    required this.text,
    required this.subtext,
    // required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 40,
        width: 40,
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/white.png"))),
      ),
      title: Text(
        subtext,
        style:
            GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w400),
      ),
      subtitle: Text(
        text,
        style: GoogleFonts.montserrat(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.blueAccent,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 15),
    );
  }
}
