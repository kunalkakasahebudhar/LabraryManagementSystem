import 'package:flutter/material.dart';
import '../widgets/rule_category_section.dart';

class RulesScreen extends StatelessWidget {
  const RulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rules & Guidelines')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            RuleCategorySection(
              title: 'General Rules',
              rules: [
                'Maintain silence in the library premises.',
                'Mobile phones must be on silent mode.',
                'Eatables are not allowed inside the study hall.',
                'Keep your desk clean and organized.',
              ],
            ),
            SizedBox(height: 32),
            RuleCategorySection(
              title: 'Seat & Locker',
              rules: [
                'Do not change your assigned seat without permission.',
                'Lockers must be renewed before expiry date.',
                'Library is not responsible for valuables kept in lockers.',
              ],
            ),
          ],
        ),
      ),
    );
  }
}
