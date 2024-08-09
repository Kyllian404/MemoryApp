// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:memoryapp/src/constants/app_colors.dart';

class HomeMemoryPage extends StatefulWidget {
  const HomeMemoryPage({super.key});

  @override
  State<HomeMemoryPage> createState() => _HomeMemoryPageState();
}

enum SampleItem { profile, settings, preferences }

class _HomeMemoryPageState extends State<HomeMemoryPage> {
  SampleItem? selectedItem;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          PopupMenuButton<SampleItem>(
            initialValue: selectedItem,
            onSelected: (SampleItem item) {
              setState(() {
                selectedItem = item;
              });
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
              const PopupMenuItem<SampleItem>(
                value: SampleItem.profile,
                child: Text('profile'),
              ),
              const PopupMenuItem<SampleItem>(
                value: SampleItem.settings,
                child: Text('settings'),
              ),
              const PopupMenuItem<SampleItem>(
                value: SampleItem.preferences,
                child: Text('preferences'),
              ),
            ],
          ),
        ],
        backgroundColor: AppColors.fondApp,
        title: const Text(
          "",
        ),
      ),
      backgroundColor: AppColors.fondApp,
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),

              /// Zone Daily challenge
              child: Container(
                width: 340,
                height: 200,
                decoration: BoxDecoration(
                  color: AppColors.fondApp,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: const [
                    BoxShadow(
                      blurStyle: BlurStyle.inner,
                      color: Color.fromARGB(127, 255, 255, 255),
                      offset: Offset(-2, 5),
                      blurRadius: 4,
                      spreadRadius: -3,
                    ),
                    BoxShadow(
                      blurStyle: BlurStyle.inner,
                      color: Color.fromARGB(65, 0, 0, 0),
                      offset: Offset(2, -5),
                      blurRadius: 4,
                      spreadRadius: 0,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: AppColors.fondApp,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        blurStyle: BlurStyle.inner,
                        color: Color.fromARGB(80, 255, 255, 255),
                        offset: Offset(0, -3),
                        blurRadius: 3,
                        spreadRadius: -0.5,
                      ),
                      BoxShadow(
                        blurStyle: BlurStyle.outer,
                        color: Color.fromARGB(80, 0, 0, 0),
                        offset: Offset(0, 3),
                        blurRadius: 4,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.list_rounded,
                      color: AppColors.iconsPrimary,
                      size: 80,
                    ),
                  ),
                ),
                splashColor: Color.fromARGB(0, 0, 0, 0),
                autofocus: false,
                borderRadius: BorderRadius.circular(20),

              ),
            ],
          )
        ],
      ),
    );
  }
}
