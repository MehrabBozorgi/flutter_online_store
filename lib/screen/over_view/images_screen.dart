import 'package:flutter/material.dart';
import 'package:flutter_shop_practice/provider/images.dart';
import 'package:flutter_shop_practice/widget/spinkit.dart';
import 'package:provider/provider.dart';

class ImagesScreen extends StatelessWidget {
  final int id;

  const ImagesScreen({required this.id});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ImagesProvider>(context);
    provider.fetchData(id);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black26,
      ),
      child: Hero(
        tag: '1',
        child: GridView.builder(
          itemCount: provider.item.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
          ),
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(10),
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            ImageZoom(provider.item[index].image_slide),
                      ),
                    );
                  },
                  child: (provider.item[index].image_slide.isNotEmpty)
                      ? FadeInImage.assetNetwork(
                          placeholder: 'spin.gif',
                          image: '${provider.item[index].image_slide}',
                          width: double.infinity,
                          height: 100,
                          fit: BoxFit.cover,
                          fadeInDuration: Duration(milliseconds: 400),

                          // child: Image.network(
                          //     provider.item[index].image_slide,
                          //     width: double.infinity,
                          //     height: 100,
                          //     fit: BoxFit.cover,
                          //   ),
                        )
                      : SpinKitWidget(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ImageZoom extends StatelessWidget {
  String myImage = '';

  ImageZoom(String image_slide) {
    this.myImage = image_slide;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Hero(
          tag: '1',
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.network(
                myImage,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
