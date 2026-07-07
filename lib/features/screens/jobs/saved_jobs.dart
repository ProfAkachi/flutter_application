import 'package:flutter/material.dart';
import 'package:career_connect_app/features/screens/jobs/job_listings.dart';
import 'package:career_connect_app/constant/theme/external_colors.dart';

class SavedJobsScreen extends StatelessWidget {
  final List<Job> savedJobs;
  final VoidCallback? onBrowseJobs;

  const SavedJobsScreen({super.key, required this.savedJobs, this.onBrowseJobs,});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ExternalColors.background,

      child: savedJobs.isEmpty
          ? _EmptySavedJobs(onBrowseJobs: onBrowseJobs)
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: savedJobs.length,
              itemBuilder: (context, index) {
                final job = savedJobs[index];

                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: _SavedJobCard(job: job),
                );
              },
            ),
    );
  }
}

class _SavedJobCard extends StatelessWidget {
  final Job job;

  const _SavedJobCard({required this.job});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 55,
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(Icons.work, color: Colors.blue, size: 28),
              ),

              const SizedBox(width: 15),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      job.title,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      job.company,
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),

              const Icon(Icons.bookmark, color: ExternalColors.jobCardColor),
            ],
          ),

          const SizedBox(height: 18),

          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                size: 18,
                color: Colors.grey,
              ),
              const SizedBox(width: 5),
              Text(job.location, style: const TextStyle(color: Colors.grey)),

              const Spacer(),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  job.salary,
                  style: const TextStyle(
                    color: ExternalColors.text,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: ExternalColors.jobCardColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: const Text("Apply Now"),
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptySavedJobs extends StatelessWidget {
  final VoidCallback? onBrowseJobs;

  const _EmptySavedJobs({
    this.onBrowseJobs,
    });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.bookmark_border_rounded,
              size: 90,
              color: Colors.grey.shade400,
            ),

            const SizedBox(height: 20),

            const Text(
              "No Saved Jobs",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Text(
              "Jobs you bookmark will appear here for easy access later.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade600, fontSize: 15),
            ),

            const SizedBox(height: 30),

            ElevatedButton.icon(
              onPressed: onBrowseJobs,
              icon: const Icon(Icons.search),
              label: const Text("Browse Jobs"),
              style: ElevatedButton.styleFrom(
                backgroundColor: ExternalColors.jobCardColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
