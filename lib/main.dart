import 'package:flutter/
material.dart';
import 'package:image_picker/
image_picker.dart';
import 'package:file_picker/
file_picker.dart';
import 'package:just_audio/
just_audio.dart';

final AudioPlayer audioPlayer = 
AudioPlayer();

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
              onPressed: () {},
              icon: const Icon(Icons.edit),
              label: const Text('AI Video Editor'),
            ),

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
              onPressed: () {},
              icon: const Icon(Icons.record_voice_over),
              label: const Text('AI Voiceover'),
            ),

            const SizedBox(height: 15),

            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.video_library),
              label: const Text('My Videos'),
            ),
          ],
        ),
      ),
    );
  }
}
