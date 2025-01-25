// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class ReportSebenaArticleScreen extends StatefulWidget {
  const ReportSebenaArticleScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ReportSebenaArticleScreenState createState() =>
      _ReportSebenaArticleScreenState();
}

class _ReportSebenaArticleScreenState extends State<ReportSebenaArticleScreen> {
  final List<String> reportOptions = [
    'Hate Speech',
    'Fake Promotions',
    'Vulgar Content',
    'Spreading Hate',
    'Religious Issue',
  ];

  int? selectedOptionIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Report Sebena Article',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10,),
            const Text(
              'Why would you like to report this Article?',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 20),
            ...List.generate(reportOptions.length, (index) {
              return ListTile(
                leading: Checkbox(
                  value: selectedOptionIndex == index,
                  onChanged: (bool? value) {
                    setState(() {
                      selectedOptionIndex = value! ? index : null;
                    });
                  },
                  activeColor: Colors.blueAccent,
                  checkColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                title: Text(
                  reportOptions[index],
                  style: const TextStyle(color: Colors.white),
                ),
                contentPadding: EdgeInsets.zero,
              );
            }),
           
           const SizedBox(height: 320,),
            const Divider(height: 3,thickness: 1,),
            const SizedBox(height:30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    backgroundColor: Colors.grey[800],
                  ),
                  child: const Text('Cancel',
                      style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (selectedOptionIndex != null) {
                      final selectedReason =
                          reportOptions[selectedOptionIndex!];

                      print('Reported for: $selectedReason');
                    } else {
                      print('No option selected');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    backgroundColor: Colors.blueAccent,
                  ),
                  child: const Text('Report it',style: TextStyle(color: Colors.white),),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
