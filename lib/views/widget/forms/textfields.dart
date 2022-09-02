import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';

import '../../../../app_config/colors.dart';
import '../nil.dart';

class PrimaryTextField extends HookWidget {
  final String? hintTxt;
  final String? initialValue;
  final String? keyName;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final TextInputType? textInputType;
  final int? maxLength;
  final int? maxLine;
  final String? label;
  final String? errorText;
  final IconData? prefixIcon;
  final Widget? innerIcon;
  final double? borderRadius;
  final Widget? suffixIcon;
  final bool isPassword;
  final bool? isReadOnly;
  final GlobalKey<FormBuilderFieldState>? fieldKey;
  final bool enableBorder;
  final Color? fillColor;
  final TextEditingController? controller;
  final double? labelHeight;
  final bool enable;

  // final Function onSaved;

  const PrimaryTextField(
      {this.enable = true,
      required this.onSaved,
      this.innerIcon,
      this.label,
      this.maxLine,
      this.validator,
      this.initialValue,
      this.borderRadius,
      this.errorText,
      this.prefixIcon,
      this.suffixIcon,
      this.hintTxt,
      this.keyName,
      this.controller,
      this.fillColor,
      this.labelHeight,
      this.enableBorder = false,
      this.isReadOnly,
      this.isPassword = false,
      this.textInputType,
      this.maxLength,
      this.fieldKey});

  @override
  Widget build(BuildContext context) {
    final isPasswordVisible = useState(isPassword);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (label != null)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (prefixIcon != null)
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Icon(
                    prefixIcon,
                  ),
                ),
              Text(
                '${label}',
              ),
            ],
          ),
        SizedBox(
          height: labelHeight ?? 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: FormBuilderTextField(
            controller: controller,
            enabled: enable,
            key: fieldKey,
            initialValue: initialValue,
            keyboardType: textInputType ?? TextInputType.text,
            obscureText: isPasswordVisible.value,
            style: Theme.of(context).textTheme.bodyText1,
            readOnly: isReadOnly ?? false,
            // enabled: isTextFieldEnabled??true,
            decoration: InputDecoration(
              prefixIcon: innerIcon,
              fillColor: fillColor,
              isDense: true,
              errorText: errorText,
              counterText: "",
              errorMaxLines: 2,
              contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
              // labelText:
              hintText: hintTxt ?? "",
              // hintStyle:Theme.of(context).textTheme.bodyText1 ,
              // "Email or Phone",
              // labelStyle: AppTextStyle.textboxtext,
              filled: true,
              errorBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(borderRadius ?? 5.0)),
                borderSide: const BorderSide(color: Colors.red),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(borderRadius ?? 5.0)),
                borderSide: BorderSide(
                    color: enableBorder
                        ? Theme.of(context).primaryColor
                        : Colors.transparent),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(borderRadius ?? 5.0)),
                borderSide: BorderSide(
                  color: enableBorder
                      ? Theme.of(context).primaryColor
                      : Colors.transparent,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(borderRadius ?? 5.0)),
                borderSide: BorderSide(
                  color: enableBorder
                      ? Theme.of(context).primaryColor
                      : Colors.transparent,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(borderRadius ?? 5.0)),
                borderSide: BorderSide(
                    color: enableBorder
                        ? Theme.of(context).primaryColor
                        : Colors.transparent),
              ),
              suffixIcon: isPassword
                  ? GestureDetector(
                      onTap: () {
                        isPasswordVisible.value = !isPasswordVisible.value;
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Icon(isPasswordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ))
                  : Container(
                      padding: const EdgeInsets.all(15),
                      child: suffixIcon ?? const Text('')),
            ),
            onSaved: onSaved,
            maxLines: maxLine??1,
            maxLength: maxLength,
            validator: validator,
            name: keyName ?? "null",
          ),
        ),
      ],
    );
  }
}

class PrimaryDropDownField extends HookWidget {
  final String hintTxt;
  final String? initialValue;
  final List<DropdownMenuItem<String>> items;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String?> onChanged;
  final TextInputType? textInputType;
  final int? maxLength;
  final String label;
  final GlobalKey<FormBuilderFieldState>? fieldKey;
  final IconData? prefixIcon;
  final double? borderRadius;
  final double? labelHeight;


  // final Function onSaved;

