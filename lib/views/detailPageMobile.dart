import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String itemTitle;
  final String itemDescription;
  final String imageNetwork;

  DetailPage({
    required this.itemTitle,
    required this.itemDescription,
    required this.imageNetwork,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CachedNetworkImage(
  imageUrl: imageNetwork,
  imageBuilder: (context, imageProvider) => Container(
    height: 300,
    width: double.infinity,
    decoration: BoxDecoration(
      image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
          ),
    ),
  ),
  placeholder: (context, url) => CircularProgressIndicator(),
  errorWidget: (context, url, error) => Container(
    height: 300,
    width: double.infinity,
    decoration: BoxDecoration(
      image: DecorationImage(
          image:NetworkImage('https://static.vecteezy.com/system/resources/previews/008/695/917/original/no-image-available-icon-simple-two-colors-template-for-no-image-or-picture-coming-soon-and-placeholder-illustration-isolated-on-white-background-vector.jpg'),
          fit: BoxFit.fill,
          ),
    ),
  ),
),
            
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    itemTitle,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    itemDescription,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
