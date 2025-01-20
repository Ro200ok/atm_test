import 'package:atm_test/core/atm_app_theme.dart';
import 'package:atm_test/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'features/cash_machine/presentation/atm_page.dart';

class AtmApp extends StatefulWidget {
  const AtmApp({super.key});

  @override
  State<AtmApp> createState() => _AtmAppState();
}

class _AtmAppState extends State<AtmApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => WidgetsBinding.instance.allowFirstFrame());
  }

  @override
  Widget build(BuildContext context) {
    return AtmAppTheme(
      child: MaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('ru')],
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const AtmPage(),
      ),
    );
  }
}
