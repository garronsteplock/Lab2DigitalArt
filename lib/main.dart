import 'package:flutter/material.dart';

void main() {
  runApp(const ArtSpaceApp());
}

class ArtSpaceApp extends StatefulWidget {
  const ArtSpaceApp({super.key});

  @override
  State<ArtSpaceApp> createState() => _ArtSpaceAppState();
}

class _ArtSpaceAppState extends State<ArtSpaceApp> {

int currentIndex = 0;

final List<String> images = [
  'mona_lisa.jpeg',
  'starry_night.jpeg',
];

final List<String> titles = [
  'Mona Lisa',
  'The Starry Night',
];

final List<String> artists = [
  'Leonardo Da Vinci (1517)',
  'Vincent van Gogh (1889)',
];

void nextArt() {
  setState(() {
    currentIndex = (currentIndex + 1) % 2;
  });
}

void previousArt() {
  setState(() {
    currentIndex = (currentIndex - 1 + 2) % 2;
  });
}



@override
Widget build(BuildContext context){
    return MaterialApp(
      title: 'Art Space',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Lab 2 Art Space'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // ARTWORK WALL
              Container(
                width: 250,
                height: 350,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                  color: Colors.grey[300],
                ),
                child: Center(
                  child: Container(
                    width: 200,
                    height: 280,
                    color: Colors.white,
                    child: Image.asset(
                      images[currentIndex],
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // ARTWORK DESCRIPTOR
              Container(
                width: 250,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: Column(
                  children: [
                    Text(
                      titles[currentIndex],
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      artists[currentIndex],
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // DISPLAY CONTROLLER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: previousArt,
                    child: Text('Previous'),
                  ),
                  ElevatedButton(
                    onPressed: nextArt,
                    child: Text('Next'),
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