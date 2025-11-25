import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hosta_user/core/resource/main_page/main_page.dart';
import 'package:hosta_user/generated/locale_keys.g.dart';

class ProviderPage extends StatefulWidget {
  const ProviderPage({super.key});

  @override
  State<ProviderPage> createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage> {
  @override
  Widget build(BuildContext context) {
    return MainPage(
      title: LocaleKeys.providerDetailsPage_title.tr(),
      body: ListView(),
    );
  }
}
