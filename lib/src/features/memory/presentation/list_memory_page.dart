import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:memoryapp/src/constants/app_colors.dart';
import 'package:memoryapp/src/features/memory/application/providers/memo_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListMemoryPage extends ConsumerWidget {
  const ListMemoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final challengeList = ref.watch(memoListProvider);
    //! TODO Mettre en place le booléen qui affichera une tuile 
    //! différente lorsque l'on peut deviner ou non
    //final guessState = ref.watch(memoControllerProvider);
    print('Les datas : ${challengeList.toString()}');
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
            child: Text(
              'MY LIST',
              style:
                  GoogleFonts.koulen(color: AppColors.colorTxt, fontSize: 32),
                  
            ),
          ),
          Expanded(
              child: challengeList.when(
            data: (data) => ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  print('Item $index: ${data[index]} + ${data.length}');
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: ListTile(
                      title: Text(data[index].nameRandom, style: GoogleFonts.koulen(
                    color: AppColors.colorTxt,
                    fontSize: 25,
                  ),),
                      onTap: () {

                        print('${challengeList}');
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
