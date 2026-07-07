import 'package:flutter/material.dart';

class ApplicationHistoryScreen extends StatelessWidget {
  const ApplicationHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      child: ListView(
        padding: const EdgeInsets.all(12),
        children: const [
          ApplicationCard(
            company: "Google",
            role: "Flutter Developer",
            date: "Applied on 12 May 2026",
            status: "Under Review",
            statusColor: Colors.orange,
          ),

          ApplicationCard(
            company: "Microsoft",
            role: "Software Engineer",
            date: "Applied on 08 May 2026",
            status: "Interview Scheduled",
            statusColor: Colors.blue,
          ),

          ApplicationCard(
            company: "Spotify",
            role: "Mobile Developer",
            date: "Applied on 26 June 2026",
            status: "Pending",
            statusColor: Colors.grey,
          ),

          ApplicationCard(
            company: "Amazon",
            role: "Backend Developer",
            date: "Applied on 20 June 2026",
            status: "Rejected",
            statusColor: Colors.red,
          ),

          ApplicationCard(
            company: "Apple",
            role: "iOS Developer",
            date: "Applied on 20 May 2026",
            status: "Accepted",
            statusColor: Colors.green,
          ),
        ],
      ),
    );
  }
}

class ApplicationCard extends StatelessWidget {
  final String company;
  final String role;
  final String date;
  final String status;
  final Color statusColor;

  const ApplicationCard({
    super.key,
    required this.company,
    required this.role,
    required this.date,
    required this.status,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: Colors.blue.shade50,
              child: Text(
                company[0],
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    role,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    company,
                    style: const TextStyle(color: Colors.grey),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    date,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: statusColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                status,
                style: TextStyle(
                  color: statusColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}