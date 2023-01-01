import 'package:flutter/material.dart';

import '../../constants/app/app_constants.dart';
import '../../constants/colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required String labelText,
    String? hintText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    TextInputType? textInputType,
    bool isObscureText = false,
    String? Function(String?)? validator,
    TextEditingController? controller,
  })  : _labelText = labelText,
        _hintText = hintText,
        _prefixIcon = prefixIcon,
        _suffixIcon = suffixIcon,
        _validator = validator,
        _isObscureText = isObscureText,
        _passwordConfirmController = controller,
        _textInputType = textInputType,
        super(key: key);

  final TextEditingController? _passwordConfirmController;
  final String _labelText;

  final String? _hintText;
  final Widget? _prefixIcon;
  final Widget? _suffixIcon;
  final bool _isObscureText;
  final TextInputType? _textInputType;
  final String? Function(String?)? _validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: _passwordConfirmController,
      obscureText: _isObscureText,
      keyboardType: _textInputType,
      decoration: InputDecoration(
        labelText: _labelText,
        hintText: _hintText,
        prefixIcon: _prefixIcon,
        suffixIcon: _suffixIcon,
        labelStyle: Theme.of(context)
            .textTheme
            .subtitle1
            ?.copyWith(color: ColorsConstants.grey, fontFamily: AppConstants.fontFamily, fontWeight: FontWeight.w500),
      ),
      validator: _validator,
    );
  }
}
