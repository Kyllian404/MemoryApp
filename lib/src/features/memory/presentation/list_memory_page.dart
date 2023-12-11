import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:memoryapp/src/constants/app_colors.dart';

class ListMemoryPage extends StatefulWidget {
  const ListMemoryPage({super.key});

  @override
  State<ListMemoryPage> createState() => _ListMemoryPageState();
}

class _ListMemoryPageState extends State<ListMemoryPage> {
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
            child: Text(
              'MY LIST',
              style:
                  GoogleFonts.koulen(color: AppColors.colorTxt, fontSize: 32),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Hero(
                tag: 'ListTile-Hero',
                child: Material(
                  child: ListTile(
                    title: const Text('Random 1'),
                    subtitle: const Text('You can guess'),
                    tileColor: AppColors.iconsPrimary,
                    onTap: () {
                      print('Bonjour !');
                    },
                  ),
                ),
              ),
              Hero(
                tag: 'ListTile-Hero',
                child: Material(
                  child: ListTile(
                    title: const Text('Random 2'),
                    subtitle: const Text('Guess in :'),
                    tileColor: AppColors.iconsPrimary,
                    onTap: () {
                      print('Bonjour !');
                    },
                  ),
                ),
              ),
              Hero(
                tag: 'ListTile-Hero',
                child: Material(
                  child: ListTile(
                    title: const Text('Random 2'),
                    subtitle: const Text('Guess in :'),
                    tileColor: AppColors.iconsPrimary,
                    onTap: () {
                      print('Bonjour !');
                    },
                  ),
                ),
              ),
              Hero(
                tag: 'ListTile-Hero',
                child: Material(
                  child: ListTile(
                    title: const Text('Random 2'),
                    subtitle: const Text('Guess in :'),
                    tileColor: AppColors.iconsPrimary,
                    onTap: () {
                      print('Bonjour !');
                    },
                  ),
                ),
              ),
              Hero(
                tag: 'ListTile-Hero',
                child: Material(
                  child: ListTile(
                    title: const Text('Random 2'),
                    subtitle: const Text('Guess in :'),
                    tileColor: AppColors.iconsPrimary,
                    onTap: () {
                      print('Bonjour !');
                    },
                  ),
                ),
              ),
              Hero(
                tag: 'ListTile-Hero',
                child: Material(
                  child: ListTile(
                    title: const Text('Random 2'),
                    subtitle: const Text('Guess in :'),
                    tileColor: AppColors.iconsPrimary,
                    onTap: () {
                      print('Bonjour !');
                    },
                  ),
                ),
              ),
              Hero(
                tag: 'ListTile-Hero',
                child: Material(
                  child: ListTile(
                    title: const Text('Random 2'),
                    subtitle: const Text('Guess in :'),
                    tileColor: AppColors.iconsPrimary,
                    onTap: () {
                      print('Bonjour !');
                    },
                  ),
                ),
              ),
              Hero(
                tag: 'ListTile-Hero',
                child: Material(
                  child: ListTile(
                    title: const Text('Random 2'),
                    subtitle: const Text('Guess in :'),
                    tileColor: AppColors.iconsPrimary,
                    onTap: () {
                      print('Bonjour !');
                    },
                  ),
                ),
              ),
              Hero(
                tag: 'ListTile-Hero',
                child: Material(
                  child: ListTile(
                    title: const Text('Random 2'),
                    subtitle: const Text('Guess in :'),
                    tileColor: AppColors.iconsPrimary,
                    onTap: () {
                      print('Bonjour !');
                    },
                  ),
                ),
              ),
              Hero(
                tag: 'ListTile-Hero',
                child: Material(
                  child: ListTile(
                    title: const Text('Random 2'),
                    subtitle: const Text('Guess in :'),
                    tileColor: AppColors.iconsPrimary,
                    onTap: () {
                      print('Bonjour !');
                    },
                  ),
                ),
              ),
              Hero(
                tag: 'ListTile-Hero',
                child: Material(
                  child: ListTile(
                    title: const Text('Random 2'),
                    subtitle: const Text('Guess in :'),
                    tileColor: AppColors.iconsPrimary,
                    onTap: () {
                      print('Bonjour !');
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}