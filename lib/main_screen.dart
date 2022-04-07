import 'package:flutter/material.dart';
import 'package:heyfood_test/main_bottomsheet.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              SizedBox(
                height: size.height,
                width: size.width,
                child: Column(
                  children: [
                    Container(
                      width: size.width,
                      height: 200,
                      color: Colors.grey[100],
                      padding:
                          const EdgeInsets.only(top: 10, right: 10, left: 10),
                      child: Stack(
                        children: [
                          SizedBox(
                            width: size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Icon(Icons.arrow_back),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Icon(Icons.favorite),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Icon(Icons.share),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.grey[200],
                        width: size.width,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 100,
                            ),
                            Text(
                              "MAP",
                              style: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 5,
                                ),
                                backgroundColor: Colors.white,
                                shadowColor: Colors.grey.withOpacity(0.2),
                                textStyle: TextStyle(
                                  color: Colors.grey[600],
                                ),
                              ),
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    builder: (context) {
                                      return const MainBottomSheet();
                                    });
                              },
                              child: const Text(
                                "Display Bottomsheet",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
