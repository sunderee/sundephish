import 'package:meta/meta.dart';

enum ActionEnum {
  openBrowser(0),
  clickSignUp(1),
  clickForgotPassword(2),
  submittedCredentials(3);

  final int actionID;
  const ActionEnum(this.actionID);
}

@immutable
class RequestModel {
  final String nonce;
  final String groupID;
  final ActionEnum action;

  const RequestModel({
    required this.nonce,
    required this.groupID,
    required this.action,
  });

  Map<String, dynamic> toJson() => {
        'id': nonce,
        'groupID': groupID,
        'action': action.actionID,
      };
}
