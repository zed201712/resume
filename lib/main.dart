import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'providers/chat_provider.dart';
import 'providers/language_provider.dart';
import 'ui/screens/home_screen.dart';
import 'utils/locale_from_query.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('zh'), Locale('en'), Locale('ja')],
      path: 'assets/translations',
      fallbackLocale: const Locale('zh'),
      child: ResumeApp(
        urlLocale: localeFromQuery(Uri.base.queryParameters['lang']),
      ),
    ),
  );
}

class ResumeApp extends StatefulWidget {
  /// 網址 `?lang=` 指定的語言，優先於已存的語言選擇。
  final Locale? urlLocale;

  const ResumeApp({super.key, this.urlLocale});

  @override
  State<ResumeApp> createState() => _ResumeAppState();
}

class _ResumeAppState extends State<ResumeApp> {
  @override
  void initState() {
    super.initState();
    final urlLocale = widget.urlLocale;
    if (urlLocale != null) {
      // easy_localization 有已存語言時會忽略 startLocale，因此改在啟動後套用。
      WidgetsBinding.instance.addPostFrameCallback((_) => context.setLocale(urlLocale));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
      ],
      child: MaterialApp(
        title: 'Resume',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4F46E5)), // Indigo 600
          useMaterial3: true,
          textTheme: context.locale.languageCode == 'ja'
              ? GoogleFonts.notoSansJpTextTheme(Theme.of(context).textTheme)
              : GoogleFonts.notoSansTcTextTheme(Theme.of(context).textTheme),
          scaffoldBackgroundColor: Colors.white,
        ),
        home: const PortfolioHomePage(),
      ),
    );
  }
}
