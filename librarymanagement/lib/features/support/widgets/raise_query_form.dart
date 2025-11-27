import 'package:flutter/material.dart';
import '../../../core/widgets/app_text_field.dart';
import '../../../core/widgets/primary_button.dart';

class RaiseQueryForm extends StatefulWidget {
  const RaiseQueryForm({super.key});

  @override
  State<RaiseQueryForm> createState() => _RaiseQueryFormState();
}

class _RaiseQueryFormState extends State<RaiseQueryForm> {
  final _messageController = TextEditingController();
  String _selectedIssue = 'Fees Issue';
  final List<String> _issues = [
    'Fees Issue',
    'Seat Issue',
    'Timing Issue',
    'Others',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonFormField<String>(
          value: _selectedIssue,
          items: _issues.map((issue) {
            return DropdownMenuItem(value: issue, child: Text(issue));
          }).toList(),
          onChanged: (value) {
            setState(() => _selectedIssue = value!);
          },
          decoration: InputDecoration(
            labelText: 'Issue Type',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
        const SizedBox(height: 16),
        AppTextField(
          label: 'Message',
          controller: _messageController,
          maxLines: 4,
          hint: 'Describe your issue...',
        ),
        const SizedBox(height: 24),
        PrimaryButton(
          text: 'Submit Query',
          onPressed: () {
            // Submit logic
          },
        ),
      ],
    );
  }
}
