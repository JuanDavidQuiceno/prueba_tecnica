import 'package:custom_image/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:prueba_tecnica/src/common/theme/colors.dart';
import 'package:responsive_content/responsive_content.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor.withOpacity(0.6),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomImage(
              'assets/icons_feat/feat1.png',
              width: size.width * 0.6,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              width: ResponsiveContent.isMobile(context)
                  ? size.width * 0.60
                  : size.width * 0.30,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: LinearProgressIndicator(
                  minHeight: 5,
                  backgroundColor: AppColors.grey,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
            Text(
              'Cargando...',
              style: Theme.of(context).primaryTextTheme.bodySmall,
            ),
          ],
        ),
      ],
    );
  }
}
