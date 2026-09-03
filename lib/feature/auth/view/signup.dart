import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hangry/core/constants/app_color.dart';
import 'package:hangry/core/network/api_error.dart';
import 'package:hangry/core/utils/validators.dart';
import 'package:hangry/feature/auth/data/auth_repo.dart';
import 'package:hangry/feature/auth/view/login_view.dart';
import 'package:hangry/feature/auth/widgets/custom_button.dart';
import 'package:hangry/feature/shared/custom_snakbar.dart';
import 'package:hangry/feature/shared/custom_text.dart';
import 'package:hangry/feature/shared/custom_txtfeild.dart';
import 'package:hangry/root.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _phonecontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final GlobalKey<FormState> _fromkey = GlobalKey<FormState>();
  final authrepo autrepo = authrepo();
  bool isloading = false;

  @override
  void dispose() {
    _namecontroller.dispose();
    _emailcontroller.dispose();
    _phonecontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  Future<void> signup() async {
    if (!_fromkey.currentState!.validate()) {
      return;
    }

    setState(() => isloading = true);

    try {
      // ✅ الإيميل بيتحول lowercase قبل ما يتبعت، عشان
      // Test@Test.com و test@test.com يتعاملوا كنفس الحساب
      final user = await autrepo.signup(
        _namecontroller.text.trim(),
        _emailcontroller.text.trim().toLowerCase(),
        _phonecontroller.text.trim(),
        _passwordcontroller.text.trim(),
      );

      if (!mounted) return;

      if (user != null) {
        Navigator.push(context, MaterialPageRoute(builder: (c) => Root()));
      }

      setState(() => isloading = false);
    } catch (e) {
      if (!mounted) return;

      setState(() => isloading = false);

      String errmsg = "unexpected error from signup";
      if (e is ApiError) {
        errmsg = e.message;
        print('❌ SIGNUP ERROR MESSAGE: ${e.message}');
      } else {
        print('❌ SIGNUP ERROR (not ApiError): $e');
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
                key: _fromkey,
                // ✅ بعد أول محاولة Submit فاشلة، هيبدأ يتحقق من كل حقل
                // أول ما تكتبي فيه (live validation) بدل ما تستني تدوسي الزرار تاني
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
                    Gap(80),
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
                                hint: "Full Name",
                                sec: false,
                                controller: _namecontroller,
                                validator: Validators.name,
                              ),
                              Gap(15),
                              CustomTxtfeild(
                                hint: "Email Adress",
                                sec: false,
                                controller: _emailcontroller,
                                keyboardType: TextInputType.emailAddress,
                                validator: Validators.email,
                              ),
                              Gap(15),
                              CustomTxtfeild(
                                hint: "Phone Number",
                                sec: false,
                                controller: _phonecontroller,
                                keyboardType: TextInputType.phone,
                                maxLength: 11,
                                validator: Validators.egyptianPhone,
                              ),
                              Gap(15),
                              CustomTxtfeild(
                                hint: "Password",
                                sec: true,
                                controller: _passwordcontroller,
                                validator: Validators.password,
                              ),
                              Gap(15),
      
                              Gap(30),
                              isloading
                                  ? CupertinoActivityIndicator(
                                      color: Colors.white,
                                    )
                                  : customauthbutton(
                                      textbtn: "Sign Up",
                                      ontapp: signup,
                                    ),
                              Gap(20),
                              customauthbutton(
                                textbtn: "Go To Login",
                                txtcolor: Colors.white,
                                borcolor: Colors.transparent,
                                ontapp: () => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (c) => LoginView()),
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
