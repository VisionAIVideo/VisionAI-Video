import 'package:flutter/
material.dart';
import 'package:image_picker/
image_picker.dart';
import 'package:file_picker/
file_picker.dart';
import 'package:just_audio/
just_audio.dart';
import 'package:video_player/
video_player.dart';
import 'package:flutter_tts/
flutter_tts.dart';

final AudioPlayer audioPlayer =
 AudioPlayer();
final FlutterTts flutterTts = 
FlutterTts();

void main() {
  runApp(const VisionAIVideoApp());
}

class VisionAIVideoApp extends StatelessWidget {
  const VisionAIVideoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VisionAI Video',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VisionAI Video'),
        centerTitle: true,
      ),
      body: Padding (
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),

            const Text(
              'Create amazing videos with AI',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Turn your ideas and images into beautiful videos.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 35),

            ElevatedButton.icon(
              onPressed: () async {
                final ImagePicker picker = 
              ImagePicker();

                final XFile? image = await
              picker.pickImage(
                  source: ImageSource.gallery,
                );

                if (image != null &&
              context.mounted) {
              ScaffoldMessenger.of(context).sh
              owSnackBar(
                    const SnackBar(
                      content: Text('Image
              selected successfully!'),
                    ),
                  );
                }
              },
            
          
            

            const SizedBox(height: 15),

            ElevatedButton.icon(
              onPressed: () async {
                final result = await 
              FilePicker.platform.pickFiles(
                  type: FileType.video,
                );  

                if (result != null &&
              result.files.single.path != 
              null) {
                  final videoPath = 
                  result.files.single.path!;
 
               if (context.mounted) {
                 Navigator.push(
                   context,
                   MaterialPageRoute(
                     builder: (context) => 
             VideoPreviewPage(
                         videoPath: 
             videoPath,
                       ),
                     ),
                   );
                 }
               }
             }, 
              
            

            const SizedBox(height: 15),

            ElevatedButton.icon(
              onPressed: () async {
                final rsult = await 
              FilePicker.platform.pickFiles(
                  type: FileType.audio,
                );

                if (result != null && 
              result.files.single.path != 
              null) {
                  final path = 
              result.files.single.path!;

                  try {
                    await 
              audioPlayer.setFilePath(path);
                    await audioPlayer.play();

                    if (context.mounted) {
              ScaffoldMessenger.of(context).sh
              owSnackBar(
                        const SnackBar(
                           content: Text('Music
              is playing!'),
                        ),
                      );
                    }
                  } catch (e) {
                    if (context.mounted) {
              ScaffoldMessenger.of(context).sh
              owSnackBar(
                        const SnackBar(
                         content: Text('Could
              not play this audio file.'),
                        ),
                      );
                    }
                  }
                }
              },
              
            
            

            const SizedBox(height: 15),

            ElevatedButton.icon(
              onPressed: () async {
                final TextEditingController 
              controller =
              TextEditingController();

                 final String? text = await
              showDialog<String>(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('AI 
              Voiceover'),
                      content: TextField(
                        controller: 
              controller,
                        maxLines: 5,
                        decoration: const 
              InputDecoration(
                          hintText: 'Enter
              your voiceover text...',
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => 
              Navigator.pop(context),
                          child: const
              Text('Cancel'),
                        ),
                        ElevatedButton(
                          onPressed: () =>
              Navigator.pop(context, 
              controller.text),
                          child: const 
              Text('Speak'),
                        ),
                      ],
                    );
                  },
                );

                if (text != null && 
              text.trim().isNotEmpty) {
                  await 
              flutterTts.speak(text.trim());

                  if (context.mounted) {

              ScaffoldMessenger.of(context).sh
              owSnackBar(
                      const SnackBar(
                        content:
              Text('Voiceover is playing!'),
                      ),
                    );
                  }
                }
              },
              
              
            

            const SizedBox(height: 15),

            ElevatedButton.icon(
              onPressed:
              () {
              ScaffoldMessenger.of(context).sh
              owSnackBar(
                  const SnackBar(
                    content: Text('My Videos 
              is comin),g soon!'),
                  ),
                );
              },

              
            
          
        
      
    
  

