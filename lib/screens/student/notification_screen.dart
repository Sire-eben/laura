import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification"),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none),
                fillColor: const Color.fromARGB(255, 234, 238, 240),
                filled: true,
                // labelText: 'Search',
                hintText: 'Search',
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "You can check your\nnotifications here",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )),
          ),
          Flexible(
            child: ListView.separated(
              itemCount: 5,
              itemBuilder: ((context, index) {
                return NotificationCard(
                  'Angela just sent you 2000',
                  "Angela yol",
                );
              }),
              separatorBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Divider(),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String text;
  final String subtext;

  NotificationCard(this.subtext, this.text);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(),
      title: Text(text),
      subtitle: Text(subtext),
      trailing: Icon(Icons.arrow_forward_ios, size: 15),
    );
  }
}
