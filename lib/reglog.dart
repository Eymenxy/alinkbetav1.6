import 'package:flutter/material.dart';
import 'login_page.dart'; // Giriş ekranı burada tanımlı
import 'bilgiedin.dart'; // Bilgi edinme sayfası burada tanımlı

class RegLogPage extends StatefulWidget {
  const RegLogPage({super.key});

  @override
  State<RegLogPage> createState() => _RegLogPageState();
}

class _RegLogPageState extends State<RegLogPage> with SingleTickerProviderStateMixin {
  late AnimationController _glowController;
  late Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();
    _glowController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _glowAnimation = Tween<double>(begin: 10.0, end: 25.0).animate(
      CurvedAnimation(parent: _glowController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _glowController.dispose();
    super.dispose();
  }

  // Giriş Yap sayfasına geçiş (fade animasyonu)
  void goToLoginPage() {
    Navigator.of(context).push(_createFadeRoute(const LoginPage()));
  }

  // Bilgi Edin sayfasına geçiş (fade animasyonu)
  void goToBilgiPage() {
    Navigator.of(context).push(_createFadeRoute(const BilgiEdinPage()));
  }

  // Ortak fade animasyonlu yönlendirme
  Route _createFadeRoute(Widget page) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 600),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurvedAnimation(parent: animation, curve: Curves.easeInOut),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF141218),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),

              // Logo ve başlık
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/alinkicon.png', width: 120),
                  const SizedBox(width: 8),
                  const Text(
                    '',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              // Uygulama ikonları
              Expanded(
                child: Center(
                  child: Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    alignment: WrapAlignment.center,
                    children: [
                      appIcon('assets/images/netflix.png'),
                      appIcon('assets/images/youtube.png'),
                      appIcon('assets/images/onedrive.png'),
                      appIcon('assets/images/spotify.png'),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // Bilgilendirme metni
              const Text(
                '🎉 Alosbililerin Uygulamasına Hoş Geldin! 🎓\n'
                    'Aşağıdan sana verilen Çok Özel Şifren ile giriş yapabilirsin.\n\n'
                    'Ama dikkat! Bu şifre o kadar özel ki... belki de annen bile bilmiyor! 😎🔐',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14.5,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 30),

              // Giriş Yap butonu (glow + animasyon)
              AnimatedBuilder(
                animation: _glowAnimation,
                builder: (context, child) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFBF0836).withOpacity(0.6),
                          blurRadius: _glowAnimation.value,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(30),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(30),
                        onTap: goToLoginPage,
                        splashColor: Colors.white.withOpacity(0.2),
                        highlightColor: Colors.white.withOpacity(0.1),
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFFBF0836), Color(0xFFE53950)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            'Giriş Yap',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 10),

              // Bilgi Edin butonu (fade yönlendirmeli)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade900,
                  foregroundColor: Colors.white70,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: goToBilgiPage,
                child: const Text('Bilgi Edin'),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // Uygulama ikonları için widget
  Widget appIcon(String path) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Image.asset(path),
      ),
    );
  }
}
