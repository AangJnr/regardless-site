import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'regardless_text.dart';
import 'terms_widget.dart';

class FooterBottomWidget extends StatelessWidget {
  const FooterBottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (_) => Column(mainAxisSize: MainAxisSize.min, children: [
        _buildDateWidget(context),
        TermsAndPrivacyPolicyWidget(
          text: 'Terms of Service     Privacy Policy',
        ),
        _buildPaymentsWidget()
      ]),
      desktop: (_) => Row(children: [
        Expanded(
          child: _buildDateWidget(context),
        ),
        Expanded(
          child: TermsAndPrivacyPolicyWidget(
            text: 'Terms of Service     Privacy Policy',
          ),
        ),
        Expanded(
          child: _buildPaymentsWidget(),
        )
      ]),
    );
  }

  Row _buildPaymentsWidget() {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: ['visa.png', 'mastercard.png', 'momo.png', 'telcel.png']
            .map((e) => Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white),
                child: Image.asset(
                  e,
                  height: 20,
                  width: 30,
                  fit: BoxFit.cover,
                )))
            .toList());
  }

  RegardlessTextWidget _buildDateWidget(BuildContext context) {
    return RegardlessTextWidget(
      text: '© ${DateTime.now().year} Regardless Inc. All Rights Reserved',
      words: ['Regardless', 'Inc.', 'All Rights Reserved'],
      wordsTextStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Colors.black, fontSize: 11, fontWeight: FontWeight.w700),
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.black54,
            fontSize: 11,
          ),
    );
  }
}
