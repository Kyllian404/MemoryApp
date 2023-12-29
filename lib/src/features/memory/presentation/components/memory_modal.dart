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

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final controller = ref.read(memoControllerProvider.notifier);
      final state = ref.watch(memoControllerProvider);

      ref.listen(
        memoControllerProvider,
        (_, state) => state.showAlertDialogOnError(context),
      );

      print('${state.toString()}');

      // construire l'ui

      List<Widget> _buildWordSelection() {
        return [
          Text(
            'SELECT YOUR WORD',
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
              print('Random word press');
            },
            child: Text(
              'RANDOM',
              style: GoogleFonts.koulen(
                color: AppColors.colorTxt,
                fontSize: 32,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: AppColors.fondBtn,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black, width: 1.5),
              ),
              child: TextField(
                controller: _wordController,
                decoration: const InputDecoration(hintText: "Write here..."),
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
                  print(_wordController.text);
                  setState(() => _currentStep = 1);
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

      List<Widget> _buildShowWord() {
        return [
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
              width: 240, // Ajoutez du padding autour du texte
              decoration: BoxDecoration(
                color: AppColors.fondBtn, // Couleur de fond du rectangle
                borderRadius:
                    BorderRadius.circular(5), // Bord arrondi (optionnel)
                border: Border.all(color: Colors.black, width: 1.5),
                // Ajoutez d'autres décorations comme boxShadow, border, etc.
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
                    // Fermez la modal après le traitement
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

      @override
      void dispose() {
        // S'assurer de nettoyer le contrôleur quand le widget est supprimé
        _wordController.dispose();
        super.dispose();
      }

      List<Widget> _buildDialogContent() {
        switch (_currentStep) {
          case 0:
            return _buildWordSelection();
          case 1:
            return _buildShowWord();

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
              children: _buildDialogContent(),
            ),
          )
        ],
      );
    });
  }
}
