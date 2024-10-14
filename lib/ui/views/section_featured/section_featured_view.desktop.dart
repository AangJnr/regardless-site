import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:regardless_site/app/config/theme_setup.dart';
import 'package:regardless_site/extensions/hover_extensions.dart';
import 'package:regardless_site/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import '../../widgets/primary_button_widget.dart';
import '../../widgets/regardless_text.dart';
import 'section_featured_viewmodel.dart';

class SectionFeaturedViewDesktop
    extends ViewModelWidget<SectionFeaturedViewModel> {
  const SectionFeaturedViewDesktop({super.key});

  @override
  Widget build(BuildContext context, SectionFeaturedViewModel viewModel) {
    return Container(
      color: AppColors.whiteColor,
      padding: EdgeInsets.symmetric(
          vertical: getResponsiveVerticalSpaceMedium(context)),
      child: Row(
        children: [
          horizontalSpaceMassive,
          SizedBox(
            width: 500,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: 500,
                    width: 500,
                    child: _buildGridWidget(viewModel)),
              ],
            ),
          ),
          horizontalSpaceMedium,
          // Column(mainAxisSize: MainAxisSize.min,
          //   children: [
          //     smooth_page_indicator.SmoothPageIndicator(
          //       controller: viewModel.pageViewController,
          //       count: viewModel.images.length,
          //       axisDirection: Axis.horizontal,
          //       onDotClicked: (i) async {
          //         viewModel.animateToPage(i);
          //       },
          //       effect: smooth_page_indicator.ExpandingDotsEffect(
          //         expansionFactor: 3,
          //         spacing: 8,
          //         radius: 8,
          //         dotWidth: 8,
          //         dotHeight: 8,
          //         dotColor: AppColors.blackColor.withOpacity(0.3),
          //         activeDotColor: AppColors.blackColor,
          //         paintStyle: PaintingStyle.fill,
          //       ),
          //     ),
          //     verticalSpaceMedium,
          //     Expanded(
          //       child: ClipRRect(
          //         borderRadius: BorderRadius.circular(12),
          //         child:SizedBox(height: 500, width: 300, child: PageView(
          //             controller: viewModel.pageViewController,
          //             scrollDirection: Axis.horizontal,
          //             onPageChanged: viewModel.setCurrentPage,
          //             children: viewModel.images
          //                 .map((e) => Image.asset(
          //                       e.image,
          //                       fit: BoxFit.cover,
          //                     ))
          //                 .toList()),
          //       ),
          //     ))
          //   ],
          // ),
          horizontalSpaceMassive,
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RegardlessTextWidget(
                text: 'Our Featured Collection',
                words: ['Featured'],
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
                'Elevate your style with Regardless Apparel! Our collection combines comfort, durability, and bold designs that inspire confidence. Whether you\'re hitting the gym, heading to a game, or just embracing everyday life, we\'ve got the perfect gear to keep you looking sharp. Wear your passion, own your journey—no limits, just you.\n\nBrowse through our collection and find your perfect piece!',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: AppColors.blackColor),
              ),
              verticalSpaceLarge,
              PrimaryButtonWidget(
                () {},
                textLabel: 'Browse Catalogue',
                isFullWidth: false,
              ),
            ],
          )),
          horizontalSpaceMassive,
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
                // child: Image.asset(
                //   e.image,
                //   fit: BoxFit.cover,
                // ),
              ).scaleOnHover())
        .toList(),
  );
}
