import 'package:flutter/material.dart';
import 'backwards_view.dart';

String _defaultOnGenerateDefaultTitle(BuildContext context) => '';
List<Widget> _defaultOnGenerateWidgetList(BuildContext context) => const [];
Widget _defaultOnGenerateWidget(BuildContext context, Widget body) => body;

abstract class TemplateScaffold extends StatelessWidget {
  final OnBackPressed onBackPressed;
  final Widget body;
  final String? tabTitle, appbarTitle;
  final bool onlyBackButton, hideAllActions;
  final double minDisplayTopBarWidgetsWidth;
  final void Function()? onAppbarTitlePressed;
  final void Function(BuildContext context)? onDefaultAppbarTitlePressed;
  final String Function(BuildContext context) onGenerateDefaultTabTitle, onGenerateDefaultAppbarTitle;
  final List<Widget> Function(BuildContext context) onGenerateDrawerList, onGenerateTopBarList;
  final Widget Function(BuildContext context, Widget body) onGenerateBodyInjection;
  final Widget? floatingActionButton;

  const TemplateScaffold({super.key, required this.onBackPressed, this.tabTitle, this.onGenerateDefaultTabTitle = _defaultOnGenerateDefaultTitle,
    this.appbarTitle, this.onGenerateDefaultAppbarTitle = _defaultOnGenerateDefaultTitle, this.onAppbarTitlePressed, this.onDefaultAppbarTitlePressed, required this.body, this.onlyBackButton = false, this.hideAllActions = false,
    this.minDisplayTopBarWidgetsWidth = 0, this.onGenerateDrawerList = _defaultOnGenerateWidgetList, this.onGenerateTopBarList = _defaultOnGenerateWidgetList, this.onGenerateBodyInjection = _defaultOnGenerateWidget, this.floatingActionButton});

  @override
  Widget build(BuildContext context) {
    return BackwardsView(onBackPressed: onBackPressed, child: Title(title: tabTitle ?? onGenerateDefaultTabTitle(context), color: Colors.black,
        child:  Scaffold(drawer: onlyBackButton || hideAllActions ? null : Drawer(
          child: ListView(
            children: onGenerateDrawerList(context),
          ),
        ),
          appBar: AppBar(
              leading: onlyBackButton && !hideAllActions ? IconButton(onPressed: () => onBackPressed(context), icon: const Icon(Icons.arrow_back)) : null,
              titleSpacing: 0,
              title: LayoutBuilder(builder: (context, constraints) =>
                  Wrap(crossAxisAlignment: WrapCrossAlignment.center,
                      runAlignment: WrapAlignment.center,
                      spacing: 5,
                      children: [
                        TextButton(onPressed: onAppbarTitlePressed ?? (onlyBackButton || hideAllActions || onDefaultAppbarTitlePressed == null ? null : () => onDefaultAppbarTitlePressed!(context)), child: Text(appbarTitle ?? onGenerateDefaultAppbarTitle(context), style: Theme.of(context).textTheme.titleLarge!, overflow: TextOverflow.fade, softWrap: false,)),//.copyWith(color: Theme.of(context).colorScheme.onPrimary))),)
                        if(!onlyBackButton && !hideAllActions && minDisplayTopBarWidgetsWidth > 0 && constraints.maxWidth > minDisplayTopBarWidgetsWidth) ...onGenerateTopBarList(context)]),
              ),

          ),
          body: onGenerateBodyInjection(context, body),
          floatingActionButton: floatingActionButton,
        )));
  }
}