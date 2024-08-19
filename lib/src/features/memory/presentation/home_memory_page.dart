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
      body: Stack(
        children: [
          //* Page Title
          Positioned(
            top: screenHeight * 0.02,
            left: screenWidth * 0.05,
            right: screenWidth * 0.05,
            child: Container(
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
          ),
          //* Daily Challenge Area
          Positioned(
            top: screenHeight * 0.10,
            left: screenWidth * 0.05,
            right: screenWidth * 0.05,
            child: Container(
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
          ),
          //* Actions jeux/liste
          Positioned(
            top: screenHeight * 0.33,
            left: screenWidth * 0.05,
            right: screenWidth * 0.05,
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
          //* Navigation bottom
          Positioned(
            bottom: screenHeight * 0.02,
            left: screenWidth * 0.03,
            right: screenWidth * 0.03,
            child: Row(
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
                  () {
                    showModalBottomSheet(
                      context: context,
                      barrierColor: Colors.white.withOpacity(0.1),
                      builder: (context) {
                        return Container(
                          padding: const EdgeInsets.all(16.0),
                          height: screenHeight * 0.42,
                          decoration: const BoxDecoration(
                            color: AppColors.fondApp,
                            
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20.0)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Select an Action',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 10),
                              ListTile(
                                leading: const Icon(Icons.camera_alt,
                                    color: AppColors.iconsPrimary),
                                title: const Text('New Challenge',
                                    style: TextStyle(color: Colors.white)),
                                onTap: () {
                                  // Your action here
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: const Icon(Icons.card_giftcard,
                                    color: AppColors.iconsPrimary),
                                title: const Text('Rewards',
                                    style: TextStyle(color: Colors.white)),
                                onTap: () {
                                  // Your action here
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: const Icon(Icons.settings,
                                    color: AppColors.iconsPrimary),
                                title: const Text('Settings',
                                    style: TextStyle(color: Colors.white)),
                                onTap: () {
                                  // Your action here
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: const Icon(Icons.room_preferences,
                                    color: AppColors.iconsPrimary),
                                title: const Text('Preferences',
                                    style: TextStyle(color: Colors.white)),
                                onTap: () {
                                  // Your action here
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
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
        Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 2.0),
          child: InkResponse(
            splashColor: const Color.fromARGB(
                255, 255, 255, 255), // Couleur de l'effet d'ondulation (splash)
            radius:
                10.0, // Rayon de l'effet d'ondulation (utile si la forme est circulaire)
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
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4.0, top: 20),
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
