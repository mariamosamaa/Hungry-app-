import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hangry/core/constants/app_color.dart';
import 'package:hangry/core/network/api_error.dart';
import 'package:hangry/core/utils/validators.dart';
import 'package:hangry/feature/auth/data/auth_repo.dart';
import 'package:hangry/feature/auth/view/signup.dart';
import 'package:hangry/feature/auth/widgets/custom_button.dart';
import 'package:hangry/feature/shared/custom_snakbar.dart';
import 'package:hangry/feature/shared/custom_text.dart';
import 'package:hangry/feature/shared/custom_txtfeild.dart';
import 'package:hangry/root.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passcontroller = TextEditingController();
  final GlobalKey<FormState> fromkey = GlobalKey<FormState>();
  final authrepo autrepo = authrepo();
  bool isloading = false;

  @override
  void dispose() {
    emailcontroller.dispose();
    passcontroller.dispose();
    super.dispose();
  }

  Future<void> login() async {
    if (!fromkey.currentState!.validate()) {
      return;
    }

    setState(() => isloading = true);

    try {
      // ✅ الإيميل بيتحول lowercase قبل ما يتبعت
      final user = await autrepo.login(
        emailcontroller.text.trim().toLowerCase(),
        passcontroller.text.trim(),
      );

      if (!mounted) return;

      if (user != null) {
        Navigator.push(context, MaterialPageRoute(builder: (c) => Root()));
      }

      setState(() => isloading = false);
    } catch (e) {
      if (!mounted) return;

      setState(() => isloading = false);

      String errmsg = "unexpected error from login";
      if (e is ApiError) {
        errmsg = e.message;
        print('❌ LOGIN ERROR MESSAGE: ${e.message}');
      } else {
        print('❌ LOGIN ERROR (not ApiError): $e');
      }

      ScaffoldMessenger.of(context).showSnackBar(customsnackbar(errmsg));
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1.0),
              child: Form(
                key: fromkey,
                // ✅ تفعيل الـ live validation بعد أول محاولة Submit
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    Gap(100),
                    SvgPicture.asset(
                      "assets/logo/logo.svg",
                      color: AppColor.appcolor,
                    ),
                    Gap(5),
                    CustomText(text: "Welcome Foodie", color: Colors.black),
                    Gap(150),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(18.0),
                        decoration: BoxDecoration(
                          color: AppColor.appcolor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              CustomTxtfeild(
                                hint: "Email Adress",
                                sec: false,
                                controller: emailcontroller,
                                keyboardType: TextInputType.emailAddress,
                                validator: Validators.email,
                              ),
                              Gap(15),
                              CustomTxtfeild(
                                hint: "Password",
                                sec: true,
                                controller: passcontroller,
                                validator: Validators.password,
                              ),
                              Gap(15),
      
                              Gap(30),
                              isloading
                                  ? CupertinoActivityIndicator(
                                      color: Colors.white,
                                    )
                                  : customauthbutton(
                                      textbtn: "Login",
                                      ontapp: login,
                                    ),
                              Gap(20),
                              customauthbutton(
                                textbtn: "Create Accont ?",
                                txtcolor: Colors.white,
                                borcolor: Colors.transparent,
                                ontapp: () => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (c) => Signup()),
                                ),
                              ),
                              Gap(20),
                              customauthbutton(
                                textbtn: "Continue As Guest",
                                txtcolor: Colors.white,
                                borcolor: Colors.transparent,
                                ontapp: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (c) => Root()),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
