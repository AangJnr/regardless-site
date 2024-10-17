import 'package:flutter/material.dart';
import 'package:regardless_site/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import '../../../app/config/theme_setup.dart';
import '../../widgets/regardless_text.dart';
import 'section_featured_viewmodel.dart';

class SectionFeaturedViewMobile
    extends ViewModelWidget<SectionFeaturedViewModel> {
  const SectionFeaturedViewMobile({super.key});

  @override
  Widget build(BuildContext context, SectionFeaturedViewModel viewModel) {
    return Container(
      color: AppColors.whiteColor,
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(
              height: 500,
              width: double.infinity,
              child: _buildGridWidget(viewModel)),

          RegardlessTextWidget(
            text: 'Coming Soon!',
            words: ['Soon!'],
            textAlign: TextAlign.start,
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(color: AppColors.blackColor, fontSize: 45),
            wordsTextStyle: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(color: AppColors.accentColorText, fontSize: 45),
          ),
          verticalSpaceMedium,
          Text(
            'Elevate your style with Regardless Apparel! Our collection combines comfort, durability, and bold designs that inspire confidence. Whether you\'re hitting the gym, heading to a game, or just embracing everyday life, we\'ve got the perfect gear to keep you looking sharp. Wear your passion, own your journey—no limits, just you.\n\n',
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: AppColors.blackColor),
          ),

          // PrimaryButtonWidget(
          //   () => viewModel.linkUseCase.goToPage('shop'),
          //   textLabel: 'Browse Catalogue',
          //   isFullWidth: false,
          // ),
        ],
      ),
    );
  }
}

Widget _buildGridWidget(SectionFeaturedViewModel viewModel) {
  return GridView(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    children: viewModel.images
        .map((e) => e.image.contains('4')
            ? ClipRRect(
                borderRadius: BorderRadius.circular(200),
                child: Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        e.color,
                        e.color.withOpacity(0.7),
                        e.color.withOpacity(0.3),
                      ],
                    ),
                  ),
                  child: PageView(
                      controller: viewModel.pageViewController,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: viewModel.setCurrentPage,
                      children: viewModel.shirtMockups
                          .map((e) => Image.asset(
                                e,
                                fit: BoxFit.contain,
                              ))
                          .toList()),
                ),
              )
            : Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      e.color,
                      e.color.withOpacity(0.7),
                      e.color.withOpacity(0.3),
                    ],
                  ),
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage(
                      e.image,
                    ),
                  ),
                  borderRadius: e.image.contains('1')
                      ? BorderRadius.circular(200)
                      : BorderRadius.circular(50),
                ),
              ))
        .toList(),
  );
}
