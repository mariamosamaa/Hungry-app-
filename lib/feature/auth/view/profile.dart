import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hangry/core/constants/app_color.dart';
import 'package:hangry/core/network/api_error.dart';
import 'package:hangry/feature/auth/data/auth_repo.dart';
import 'package:hangry/feature/auth/data/user_Model.dart';
import 'package:hangry/feature/auth/view/login_view.dart';
import 'package:hangry/feature/auth/widgets/custom_authtextfeild.dart';
import 'package:hangry/feature/shared/custom_snakbar.dart';
import 'package:hangry/feature/shared/custom_text.dart';
import 'package:hangry/root.dart';
import 'package:skeletonizer/skeletonizer.dart';

class profileview extends StatefulWidget {
  const profileview({super.key});

  @override
  State<profileview> createState() => _profileviewState();
}

class _profileviewState extends State<profileview> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _visa = TextEditingController();

  authrepo authreepo = authrepo();
  UserModel? usermodel;

  // آخر 4 أرقام اللي المستخدم كتبهم دلوقتي (لسه ماتبعتش للسيرفر)
  String? _enteredLast4;

  // بيرجع true لو فيه كارت متسجل من السيرفر، أو المستخدم دلوقتي دخل رقم وضغط Save
  bool get _hasSavedCard =>
      (usermodel?.card?.last4 != null) || (_enteredLast4 != null);

  Future<void> getprofiledata() async {
    try {
      final user = await authreepo.getprofdata();
      setState(() {
        usermodel = user;
      });
    } catch (e) {
      String errormessage = 'error in profile ';
      if (e is ApiError) {
        errormessage = e.message;
      }
      ScaffoldMessenger.of(context).showSnackBar(customsnackbar(errormessage));
    }
  }

  @override
  void initState() {
    getprofiledata().then((v) {
      _name.text = usermodel?.name ?? "Name";
      _email.text = usermodel?.email ?? "Name@gmail.com";
      _address.text = usermodel?.address ?? "EX : Cairo";
      // ملحوظة: مش بنحط أي نص افتراضي جوه _visa
      // عشان نسيبها فاضية لحد ما اليوزر يكتب رقم فعلي
    });
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _name.dispose();
    _address.dispose();
    _visa.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColor.appcolor,
        appBar: AppBar(
          backgroundColor: AppColor.appcolor,
          leading: GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (c) => Root()),
            ),
            child: const Icon(Icons.arrow_back, color: Colors.white),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SvgPicture.asset("assets/icon/settings.svg"),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Skeletonizer(
                    enabled: usermodel == null,
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image:
                            (usermodel?.image != null &&
                                usermodel!.image!.isNotEmpty)
                            ? DecorationImage(
                                image: NetworkImage(usermodel!.image!),
                                fit: BoxFit.cover,
                              )
                            : const DecorationImage(
                                image: AssetImage('assets/icon/look.png'),
                                fit: BoxFit.cover,
                              ),
                        color: Colors.grey.shade300,
                        border: Border.all(width: 5, color: Colors.white),
                      ),
                    ),
                  ),
                ),

                Gap(30),
                CustomAuthtextfeild(controller: _name, label: "Name"),
                Gap(20),
                CustomAuthtextfeild(controller: _email, label: "Email"),
                Gap(20),
                CustomAuthtextfeild(controller: _address, label: "Address"),
                Gap(15),
                Divider(color: Colors.grey),
                Gap(10),

                // ===== قسم كارت الفيزا =====
                // لو معندوش كارت لسه → اظهري التيكست فيلد + زرار الحفظ فقط
                if (!_hasSavedCard) ...[
                  Gap(10),
                  TextField(
                    controller: _visa,
                    keyboardType: TextInputType.number,
                    maxLength: 16,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      labelText: "Enter Visa Card Number",
                      counterText: "", // يخفي عداد الحروف اللي بيظهر تحت تلقائي
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  Gap(10),
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.appcolor,
                      ),
                      onPressed: () {
                        if (_visa.text.length == 16) {
                          setState(() {
                            _enteredLast4 = _visa.text.substring(
                              _visa.text.length - 4,
                            );
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            customsnackbar("رقم الفيزا لازم يكون 16 رقم"),
                          );
                        }
                      },
                      child: CustomText(
                        text: "Save Card",
                        color: Colors.white,
                        fsize: 15,
                      ),
                    ),
                  ),
                ],

                // لو عنده كارت (من السيرفر أو دخله دلوقتي) → اظهري الـ ListTile فقط
                if (_hasSavedCard) ...[
                  Gap(10),
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(12),
                    ),
                    tileColor: Color(0xffF3F4F6),
                    leading: Image.asset(
                      "assets/icon/profileVisa.png",
                      width: 60,
                    ),
                    title: CustomText(
                      text: "Debit Card",
                      color: Colors.black,
                      fsize: 15,
                    ),
                    subtitle: CustomText(
                      text:
                          "**** **** **** ${usermodel?.card?.last4 ?? _enteredLast4}",
                      color: Colors.black,
                      fsize: 13,
                    ),
                    trailing: CustomText(
                      text: "Default",
                      color: Colors.black,
                      fsize: 15,
                    ),
                  ),
                ],

                Gap(500),
              ],
            ),
          ),
        ),
        bottomSheet: SafeArea(
          child: Container(
            height: 80,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                topLeft: Radius.circular(15),
              ),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade800,
                  blurRadius: 20,
                  offset: const Offset(0, -6), // shadow above the bottom sheet
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 55,
                    decoration: BoxDecoration(
                      color: AppColor.appcolor,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CustomText(
                          text: "Edit Profile",
                          color: Colors.white,
                          fsize: 16,
                        ),
                        SizedBox(width: 10),
                        Icon(
                          CupertinoIcons.pencil,
                          color: Colors.white,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    height: 55,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.appcolor, width: 2),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: GestureDetector(
                      onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (c) => LoginView()),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: "Log out",
                            color: AppColor.appcolor,
                            fsize: 16,
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.logout_rounded,
                            color: AppColor.appcolor,
                            size: 20,
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
    );
  }
}