import 'package:flutter/material.dart';

class MesajYazSayfasi extends StatefulWidget {
  const MesajYazSayfasi({super.key});

  @override
  State<MesajYazSayfasi> createState() => _MesajYazSayfasiState();
}

class _MesajYazSayfasiState extends State<MesajYazSayfasi> {
  final TextEditingController _controller = TextEditingController();
  int maxKarakter = 280;

  void _showDosyaSecenekleri() {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF2A2A2E),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.image, color: Colors.white),
                title: const Text('Resim Ekle', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.attach_file, color: Colors.white),
                title: const Text('Dosya Ekle', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  bool get _yaziVarMi => _controller.text.trim().isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1B1F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1C1B1F),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          "Yeni Mesaj",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) => ScaleTransition(
                scale: animation,
                child: child,
              ),
              child: _yaziVarMi
                  ? ElevatedButton(
                key: const ValueKey("aktif"),
                onPressed: () {
                  // Yayınlama işlemi
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent,
                  foregroundColor: Colors.white,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "Yayınla",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
                  : const SizedBox(
                key: ValueKey("bos"),
                height: 0,
                width: 0,
              ),
            ),
          ),
        ],

      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/profile.png'),
                  radius: 22,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    onChanged: (_) => setState(() {}),
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                    maxLines: null,
                    decoration: const InputDecoration(
                      hintText: "Ne paylaşmak istiyorsun?",
                      hintStyle: TextStyle(color: Colors.white54),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                TextButton.icon(
                  onPressed: _showDosyaSecenekleri,
                  icon: const Icon(Icons.attach_file, color: Colors.white),
                  label: const Text("Dosya Ekle", style: TextStyle(color: Colors.white)),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    backgroundColor: Colors.white10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  "${_controller.text.length} / $maxKarakter",
                  style: const TextStyle(color: Colors.white38),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
