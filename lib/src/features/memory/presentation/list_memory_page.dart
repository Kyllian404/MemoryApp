import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:memoryapp/src/constants/app_colors.dart';
import 'package:memoryapp/src/features/memory/application/providers/memo_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memoryapp/src/features/memory/presentation/components/guessing_modal.dart';
import 'package:memoryapp/src/features/memory/presentation/controllers/memory_controller.dart';

class ListMemoryPage extends ConsumerWidget {
  const ListMemoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final challengeList = ref.watch(memoListProvider);
    final controller = ref.read(memoControllerProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: AppColors.fondApp,
        title: Text(
          "M3M0RY",
          style: GoogleFonts.roboto(
              color: AppColors.colorTxt,
              fontWeight: FontWeight.bold,
              fontSize: 50),
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                controller.cleanChallenge();
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Your list has been deleted.')));
              },
              icon: const Icon(Icons.settings))
        ],
        centerTitle: true,
      ),
      backgroundColor: AppColors.fondApp,
      body: Column(
        children: [
          Center(
            child: Text(
              'MY LIST',
              style:
                  GoogleFonts.koulen(color: AppColors.colorTxt, fontSize: 32),
            ),
          ),
          Expanded(
              child: challengeList.when(
            data: (data) => ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  DateTime? time = data[index].datetime;
                  final bool isPast = time!.isBefore(DateTime.now());
                  // Construction de la chaîne de format manuellement
                  String formattedTime =
                      '${time.day.toString().padLeft(2, '0')}-'
                      '${time.month.toString().padLeft(2, '0')}-'
                      '${time.year.toString().substring(2)} | '
                      '${time.hour.toString().padLeft(2, '0')}:'
                      '${time.minute.toString().padLeft(2, '0')}';

                  return Padding(
                    padding: const EdgeInsets.only(top: .0),
                    child: ListTile(
                      title: Container(
                        decoration: isPast
                            ? BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.center,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    AppColors.fondBtnOk,
                                    AppColors.fondBtnOk
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(10),
                              )
                            : BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.center,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    AppColors.iconsPrimary,
                                    AppColors.iconsSecondary
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                        height: 70,
                        child: Column(
                          children: [
                            Text(
                              "Challenge ${index + 1}",
                              style: GoogleFonts.quicksand(
                                  color: AppColors.colorTxt,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              isPast
                                  ? "You can guess"
                                  : "Guess in : $formattedTime",
                              style: GoogleFonts.quicksand(
                                  color: AppColors.colorTxt,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        if (isPast) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => GuessingModal(
                              parentContext: context,
                              callback: (BuildContext context) {
                              },
                              wordUser: data[index]
                                  .textUser, 
                              idItemList:
                                  index, 
                            ),
                          );
                        }
                      },
                    ),
                  );
                }),
            error: (Object error, StackTrace stackTrace) => Center(
              child: SelectableText(error.toString()),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          )),
        ],
      ),
    );
  }
}
