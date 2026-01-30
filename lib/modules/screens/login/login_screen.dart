import 'package:flutter/material.dart';

enum TipoLogin { veterinario, inseminador }

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Gradiente
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xCC1C398E), Color(0xB3007A55)],
          ),
        ),

        // Conteúdo principal da tela
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 40),
                      const Header(),
                      const SizedBox(height: 40),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: const LoginCard(),
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class AnimatedLogo extends StatefulWidget {
  const AnimatedLogo({super.key});

  @override
  State<AnimatedLogo> createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _animation = Tween<double>(
      begin: 0.4,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: ClipOval(
        child: Image.asset(
          'assets/images/logo_iatf.jpeg',
          width: 120,
          height: 120,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AnimatedLogo(),
        const SizedBox(height: 40),
        const Text(
          'IATF Mobile',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            // fontFamily: ,
            color: Colors.white,
          ),
        ),

        const SizedBox(height: 4),

        const Text(
          'Tecnologia para o Campo',
          style: TextStyle(fontSize: 16, color: Colors.white70),
        ),
      ],
    );
  }
}

class LoginCard extends StatefulWidget {
  const LoginCard({super.key});

  @override
  State<LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  TipoLogin tipoLogin = TipoLogin.veterinario;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.25),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          _input(icon: Icons.home_outlined, hint: 'FAZENDA-JLC'),
          const SizedBox(height: 14),

          AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            child: _input(
              key: ValueKey(tipoLogin),
              icon: Icons.email_outlined,
              hint: tipoLogin == TipoLogin.veterinario
                  ? 'veterinario@jc.com'
                  : 'inseminador@jc.com',
            ),
          ),
          const SizedBox(height: 14),

          _input(icon: Icons.lock_outline, hint: '123456', obscure: true),

          const SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _tipoToggle(),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Recuperar senha',
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF009966),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: const Text(
                'ACESSAR',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _input({
    Key? key,
    required IconData icon,
    required String hint,
    bool obscure = false,
  }) {
    return TextField(
      key: key,
      obscureText: obscure,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white70),
        prefixIcon: Icon(icon, color: Colors.white70),
        filled: true,
        fillColor: Colors.white.withValues(alpha: 0.15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _tipoToggle() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          _tipoButton('Vet', TipoLogin.veterinario),
          _tipoButton('Ins', TipoLogin.inseminador),
        ],
      ),
    );
  }

  Widget _tipoButton(String label, TipoLogin tipo) {
    final ativo = tipoLogin == tipo;

    return GestureDetector(
      onTap: () {
        setState(() {
          tipoLogin = tipo;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color: ativo ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: ativo ? Colors.black : Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
