import 'package:career_connect_app/constant/theme/external_colors.dart';
import 'package:flutter/material.dart';
import 'dart:math';

/*---------------------SignInScreen-------------------------*/
class SignInWidget extends StatefulWidget {
  final VoidCallback onSignUpTap;

  const SignInWidget({super.key, required this.onSignUpTap});

  @override
  State<SignInWidget> createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  bool obscurePassword = true;
  bool rememberMe = false;

  bool loading = false;

  Future<void> submit() async {
    setState(() => loading = true);

    await Future.delayed(const Duration(seconds: 2));

    setState(() => loading = false);

    if (context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Sign in successful!")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Container(
          width: 420,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: ExternalColors.background,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header
              const SizedBox(height: 12),
              const Text(
                "Welcome Back",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              const Text("Access your professional path"),

              const SizedBox(height: 24),

              // Email
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "Work Email",
                  labelStyle: TextStyle(fontSize: 15.0),
                  // prefixIcon: Icon(Icons.mail, size: 18),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Password
              TextField(
                obscureText: obscurePassword,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(fontSize: 15.0),
                  // prefixIcon: const Icon(Icons.lock, size: 18),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      size: 18,
                      obscurePassword ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // Remember Me
              Row(
                children: [
                  Checkbox(
                    value: rememberMe,
                    onChanged: (val) {
                      setState(() {
                        rememberMe = val ?? false;
                      });
                    },
                  ),
                  const Text("Stay signed in for 30 days"),
                ],
              ),

              const SizedBox(height: 10),

              // Sign In Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        ExternalColors.jobCardColor, // Your desired color
                  ),
                  onPressed: loading ? null : submit,
                  child: loading
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text(
                          "Sign In",
                          style: TextStyle(
                            color: ExternalColors.background,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                ),
              ),

              const SizedBox(height: 20),

              const Text("Or continue with"),

              const SizedBox(height: 12),

              // Social buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.g_mobiledata, size: 23),
                      label: const Text("Google"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.apple, size: 18),
                      label: const Text("Apple"),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Footer
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: widget.onSignUpTap,
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Text(" Sign up", style: TextStyle(color: ExternalColors.jobCardColor, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*----------------------------SignUp-------------------------*/

class SignupWidget extends StatefulWidget {
  final VoidCallback onSignInTap;
  const SignupWidget({super.key, required this.onSignInTap});

  @override
  State<SignupWidget> createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  bool obscurePassword = true;
  bool agreed = false;
  String category = "";

  bool loading = false;

  Future<void> submit() async {
    setState(() => loading = true);

    await Future.delayed(const Duration(seconds: 2));

    setState(() => loading = false);

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Account created successfully!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Container(
          width: 420,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: ExternalColors.background,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              const SizedBox(height: 20),

              const Align(
                alignment: Alignment.center,
                child: Text(
                  "Create Account",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 10),

              // Full Name
              TextField(
                decoration: const InputDecoration(
                  labelText: "Full Name",
                  labelStyle: TextStyle(fontSize: 15.0),
                  // prefixIcon: Icon(Icons.person, size: 18),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Email
              TextField(
                keyboardType: TextInputType.emailAddress,

                decoration: const InputDecoration(
                  labelText: "Email Address",
                  labelStyle: TextStyle(fontSize: 15.0),
                  // prefixIcon: Icon(Icons.mail, size: 18,),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Password
              TextField(
                obscureText: obscurePassword,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(fontSize: 15.0),
                  // prefixIcon: const Icon(Icons.lock, size: 18),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      size: 18,
                      obscurePassword ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Category
              DropdownButtonFormField<String>(
                value: category.isEmpty ? null : category,
                items: const [
                  DropdownMenuItem(
                    value: "tech",
                    child: Text("Technology & Engineering"),
                  ),
                  DropdownMenuItem(
                    value: "design",
                    child: Text("Design & Creative"),
                  ),
                  DropdownMenuItem(
                    value: "marketing",
                    child: Text("Marketing & Sales"),
                  ),
                  DropdownMenuItem(
                    value: "finance",
                    child: Text("Finance & Accounting"),
                  ),
                  DropdownMenuItem(
                    value: "healthcare",
                    child: Text("Healthcare"),
                  ),
                ],
                onChanged: (val) {
                  setState(() => category = val ?? "");
                },
                decoration: const InputDecoration(
                  // prefixIcon: Icon(Icons.category_outlined, size: 18),
                  labelText: "Desired Job Category",
                  labelStyle: TextStyle(fontSize: 15.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              Row(
                children: [
                  Checkbox(
                    value: agreed,
                    onChanged: (val) {
                      setState(() => agreed = val ?? false);
                    },
                  ),
                  const Expanded(
                    child: Text(
                      "I agree to Terms of Service and Privacy Policy",
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              SizedBox(
                width: double.infinity,

                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        ExternalColors.jobCardColor, // Your desired color
                  ),

                  onPressed: loading ? null : submit,
                  child: loading
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text(
                          "Sign up",
                          style: TextStyle(
                            color: ExternalColors.background,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                ),
              ),

              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  TextButton(
                    onPressed: widget.onSignInTap,
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Text(" Sign in", style: TextStyle(color: ExternalColors.jobCardColor, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AuthFlipCard extends StatefulWidget {
  const AuthFlipCard({super.key});

  @override
  State<AuthFlipCard> createState() => _AuthFlipCardState();
}

class _AuthFlipCardState extends State<AuthFlipCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  bool showSignup = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutBack,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void flipCard() {
    if (showSignup) {
      _controller.reverse();
    } else {
      _controller.forward();
    }

    setState(() {
      showSignup = !showSignup;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (_, __) {
        final angle = _animation.value * pi;
        final isBack = angle > pi / 2;

        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.0015)
            ..rotateY(angle),
          child: isBack
              ? Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()..rotateY(pi),
                  child: _buildSignup(),
                )
              : _buildSignIn(),
        );
      },
    );
  }

  Widget _buildSignIn() {
    return SizedBox(
      width: 420,
      height: 650,
      child: SignInWidget(onSignUpTap: flipCard),
    );
  }

  Widget _buildSignup() {
    return SizedBox(
      width: 420,
      height: 650,
      child: SignupWidget(onSignInTap: flipCard),
    );
  }
}

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ExternalColors.background,
      alignment: Alignment.center,
      child: const AuthFlipCard(),
    );
  }
}
