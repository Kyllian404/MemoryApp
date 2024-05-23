import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:memoryapp/src/constants/app_colors.dart';
import 'package:memoryapp/src/features/memory/presentation/controllers/memory_controller.dart';
import 'package:memoryapp/src/utils/async_value_ui.dart';

class MemoryModal extends ConsumerStatefulWidget {
  const MemoryModal(
      {super.key,
      required this.parentContext,
      required this.callback,
      required this.datePickerUser});
  final BuildContext parentContext;
  final void Function(BuildContext) callback;
  final DateTime datePickerUser;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MemoryModalState();
}

class _MemoryModalState extends ConsumerState<MemoryModal> {
  int _currentStep = 0;
  final _wordController = TextEditingController();

  int remainingTime = 30; 
  Timer? countdownTimer;

  @override
  void initState() {
    super.initState();
    
  }

  void startCountdown() {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime > 0) {
        setState(() {
          remainingTime--;
        });
      } else {
        timer.cancel();
        onCountdownFinished(ref);
      }
    });
  }

  void onCountdownFinished(WidgetRef ref) {
    final controller = ref.read(memoControllerProvider.notifier);
    controller.setMemo(widget.datePickerUser, _wordController.text);
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    countdownTimer?.cancel();
    // ... vos autres nettoyages ...
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final controller = ref.read(memoControllerProvider.notifier);
      final state = ref.watch(memoControllerProvider);

      ref.listen(
        memoControllerProvider,
        (_, state) => state.showAlertDialogOnError(context),
      );


      // construire l'ui

      List<Widget> buildWordSelection() {
        return [
          Text(
            'Select',
            style: GoogleFonts.koulen(
              color: AppColors.colorTxt,
              fontSize: 32,
            ),
          ),
          ElevatedButton(
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
            onPressed: () {
              // Logique du bouton supplémentaire
            },
            child: Text(
              'a Random Word',
              style: GoogleFonts.koulen(
                color: AppColors.colorTxt,
                fontSize: 32,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(top: 5.0),
            child: Text(
              'Or',
              style: GoogleFonts.koulen(
                color: AppColors.colorTxt,
                fontSize: 32, 
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: AppColors.fondBtn,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black, width: 1.5),
              ),
              child: TextField(
                controller: _wordController,
                decoration: const InputDecoration(hintText: "Write your word here..."),
              ),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();

                  widget.callback(widget.parentContext);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0)),
                  backgroundColor: AppColors.fondBtnCancel,
                  shadowColor: AppColors.shadeBtnForm,
                  elevation: 2,
                ),
                child: Text(
                  'CANCEL',
                  style: GoogleFonts.koulen(
                    color: AppColors.colorTxt,
                    fontSize: 15,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() => _currentStep = 1);
                  startCountdown();
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0)),
                  backgroundColor: AppColors.fondBtnOk,
                  shadowColor: AppColors.shadeBtnForm,
                  elevation: 2,
                ),
                child: Text(
                  'OK',
                  style: GoogleFonts.koulen(
                    color: AppColors.colorTxt,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          )
        ];
      }

      List<Widget> buildShowWord() {
        return [
          Text(
            '$remainingTime s',
            style: GoogleFonts.koulen(
              color: Colors.red, 
              fontSize: 32,
            ),
          ),
          Text(
            'TO MEMORIZE',
            style: GoogleFonts.koulen(
              color: AppColors.colorTxt,
              fontSize: 32,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Container(
              padding: const EdgeInsets.all(5),
              width: 240, 
              decoration: BoxDecoration(
                color: AppColors.fondBtn, 
                borderRadius:
                    BorderRadius.circular(5), 
                border: Border.all(color: Colors.black, width: 1.5),
              ),
              child: Text(
                _wordController.text,
                style: GoogleFonts.koulen(
                  color: const Color(0xFFFFFFFF),
                  fontSize: 32,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  if (!state.isLoading) {
                    controller.setMemo(
                        widget.datePickerUser, _wordController.text);
                    Navigator.of(context).pop();
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  backgroundColor: AppColors.fondBtnOk,
                  shadowColor: AppColors.shadeBtnForm,
                  elevation: 2,
                  textStyle: const TextStyle(
                    color: AppColors.colorTxt,
                  ),
                ),
                child: Text(
                  'Already Finish ?',
                  style: GoogleFonts.koulen(
                    color: AppColors.colorTxt,
                    fontSize: 32,
                  ),
                ),
              ),
            ],
          )
        ];
      }


      List<Widget> buildDialogContent() {
        switch (_currentStep) {
          case 0:
            return buildWordSelection();
          case 1:
            return buildShowWord();

          default:
            return [const SizedBox()];
        }
      }

      return SimpleDialog(
        backgroundColor: AppColors.fondApp,
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width *
                0.9, // Largeur proportionnelle à l'écran,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: buildDialogContent(),
            ),
          )
        ],
      );
    });
  }
}
