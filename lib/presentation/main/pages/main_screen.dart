import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamu_recipes/presentation/settings/settings_screen.dart';
import '../../../core/configs/theme/app_colors.dart';
import '../../home/home_screen.dart';
import '../../orders/recipes_screen.dart';
import '../../theme/theme_cubit.dart';
import '../bloc/bottom_nav_cubit.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  static final List<Widget> _pages = [
    const HomeScreen(),
    const RecipesScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return BlocProvider(
      create: (BuildContext context) => BottomNavCubit(),
      child: Scaffold(
        extendBodyBehindAppBar: false,

        appBar: AppBar(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'Recipes',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w700,
              fontSize: 26,
              letterSpacing: 0.5,
            ),
          ),
          centerTitle: false,
          actions: [
            IconButton(
              icon: isDarkMode
                  ? const Icon(Icons.sunny)
                  : const Icon(Icons.nightlight),
              onPressed: () {
                isDarkMode
                    ? context.read<ThemeCubit>().updateTheme(ThemeMode.light)
                    : context.read<ThemeCubit>().updateTheme(ThemeMode.dark);
              },
            ),
            const SizedBox(width: 8),
          ],
        ),

        body: BlocBuilder<BottomNavCubit, int>(
          builder: (context, selectedIndex) {
            return IndexedStack(index: selectedIndex, children: _pages);
          },
        ),

        bottomNavigationBar: BlocBuilder<BottomNavCubit, int>(
          builder: (context, selectedIndex) {
            return BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index) {
                context.read<BottomNavCubit>().updateIndex(index);
              },
              selectedItemColor: AppColors.primary,
              unselectedItemColor: Colors.grey.shade600,
              selectedLabelStyle: const TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle: const TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
              ),
              type: BottomNavigationBarType.fixed,
              elevation: 12,
              backgroundColor: isDarkMode ? AppColors.matteBlack : AppColors.lightBackground,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home_rounded),
                  label: 'Home',
                ),

                BottomNavigationBarItem(
                  icon: Icon(Icons.receipt_long_outlined),
                  activeIcon: Icon(Icons.receipt_long_rounded),
                  label: 'Recipes',
                ),

                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline_rounded),
                  activeIcon: Icon(Icons.person_rounded),
                  label: 'Settings',
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
