import 'package:flutter/material.dart';
import '../../../core/widgets/section_header.dart';
import '../widgets/contact_info_card.dart';
import '../widgets/faq_tile.dart';
import '../widgets/raise_query_form.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Support & Help')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const ContactInfoCard(),
            const SizedBox(height: 32),
            const SectionHeader(title: 'Frequently Asked Questions'),
            const SizedBox(height: 16),
            const FaqTile(question: 'How to renew my plan?'),
            const SizedBox(height: 12),
            const FaqTile(question: 'What if I lose my ID card?'),
            const SizedBox(height: 32),
            const SectionHeader(title: 'Raise a Query'),
            const SizedBox(height: 16),
            const RaiseQueryForm(),
          ],
        ),
      ),
    );
  }
}
