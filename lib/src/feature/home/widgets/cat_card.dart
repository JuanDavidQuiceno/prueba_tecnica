import 'package:custom_image/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:prueba_tecnica/src/feature/home/domain/models/home_model.dart';
import 'package:prueba_tecnica/src/feature/home/presentation/home/car_detailt/cat_detail_scree.dart';
import 'package:prueba_tecnica/src/utils/environment.dart';

class CatCard extends StatelessWidget {
  const CatCard({required this.catModel, super.key});
  final CatModel catModel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              settings: const RouteSettings(name: CatDetailtScreen.routeName),
              builder: (context) => CatDetailtScreen(catModel: catModel),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  if (catModel.name != null)
                    Expanded(
                      child: Text(
                        catModel.name!,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Más...',
                      style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                                decoration: TextDecoration.underline,
                              ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Hero(
                  tag: '${catModel.id}${catModel.referenceImageId!}',
                  child: CustomImage(
                    '${Environment.network.urlCatImage}/${catModel.referenceImageId}.jpg',
                    type: ImageType.network,
                    height: size.height * 0.4,
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  if (catModel.origin != null)
                    Expanded(
                      child: Text(
                        catModel.origin!,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                  const SizedBox(width: 10),
                  if (catModel.intelligence != null)
                    Expanded(
                      child: Text(
                        catModel.intelligence!.toString(),
                        style: Theme.of(context).textTheme.displayMedium,
                        textAlign: TextAlign.end,
                      ),
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
