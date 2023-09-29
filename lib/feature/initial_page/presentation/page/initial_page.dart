import 'package:cs_hd_hour/core/theme/colors/app_colors.dart';
import 'package:cs_hd_hour/core/widgets/cutom_button/custom_button.dart';
import 'package:cs_hd_hour/router/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset(
              'assets/svg/ic_c_space_logo.svg',
              height: 67,
            ),
            SvgPicture.asset('assets/svg/ic_initial_page_logo.svg'),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 50,
        ),
        bottom: true,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutesName.login);
              },
              borderColor: AppColors.buttonBorderSidedColor,
              color: AppColors.buttonBackgroundColor,
              buttonText: 'Войти',
            ),
            const SizedBox(
              height: 16,
            ),
            CustomButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutesName.auth);
              },
              borderColor: AppColors.buttonBorderSidedColor,
              buttonText: 'Зарегистрироваться',
              textColor: AppColors.buttonBackgroundColor,
            ),
          ],
        ),
      ),
    );
  }
}
