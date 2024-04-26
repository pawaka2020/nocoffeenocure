import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import '../../common.dart';

class TakePhotoScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TakePhotoState();
}

class TakePhotoState extends State<TakePhotoScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _initializeControllerFuture = _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    _controller = CameraController(
      firstCamera,
      ResolutionPreset.medium,
    );
    await _controller.initialize();
  }

  void _takePhoto() async {
    try {
      await _initializeCamera();
      final image = await _controller.takePicture();
      Navigator.of(context).pop(image);
      if (!mounted) return;
    } catch (e) {
      print("Error taking photo: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Take A Photo',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // The camera is initialized, you can now display the preview.
            return CameraPreview(_controller);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _takePhoto,
        child: const Icon(Icons.camera_alt),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

Center placeholder = Center(
  child: Text(
    'Take Photo',
    style: TextStyle(fontSize: 24),
  ),
);