  const PrimaryDropDownField(
      {required this.items,
      required this.label,
      this.validator,
      this.initialValue,
      required this.onSaved,
      required this.onChanged,
      this.borderRadius,

      this.prefixIcon,
      required this.hintTxt,
      this.labelHeight,
      this.textInputType,
      this.maxLength,
      this.fieldKey});

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (prefixIcon != null)
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Icon(
                  prefixIcon,
                ),
              ),
            Text(
              label,
            ),
          ],
        ),
        SizedBox(
          height: labelHeight ?? 10,
        ),
        Container(
          // alignment: Alignment.centerLeft,
          child: FormBuilderDropdown<String>(
            key: fieldKey,
            initialValue: initialValue,
            style: Theme.of(context).textTheme.bodyText1,
            name: '',
            isExpanded: true,
            hint: Text(
              hintTxt,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            decoration:  const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
            ),
            // initialValue: 'Male',
            allowClear: true,
            onSaved: onSaved,
            isDense: true,
            onChanged: onChanged,
            validator: validator,
            items: items,
          ),
        ),
      ],
    );
  }
}
class SecondaryTextField extends HookWidget {
  final String? hintTxt;
  final String? initialValue;
  final String? keyName;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final TextInputType? textInputType;
  final int? maxLength;
  final String? label;
  final String? errorText;
  final Widget? prefixIcon;
  final double? borderRadius;
  final Widget? suffixIcon;
  final bool? isReadOnly;
  final GlobalKey<FormBuilderFieldState>? fieldKey;
  final bool enableBorder;
  final Color? fillColor;
  final TextEditingController? controller;
  final double? labelHeight;
  final bool isPassword;

  // final Function onSaved;

  const SecondaryTextField(
      {required this.onSaved,
        this.label,
        this.validator,
        this.initialValue,
        this.borderRadius,
        this.errorText,
        this.isPassword = false,
        this.prefixIcon,
        this.suffixIcon,
        this.hintTxt,
        this.keyName,
        this.controller,
        this.fillColor,
        this.labelHeight,
        this.enableBorder = false,
        this.isReadOnly,
        this.textInputType,
        this.maxLength,
        this.fieldKey});

  @override
  Widget build(BuildContext context) {
    final isPasswordVisible = useState(isPassword);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (label != null)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (prefixIcon != null)
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: prefixIcon,
                ),
              Text(
                '${label}',
              ),
            ],
          ),
        SizedBox(
          height: labelHeight,
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: FormBuilderTextField(
            controller: controller,
            key: fieldKey,
            initialValue: initialValue,
            keyboardType: textInputType ?? TextInputType.text,
            obscureText: isPasswordVisible.value,
            style: Theme.of(context).textTheme.bodyText1,
            readOnly: isReadOnly ?? false,
            decoration: InputDecoration(
              isDense: true,
              fillColor: fillColor??Colors.white,
              errorText: errorText,
              counterText: "",
              errorMaxLines: 2,
              contentPadding: const EdgeInsets.symmetric(horizontal: 2.0,vertical: 8.0),
              // labelText:
              hintText: hintTxt ?? "",
              // hintStyle:Theme.of(context).textTheme.bodyText1 ,
              // "Email or Phone",
              // labelStyle: AppTextStyle.textboxtext,
              filled: true,
              disabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
              ),
              focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green.withOpacity(0.5)),
              ),
              errorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
              ),
              border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.withOpacity(0.5))),
              suffixIcon: isPassword
                  ? GestureDetector(
                  onTap: () {
                    isPasswordVisible.value = !isPasswordVisible.value;
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Icon(isPasswordVisible.value
                        ? Icons.visibility
                        : Icons.visibility_off),
                  ))
                  : Container(
                  padding: const EdgeInsets.all(15),
                  child: suffixIcon ?? const Text('')),

            ),
            onSaved: onSaved,
            maxLength: maxLength,
            validator: validator,
            name: keyName ?? "null",
          ),
        ),
      ],
    );
  }
}

class SecondaryDropDown extends HookWidget {
  final List<String> items;

  const SecondaryDropDown({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dropdownValue = useState(items[0]);
    return DropdownButton<String>(
      isDense: true,
      value: dropdownValue.value,
      // iconDisabledColor: primaryColor,
      icon: Padding(
        padding: const EdgeInsets.only(left: 6),
        child: Icon(
          Icons.keyboard_arrow_down,
          color: Theme.of(context).primaryColor,
        ),
      ),
      iconEnabledColor: AppColors.primaryColor(1),
      iconSize: 20,
      elevation: 16,
      style: Theme.of(context).textTheme.bodyText2,
      underline: Container(
        height: 2,
        color: Colors.transparent,
      ),
      onChanged: (String? newValue) {
        dropdownValue.value = newValue ?? '';
      },
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Text(
              value,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        );
      }).toList(),
    );
  }
}



