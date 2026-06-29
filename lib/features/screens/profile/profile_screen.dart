import 'package:career_connect_app/constant/theme/external_colors.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const Color secondary = ExternalColors.jobCardColor;
  static const Color background = Color(0xFFF7F9FB);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: background,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            /// PROFILE HEADER
            Column(
              children: [
                Stack(
                  children: [
                    const CircleAvatar(
                      radius: 64,
                      backgroundImage: NetworkImage(
                        'https://lh3.googleusercontent.com/aida-public/AB6AXuAT4kA-m50pSbDNhe3UsU-XkcVv8iogwlsiPQLz1Bqfem1LrsBXzfSM2Zot-UkITg3cr2jGrFoiRxCRrfNoJE6Ae4PPgO_Zq5BGL5IxGTd48OsCLGdwiJ-iHf5nnUrvP9hYIwyGSqG3dGdrtq60aBpvF2xQDm8u_wC-f5YK3nwcSvHFM8yVS7CLwwfWlwWvjaA8EaQ1xpPhgf7R8L8InwAvS335NPQZo0f025_KbewFI2PRS21Nzbtmy7uO8I1Sq1KvSnaZu2W7kLKh',
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor: secondary,
                        child: const Icon(
                          Icons.photo_camera,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                const Text(
                  "Emeka Chukwu",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
                ),

                const SizedBox(height: 6),

                Text(
                  "Senior Product Designer",
                  style: TextStyle(color: Colors.grey.shade700, fontSize: 16),
                ),

                const SizedBox(height: 16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: secondary,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {},
                      child: const Text("Edit Profile"),
                    ),
                    const SizedBox(width: 12),
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.share),
                      label: const Text("Share"),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 24),

            /// ABOUT ME
            _glassCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Row(
                    children: [
                      Icon(Icons.person_4_outlined),
                      SizedBox(width: 8),
                      Text(
                        "About Me",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Passionate about creating human-centric digital experiences with 8+ years of experience in FinTech and E-commerce. I specialize in bridging the gap between business goals and user needs through data-driven design and rapid prototyping.",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            /// SKILLS + STATS
            LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth < 700) {
                  return Column(
                    children: [
                      _buildSkillsCard(),
                      const SizedBox(height: 12),
                      _buildStatsCard(),
                    ],
                  );
                }

                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _buildSkillsCard()),
                    const SizedBox(width: 12),
                    Expanded(child: _buildStatsCard()),
                  ],
                );
              },
            ),

            const SizedBox(height: 12),

            /// EXPERIENCE
            _glassCard(
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.work),
                      const SizedBox(width: 8),
                      const Text(
                        "Experience",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: const Text("Add New"),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  const ExperienceTile(
                    icon: Icons.corporate_fare,
                    title: "Senior Product Designer",
                    company: "Global Tech Solutions",
                    period: "Jan 2021 — Present",
                    description:
                        "Led the redesign of the enterprise dashboard resulting in a 25% increase in user retention.",
                  ),

                  Divider(),

                  const ExperienceTile(
                    icon: Icons.apartment,
                    title: "UX Designer",
                    company: "Creative Minds Inc.",
                    period: "May 2018 — Dec 2020",
                    description:
                        "Collaborated with cross-functional teams to deliver mobile apps for iOS and Android.",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillsCard() {
    return _glassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.psychology),
              SizedBox(width: 8),
              Text(
                "Core Skills",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(height: 12),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              SkillChip("Product Strategy"),
              SkillChip("Figma Expert"),
              SkillChip("Design Systems"),
              SkillChip("UI/UX Research"),
              SkillChip("Prototyping"),
              SkillChip("A/B Testing"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatsCard() {
    return _glassCard(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            StatItem(value: "12", title: "Applications"),
            StatItem(value: "84", title: "Profile Views"),
          ],
        ),
      ),
    );
  }

  static Widget _glassCard({required Widget child}) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(padding: const EdgeInsets.all(16), child: child),
    );
  }
}

class SkillChip extends StatelessWidget {
  final String label;

  const SkillChip(this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Chip(label: Text(label));
  }
}

class StatItem extends StatelessWidget {
  final String value;
  final String title;

  const StatItem({super.key, required this.value, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0051D5),
          ),
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}

class ExperienceTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String company;
  final String period;
  final String description;

  const ExperienceTile({
    super.key,
    required this.icon,
    required this.title,
    required this.company,
    required this.period,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(company, style: const TextStyle(color: Color(0xFF0051D5))),
              const SizedBox(height: 4),
              Text(
                period,
                style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
              ),
              const SizedBox(height: 8),
              Text(description),
            ],
          ),
        ),
      ],
    );
  }
}
