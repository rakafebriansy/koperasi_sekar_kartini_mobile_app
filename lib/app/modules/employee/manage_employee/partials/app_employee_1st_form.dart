import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/modules/employee/manage_employee/controllers/employee_manage_employee_controller.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/validators/text_input_validator.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/widget_builder.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_date_input_field.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/components/app_filled_button.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/utils/widgets/fragments/app_text_form_group.dart';

class AppEmployee1stForm extends StatelessWidget {
  const AppEmployee1stForm({super.key, required this.controller});

  final EmployeeManageEmployeeController controller;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.firstFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AppTextFormGroup(
            controller: controller.identityNumberCtrl,
            label: 'NIK',
            maxLines: 1,
            placeholder: 'Masukkan NIK',
            validator: (value) =>
                value.isRequired('NIK') ?? value.exactLength(16, 'NIK'),
          ),
          SizedBox(height: 8.sp),
          AppTextFormGroup(
            controller: controller.nameCtrl,
            label: 'Nama Lengkap',
            maxLines: 1,
            placeholder: 'Masukkan nama',
            validator: (value) =>
                value.isRequired('Nama Lengkap') ??
                value.minLength(3, 'Nama Lengkap'),
          ),
          SizedBox(height: 8.sp),
          AppTextFormGroup(
            controller: controller.memberNumberCtrl,
            label: 'Nomor Anggota',
            maxLines: 1,
            keyboardType: TextInputType.number,
            placeholder: 'Masukkan no anggota',
            validator: (value) =>
                value.isRequired('Nomor Anggota')
          ),
          SizedBox(height: 8.sp),
          poppins(
            'Tanggal Lahir',
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
          AppDateInputField(
            controller: controller.birthDateCtrl,
            placeholder: 'Masukkan tanggal lahir',
            label: 'Tanggal Lahir',
          ),
          SizedBox(height: 8.sp),
                    AppTextFormGroup(
            controller: controller.addressCtrl,
            label: 'Alamat Lengkap',
            maxLines: 2,
            placeholder: 'Masukkan alamat',
            validator: (value) => value.isRequired('Alamat Lengkap'),
          ),
          SizedBox(height: 18.sp),
          AppFilledButton(
            label: 'Lanjut',
            onTap: controller.submitButton,
            width: double.infinity,
          ),
          SizedBox(height: 12.sp),
        ],
      ),
    );
  }
}
