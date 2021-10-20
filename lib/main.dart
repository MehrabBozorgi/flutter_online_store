import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_shop_practice/provider/auth.dart';
import 'package:flutter_shop_practice/provider/comment.dart';
import 'package:flutter_shop_practice/provider/cart.dart';
import 'package:flutter_shop_practice/provider/favorite.dart';
import 'package:flutter_shop_practice/provider/images.dart';
import 'package:flutter_shop_practice/provider/order.dart';
import 'package:flutter_shop_practice/provider/product.dart';
import 'package:flutter_shop_practice/provider/theme.dart';
import 'package:flutter_shop_practice/screen/splash_screen.dart';
import 'package:provider/provider.dart';
import 'provider/User.dart';
import 'provider/showCart.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ImagesProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CommentProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => OrderProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FavoriteProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ShowCartProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) => MaterialApp(
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            const Locale('fa'),
          ],
          debugShowCheckedModeBanner: false,
          theme: themeProvider.darkTheme! ? Customdark : CustomLight,
          home: SafeArea(
            child: SplashScreen(),
          ),

        ),
      ),
    );
  }
}
