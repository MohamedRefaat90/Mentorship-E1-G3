import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentorship_e1_g3/core/extension/num_extension.dart';
import 'package:mentorship_e1_g3/core/resources/assets.dart';
import 'package:mentorship_e1_g3/core/themes/app_pallete.dart';
import 'package:mentorship_e1_g3/core/widgets/custom_btn.dart';
import 'package:mentorship_e1_g3/features/Auth/login/cubit/login_cubit.dart';

import 'social_login_btn.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({super.key});

  @override
  Widget build(BuildContext context) {
    LoginCubit cubit = BlocProvider.of<LoginCubit>(context);
    return Row(
      children: [
        Expanded(
          child: SocialLoginBtn(
            press: () => cubit.loginByGoogle(context),
            lable: "Google",
            svgIcon: Assets.loginGoogleIcon,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: SocialLoginBtn(
            press: () => cubit.loginByGithub(context),
            lable: "Github",
            svgIcon: Assets.loginGithubIcon,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: SocialLoginBtn(
            press: () {
              showDialog(
                context: context,
                barrierDismissible: true,
                builder: (context) {
                  TextEditingController phoneController =
                      TextEditingController();
                  String codeCountry = "+20";
                  return AlertDialog(
                    actionsAlignment: MainAxisAlignment.center,
                    contentPadding: const EdgeInsets.all(10),
                    backgroundColor: Colors.white,
                    title: const Text('Login by Phone',
                        style: TextStyle(color: Colors.black)),
                    content: Row(
                      children: [
                        CountryCodePicker(
                          onChanged: (value) {
                            codeCountry = value.dialCode!;
                          },
                          initialSelection: "eg",
                          searchStyle: const TextStyle(color: Colors.black),
                          textStyle: const TextStyle(color: Colors.black),
                          dialogTextStyle: const TextStyle(color: Colors.black),
                          showCountryOnly: false,
                          showOnlyCountryWhenClosed: false,
                          alignLeft: false,
                        ),
                        SizedBox(
                            width: 170.w,
                            height: 40,
                            child: TextFormField(
                              controller: phoneController,
                              style: const TextStyle(color: Colors.black),
                            ))
                      ],
                    ),
                    actions: [
                      CustomBTN(
                          widget: const Text("Submit"),
                          padding: 15,
                          width: 200.w,
                          color: AppPallete.violet,
                          press: () {
                            String varifiedPhone =
                                codeCountry + phoneController.text.trim();
                            cubit.loginByPhone(context, varifiedPhone);
                          }),
                    ],
                  );
                },
              );
            },
            lable: "Phone",
            svgIcon: Assets.loginPhoneIcon,
          ),
        ),
      ],
    );
  }
}
