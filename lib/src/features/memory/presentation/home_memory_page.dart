import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:memoryapp/src/constants/app_colors.dart';
import 'package:memoryapp/src/features/memory/domain/home_icon_data.dart';
import 'package:memoryapp/src/features/memory/domain/item_random.dart';
import 'package:memoryapp/src/features/memory/presentation/components/memory_modal.dart';
import 'package:memoryapp/src/features/memory/presentation/list_memory_page.dart';

class HomeMemoryPage extends StatefulWidget {
  const HomeMemoryPage({super.key});

  @override
  State<HomeMemoryPage> createState() => _HomeMemoryPageState();
}

class _HomeMemoryPageState extends State<HomeMemoryPage> {
  //final controller = ref.read(memoControllerProvider.notifier);

  late DateTime _pickedDateTime;
  //* Liste des défis
  List<ItemRandom> defis = [];

  //* Liste des icones
  final List<HomeIconData> iconsData = [
    HomeIconData(
      color1: AppColors.iconsPrimary,
      color2: AppColors.iconsSecondary,
      icon: Icons.format_list_bulleted_rounded,
      onTap: () {
        print('List icon tapped!');
      },
    ),
    // Ajoutez d'autres données d'icônes ici
  ];

  //* Time et Date Picker
  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime now = DateTime.now();
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year, now.month, now.day),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && context.mounted) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: now.hour, minute: now.minute),
      );

      if (pickedTime != null) {
        final DateTime pickedDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );

        final Duration difference = pickedDateTime.difference(now);

        if (difference.inMinutes < 5) {
          // Afficher un message si la durée est inférieure à 5 minutes
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('La durée doit être supérieure à 5 minutes.'),
            ),
          );
          return;
        }

        setState(() {
          _pickedDateTime = pickedDateTime;
        });

        // Utilisez _pickedDateTime comme vous le souhaitez
        print('Date et heure choisies: $_pickedDateTime');
        print('Durée jusqu\'à la date choisie: $difference');
        // * Appel de la modale personnalisée
        _showCustomDialog(context);
      }
    }
  }

  void _showCustomDialog(BuildContext parentContext) {
    showDialog(
      context: parentContext,
      builder: (BuildContext context) {
        return MemoryModal(
          parentContext: parentContext,
          callback: _selectDateTime,
          datePickerUser: _pickedDateTime,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.fondApp,
        title: Text(
          "M3M0RY",
          style: GoogleFonts.roboto(
              color: AppColors.colorTxt,
              fontWeight: FontWeight.bold,
              fontSize: 50),
        ),
        centerTitle: true,
      ),
      backgroundColor: AppColors.fondApp,
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  backgroundColor: AppColors.fondBtn,
                  shadowColor: AppColors.colorShade,
                  elevation: 2,
                  textStyle: const TextStyle(
                    color: AppColors.colorTxt,
                  ),
                ),
                onPressed: () => _selectDateTime(context),
                child: Text(
                  'START MEMORISING',
                  style: GoogleFonts.koulen(
                    color: AppColors.colorTxt,
                    fontSize: 32,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              child: GridView.builder(
            padding: const EdgeInsets.all(8.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            physics: const ClampingScrollPhysics(),
            itemCount: iconsData.length,
            itemBuilder: (BuildContext context, int index) {
              var iconInfo = iconsData[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ListMemoryPage()),
                  );
                },
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: AlignmentDirectional.bottomCenter,
                        colors: [
                          iconInfo.color1,
                          iconInfo.color2,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 80,
                    width: 80,
                    child: Icon(
                      iconInfo.icon,
                      size: 60.0,
                    ),
                  ),
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
