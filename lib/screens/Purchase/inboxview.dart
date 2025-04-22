import 'package:flutter/material.dart';

class InboxView extends StatelessWidget {
  final Color primaryBlue = const Color(0xFF1A73E8);
  final Color lightGray = const Color(0xFFF2F2F2);
  final Color green = const Color(0xFF4CAF50);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryBlue,
        title: const Text('Indent #10 - Projector'),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _stepTile('Head Approval', Icons.check_circle, Colors.green),
            _stepTile('Director Approval', Icons.check_circle, Colors.green),
            _stepTile('Bill Approval', Icons.hourglass_bottom, Colors.orange),
            const SizedBox(height: 20),

            const Text('Description', style: TextStyle(fontWeight: FontWeight.bold)),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(top: 8, bottom: 16),
              decoration: BoxDecoration(
                color: lightGray,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text('Computer', style: TextStyle(fontSize: 16)),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(onPressed: () {}, child: const Text('Note Sheets')),
                OutlinedButton(onPressed: () {}, child: const Text('Attachments')),
              ],
            ),

            const Divider(height: 30),

            const Text('Created by: atul-professor'),
            const Text('FILE ID: CSE-2024-02-4741'),
            const SizedBox(height: 20),

            const Text('INDENT DETAILS', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 10),

            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: lightGray,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const Expanded(child: Text('Computer')),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: primaryBlue,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Text('QTY: 1', style: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(width: 12),
                  const Text('₹4,525', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: green,
                    ),
                    child: const Text('Stock Entry'),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
            const Text('Forward Indent', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 10),

            _buildTextField('Remarks', maxLines: 3),
            const SizedBox(height: 10),
            _buildTextField('Forward To'),
            const SizedBox(height: 10),
            _buildTextField('Receiver Designation'),

            const SizedBox(height: 10),
            const Text('Attachments', style: TextStyle(fontWeight: FontWeight.bold)),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Upload Files'),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryBlue,
                  ),
                  child: const Text('Submit'),
                ),
                const SizedBox(width: 10),
                OutlinedButton(onPressed: () {}, child: const Text('Archive Indent')),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _stepTile(String title, IconData icon, Color color) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
    );
  }

  Widget _buildTextField(String label, {int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: const Color(0xFFF9F9F9),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
