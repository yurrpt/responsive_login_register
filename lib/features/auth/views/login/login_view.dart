import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../../core/common/components/custom_text_field.dart';
import '../../../../core/common/mixin/input_valid_mixin.dart';
import '../../../../core/constants/app/app_constants.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../core/extension/image_convert_extension.dart';
import '../register/register_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with InputValidationMixin {
  bool _isVisible = false;

  void _submit() {
    _formKey.currentState != null && _formKey.currentState!.validate()
        ? () {
            // servise istek atılabilir
          }
        : null;
  }

  bool _value = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstants.honeyWax,
      body: Stack(
        fit: StackFit.loose,
        children: [
          _circleDecor(175, -45, context.dynamicWidth(.125), context.dynamicWidth(.125)), //DX - DY - HEIGHT - WIDTH
          _circleDecor(-5, 222, context.dynamicWidth(.00950), context.dynamicWidth(.00950)),
          _circleDecor(30, 240, context.dynamicWidth(.025), context.dynamicWidth(.025)),
          _positionedLoginText(context, AppConstants.fontFamily),
          _bottomCenterScrollableForm(context, AppConstants.fontFamily)
        ],
      ),
    );
  }

  Positioned _positionedLoginText(BuildContext context, String fontFamily2) {
    return Positioned(
      top: 120,
      child: Padding(
        padding: const Paddings.symmetric(),
        child: Text(
          AppConstants.lgn,
          style: Theme.of(context).textTheme.headline2?.copyWith(
                color: ColorsConstants.white,
                fontFamily: fontFamily2,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }

  Align _bottomCenterScrollableForm(BuildContext context, String fontFamily2) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: AllRadius.only(),
          color: ColorsConstants.white,
        ),
        height: context.dynamicHeight(.650),
        width: context.dynamicWidth(1),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
          ),
          child: _scrollable(context, fontFamily2),
        ),
      ),
    );
  }

  SingleChildScrollView _scrollable(BuildContext context, String fontFamily2) {
    return SingleChildScrollView(
      child: _form(context, fontFamily2),
    );
  }

  Form _form(BuildContext context, String fontFamily2) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          context.emptySizedHeightBoxNormal,
          _emailText(context, fontFamily2),
          context.emptySizedHeightBoxLow3x,
          CustomTextFormField(
              labelText: AppConstants.enterYourEmail,
              validator: combine([
                withMessage(AppConstants.message5, isTextEmpty),
                withMessage(AppConstants.message4, isInvalidEmail),
              ])),
          context.emptySizedHeightBoxLow3x,
          _passwordText(context, fontFamily2),
          context.emptySizedHeightBoxLow3x,
          CustomTextFormField(
              isObscureText: !_isVisible ? true : false,
              suffixIcon: InkWell(
                  overlayColor: MaterialStatePropertyAll(ColorsConstants.transparent),
                  onTap: () {
                    setState(() {
                      _isVisible = !_isVisible;
                    });
                  },
                  child: Icon(_isVisible ? Icons.visibility : Icons.visibility_off)),
              labelText: AppConstants.enterPass,
              validator: combine([
                withMessage(AppConstants.message, isTextEmpty),
                withMessage(AppConstants.message2, isInvalidPassword),
              ])),
          context.emptySizedHeightBoxLow,
          _checkBoxAndForgotPasswordRow(context, fontFamily2),
          _loginButton(context, fontFamily2),
          context.emptySizedHeightBoxLow,
          _dividerRow(context, fontFamily2),
          _orLoginDivider(context, fontFamily2),
          _emptySizedBox(),
          _socialButtons()
        ],
      ),
    );
  }

  Text _emailText(BuildContext context, String fontFamily2) {
    return Text(
      AppConstants.data3,
      style: Theme.of(context).textTheme.headline6?.copyWith(color: ColorsConstants.black, fontWeight: FontWeight.bold, fontFamily: fontFamily2),
    );
  }

  Text _passwordText(BuildContext context, String fontFamily2) {
    return Text(
      AppConstants.data6,
      style: Theme.of(context).textTheme.headline6?.copyWith(color: ColorsConstants.black, fontWeight: FontWeight.bold, fontFamily: fontFamily2),
    );
  }

  Row _checkBoxAndForgotPasswordRow(BuildContext context, String fontFamily2) {
    return Row(
      children: [
        _checkBox(context, fontFamily2),
        _forgotPasswordButton(context, fontFamily2),
      ],
    );
  }

  Expanded _checkBox(BuildContext context, String fontFamily2) {
    return Expanded(
      child: CheckboxListTile(
          autofocus: false,
          contentPadding: EdgeInsets.zero,
          title: Text(
            AppConstants.stayLoggedIn,
            style: Theme.of(context).textTheme.subtitle2?.copyWith(fontFamily: fontFamily2, color: ColorsConstants.black),
          ),
          controlAffinity: ListTileControlAffinity.leading,
          value: _value,
          selected: _value,
          onChanged: (bool? value) {
            setState(() {
              _value = value ?? false;
            });
          }),
    );
  }

  TextButton _forgotPasswordButton(BuildContext context, String fontFamily2) {
    return TextButton(
      onPressed: () {},
      child: Text(
        AppConstants.frgtPass,
        style: Theme.of(context).textTheme.subtitle2?.copyWith(fontFamily: fontFamily2, color: ColorsConstants.black),
      ),
    );
  }

  Center _loginButton(BuildContext context, String fontFamily2) {
    return Center(
      child: ElevatedButton(
        onPressed: _submit,
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 55),
            shape: RoundedRectangleBorder(borderRadius: AllRadius.buttonRadius()),
            backgroundColor: ColorsConstants.ripePumpkin,
            elevation: 0,
            shadowColor: ColorsConstants.transparent),
        child: Text(
          AppConstants.lgn,
          style: Theme.of(context).textTheme.headline6?.copyWith(
                color: ColorsConstants.white,
                fontFamily: fontFamily2,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }

  Row _dividerRow(BuildContext context, String fontFamily2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _registerText(context, fontFamily2),
        _hereText(context, fontFamily2),
        context.emptySizedHeightBoxNormal,
      ],
    );
  }

  Center _registerText(BuildContext context, String fontFamily2) {
    return Center(
      child: Text(
        AppConstants.dontHaveAcc,
        textAlign: TextAlign.center,
        softWrap: false,
        overflow: TextOverflow.fade,
        style: Theme.of(context).textTheme.subtitle2?.copyWith(fontFamily: fontFamily2, color: ColorsConstants.black),
      ),
    );
  }

  GestureDetector _hereText(BuildContext context, String fontFamily2) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (context) => const RegisterView(),
            ));
      },
      child: Text(
        AppConstants.here,
        style:
            Theme.of(context).textTheme.subtitle2?.copyWith(fontFamily: fontFamily2, color: ColorsConstants.ripePumpkin, fontWeight: FontWeight.bold),
      ),
    );
  }

  Row _orLoginDivider(BuildContext context, String fontFamily2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          child: Divider(
            indent: 20.0,
            endIndent: 10.0,
            thickness: 1,
          ),
        ),
        Text(AppConstants.orLogin,
            style:
                Theme.of(context).textTheme.subtitle2?.copyWith(fontFamily: fontFamily2, color: ColorsConstants.grey, fontWeight: FontWeight.w600)),
        const Expanded(
          child: Divider(
            indent: 10.0,
            endIndent: 20.0,
            thickness: 1,
          ),
        ),
      ],
    );
  }

  SizedBox _emptySizedBox() {
    return const SizedBox(
      height: 25,
    );
  }

  Row _socialButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(child: IconButton(onPressed: () {}, icon: ImageEnums.facebook.toPng, iconSize: context.dynamicHeight(.0300))),
        const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
        Flexible(child: IconButton(onPressed: () {}, icon: ImageEnums.gmail.toPng, iconSize: context.dynamicHeight(.0300))),
      ],
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
