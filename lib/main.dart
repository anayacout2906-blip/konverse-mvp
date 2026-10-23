import 'package:flutter/material.dart';

void main() => runApp(KonverseApp());

class KonverseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Konverse',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: KonverseHome(),
    );
  }
}

class KonverseHome extends StatefulWidget {
  @override
  State<KonverseHome> createState() => _KonverseHomeState();
}

class _KonverseHomeState extends State<KonverseHome> {
  final List<Map<String,String>> messages = [];
  final controller = TextEditingController();

  void sendMessage() {
    if(controller.text.trim().isEmpty) return;
    setState(() {
      messages.add({"text": controller.text, "user": "Você"});
      // Simula resposta
      messages.add({"text": "Konverse responde: ${controller.text} 😊", "user": "Bot"});
    });
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Konverse 💬", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepPurple.shade100,
      ),
      body: Column(
        children: [
          Expanded(
            child: messages.isEmpty 
              ? Center(child: Text("Diga oi para começar! 👋", style: TextStyle(fontSize: 18)))
              : ListView.builder(
                itemCount: messages.length,
                padding: EdgeInsets.all(12),
                itemBuilder: (c,i) {
                  final isMe = messages[i]["user"] == "Você";
                  return Align(
                    alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 4),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isMe ? Colors.deepPurple : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(messages[i]["text"]!, 
                        style: TextStyle(color: isMe ? Colors.white : Colors.black)),
                    ),
                  );
                },
              ),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: "Digite sua mensagem...",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 12)
                  ),
                  onSubmitted: (_) => sendMessage(),
                )),
                SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: Colors.deepPurple,
                  child: IconButton(icon: Icon(Icons.send, color: Colors.white), onPressed: sendMessage),
                )
              ],
            ),
          )
        ],
      ),
    );
  }