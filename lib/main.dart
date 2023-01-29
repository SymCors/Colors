import 'package:colors/core/base/custom_scroll_behavior.dart';
import 'package:colors/core/base/providers.dart';
import 'package:colors/core/blocs/theme/theme_cubit.dart';
import 'package:colors/core/constants/fonts.dart';
import 'package:colors/core/constants/paths.dart';
import 'package:colors/core/constants/strings.dart';
import 'package:colors/core/database/hive_repository.dart';
import 'package:colors/core/localization/localization.dart';
import 'package:colors/core/theme/app_theme.dart';
import 'package:colors/view/home_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
  await HiveRepository.initHive();
  HiveRepository.registerHiveAdapters();
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString(Fonts.courgetteOFL);
    yield LicenseEntryWithLineBreaks([Fonts.courgette], license);
  });
  runApp(
    EasyLocalization(
      supportedLocales: Localization.supportedLanguagesLocale,
      path: Paths.translations,
      fallbackLocale: Localization.fallBackLocale,
      useOnlyLangCode: true,
      child: MultiBlocProvider(
        providers: Providers.providers,
        child: const Main(),
      ),
    ),
  );
}

/// [Main] is the root widget of the app.
class Main extends StatefulWidget {
  /// Constructor for [Main].
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await BlocProvider.of<ThemeCubit>(context).initTheme();
      FlutterNativeSplash.remove();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          title: Strings.appName,
          themeMode: state is LightTheme ? ThemeMode.light : ThemeMode.dark,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          scrollBehavior: const MaterialScrollBehavior().copyWith(
            dragDevices: CustomScrollBehavior().dragDevices,
          ),
          home: const HomeView(),
          builder: EasyLoading.init(),
        );
      },
    );
  }
}
