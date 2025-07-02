import 'package:flutter/material.dart';

class BilgiEdinPage extends StatelessWidget {
  const BilgiEdinPage({super.key});

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

              // Logo ve Başlık
              Column(
                children: [
                  Image.asset(
                    'assets/images/alinkicon.png',
                    width: 60,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              const Text(
                '📌 Bu Uygulama Sadece Alosbililer İçindir! 🔒',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),

              const SizedBox(height: 16),

              const Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: Text(
                      'Merhaba! 👋\n'
                          'Bu uygulama, sadece Alosbi Okulu öğrencileri için hazırlanmıştır.\n'
                          '(Öğrencileri Tarafından da Geliştiriliyor 😁)\n\n'
                          'Yani dışarıdan biriysen... üzgünüz, seni alamayız 😢🙅‍♂️\n\n'
                          '📌 Nasıl Giriş Yapılır?\n'
                          'Her öğrenciye özel verilen gizli şifre ile giriş yapabilirsin.\n\n'
                          'Şifren yoksa, okul yetkilileriyle iletişime geçmen yeterli! 📞📝\n\n'
                          'Unutma, bu platform Alosbililer için bir arada olma, '
                          'paylaşma ve etkinlikleri takip etme alanıdır. 🎤🎉',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 15.2,
                        height: 1.6,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // 🟦 İletişim Butonu
              ElevatedButton.icon(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: false,
                    backgroundColor: Colors.transparent,
                    builder: (context) {
                      return _buildPopup(context);
                    },
                  );
                },
                icon: const Icon(Icons.facebook, color: Colors.white),
                label: const Text('İletişim'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1877F2),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 6,
                ),
              ),

              const SizedBox(height: 12),
              const Text(
                'Veya',
                style: TextStyle(color: Colors.white38, fontSize: 15),
              ),
              const SizedBox(height: 12),

              // 🔙 Geri Dön Butonu
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.white30),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Geri Dön',
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ),

              const SizedBox(height: 16),
              const Text(
                'Burayı Merak Ediyorsan Üzülme İllaki Çevrende Bir Alosbili Vardı...',
                style: TextStyle(color: Colors.grey, fontSize: 13),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // 🎉 Popup Alt Paneli
  Widget _buildPopup(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color(0xFF1E1C24),
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Bize Ulaşın',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),

          // Sosyal Medya İkonları
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.facebook),
                color: Colors.blueAccent,
                iconSize: 32,
                onPressed: () {
                  // Facebook bağlantısı
                },
              ),
              const SizedBox(width: 20),
              IconButton(
                icon: const Icon(Icons.camera_alt),
                color: Colors.pinkAccent,
                iconSize: 32,
                onPressed: () {
                  // Instagram bağlantısı
                },
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Kapatma Butonu
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey.shade800,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              minimumSize: const Size(double.infinity, 50),
            ),
            child: const Text('Kapat'),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
