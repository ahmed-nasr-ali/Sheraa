import 'package:flutter/material.dart';
import 'package:sheraa/locale/app_localizations.dart';
import 'package:sheraa/utils/commons.dart';
import 'package:validators/validators.dart';

mixin ValidationMixin<T extends StatefulWidget> on State<T> {
  String _password = '';
  String? validateUserName(String? userName) {
    if (userName!.trim().length == 0) {
      return AppLocalizations.of(context)!.translate('user_name_validation');
    }
    return null;
  }

  String? validateUserFamilyName(String? familyname) {
    if (familyname!.trim().length == 0) {
      return AppLocalizations.of(context)!
          .translate('User_Family_name_validation');
    }
    return null;
  }

  String? validateOrganizationName(String organizationName) {
    if (organizationName.trim().length == 0) {
      return AppLocalizations.of(context)!
          .translate('organization_name_validation');
    }
    return null;
  }

  String? validateSenderName(String userName) {
    if (userName.trim().length == 0) {
      return AppLocalizations.of(context)!.translate('sender_name_validation');
    }
    return null;
  }

  String? validateTransferAmount(String userName) {
    if (userName.trim().length == 0) {
      return AppLocalizations.of(context)!
          .translate('transfer_amount_validation');
    }
    return null;
  }

  String? validateFirstName(String fName) {
    if (fName.trim().length == 0) {
      return AppLocalizations.of(context)!.translate('first_name_validation');
    }
    return null;
  }

  String? validateSecondName(String secondName) {
    if (secondName.trim().length == 0) {
      return AppLocalizations.of(context)!.translate('second_name_validation');
    }
    return null;
  }

  String? validateNumberId(String noId) {
    if (noId.trim().length == 0) {
      return AppLocalizations.of(context)!.translate('identity_no_validation');
    }
    return null;
  }

  String? validateNationality(String nationality) {
    if (nationality.trim().length == 0) {
      return AppLocalizations.of(context)!.translate('nationality_validation');
    }
    return null;
  }

  String? validateCompanyName(String companyName) {
    if (companyName.trim().length == 0) {
      return AppLocalizations.of(context)!.translate('company_name_validation');
    }
    return null;
  }

  String? validateAddress(String address) {
    if (address.trim().length == 0) {
      return AppLocalizations.of(context)!.translate('address_validation');
    }
    return null;
  }

  String? validateContactNo(String contactNo) {
    if (contactNo.trim().length == 0 || !isNumeric(contactNo)) {
      return AppLocalizations.of(context)!.translate('contact_no_validation');
    }
    return null;
  }

  String? validateResponsibleName(String responsibleName) {
    if (responsibleName.trim().length == 0) {
      return AppLocalizations.of(context)!
          .translate('responsible_name_validation');
    }
    return null;
  }

  String? validateNoOfRegistrationCommercial(String noOfRegistration) {
    if (noOfRegistration.trim().length == 0 || !isNumeric(noOfRegistration)) {
      return AppLocalizations.of(context)!
          .translate('no_of_registration_commercial_validation');
    }
    return null;
  }

  String? validateNoOfTaxFile(String noOfTaxFile) {
    if (noOfTaxFile.trim().length == 0 || !isNumeric(noOfTaxFile)) {
      return AppLocalizations.of(context)!
          .translate('no_of_tax_file_validation');
    }
    return null;
  }

  String? validateUserEmail(String? userEmail) {
    if (userEmail!.trim().length == 0 || (!isEmail(userEmail))) {
      return AppLocalizations.of(context)!.translate('email_validation');
    }

    return null;
  }

  String? validateOrderDetials(String orderDetials) {
    if (orderDetials.trim().length == 0) {
      return AppLocalizations.of(context)!
          .translate('order_details_validation');
    }
    return null;
  }

  String? validateActivationCode(String activationCode) {
    if (activationCode.trim().length == 0) {
      return AppLocalizations.of(context)!
          .translate('activation_code_validation');
    }
    return null;
  }

  String? validateOldPassword(String oldPassword) {
    if (oldPassword.trim().length == 0) {
      return AppLocalizations.of(context)!.translate('old_password_validation');
    }
    return null;
  }

  String? validatePassword(String? password) {
    _password = password!;
    if (password.trim().length == 0) {
      return AppLocalizations.of(context)!.translate('password_validation');
    }
    return null;
  }

  String? validateConfirmPassword(String? confirmPassword) {
    if (confirmPassword?.trim().length == 0) {
      return AppLocalizations.of(context)!
          .translate('confirm_password_validation');
    } else if (_password != confirmPassword) {
      return AppLocalizations.of(context)!.translate('Password_not_identical');
    }
    return null;
  }

  String? validateUserPhone(String? phone) {
    if (phone!.trim().length == 0 || !isNumeric(phone)) {
      return AppLocalizations.of(context)!.translate('phone_no_validation');
    }else if(phone.trim().length<11){
      return AppLocalizations.of(context)!.translate('phone_short');
    }
    return null;
  }

  String? validateSearch(String message) {
    if (message.trim().length == 0) {
      return AppLocalizations.of(context)!.translate('search_validation_msg');
    }
    return null;
  }

  String? validateMsg(String message) {
    if (message.trim().length == 0) {
      return AppLocalizations.of(context)!.translate('msg_validation');
    }
    return null;
  }

  String? validateComment(String message) {
    if (message.trim().length == 0) {
      return AppLocalizations.of(context)!.translate('comment_validation');
    }
    return null;
  }

  String? validateSpecialization(String specialization) {
    if (specialization.trim().length == 0) {
      return AppLocalizations.of(context)!
          .translate('specialization_validation');
    }
    return null;
  }

  bool checkValidationOfMemberReservation(BuildContext context,
      {String? date,
      String? identityType,
      TimeOfDay? fromTime,
      TimeOfDay? toTime}) {
    if (date == null) {
      Commons.showToast(
          context: context,
          message: AppLocalizations.of(context)!.translate('date_validation'),
          color: Colors.red);
      return false;
    } else if (identityType == null) {
      Commons.showToast(
          context: context,
          message: AppLocalizations.of(context)!
              .translate('identity_type_validation'),
          color: Colors.red);
      return false;
    } else if (fromTime == null) {
      Commons.showToast(
          context: context,
          message:
              AppLocalizations.of(context)!.translate('from_time_validation'),
          color: Colors.red);
      return false;
    } else if (toTime == null) {
      Commons.showToast(
          context: context,
          message:
              AppLocalizations.of(context)!.translate('to_time_validation'),
          color: Colors.red);
      return false;
    }
    return true;
  }
}
