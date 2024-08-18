// ignore_for_file: use_build_context_synchronously

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
      body: Center(
        child: Column(
          children: [
            //* Titre page
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Container(
                width: 340,
                height: 45,
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
                    fontFamily:
                        'Roboto', // Remplace par une autre police si souhaité
                    fontSize: 32, // Taille de la police
                    fontWeight: FontWeight.normal, // Epaisseur du texte
                    color: Colors.white, // Couleur du texte
                    letterSpacing: 2, // Espacement des lettres
                    wordSpacing: 3, // Espacement des mots
                  ),
                ),
              ),
            ),
            //* Zone Daily challenge
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Container(
                width: 340,
                height: 180,
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
                    fontFamily:
                        'Roboto', // Remplace par une autre police si souhaité
                    fontSize: 28, // Taille de la police
                    fontWeight: FontWeight.normal, // Epaisseur du texte
                    color: Colors.white, // Couleur du texte
                    letterSpacing: 2, // Espacement des lettres
                    wordSpacing: 3, // Espacement des mots
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 38.0),
              child: Column(
                children: [
                  Row(
                    //* Time Challenge List
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: InkResponse(
                          onTap: () {
                            // Action à exécuter lors du tapotement
                            print("Time Challenge List");
                          },
                          containedInkWell:
                              true, // Assure que l'ondulation reste contenue dans les limites du widget enfant
                          highlightShape: BoxShape
                              .rectangle, // Forme de l'effet d'ondulation, ici un rectangle
                          highlightColor: Colors.black87.withOpacity(
                              1), // Couleur de surbrillance lors de l'interaction
                          splashColor: Colors.pink.withOpacity(
                              1), // Couleur de l'effet d'ondulation (splash)
                          radius:
                              2.0, // Rayon de l'effet d'ondulation (utile si la forme est circulaire)
                          borderRadius: BorderRadius.circular(
                              15), // Coin arrondis pour l'ondulation
                          enableFeedback:
                              true, // Active le retour haptique ou sonore, selon la plateforme
                          onTapCancel: () {
                            // Action à exécuter si l'utilisateur annule le tapotement
                          },
                          onTapDown: (TapDownDetails details) {
                            // Action à exécuter lorsque l'utilisateur commence à tapoter
                          },
                          onTapUp: (TapUpDetails details) {
                            // Action à exécuter lorsque l'utilisateur relâche le tapotement
                          },
                          child: Container(
                            width: 68,
                            height: 68,
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
                            child: const Center(
                              child: Icon(
                                Icons.list_rounded,
                                color: AppColors.iconsPrimary,
                                size: 68,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 15.0, left: 5.0),
                        child: Text(
                          'Time Challenge List',
                          style: TextStyle(
                            fontFamily:
                                'Roboto', // Remplace par une autre police si souhaité
                            fontSize: 24, // Taille de la police
                            fontWeight: FontWeight.normal, // Epaisseur du texte
                            color: AppColors.iconsPrimary, // Couleur du texte
                            letterSpacing: 2, // Espacement des lettres
                            wordSpacing: 3, // Espacement des mots
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    //* Match Mania
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: InkResponse(
                          onTap: () {
                            // Action à exécuter lors du tapotement
                            print("Match Mania");
                          },
                          containedInkWell:
                              true, // Assure que l'ondulation reste contenue dans les limites du widget enfant
                          highlightShape: BoxShape
                              .rectangle, // Forme de l'effet d'ondulation, ici un rectangle
                          highlightColor: Colors.black87.withOpacity(
                              1), // Couleur de surbrillance lors de l'interaction
                          splashColor: Colors.pink.withOpacity(
                              1), // Couleur de l'effet d'ondulation (splash)
                          radius:
                              2.0, // Rayon de l'effet d'ondulation (utile si la forme est circulaire)
                          borderRadius: BorderRadius.circular(
                              15), // Coin arrondis pour l'ondulation
                          enableFeedback:
                              true, // Active le retour haptique ou sonore, selon la plateforme
                          onTapCancel: () {
                            // Action à exécuter si l'utilisateur annule le tapotement
                          },
                          onTapDown: (TapDownDetails details) {
                            // Action à exécuter lorsque l'utilisateur commence à tapoter
                          },
                          onTapUp: (TapUpDetails details) {
                            // Action à exécuter lorsque l'utilisateur relâche le tapotement
                          },
                          child: Container(
                            width: 68,
                            height: 68,
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
                            child: const Center(
                              child: Icon(
                                Icons.autorenew_rounded,
                                color: AppColors.iconsPrimary,
                                size: 68,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 15.0, left: 5.0),
                        child: Text(
                          'Match Mania',
                          style: TextStyle(
                            fontFamily:
                                'Roboto', // Remplace par une autre police si souhaité
                            fontSize: 24, // Taille de la police
                            fontWeight: FontWeight.normal, // Epaisseur du texte
                            color: AppColors.iconsPrimary, // Couleur du texte
                            letterSpacing: 2, // Espacement des lettres
                            wordSpacing: 3, // Espacement des mots
                          ),
                          textAlign: TextAlign.center, // Alignement du texte
                        ),
                      ),
                    ],
                  ),
                  Row(
                    //* Sequence Master
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: InkResponse(
                          onTap: () {
                            // Action à exécuter lors du tapotement
                            print("Sequence Master");
                          },
                          containedInkWell:
                              true, // Assure que l'ondulation reste contenue dans les limites du widget enfant
                          highlightShape: BoxShape
                              .rectangle, // Forme de l'effet d'ondulation, ici un rectangle
                          highlightColor: Colors.black87.withOpacity(
                              1), // Couleur de surbrillance lors de l'interaction
                          splashColor: Colors.pink.withOpacity(
                              1), // Couleur de l'effet d'ondulation (splash)
                          radius:
                              2.0, // Rayon de l'effet d'ondulation (utile si la forme est circulaire)
                          borderRadius: BorderRadius.circular(
                              15), // Coin arrondis pour l'ondulation
                          enableFeedback:
                              true, // Active le retour haptique ou sonore, selon la plateforme
                          onTapCancel: () {
                            // Action à exécuter si l'utilisateur annule le tapotement
                          },
                          onTapDown: (TapDownDetails details) {
                            // Action à exécuter lorsque l'utilisateur commence à tapoter
                          },
                          onTapUp: (TapUpDetails details) {
                            // Action à exécuter lorsque l'utilisateur relâche le tapotement
                          },
                          child: Container(
                            width: 68,
                            height: 68,
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
                            child: const Center(
                              child: Icon(
                                Icons.calendar_view_month_rounded,
                                color: AppColors.iconsPrimary,
                                size: 68,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 15.0, left: 5.0),
                        child: Text(
                          'Sequence Master',
                          style: TextStyle(
                            fontFamily:
                                'Roboto', // Remplace par une autre police si souhaité
                            fontSize: 24, // Taille de la police
                            fontWeight: FontWeight.normal, // Epaisseur du texte
                            color: AppColors.iconsPrimary, // Couleur du texte
                            letterSpacing: 2, // Espacement des lettres
                            wordSpacing: 3, // Espacement des mots
                          ),
                          textAlign: TextAlign.center, // Alignement du texte
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        //* Home
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkResponse(
              onTap: () {
                // Action à exécuter lors du tapotement
                print("You are ready on Home");
              },
              containedInkWell:
                  true, // Assure que l'ondulation reste contenue dans les limites du widget enfant
              highlightShape: BoxShape
                  .rectangle, // Forme de l'effet d'ondulation, ici un rectangle
              highlightColor: Colors.black87.withOpacity(
                  1), // Couleur de surbrillance lors de l'interaction
              splashColor: Colors.pink
                  .withOpacity(1), // Couleur de l'effet d'ondulation (splash)
              radius:
                  2.0, // Rayon de l'effet d'ondulation (utile si la forme est circulaire)
              borderRadius:
                  BorderRadius.circular(15), // Coin arrondis pour l'ondulation
              enableFeedback:
                  true, // Active le retour haptique ou sonore, selon la plateforme
              onTapCancel: () {
                // Action à exécuter si l'utilisateur annule le tapotement
              },
              onTapDown: (TapDownDetails details) {
                // Action à exécuter lorsque l'utilisateur commence à tapoter
              },
              onTapUp: (TapUpDetails details) {
                // Action à exécuter lorsque l'utilisateur relâche le tapotement
              },
              child: Container(
                width: 68,
                height: 68,
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
                child: const Center(
                  child: Icon(
                    Icons.home_filled,
                    color: AppColors.iconsPrimary,
                    size: 48,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkResponse(
              onTap: () {
                // Action à exécuter lors du tapotement
                print("You are ready on Home");
              },
              containedInkWell:
                  true, // Assure que l'ondulation reste contenue dans les limites du widget enfant
              highlightShape: BoxShape
                  .rectangle, // Forme de l'effet d'ondulation, ici un rectangle
              highlightColor: Colors.black87.withOpacity(
                  1), // Couleur de surbrillance lors de l'interaction
              splashColor: Colors.pink
                  .withOpacity(1), // Couleur de l'effet d'ondulation (splash)
              radius:
                  2.0, // Rayon de l'effet d'ondulation (utile si la forme est circulaire)
              borderRadius:
                  BorderRadius.circular(15), // Coin arrondis pour l'ondulation
              enableFeedback:
                  true, // Active le retour haptique ou sonore, selon la plateforme
              onTapCancel: () {
                // Action à exécuter si l'utilisateur annule le tapotement
              },
              onTapDown: (TapDownDetails details) {
                // Action à exécuter lorsque l'utilisateur commence à tapoter
              },
              onTapUp: (TapUpDetails details) {
                // Action à exécuter lorsque l'utilisateur relâche le tapotement
              },
              child: Container(
                width: 68,
                height: 68,
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
                child: const Center(
                  child: Icon(
                    Icons.add,
                    color: AppColors.iconsPrimary,
                    size: 65,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkResponse(
              onTap: () {
                // Action à exécuter lors du tapotement
                print("You are ready on Home");
              },
              containedInkWell:
                  true, // Assure que l'ondulation reste contenue dans les limites du widget enfant
              highlightShape: BoxShape
                  .rectangle, // Forme de l'effet d'ondulation, ici un rectangle
              highlightColor: Colors.black87.withOpacity(
                  1), // Couleur de surbrillance lors de l'interaction
              splashColor: Colors.pink
                  .withOpacity(1), // Couleur de l'effet d'ondulation (splash)
              radius:
                  2.0, // Rayon de l'effet d'ondulation (utile si la forme est circulaire)
              borderRadius:
                  BorderRadius.circular(15), // Coin arrondis pour l'ondulation
              enableFeedback:
                  true, // Active le retour haptique ou sonore, selon la plateforme
              onTapCancel: () {
                // Action à exécuter si l'utilisateur annule le tapotement
              },
              onTapDown: (TapDownDetails details) {
                // Action à exécuter lorsque l'utilisateur commence à tapoter
              },
              onTapUp: (TapUpDetails details) {
                // Action à exécuter lorsque l'utilisateur relâche le tapotement
              },
              child: Container(
                width: 68,
                height: 68,
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
                child: const Center(
                  child: Icon(
                    Icons.person_rounded,
                    color: AppColors.iconsPrimary,
                    size: 48,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
