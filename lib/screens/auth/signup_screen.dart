import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:laura/screens/auth/login_screen.dart';
import 'package:laura/screens/guardian/guardian_dashboard.dart';
import 'package:laura/utils/extension.dart';
import 'package:laura/utils/theme.dart';
import 'package:laura/utils/utils.dart';
import 'package:laura/widgets/base_scaffold.dart';
import 'package:laura/widgets/img.dart';
import 'package:laura/widgets/primary_btn.dart';
import 'package:laura/widgets/text_field.dart';

import '../student/dashboardNavigationBar.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final idController = TextEditingController();
  bool _passwordVisible = false;

  DateTime selectedDate = DateTime.now();

  Future _showDatePicker(BuildContext context) async {
    DateTime? date = await pickDate();
    if (date == null) return;

    var dateTime = DateTime(
      date.year,
      date.month,
      date.day,
    );
    setState(() {
      selectedDate = dateTime;
    });
  }

  Future<DateTime?> pickDate() => showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100),
      );

  List<String> userType = ["Student", "Guardian"];
  String? selectedUserType;
  final _formKey = GlobalKey<FormState>();

  final imagePicker = ImagePicker();
  File? avatarImageXFile;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      safeTop: false,
      builder: (x) => SingleChildScrollView(
        child: Column(children: [
          Container(
            height: MediaQuery.sizeOf(context).height * .4,
            width: double.infinity,
            padding: const EdgeInsets.only(left: 22),
            decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(200),
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.png',
                  // width: 100,
                  height: 35,
                ),
                const Gap(18),
                Text(
                  "Create\nAccount",
                  style: AppStyles.general(28, FontWeight.w400,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: AppTextField(
                        labelText: "First name",
                        hintText: "First name",
                        textCapitalization: TextCapitalization.words,
                        // validator: Validators.validateString(
                        //     error: "first name is required"),
                        controller: firstNameController,
                      )),
                      Gap(x.width * .1),
                      Expanded(
                        child: AppTextField(
                          labelText: "Last name",
                          hintText: "Last name",
                          textCapitalization: TextCapitalization.words,
                          // validator: Validators.validateString(
                          //     error: "last name is required"),
                          controller: lastNameController,
                        ),
                      ),
                    ],
                  ),
                  AppTextField(
                    hintText: "Email",
                    labelText: "Email",
                    controller: emailController,
                    // validator: (x) => Validators.validateEmail(x),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 22),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(color: AppColors.secondrayColor))),
                    child: GestureDetector(
                      onTap: () => _showDatePicker(context),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ConstrainedBox(
                            constraints:
                                BoxConstraints(maxWidth: x.width * .65),
                            child: Text(
                                selectedDate == DateTime.now()
                                    ? 'Date of birth'
                                    : Utils().formatDate(
                                        '${selectedDate.toLocal()}'),
                                overflow: TextOverflow.ellipsis,
                                style: AppStyles.general(14, FontWeight.w400)),
                          ),
                          Icon(
                            Icons.calendar_today_rounded,
                            color: AppColors.secondrayColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Gap(16),
                  DropdownButtonFormField(
                    validator: (value) {
                      if (value == null) {
                        return 'Select a user';
                      }
                      return null;
                    },
                    hint: Text(
                      'Select user',
                      style: AppStyles.general(12, FontWeight.w400,
                          color: AppColors.secondrayColor),
                    ),
                    disabledHint: Text(
                      'Select user',
                      style: AppStyles.general(12, FontWeight.w400,
                          color: AppColors.secondrayColor),
                    ),
                    dropdownColor: Colors.white,
                    elevation: 25,
                    style: AppStyles.general(12, FontWeight.w400,
                        color: Colors.black),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintStyle: AppStyles.general(12, FontWeight.w400,
                          color: Colors.black),
                    ),
                    value: selectedUserType,
                    items: userType.map((user) {
                      return DropdownMenuItem(
                        value: user,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: x.width * .6),
                          child: ClipRRect(
                            clipBehavior: Clip.hardEdge,
                            child: Text(user,
                                overflow: TextOverflow.ellipsis,
                                style: AppStyles.general(14, FontWeight.w400)
                                    .copyWith(color: Colors.black)),
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (x) {
                      setState(() {
                        selectedUserType = x;
                      });
                    },
                  ),
                  const Gap(16),
                  if (selectedUserType == userType.first)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppTextField(
                          hintText: "Guardian ID number",
                          labelText: "Guardian ID number",
                          controller: idController,
                          keyboardType: TextInputType.emailAddress,
                          // validator: Validators.validateString(),
                        ),
                        const Gap(16),
                      ],
                    ),
                  const Gap(16),
                  if (selectedUserType == userType.last)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Guardian ID"),
                        const Gap(6),
                        CustomImagePicker(
                          imageXFile: avatarImageXFile,
                          ontap: () => showPickAvatarIdSheet(context),
                          onCancel: () =>
                              setState(() => avatarImageXFile == null),
                          description: "Click to upload a photo of you.",
                        ),
                        // const Gap(16),
                      ],
                    ),
                  AppTextField(
                    hintText: "Username",
                    labelText: "Username",
                    controller: usernameController,
                    // validator: Validators.validateString(
                    //     error: "username is required"),
                  ),
                  AppTextField(
                    obscureText: _passwordVisible,
                    hintText: "Password",
                    labelText: "Password",
                    controller: passwordController,
                    // validator: Validators.validatePassword(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ),
                  // Gap(16),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PrimaryButton(
                      onPressed: () {
                        if (!_formKey.currentState!.validate()) return;
                        if (selectedUserType == userType.first) {
                          context.push(const DashboardNavigationBar());
                        } else {
                          context.push(const GuardianDashboard());
                        }
                      },
                      label: "Sign up now",
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const LoginScreen()));
                        // Handle forgot password action
                      },
                      child: const Text('Log In ->'),
                    ),
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }

  void showPickAvatarIdSheet(BuildContext context) {
    showModalBottomSheet(
        // showDragHandle: true,
        isScrollControlled: true,
        backgroundColor: AppColors.white,
        constraints: BoxConstraints(
          minWidth: MediaQuery.sizeOf(context).width,
          maxHeight: MediaQuery.sizeOf(context).height * .75,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Container(
                  decoration: ShapeDecoration(
                    color: AppColors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x3F425060),
                        blurRadius: 14,
                        offset: Offset(0, -7),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        width: 60,
                        height: 5,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFB8BBC5),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(36),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ImageSheetWidget(
                                icon: Icons.camera,
                                text: "Take a photo",
                                onTap: () async {
                                  final image = await imagePicker.pickImage(
                                      source: ImageSource.camera);
                                  if (image != null) {
                                    setState(() {
                                      avatarImageXFile = File(image.path);
                                    });
                                    context.pop();
                                  }
                                },
                              ),
                              // Gap(30.w),
                              ImageSheetWidget(
                                icon: Icons.document_scanner,
                                text: "Select file",
                                onTap: () async {
                                  final image = await imagePicker.pickImage(
                                      source: ImageSource.gallery);
                                  if (image != null) {
                                    setState(() {
                                      avatarImageXFile = File(image.path);
                                    });
                                    context.pop();
                                  }
                                },
                              ),
                            ]),
                      ),
                    ],
                  )),
            ),
          );
        });
  }
}

class ImageSheetWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;
  const ImageSheetWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: context.getWidth(.375),
        // height: 108,
        padding: const EdgeInsets.symmetric(vertical: 30),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              width: 0.50,
              strokeAlign: BorderSide.strokeAlignOutside,
              color: Color(0x4CE0E0E0),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x1C425060),
              blurRadius: 60,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 35,
              color: AppColors.primaryColor,
            ),
            const Gap(5),
            Text(
              text,
              style: AppStyles.general(12, FontWeight.w600)
                  .copyWith(color: AppColors.transparentPrimaryrimary),
            ),
          ],
        ),
      ),
    );
  }
}
