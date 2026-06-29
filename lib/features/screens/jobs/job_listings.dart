import 'package:career_connect_app/constant/theme/external_colors.dart';
import 'package:flutter/material.dart';

/* ---------------- MODEL ---------------- */

class Job {
  final String title;
  final String logo;
  final String company;
  final String location;
  final String salary;
  final String category;
  final Color color;

  Job({
    required this.title,
    required this.logo,
    required this.company,
    required this.location,
    required this.salary,
    required this.category,
    required this.color,
  });
}

/* ---------------- SCREEN ---------------- */

class JobsScreen extends StatefulWidget {
  final Set<Job> favoriteJobs;
  final Function(Job) onFavoriteToggle;

  const JobsScreen({
    super.key,
    required this.favoriteJobs,
    required this.onFavoriteToggle,
  });

  @override
  State<JobsScreen> createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
  final TextEditingController searchController = TextEditingController();

  String searchQuery = '';

  String selectedFilter = "All Jobs";

  List<Job> get filteredJobs {
    return jobs.where((job) {
      final matchesSearch =
          job.title.toLowerCase().contains(searchQuery.toLowerCase()) ||
          job.company.toLowerCase().contains(searchQuery.toLowerCase());

      final matchesFilter =
          selectedFilter == "All Jobs" ||
          job.category == selectedFilter ||
          (selectedFilter == "Remote" && job.location == "Remote");

      return matchesSearch && matchesFilter;
    }).toList();
  }

  int? selectedIndex;

  final List<Job> jobs = [
    Job(
      title: "Senior Flutter Developer",
      logo: "", // import from assets
      company: "TechFlow Inc.",
      location: "San Francisco",
      salary: "\$140k - \$180k",
      category: "Developer",
      color: ExternalColors.jobCardColor,
    ),
    Job(
      title: "Backend Engineer (Go)",
      logo: "", // import from assets
      company: "CloudScale Systems",
      location: "Austin, TX",
      salary: "\$150k - \$200k",
      category: "Developer",
      color: ExternalColors.jobCardColor,
    ),
    Job(
      title: "Product Designer",
      logo: "", // import from assets
      company: "DesignHub",
      location: "Remote",
      salary: "\$90k - \$120k",
      category: "Design",
      color: ExternalColors.jobCardColor,
    ),
    Job(
      title: "Mobile Engineer",
      logo: "", // import from assets
      company: "AppNova",
      location: "London",
      salary: "\$110k - \$150k",
      category: "Developer",
      color: Colors.white,
    ),
    Job(
      title: "Junior Flutter Developer",
      logo: "", // import from assets
      company: "TechFlow Inc.",
      location: "San Francisco",
      salary: "\$90k - \$100k",
      category: "Developer",
      color: ExternalColors.jobCardColor,
    ),
    Job(
      title: "Senior Python Developer",
      logo: "", // import from assets
      company: "Dart Inc.",
      location: "Lagos",
      salary: "\$250k - \$300k",
      category: "Developer",
      color: ExternalColors.jobCardColor,
    ),
    Job(
      title: "Data Scientist",
      logo: "", // import from assets
      company: "Cloud Inc.",
      location: "Remote",
      salary: "\$150k - \$200k",
      category: "Data Analyst",
      color: ExternalColors.jobCardColor,
    ),
    Job(
      title: "Cybersecurity Expert",
      logo: "", // import from assets
      company: "Cyberdime",
      location: "Abuja",
      salary: "\$70k - \$100k",
      category: "Cybersecurity Analyst",
      color: ExternalColors.jobCardColor,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        children: [
          const SizedBox(height: 16),

          _SearchBar(
            controller: searchController,
            onChanged: (value) {
              setState(() {
                searchQuery = value;
              });
            },
          ),

          const SizedBox(height: 16),

          _FilterChips(
            selectedFilter: selectedFilter,
            onFilterSelected: (filter) {
              setState(() {
                selectedFilter = filter;
              });
            },
          ),

          const SizedBox(height: 24),

          const _SectionHeader(title: "Recommended for you"),
          const SizedBox(height: 12),

          // _JobFeatured(job: jobs[0]),
          SizedBox(
            height: 220,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: jobs.take(3).map((job) {
                return Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: SizedBox(width: 400, child: _JobFeatured(job: job)),
                );
              }).toList(),
            ),
          ),

          const SizedBox(height: 20),
          const _SectionHeader(title: "Recent Postings"),
          const SizedBox(height: 12),

          ListView.builder(
            itemCount: filteredJobs.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = selectedIndex == index ? null : index;
                    });
                  },
                  child: _JobCard(
                    job: filteredJobs[index],
                    isSelected: selectedIndex == index,
                    isFavorite: widget.favoriteJobs.contains(
                      filteredJobs[index],
                    ),
                    onFavoriteTap: () {
                      setState(() {
                        widget.onFavoriteToggle(filteredJobs[index]);
                      });
                    },
                  ),
                ),
              );
            },
          ),

          const SizedBox(height: 80),
        ],
      ),
    );
  }
}

