import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:memoryapp/src/constants/app_colors.dart';

class ListMemoryPage extends StatefulWidget {
  const ListMemoryPage({super.key});

  @override
  State<ListMemoryPage> createState() => _ListMemoryPageState();
}

class _ListMemoryPageState extends State<ListMemoryPage> {

  final List<String> memos = ["test1","test2","test3","test4","test5","test6","test7","test8"];

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
          Expanded(child: ListView.builder(
            itemCount: memos.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(memos[index]),
              );
            }))
        ],
      ),
    );
  }
}