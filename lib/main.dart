import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:pravo_client/app/theme.dart';
import 'package:pravo_client/assets/constants.dart';
import 'package:pravo_client/features/auth/presentation/viewmodels/router_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env'); // .env 파일 로드
  KakaoSdk.init(
    nativeAppKey: dotenv.env['KAKAO_NATIVE_APP_KEY']!,
  ); // Flutter SDK 초기화
  await initializeDateFormatting('ko_KR', null); // 한국어 로케일 초기화
  runApp(ProviderScope(child: _App()));
}

class _App extends ConsumerStatefulWidget {
  @override
  ConsumerState<_App> createState() => _AppState();
}

class _AppState extends ConsumerState<_App> {
  late AppLinks _appLinks;
  StreamSubscription<Uri>? _linkSubscription;
  late final GoRouter router;

  @override
  void initState() {
    super.initState();
    router = ref.read(routerProvider);
    _initializeDeepLinks();
  }

  @override
  void dispose() {
    _linkSubscription?.cancel();
    super.dispose();
  }

  Future<void> _initializeDeepLinks() async {
    _appLinks = AppLinks();
    _linkSubscription = _appLinks.uriLinkStream.listen(
      (Uri uri) {
        _handleDeepLink(uri);
      },
      onError: (err) {
        debugPrint('Failed to receive link: $err');
      },
    );
  }

  void _handleDeepLink(Uri uri) {
    final router = ref.read(routerProvider);
    final path = uri.path;

    /// 약속 상세 페이지만 공유 가능하므로 promise 아닌 경우에는 홈으로 리디렉션
    if (path.contains('/promise')) {
      router.push(path);
    } else {
      router.go('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(routerProvider);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        // statusBarColor: Colors.transparent,
        systemNavigationBarColor: kBackgroundColor,
      ),
      child: MaterialApp.router(
        theme: appTheme,
        routeInformationProvider: router.routeInformationProvider,
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ko', 'KR'),
        ],
      ),
    );
  }
}
