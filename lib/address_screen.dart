import 'package:flutter/material.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: size.width,
                  height: 200,
                  color: Colors.grey[100],
                  padding: const EdgeInsets.only(
                    top: 10,
                    right: 10,
                    left: 10,
                  ),
                  child: Center(
                    child: Text(
                      "MAP",
                      style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "Current Item",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "Some dummy text to make this text widget soft wrap itself. A multiline dummy text always looks better as filler info. ",
                    softWrap: true,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 13,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  thickness: 1.1,
                ),
                const SizedBox(
                  height: 10,
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  minVerticalPadding: 0,
                  leading: const Icon(Icons.location_on_rounded),
                  trailing: const Icon(Icons.more_horiz),
                  title: Text(
                    "3 Handover Square, New York, NY",
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 100.0),
                  child: Divider(
                    thickness: 1.1,
                  ),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  minVerticalPadding: 0,
                  leading: const Icon(Icons.timer_rounded),
                  trailing: const Icon(Icons.add),
                  title: Text(
                    "Open until 2:30",
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Divider(
                  thickness: 1.1,
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  minVerticalPadding: 0,
                  leading: const Icon(Icons.favorite),
                  trailing: const Icon(Icons.chevron_right),
                  title: Text(
                    "Best Overall",
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    "One of the best spots on Uber Eats",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                ),
                const Divider(
                  thickness: 1.1,
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  minVerticalPadding: 0,
                  leading: const Icon(Icons.star),
                  title: Text(
                    "4.8 (500+ ratings)",
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Divider(
                  thickness: 1.1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
