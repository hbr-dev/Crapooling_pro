import 'package:camera/camera.dart';
import 'package:flutter/material.dart';


class IDExaminer extends StatefulWidget {
  const IDExaminer({
    super.key,
    required this.camera,
  });

  final CameraDescription camera;
  @override
  State<IDExaminer> createState() => _IDExaminerState();
}

class _IDExaminerState extends State<IDExaminer> {

  // Received data from VerifyID class
  Map receivedData = {};
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  final pageTitles = [
                  "Vérication par Carte Nationale d'identité",
                  "Vérification par Permis de conduite",
                  "Vérification par un passport"
  ];

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    receivedData = receivedData.isNotEmpty
        ? receivedData
        : ModalRoute.of(context)?.settings.arguments as Map;

    return Scaffold(
      // ------------------------ The AppBar Section ------------------------ //
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFF3F9F9),
        elevation: 0,
        actions: [
          Row(
            children: [
              Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'X',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'NunitoMedium',
                          fontSize: 22.0,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                  )
              )
            ],
          )
        ],
      ),
      // ------------------------ ****************** ------------------------ //
      // ---------------------- Main Container Section ---------------------- //
      body: Container(
        color: const Color(0xFFF3F9F9),
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ########### Container 1 : the page title #############
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Text(
                pageTitles[receivedData['verificationMethod']],
                style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'NunitoBold',
                    fontSize: 34.0,
                    fontWeight: FontWeight.w700
                ),
              ),
            ),
            // ########### Container 2 : cam zone #############
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              color: Colors.black54,
              height: 250,
              child:  FutureBuilder<void>(
                future: _initializeControllerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    // If the Future is complete, display the preview.
                    return CameraPreview(_controller);
                  } else {
                    // Otherwise, display a loading indicator.
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            // ########### Container 3 : info zone #############
            Container(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: const Text(
                "Placer la carte d'identité convenablement dans la zone ci dessus",
                style: TextStyle(
                  fontFamily: 'NunitoRegular',
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54
                ),
              ),
            ),
            // ########### Container 4 : Cam capture button #############
            Container(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Center(
                child: Container(
                  width: 75,
                  height: 75,
                  decoration: BoxDecoration(
                    color: Colors.grey[350],
                    border: Border.all(
                      color: Colors.black,
                      width: 2
                    ),
                    borderRadius: BorderRadius.circular(75)
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child:  const Icon(
                      Icons.camera_alt_sharp,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      // ------------------------ ****************** ------------------------ //
    );
  }
}
