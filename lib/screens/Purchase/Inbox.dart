import 'package:flutter/material.dart';
import 'inboxview.dart'; // Make sure the file is named inboxview.dart and is in the same folder

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inbox"),
        backgroundColor: const Color(0xFF1A73E8),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 3, // Replace with actual message count
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFE6FAFB),
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(2, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _infoRow("File Id", "10"),
                _infoRow("Indent Item", "Projector"),
                _infoRow("Date", "15-02-2025"),
                const SizedBox(height: 8),
                const Text(
                  "Click 'View' to see the full message.",
                  style: TextStyle(
                    color: Colors.grey,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _actionButton("View", Colors.blue, Colors.white, context),
                    const SizedBox(width: 12),
                    _actionButton("Delete", Colors.red, Colors.white, context),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 15, color: Colors.black),
          children: [
            TextSpan(
              text: "$label: ",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }

  Widget _actionButton(String label, Color bgColor, Color textColor, BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (label == "View") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => InboxView()), // ✅ Corrected class name
          );
        } else if (label == "Delete") {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Delete action triggered")),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: textColor,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 2,
      ),
      child: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