// class SlideToVerifyField extends StatelessWidget {
//   final String? hintTxt;
//   final FormFieldSetter<String> onSaved;
//   final FormFieldValidator<String>? validator;
//   final bool? isPassword;
//   final TextInputType? textInputType;
//   final int? maxLength;
//   final String? label;
//   final Function? onSuffixTap;
//
//   // final Function onSaved;
//
//   const SlideToVerifyField(
//       {required this.onSaved,
//         this.validator,
//         this.hintTxt,
//         this.label,
//         this.isPassword,
//         this.textInputType,
//         this.onSuffixTap,
//         this.maxLength});
//
//   @override
//   Widget build(BuildContext context) {
//     return ResponsiveBuilder(builder: (context, config) {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           if (label != null)
//             Text(
//               '$label',
//               style: Theme.of(context).textTheme.bodyText2,
//             ),
//           if (label != null) SizedBox(height: 20,),
//           Container(
//             alignment: Alignment.centerLeft,
//             child: FormBuilderTextField(
//               keyboardType: textInputType ?? TextInputType.text,
//               obscureText: isPassword ?? false,
//               style: Theme.of(context).textTheme.bodyText1,
//               decoration: InputDecoration(
//                   counterText: "",
//                   errorMaxLines: 2,
//                   contentPadding: const EdgeInsets.symmetric(
//                       vertical: 15.0, horizontal: 10.0),
//                   // labelText:
//                   hintText: hintTxt ?? "",
//                   hintStyle: Theme.of(context).textTheme.bodyText2,
//                   // "Email or Phone",
//                   // labelStyle: AppTextStyle.textboxtext,
//                   filled: true,
//                   errorBorder: const OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(5.0)),
//                     borderSide: BorderSide(color: Colors.red),
//                   ),
//                   focusedErrorBorder: OutlineInputBorder(
//                     borderRadius: const BorderRadius.all(Radius.circular(5.0)),
//                     // borderSide: BorderSide(color: AppColors.secondaryColor(1)),
//                   ),
//                   enabledBorder: const OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(5.0)),
//                     borderSide: BorderSide(
//                       color: Color(0xffececec),
//                     ),
//                   ),
//                   focusedBorder: const OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(5.0)),
//                     borderSide: BorderSide(color: Color(0xffECECEC)),
//                   ),
//                   suffixIcon: Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 15.0),
//                     child: InkWell(
//                       onTap: onSuffixTap!=null?onSuffixTap:null,
//                       child: Text(
//                         'Resend',
//                         style: themeData.textTheme.bodyText2.apply(
//                           color: AppColors.colorBlack(0.4),
//                         ),
//                       ),
//                     ),
//                   )),
//               onSaved: onSaved,
//               maxLength: maxLength,
//               validator: validator,
//               name: "null",
//             ),
//           ),
//         ],
//       );
//     });
//   }
// }

BoxDecoration kBoxDecoration(BuildContext context) {
  return BoxDecoration(
    color: Theme.of(context).backgroundColor,
    borderRadius: BorderRadius.circular(25.0),
    boxShadow: const [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 6.0,
        offset: Offset(0, 2),
      ),
    ],
  );
}

//Raw Dropdown and date picker
dynamic formField(BuildContext context) {
  return [
    FormBuilderDropdown(
      style: Theme.of(context).textTheme.bodyText1,
      name: 'gender',
      decoration: InputDecoration(
        labelStyle: Theme.of(context).textTheme.bodyText1,
        labelText: 'Gender',
      ),
      // initialValue: 'Male',
      allowClear: true,
      // onSaved: (value) {
      //   _registrationParams.general.gender = value;
      // },
      // validator: FormBuilderValidators.compose(
      //     [FormBuilderValidators.required(context)]),
      items: ['Male', 'Female', 'Other']
          .map((gender) => DropdownMenuItem(
                value: gender,
                child: Text(gender),
              ))
          .toList(),
    ),
    FormBuilderDateTimePicker(
      name: 'Date',
      style: Theme.of(context).textTheme.bodyText1,
      format: DateFormat('yyyy-MM-dd'),
      // onChanged: _onChanged,
      inputType: InputType.date,
      decoration: InputDecoration(
        labelStyle: Theme.of(context).textTheme.bodyText1,
        labelText: 'Select DOB',
      ),
      initialDate: DateTime.now(),
      initialValue: DateTime.now(),
      onSaved: (value) {
        // _registrationParams.general.dob = value.toString();
      },
      // enabled: true,
    ),
  ];
}
