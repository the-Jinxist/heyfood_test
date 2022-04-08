import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:heyfood_test/address_screen.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MainBottomSheet extends StatefulWidget {
  const MainBottomSheet({Key? key}) : super(key: key);

  @override
  State<MainBottomSheet> createState() => _MainBottomSheetState();
}

class _MainBottomSheetState extends State<MainBottomSheet>
    with SingleTickerProviderStateMixin {
  bool isAtTop = false;
  late TabController _tabController;

  late ItemScrollController scrollController;
  late ItemPositionsListener itemPositionsListener;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 5, vsync: this);

    scrollController = ItemScrollController();
    itemPositionsListener = ItemPositionsListener.create();
  }

  @override
  void setState(Function() fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return DraggableScrollableActuator(
      child: DraggableScrollableSheet(
        maxChildSize: 1,
        minChildSize: 0.6,
        expand: false,
        initialChildSize: 0.6,
        builder: (BuildContext sheetContext, ScrollController controller) {
          return Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: isAtTop ? Radius.zero : const Radius.circular(10),
                topRight: isAtTop ? Radius.zero : const Radius.circular(10),
              ),
            ),
            child: Stack(
              children: [
                NotificationListener<DraggableScrollableNotification>(
                  onNotification: (notification) {
                    if (notification.extent == notification.maxExtent) {
                      log("atTop");
                      WidgetsBinding.instance?.addPostFrameCallback((_) {
                        setState(() {
                          isAtTop = true;
                        });
                      });
                    } else {
                      log("notAtTop");
                      WidgetsBinding.instance?.addPostFrameCallback((_) {
                        setState(() {
                          isAtTop = false;
                        });
                      });
                    }
                    return true;
                  },
                  child: SingleChildScrollView(
                    controller: controller,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          AnimatedOpacity(
                            opacity: isAtTop ? 0.0 : 1.0,
                            duration: const Duration(milliseconds: 500),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 5,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: Colors.grey[300],
                                  ),
                                )
                              ],
                            ),
                          ),
                          AnimatedSize(
                            curve: Curves.linearToEaseOut,
                            duration: const Duration(milliseconds: 500),
                            child: SizedBox(
                              height: isAtTop ? 90 : 20,
                            ),
                          ),
                          AnimatedOpacity(
                            opacity: isAtTop ? 0.0 : 1.0,
                            duration: const Duration(milliseconds: 500),
                            child: const Text(
                              "Items",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (c, a1, a2) =>
                                        const AddressScreen(),
                                    transitionsBuilder: (c, anim, a2, child) =>
                                        SlideTransition(
                                            position: Tween(
                                              begin: const Offset(1.0, 0.0),
                                              end: const Offset(0.0, 0.0),
                                            ).animate(anim),
                                            child: child),
                                    transitionDuration:
                                        const Duration(milliseconds: 100),
                                  ),
                                );
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Rating for this item is 5 Stars!",
                                        style: TextStyle(
                                            color: Colors.grey[800],
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Open till 3pm",
                                        style: TextStyle(
                                          color: Colors.grey[700],
                                          fontSize: 13,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Tap to view address and find location",
                                        style: TextStyle(
                                          color: Colors.grey[700],
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    Icons.chevron_right,
                                    color: Colors.grey[500],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Stack(
                            children: [
                              Column(
                                children: [
                                  ScrollablePositionedList.builder(
                                      itemCount: 100,
                                      shrinkWrap: true,
                                      itemScrollController: scrollController,
                                      itemPositionsListener:
                                          itemPositionsListener,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 8.0),
                                          child: ListTile(
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                              vertical: 5,
                                            ),
                                            trailing: const Icon(Icons.abc),
                                            leading: Container(
                                              height: 50,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Colors.grey[200],
                                              ),
                                            ),
                                            title: Text(
                                              "Item title",
                                              style: TextStyle(
                                                color: Colors.grey[700],
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            subtitle: Text(
                                              "Item's lovely description. Small stuff",
                                              style: TextStyle(
                                                color: Colors.grey[500],
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            height: 100,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: isAtTop ? null : 0,
                  top: isAtTop ? 0 : null,
                  child: AnimatedOpacity(
                    opacity: !isAtTop ? 0.0 : 1.0,
                    duration: const Duration(milliseconds: 100),
                    child: Container(
                      width: size.width,
                      color: Colors.white,
                      padding: const EdgeInsets.only(
                        top: 10,
                        right: 10,
                        left: 10,
                      ),
                      child: SizedBox(
                        width: size.width,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Card(
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Icon(Icons.arrow_back),
                                      ),
                                    ),
                                    const Text(
                                      "Items",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Card(
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Icon(Icons.more_horiz),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TabBar(
                              controller: _tabController,
                              isScrollable: true,
                              indicatorColor: Colors.black,
                              onTap: (int index) {
                                // _handleScroll(index);
                              },
                              tabs: [
                                Tab(
                                  icon: Icon(
                                    Icons.search,
                                    color: Colors.grey[500],
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    "Breakfast Sandwich",
                                    style: TextStyle(
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    "Smoked Fish Sandwich",
                                    style: TextStyle(
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    "Burger King Sandwich",
                                    style: TextStyle(
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    "Good Life Sandwich",
                                    style: TextStyle(
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  void _handleScroll(int index) {
    switch (index) {
      case 0:
        {
          setState(() {
            scrollController.jumpTo(
              index: 0,
            );
          });

          break;
        }
      case 1:
        {
          setState(() {
            scrollController.jumpTo(
              index: 4,
            );
          });
          break;
        }
      case 2:
        {
          setState(() {
            scrollController.jumpTo(
              index: 8,
            );
          });
          break;
        }
      case 3:
        {
          setState(() {
            scrollController.jumpTo(
              index: 16,
            );
          });
          break;
        }
      case 4:
        {
          setState(() {
            scrollController.jumpTo(
              index: 20,
            );
          });
          break;
        }
    }
  }
}
