import 'package:calculate_time_app/app_utils/basic_import.dart';
import 'package:calculate_time_app/app_utils/themes/dynamic_themes.dart';
import 'package:calculate_time_app/feature/calculate_time/view/calculate_time_screen.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ThemesBloc(),
          ),
        ],
        child: BlocBuilder<ThemesBloc, ThemesState>(
          builder: (context, state) {
            return GestureDetector(
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: ScreenUtilInit(
                designSize: const Size(360, 690),
                child: MaterialApp(
                  locale: const Locale("en"),
                  title: AppString.appName,
                  themeMode: ThemeMode.light,
                  // navigatorObservers: <NavigatorObserver>[observer],
                  theme: state.themeData,
                  darkTheme: state.themeData,
                  navigatorKey: GlobalVariable.navigatorKey,
                  debugShowCheckedModeBanner: false,
                  home: navigation(),
                  builder: EasyLoading.init(
                    builder: (context, child) {
                      return MediaQuery(
                        data: MediaQuery.of(context).copyWith(
                          textScaler: const TextScaler.linear(1.0),
                        ),
                        child: child!,
                      );
                    },
                  ),
                  localizationsDelegates: const [
                    CountryLocalizations.delegate,
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  navigation() {
    return const CalculateTimeScreen();

      // SharedPrefUtils.getIsUserLoggedIn() ? const DashboardScreen() : const MainAuthNavScreen();
  }
}
