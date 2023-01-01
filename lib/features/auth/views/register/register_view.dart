import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../../core/common/components/custom_text_field.dart';
import '../../../../core/common/mixin/input_valid_mixin.dart';
import '../../../../core/constants/app/app_constants.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/extension/context_extension.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> with InputValidationMixin {
  bool _isVisible = false;
  void _submit() {
    _formKey.currentState != null && _formKey.currentState!.validate() ? {} : {};
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

  @override
  void initState() {
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _phoneController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, backgroundColor: ColorsConstants.transparent),
      backgroundColor: ColorsConstants.honeyWax,
      body: Stack(
        fit: StackFit.loose,
        children: [
          _circleDecor(175, -45, context.dynamicWidth(.125), context.dynamicWidth(.125)), //DX - DY - HEIGHT - WIDTH
          _circleDecor(-5, 222, context.dynamicWidth(.00950), context.dynamicWidth(.00950)),
          _circleDecor(30, 240, context.dynamicWidth(.025), context.dynamicWidth(.025)),
          _positionedRegisterText(AppConstants.data5, context),
          _registerCard(AppConstants.data)
        ],
      ),
    );
  }

  Align _registerCard(String data) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(25), topLeft: Radius.circular(25)),
          color: ColorsConstants.white,
        ),
        height: context.dynamicHeight(.650),
        width: context.dynamicWidth(1),
        child: Padding(
          padding: const Paddings.symmetric(),
          child: _scrollableForm(
              context,
              AppConstants.data4,
              AppConstants.labelText6,
              AppConstants.message6,
              AppConstants.data3,
              AppConstants.labelText5,
              AppConstants.message5,
              AppConstants.message4,
              AppConstants.data2,
              AppConstants.labelText4,
              AppConstants.message3,
              AppConstants.data6,
              AppConstants.labelText2,
              AppConstants.message,
              AppConstants.message2,
              AppConstants.confirmPassword,
              AppConstants.labelText3,
              AppConstants.data),
        ),
      ),
    );
  }

  Positioned _positionedRegisterText(String data5, BuildContext context) {
    return Positioned(
      top: 120,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
        ),
        child: Text(
          data5,
          style: Theme.of(context).textTheme.headline2?.copyWith(
                color: ColorsConstants.white,
                fontFamily: AppConstants.fontFamily,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }

  SingleChildScrollView _scrollableForm(
      BuildContext context,
      String data4,
      String labelText6,
      String message6,
      String data3,
      String labelText5,
      String message5,
      String message4,
      String data2,
      String labelText4,
      String message3,
      String data6,
      String labelText2,
      String message,
      String message2,
      String confirmPassword,
      String labelText3,
      String data) {
    return SingleChildScrollView(
      child: _form(
        context,
      ),
    );
  }

  Form _form(
    BuildContext context,
  ) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          context.emptySizedHeightBoxNormal,
          _nameText(AppConstants.data4, context),
          _nameTextField(AppConstants.labelText6, AppConstants.message6),
          context.emptySizedHeightBoxLow3x,
          _emailText(AppConstants.data3, context),
          _emailTextField(AppConstants.labelText5, AppConstants.message5, AppConstants.message4),
          context.emptySizedHeightBoxLow3x,
          _phoneText(AppConstants.data2, context),
          _phoneTextField(AppConstants.labelText4, AppConstants.message3),
          context.emptySizedHeightBoxLow3x,
          _passwordText(AppConstants.data6, context),
          _passwordTextField(AppConstants.labelText2, AppConstants.message, AppConstants.message2),
          context.emptySizedHeightBoxLow3x,
          _confirmPasswordText(AppConstants.confirmPassword, context),
          _passwordCorrectTextField(AppConstants.labelText3),
          context.emptySizedHeightBoxLow3x,
          _registerButton(AppConstants.data, context),
          context.emptySizedHeightBoxLow,
        ],
      ),
    );
  }

  Text _nameText(String data4, BuildContext context) {
    return Text(
      data4,
      style: Theme.of(context).textTheme.headline6?.copyWith(
            color: ColorsConstants.black,
            fontWeight: FontWeight.bold,
            fontFamily: AppConstants.fontFamily,
          ),
    );
  }

  CustomTextFormField _nameTextField(String labelText6, String message6) {
    return CustomTextFormField(
      labelText: labelText6,
      controller: _nameController,
      validator: combine([
        withMessage(message6, isTextEmpty),
      ]),
    );
  }

  Text _emailText(String data3, BuildContext context) {
    return Text(
      data3,
      style: Theme.of(context).textTheme.headline6?.copyWith(
            color: ColorsConstants.black,
            fontWeight: FontWeight.bold,
            fontFamily: AppConstants.fontFamily,
          ),
    );
  }

  CustomTextFormField _emailTextField(String labelText5, String message5, String message4) {
    return CustomTextFormField(
      labelText: labelText5,
      controller: _emailController,
      validator: combine([
        withMessage(message5, isTextEmpty),
        withMessage(message4, isInvalidEmail),
      ]),
    );
  }

  Text _phoneText(String data2, BuildContext context) {
    return Text(
      data2,
      style: Theme.of(context).textTheme.headline6?.copyWith(
            color: ColorsConstants.black,
            fontWeight: FontWeight.bold,
            fontFamily: AppConstants.fontFamily,
          ),
    );
  }

  CustomTextFormField _phoneTextField(String labelText4, String message3) {
    return CustomTextFormField(
      labelText: labelText4,
      controller: _phoneController,
      textInputType: TextInputType.number,
      validator: combine([
        withMessage(message3, isTextEmpty),
      ]),
    );
  }

  Text _passwordText(String data6, BuildContext context) {
    return Text(
      data6,
      style: Theme.of(context).textTheme.headline6?.copyWith(
            color: ColorsConstants.black,
            fontWeight: FontWeight.bold,
            fontFamily: AppConstants.fontFamily,
          ),
    );
  }

  Text _confirmPasswordText(String confirmPassword, BuildContext context) {
    return Text(
      confirmPassword,
      style: Theme.of(context).textTheme.headline6?.copyWith(
            color: ColorsConstants.black,
            fontWeight: FontWeight.bold,
            fontFamily: AppConstants.fontFamily,
          ),
    );
  }

  CustomTextFormField _passwordTextField(String labelText2, String message, String message2) {
    return CustomTextFormField(
        isObscureText: !_isVisible ? true : false,
        controller: _passwordController,
        suffixIcon: InkWell(
            overlayColor: MaterialStatePropertyAll(ColorsConstants.transparent),
            onTap: () {
              setState(() {
                _isVisible = !_isVisible;
              });
            },
            child: Icon(_isVisible ? Icons.visibility : Icons.visibility_off)),
        labelText: labelText2,
        validator: combine([
          withMessage(AppConstants.message, isTextEmpty),
          withMessage(AppConstants.message2, isInvalidPassword),
        ]));
  }

  CustomTextFormField _passwordCorrectTextField(String labelText3) {
    return CustomTextFormField(
        isObscureText: !_isVisible ? true : false,
        suffixIcon: InkWell(
            overlayColor: MaterialStatePropertyAll(ColorsConstants.transparent),
            onTap: () {
              setState(() {
                _isVisible = !_isVisible;
              });
            },
            child: Icon(_isVisible ? Icons.visibility : Icons.visibility_off)),
        labelText: labelText3,
        controller: _confirmPasswordController,
        validator: combine([
          withMessage(AppConstants.message, isTextEmpty),
          (val) {
            if (val != _passwordController.text) {
              return AppConstants.data7;
            }
            return null;
          },
        ]));
  }

  Center _registerButton(String data, BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: _submit,
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 55),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            backgroundColor: ColorsConstants.ripePumpkin,
            elevation: 0,
            shadowColor: ColorsConstants.transparent),
        child: Text(
          data,
          style: Theme.of(context).textTheme.headline6?.copyWith(
                color: ColorsConstants.white,
                fontFamily: AppConstants.fontFamily,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }

  Transform _circleDecor(double dx, double dy, double height, double width) {
    return Transform.translate(
      offset: Offset(dx, dy),
      child: SizedBox(
        height: height,
        width: width,
        child: DecoratedBox(decoration: BoxDecoration(color: Colors.white12.withOpacity(.130), shape: BoxShape.circle)),
      ),
    );
  }
}
