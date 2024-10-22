import 'package:flutter/material.dart';

void main() {
  runApp(HelpApp());
}

class HelpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Help',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HelpScreen(),
    );
  }
}

class HelpScreen extends StatelessWidget {
  final List<FAQ> faqs = [
    FAQ(
      question: "How do I reset my password?",
      answer: "To reset your password, go to the login page and click on 'Forgot Password'.",
    ),
    FAQ(
      question: "How do I contact support?",
      answer: "You can contact support via email at support@example.com or call us at +1 234 567 890.",
    ),
    FAQ(
      question: "Where can I find the terms and conditions?",
      answer: "You can find the terms and conditions in the app settings or on our website.",
    ),
    // Add more FAQs as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // FAQs Section
            Text(
              'Frequently Asked Questions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: faqs.length,
                itemBuilder: (context, index) {
                  final faq = faqs[index];
                  return Card(
                    elevation: 2,
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      title: Text(faq.question),
                      subtitle: Text(faq.answer),
                    ),
                  );
                },
              ),
            ),

            // Contact Options
            Text(
              'Contact Support:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text('Email: support@example.com'),
              onTap: () {
                // Logic to send an email
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Emailing support@example.com')),
                );
              },
            ),
            ListTile(
              title: Text('Phone: +1 234 567 890'),
              onTap: () {
                // Logic to call the support number
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Calling +1 234 567 890')),
                );
              },
            ),

            // Submit Ticket Button
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Logic to submit a support ticket
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Support ticket submitted')),
                );
              },
              child: Text('Submit Ticket'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50), // Full-width button
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FAQ {
  final String question;
  final String answer;

  FAQ({
    required this.question,
    required this.answer,
  });
}
