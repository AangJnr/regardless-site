import 'package:flutter/material.dart';
import 'package:regardless_site/app/app.locator.dart';
import 'package:regardless_site/app/config/theme_setup.dart';
import 'package:regardless_site/extensions/hover_extensions.dart';
import 'package:regardless_site/ui/common/ui_helpers.dart';
import 'package:regardless_site/ui/widgets/app_logo.dart';
import 'package:regardless_site/ui/widgets/material_inkwell.dart';
import 'package:stacked_services/stacked_services.dart';

import '../usecase/links_usecase.dart';
import 'footer.dart';
import 'primary_button_widget.dart';
import 'regardless_text.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget(
      {Key? key,
      this.scrollController,
      this.color = AppColors.whiteColor,
      this.padding,
      this.margin})
      : super(key: key);
  final ScrollController? scrollController;
  final Color color;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    final useCase = LinksUseCase(scrollController: scrollController);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: color,
      ),
      padding: padding,
      margin: margin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(children: [
            AppLogoWidget(size: Size(35, 35)),
            horizontalSpaceSmall,
            // Text(
            //   'Regardless',
            //   style: Theme.of(context)
            //       .textTheme
            //       .bodyMedium
            //       ?.copyWith(fontWeight: FontWeight.bold, fontSize: 20),
            // ),
          ]),
          Row(
            children: [
              for (var item in [
                'Home',
                'About',
                'Shop',
                'Contact',
              ])
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: GestureDetector(
                    onTap: () => useCase.goToPage(item),
                    child: Text(
                      item,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 13),
                    ).underlineOnHover(),
                  ),
                ),
              horizontalSpaceLarge,
              // Padding(
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              //   child: GestureDetector(
              //     onTap: () => useCase.goToPage('Login'),
              //     child: Text(
              //       'Login',
              //       style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              //           color: AppColors.textColor,
              //           fontWeight: FontWeight.w500,
              //           fontSize: 13),
              //     ).underlineOnHover(),
              //   ),
              // ),
              // horizontalSpaceMedium,
              PrimaryButtonWidget(
                () {},
                textLabel: 'SHOP NOW',
                isFullWidth: false,
                isCompact: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BreadcrumbsWidget extends StatelessWidget {
   final LinksUseCase? useCase;
  const BreadcrumbsWidget({
    Key? key,
     required this.useCase,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> items = ['Home', ... locator<RouterService>()
        .router
        .current
        .path.trim()
        .split("/")
        .where((e) => e.isNotEmpty)
        .toList()];
    if (items.length == 1) return const SizedBox.shrink();
    return Wrap(
      alignment: WrapAlignment.start,
      children: items.asMap().entries.map((entry) {
        final index = entry.key;
        final item = entry.value;
        final isLast = index == items.length - 1;

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: isLast ? null : () => useCase?.goToPage(item),
              child: Text(
                item.capitalize(),
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w600,
                      decoration: isLast
                          ? TextDecoration.none
                          : TextDecoration.underline,
                    ),
              ),
            ),
            if (!isLast)
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(Icons.arrow_forward_ios,
                    size: 12, color: AppColors.blackColor),
              ),
          ],
        );
      }).toList(),
    );
  }
}
