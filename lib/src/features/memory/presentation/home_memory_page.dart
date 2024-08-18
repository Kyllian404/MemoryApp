import 'package:flutter/material.dart';
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
    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isPortrait = screenHeight > screenWidth;

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
                child: Text('Profile'),
              ),
              const PopupMenuItem<SampleItem>(
                value: SampleItem.settings,
                child: Text('Settings'),
              ),
              const PopupMenuItem<SampleItem>(
                value: SampleItem.preferences,
                child: Text('Preferences'),
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
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //* Title
              Container(
                width: screenWidth * 0.9,
                height: screenHeight * 0.06,
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
                child: const Text(
                  'Memoryze',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 32,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                    letterSpacing: 2,
                    wordSpacing: 3,
                  ),
                ),
              ),
              //* Daily Challenge Area
              Container(
                width: screenWidth * 0.9,
                height: screenHeight * 0.2,
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
                child: const Text(
                  textAlign: TextAlign.center,
                  'Daily Challenge',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 28,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                    letterSpacing: 2,
                    wordSpacing: 3,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              //* Icons and Labels
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.1),
                child: Column(
                  children: [
                    buildRowItem(
                      context,
                      screenWidth,
                      screenHeight,
                      'Time Challenge List',
                      Icons.list_rounded,
                    ),
                    buildRowItem(
                      context,
                      screenWidth,
                      screenHeight,
                      'Match Mania',
                      Icons.autorenew_rounded,
                    ),
                    buildRowItem(
                      context,
                      screenWidth,
                      screenHeight,
                      'Sequence Master',
                      Icons.calendar_view_month_rounded,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildBottomNavItem(
            context,
            screenWidth,
            'Home',
            Icons.home_filled,
            () => print("You are ready on Home"),
          ),
          buildBottomNavItem(
            context,
            screenWidth,
            'Add',
            Icons.add,
            () => print("Add"),
          ),
          buildBottomNavItem(
            context,
            screenWidth,
            'Profile',
            Icons.person_rounded,
            () => print("Profile"),
          ),
        ],
      ),
    );
  }

  Widget buildRowItem(
    BuildContext context,
    double screenWidth,
    double screenHeight,
    String label,
    IconData icon,
  ) {
    return Row(
      children: [
        InkResponse(
          onTap: () {
            print(label);
          },
          child: Container(
            width: screenWidth * 0.15,
            height: screenHeight * 0.08,
            decoration: BoxDecoration(
              color: AppColors.fondApp,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                  blurStyle: BlurStyle.inner,
                  color: Color.fromARGB(80, 255, 255, 255),
                  offset: Offset(0, -3),
                  blurRadius: 4,
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
            child: Center(
              child: Icon(
                icon,
                color: AppColors.iconsPrimary,
                size: screenHeight * 0.05,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.02),
          child: Text(
            label,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: screenHeight * 0.03,
              fontWeight: FontWeight.normal,
              color: AppColors.iconsPrimary,
              letterSpacing: 2,
              wordSpacing: 3,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget buildBottomNavItem(
    BuildContext context,
    double screenWidth,
    String label,
    IconData icon,
    VoidCallback onTap,
  ) {
    return InkResponse(
      onTap: onTap,
      child: Container(
        width: screenWidth * 0.15,
        height: screenWidth * 0.15,
        decoration: const BoxDecoration(
          color: AppColors.fondApp,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              blurStyle: BlurStyle.inner,
              color: Color.fromARGB(80, 255, 255, 255),
              offset: Offset(0, -3),
              blurRadius: 4,
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
        child: Center(
          child: Icon(
            icon,
            color: AppColors.iconsPrimary,
            size: screenWidth * 0.12,
          ),
        ),
      ),
    );
  }
}
