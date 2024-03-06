import 'package:custom_image/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:prueba_tecnica/src/feature/home/domain/models/home_model.dart';
import 'package:prueba_tecnica/src/utils/environment.dart';

class CatDetailtScreen extends StatelessWidget {
  const CatDetailtScreen({required this.catModel, super.key});
  static const String routeName = 'catDetailt';
  final CatModel catModel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          catModel.name ?? '',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Column(
        children: [
          Hero(
            tag: '${catModel.id}${catModel.referenceImageId!}',
            child: CustomImage(
              '${Environment.network.urlCatImage}/${catModel.referenceImageId}.jpg',
              type: ImageType.network,
              height: size.height * 0.5,
            ),
          ),
          Expanded(
            child: Scrollbar(
              child: ListView(
                children: [
                  if (catModel.name != null)
                    ListTile(
                      leading: const Icon(Icons.pets),
                      title: Text(
                        catModel.name!,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                  if (catModel.origin != null)
                    ListTile(
                      leading: const Icon(Icons.location_on),
                      title: Text(
                        catModel.origin!,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                  if (catModel.temperament != null)
                    ListTile(
                      leading: const Icon(Icons.emoji_nature),
                      title: Text(
                        catModel.temperament!,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                  if (catModel.lifeSpan != null)
                    ListTile(
                      leading: const Icon(Icons.date_range),
                      title: Text(
                        catModel.lifeSpan!,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                  if (catModel.wikipediaUrl != null)
                    ListTile(
                      leading: const Icon(Icons.link),
                      title: Text(
                        catModel.wikipediaUrl!,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                  if (catModel.description != null)
                    ListTile(
                      leading: const Icon(Icons.description),
                      title: Text(
                        catModel.description!,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                  if (catModel.adaptability != null)
                    ListTile(
                      leading: const Icon(Icons.star),
                      title: Text(
                        catModel.adaptability!.toString(),
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                  if (catModel.affectionLevel != null)
                    ListTile(
                      leading: const Icon(Icons.star),
                      title: Text(
                        catModel.affectionLevel!.toString(),
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                  if (catModel.childFriendly != null)
                    ListTile(
                      leading: const Icon(Icons.star),
                      title: Text(
                        catModel.childFriendly!.toString(),
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                  if (catModel.dogFriendly != null)
                    ListTile(
                      leading: const Icon(Icons.star),
                      title: Text(
                        catModel.dogFriendly!.toString(),
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
