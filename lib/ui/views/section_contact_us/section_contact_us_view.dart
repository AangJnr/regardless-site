import 'package:flutter/material.dart';
import 'package:regardless_site/ui/views/app_container/app_container_view.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../app/validators.dart';
import 'section_contact_us_view.desktop.dart';
import 'section_contact_us_view.form.dart';
import 'section_contact_us_view.mobile.dart';
import 'section_contact_us_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'name', validator: Validators.validateName),
  FormTextField(name: 'email', validator: Validators.validateEmail),
  FormTextField(name: 'message', validator: Validators.validateEmpty),
  FormTextField(name: 'phoneNumber')
], autoTextFieldValidation: false)
class SectionContactUsView extends StackedView<SectionContactUsViewModel>
    with $SectionContactUsView {
  const SectionContactUsView({super.key});

  @override
  Widget builder(
    BuildContext context,
    SectionContactUsViewModel viewModel,
    Widget? child,
  ) {
    return AppContainerView(
      child: ScreenTypeLayout.builder(
        mobile: (_) => const SectionContactUsViewMobile(),
        desktop: (_) => const SectionContactUsViewDesktop(),
      ),
    );
  }

  @override
  SectionContactUsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SectionContactUsViewModel();
}
