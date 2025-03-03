import 'package:flutter/material.dart';

class PlaylistScreenWidget extends StatelessWidget {
  const PlaylistScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return GestureDetector(
                child: ListTile(
              leading: ClipRRect(
                borderRadius:
                    BorderRadius.circular(8), // Adjust the radius as needed
                child: Image.network(
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                  width: 50, // Set a fixed size for consistency
                  height: 50,
                  fit: BoxFit
                      .cover, // Ensures the image covers the area properly
                ),
              ),
              title: Text("Title"),
              subtitle: Text("by: Sample ft. Test"),
            ));
          },
        )
      ],
    );
  }
}