/*--------------Section Header--------------*/

class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const Text("View all", style: TextStyle(color: Colors.blue)),
      ],
    );
  }
}

/* ---------------- SEARCH ---------------- */

class _SearchBar extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const _SearchBar({required this.controller, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade300, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(Icons.search),
          hintText: "Search job titles or companies",
          border: InputBorder.none,
        ),
      ),
    );
  }
}

/* ---------------- CHIPS ---------------- */

class _FilterChips extends StatelessWidget {
  final String selectedFilter;
  final ValueChanged<String> onFilterSelected;

  const _FilterChips({
    required this.selectedFilter,
    required this.onFilterSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ChoiceChip(
            label: const Text("All Jobs"),
            selected: selectedFilter == "All Jobs",
            onSelected: (_) => onFilterSelected("All Jobs"),
          ),
          const SizedBox(width: 8),

          ChoiceChip(
            label: const Text("Remote"),
            selected: selectedFilter == "Remote",
            onSelected: (_) => onFilterSelected("Remote"),
          ),
          const SizedBox(width: 8),

          ChoiceChip(
            label: const Text("Full-time"),
            selected: selectedFilter == "Full-time",
            onSelected: (_) => onFilterSelected("Full-time"),
          ),
          const SizedBox(width: 8),

          ChoiceChip(
            label: const Text("Design"),
            selected: selectedFilter == "Design",
            onSelected: (_) => onFilterSelected("Design"),
          ),
          const SizedBox(width: 8),

          ChoiceChip(
            label: const Text("Data"),
            selected: selectedFilter == "Data",
            onSelected: (_) => onFilterSelected("Data"),
          ),
          const SizedBox(width: 8),

          ChoiceChip(
            label: const Text("Developer"),
            selected: selectedFilter == "Developer",
            onSelected: (_) => onFilterSelected("Developer"),
          ),
        ],
      ),
    );
  }
}


/* ---------------- FEATURED ---------------- */

class _JobFeatured extends StatelessWidget {
  final Job job;

  const _JobFeatured({required this.job});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: job.color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            job.title,
            style: TextStyle(
              color: job.color == Colors.white ? Colors.black : Colors.white,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "${job.company} • ${job.location}",
            style: TextStyle(
              color: job.color == Colors.white ? Colors.grey : Colors.white70,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(job.salary),
          ),
        ],
      ),
    );
  }
}

/* ---------------- CARD ---------------- */

class _JobCard extends StatelessWidget {
  final Job job;
  final bool isSelected;

  final bool isFavorite;
  final VoidCallback onFavoriteTap;

  const _JobCard({
    required this.job,
    required this.isSelected,
    required this.isFavorite,
    required this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isSelected ? const Color.fromARGB(217, 15, 31, 69) : const Color.fromARGB(255, 15, 31, 69),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isSelected ? const Color.fromARGB(217, 15, 31, 69) : const Color.fromARGB(255, 15, 31, 69),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: isSelected ? Colors.white70 : Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.work,
              color: isSelected ? Colors.white : Colors.grey,
              // size: 30
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  job.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isSelected ? Colors.white : Colors.white,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  "${job.company} • ${job.location}",
                  style: TextStyle(
                    color: isSelected ? Colors.white70 : Colors.white,
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Text(
              job.salary,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.white : Colors.white,
              ),
            ),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            style: const ButtonStyle(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            icon: Icon(isFavorite ? Icons.bookmark : Icons.bookmark_border, color: Colors.white70),
            onPressed: onFavoriteTap,
          ),
        ],
      ),
    );
  }
}
