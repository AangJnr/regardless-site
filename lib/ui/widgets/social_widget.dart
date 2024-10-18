import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../app/config/theme_setup.dart';
import '../usecase/links_usecase.dart';
import 'material_inkwell.dart';

class SocialsWidget extends StatelessWidget {
  const SocialsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min,
        children: [
      Icon("Facebook", FontAwesomeIcons.facebook),
      Icon("Instagram", FontAwesomeIcons.instagram),
      Icon("Twitter", FontAwesomeIcons.twitter),
      Icon("YouTube", FontAwesomeIcons.youtube),
      Icon("WhatsApp", FontAwesomeIcons.whatsapp),
    ]
            .map((e) => MaterialInkWell(
                onTap: () {
                  LinksUseCase().goToPage(e.text);
                },
                radiusValue: 50,
                padding: EdgeInsets.all(10),
                child: FaIcon(
                  e.icon,
                  color: AppColors.blackColor600,
                  size: 15,
                )))
            .toList());
  }
}

class Icon {
  final String text;
  final IconData icon;
  Icon(this.text, this.icon);
}
