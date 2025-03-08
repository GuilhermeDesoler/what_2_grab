import 'package:flutter/material.dart';
import 'package:what_2_grab/presentation/pages/design-system/widgets/main.dart';

import '../../widgets/main.dart';
import 'design_system_page_data.dart';

class DesignSystemPage extends StatelessWidget {
  const DesignSystemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('App Design System'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: Text('App'),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _primaryAppButtonsSection(context),
                  const SizedBox(height: 8),
                  _secondaryAppButtonsSection(context),
                  const SizedBox(height: 8),
                  _ghostAppButtonsSection(context),
                  const SizedBox(height: 8),
                  _outlinedAppButtonsSection(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _primaryAppButtonsSection(BuildContext context) {
    return DesignSection(
      title: 'Primary App Buttons',
      content: DesignSectionRowContent(children: [
        DesignSectionColumnContent<AppButtonDto>(
          dtos: appButtonsRoundedList,
          widgetBuilder: (e) => AppButton.primary(dto: e, context: context),
        ),
        DesignSectionColumnContent<AppButtonDto>(
          dtos: appButtonsSemiList,
          widgetBuilder: (e) => AppButton.primary(dto: e, context: context),
        ),
        DesignSectionColumnContent<AppButtonDto>(
          dtos: appButtonsSquareList,
          widgetBuilder: (e) => AppButton.primary(dto: e, context: context),
        ),
      ]),
    );
  }

  Widget _secondaryAppButtonsSection(BuildContext context) {
    return DesignSection(
      title: 'Secondary App Buttons',
      content: DesignSectionRowContent(children: [
        DesignSectionColumnContent<AppButtonDto>(
          dtos: appButtonsRoundedList,
          widgetBuilder: (e) => AppButton.secondary(dto: e, context: context),
        ),
        DesignSectionColumnContent<AppButtonDto>(
          dtos: appButtonsSemiList,
          widgetBuilder: (e) => AppButton.secondary(dto: e, context: context),
        ),
        DesignSectionColumnContent<AppButtonDto>(
          dtos: appButtonsSquareList,
          widgetBuilder: (e) => AppButton.secondary(dto: e, context: context),
        ),
      ]),
    );
  }

  Widget _ghostAppButtonsSection(BuildContext context) {
    return DesignSection(
      title: 'Ghost App Buttons',
      content: DesignSectionRowContent(children: [
        DesignSectionColumnContent<AppButtonDto>(
          dtos: appButtonsRoundedList,
          widgetBuilder: (e) => AppButton.ghost(dto: e, context: context),
        ),
        DesignSectionColumnContent<AppButtonDto>(
          dtos: appButtonsSemiList,
          widgetBuilder: (e) => AppButton.ghost(dto: e, context: context),
        ),
        DesignSectionColumnContent<AppButtonDto>(
          dtos: appButtonsSquareList,
          widgetBuilder: (e) => AppButton.ghost(dto: e, context: context),
        ),
      ]),
    );
  }

  Widget _outlinedAppButtonsSection(BuildContext context) {
    return DesignSection(
      title: 'Outlined App Buttons',
      content: DesignSectionRowContent(children: [
        DesignSectionColumnContent<AppButtonDto>(
          dtos: appButtonsRoundedList,
          widgetBuilder: (e) => AppButton.outlined(dto: e, context: context),
        ),
        DesignSectionColumnContent<AppButtonDto>(
          dtos: appButtonsSemiList,
          widgetBuilder: (e) => AppButton.outlined(dto: e, context: context),
        ),
        DesignSectionColumnContent<AppButtonDto>(
          dtos: appButtonsSquareList,
          widgetBuilder: (e) => AppButton.outlined(dto: e, context: context),
        ),
      ]),
    );
  }
}
