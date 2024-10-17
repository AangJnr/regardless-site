import 'package:flutter/material.dart';
import 'package:regardless_site/app/app.locator.dart';
import 'package:regardless_site/app/config/theme_setup.dart';
import 'package:regardless_site/extensions/hover_extensions.dart';
import 'package:regardless_site/ui/common/ui_helpers.dart';
import 'package:regardless_site/ui/widgets/app_logo.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked_services/stacked_services.dart';

import '../usecase/links_usecase.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget(
      {super.key,
      this.scrollController,
      this.color,
      this.padding,
      this.showLogo = false,
      this.margin});
  final bool showLogo;
  final ScrollController? scrollController;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    final useCase = LinksUseCase(scrollController: scrollController);
    return ScreenTypeLayout.builder(
      mobile: (context) => Container(
        padding: padding,
        margin: margin,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showLogo) ...[
              AppLogoWidget(size: Size(25, 25)),
              verticalSpaceMedium,
            ],
            Wrap(
              children: [
                ..._buildOptionsWidget(context, useCase, true),
              ],
            ),
          ],
        ),
      ),
      desktop: (context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color?.withOpacity(0.6),
        ),
        padding: EdgeInsets.all(10),
        margin: margin,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showLogo) ...[
              AppLogoWidget(size: Size(40, 40)),
              horizontalSpaceSmall,
              Spacer()
            ],
            ..._buildOptionsWidget(context, useCase, false),
            // horizontalSpaceLarge,
            // PrimaryButtonWidget(
            //   () => useCase.goToPage('shop'),
            //   textLabel: 'SHOP NOW',
            //   isFullWidth: false,
            //   isCompact: true,
            // ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildOptionsWidget(
          BuildContext context, LinksUseCase useCase, bool isMobile) =>
      [
        'Home',
        'Training Services',
        'Shop',
        'Mobile App',
        'Contact',
      ]
          .map((link) => Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: _isSelected(link)
                        ? AppColors.accentColor
                        : AppColors.transparent),
                padding: isMobile
                    ? const EdgeInsets.symmetric(horizontal: 8, vertical: 6)
                    : const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: GestureDetector(
                  onTap: () => useCase.goToPage(link),
                  child: Text(
                    link,
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: AppColors.blackColor,
                        fontWeight: _isSelected(link)
                            ? FontWeight.bold
                            : FontWeight.w500,
                        fontSize: 13),
                  ).underlineOnHover(),
                ),
              ))
          .toList();

  bool _isSelected(String link) {
    final currentPath =
        locator<RouterService>().router.currentPath.stripExtra();

    if (currentPath.isEmpty && link.stripExtra() == 'home') return true;
    return currentPath.contains(link.stripExtra());
  }
}

class BreadcrumbsWidget extends StatelessWidget {
  final LinksUseCase? useCase;
  const BreadcrumbsWidget({
    super.key,
    required this.useCase,
  });

  @override
  Widget build(BuildContext context) {
    List<String> items = [
      'Home',
      ...locator<RouterService>()
          .router
          .current
          .path
          .trim()
          .split("/")
          .where((e) => e.isNotEmpty)
          .toList()
    ];
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
                item.replaceAll('-view', '').capitalize(),
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
