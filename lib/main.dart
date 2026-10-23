import 'package:flutter/material.dart';

void main() {
  runApp(const KonverseApp());
}

class KonverseApp extends StatelessWidget {
  const KonverseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Konverse',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6C5CE7)),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> phrases = [
    {"en": "How are you doing today?", "pt": "Como você está hoje?"},
    {"en": "Could you help me with this?", "pt": "Você poderia me ajudar com isso?"},
    {"en": "I was thinking about our conversation", "pt": "Eu estava pensando sobre nossa conversa"},
    {"en": "Let's practice English together!", "pt": "Vamos praticar inglês juntos!"},
    {"en": "What do you think about this idea?", "pt": "O que você acha dessa ideia?"},
  ];

  int currentIndex = 0;

  void nextPhrase() {
    setState(() {
      currentIndex = (currentIndex + 1) % phrases.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final current = phrases[currentIndex];
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FF),
      appBar: AppBar(
        title: const Text("Konverse", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: const Color(0xFF6C5CE7),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(28),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 20, offset: const Offset(0, 10))
                ],
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(color: const Color(0xFF6C5CE7).withOpacity(0.1), shape: BoxShape.circle),
                    child: const Icon(Icons.chat_bubble_rounded, size: 32, color: Color(0xFF6C5CE7)),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    current["en"]!,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF2D3436)),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    current["pt"]!,
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: nextPhrase,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6C5CE7),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: const Text("Próxima Frase →", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 16),
            Text("${currentIndex + 1} / ${phrases.length}", style: TextStyle(color: Colors.grey[500])),
          ],
        ),
      ),
    );
  }
}