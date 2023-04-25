import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sp_util/sp_util.dart';

import '../../res/colors.dart';
import '../../res/constant.dart';
import '../../res/dimens.dart';
import '../../res/gaps.dart';
import '../../routers/fluro_navigator.dart';
import '../../routers/routers.dart';
import '../../util/change_notifier_manage.dart';
import '../../util/other_utils.dart';
import '../../util/toast_utils.dart';
import '../../widgets/my_app_bar.dart';
import '../../widgets/my_button.dart';
import '../../widgets/my_scroll_view.dart';
import '../widget/my_text_field.dart';

/// 实现Login Page，继承自StatefulWidget ，两个输入框手机号、验证码，一个获取验证码按钮，点击获取验证吗提示60秒倒计时，获取验证码按钮不可点击  ，一个登录按钮，点击登录按钮验证手机号是否正确，验证是否输入了验证码，验证通过后跳转到主页
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with ChangeNotifierMixin<LoginPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _verifyCodeController = TextEditingController();
  final FocusNode _nodeText1 = FocusNode();
  final FocusNode _nodeText2 = FocusNode();
  bool _clickable = false;

  @override
  Map<ChangeNotifier, List<VoidCallback>?>? changeNotifier() {
    final List<VoidCallback> callbacks = <VoidCallback>[_verify];
    return <ChangeNotifier, List<VoidCallback>?>{
      _nameController: callbacks,
      _verifyCodeController: callbacks,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: MyAppBar(
      //   isBack: false,
      //   // actionName: DeerLocalizations.of(context)!.verificationCodeLogin,
      //   actionName: "getVerificationCode",
      //   onPressed: () {
      //    // NavigatorUtils.push(context, LoginRouter.smsLoginPage);
      //   },
      // ),
      body: MyScrollView(
        keyboardConfig: Utils.getKeyboardActionsConfig(
            context, <FocusNode>[_nodeText1, _nodeText2]),
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0),
        children: _buildBody,
      ),
    );
    // return Container();
  }

  ///两个输入框手机号、验证码，一个获取验证码按钮，点击获取验证吗提示60秒倒计时，获取验证码按钮不可点击  ，一个登录按钮，点击登录按钮验证手机号是否正确，验证是否输入了验证码
  List<Widget> get _buildBody => <Widget>[
        Gaps.vGap32,
        //居右显示，右边距为32
        Align(
          alignment: Alignment.centerRight,
          child: InkWell(
            onTap: () {
              _loginByVisitor();
            },
            child: const Text(
              '游客',
              style: TextStyle(fontSize: 14.0, color: Colours.color_878787),
            ),
          ),
        ),
        Gaps.vGap100,
        const Text(
          '登录',
          style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Colours.color_323232),
        ),
        Gaps.vGap16,
        const Text(
          '欢迎您的到来，请填写你的登录信息',
          style: TextStyle(fontSize: 12.0, color: Colours.color_878787),
        ),
        Gaps.vGap50,
        MyTextField(
          key: const Key('phone'),
          focusNode: _nodeText1,
          controller: _nameController,
          maxLength: 11,
          keyboardType: TextInputType.phone,
          hintText: '请输入手机号',
        ),
        Gaps.vGap8,
        MyTextField(
          key: const Key('code'),
          focusNode: _nodeText2,
          controller: _verifyCodeController,
          getVCode: () {
            //先验证是否输入了手机号
            if (_nameController.text.isEmpty ||
                _nameController.text.length < 11) {
              Toast.show('请输入正确的手机号');
              return Future<bool>.value(false);
            }
            return Future<bool>.value(true);
          },
          maxLength: 6,
          keyboardType: TextInputType.number,
          hintText: '请输入验证码',
        ),
        Gaps.vGap24,
        MyButton(
          key: const Key('login'),
          onPressed: _clickable ? _login : null,
          text: '登录',
        ),
      ];

  void _verify() {
    final String name = _nameController.text;
    final String verifyCode = _verifyCodeController.text;
    bool clickable = true;
    if (name.isEmpty || name.length < 11) {
      clickable = false;
    }
    if (verifyCode.isEmpty) {
      clickable = false;
    }

    /// 状态不一样再刷新，避免不必要的setState
    if (clickable != _clickable) {
      setState(() {
        _clickable = clickable;
      });
    }
  }

  void _login() {
    Toast.show("登录");
    // SpUtil.putString(Constant.phone, _nameController.text);
    NavigatorUtils.push(context, Routes.home, clearStack: true);
  }

  void _loginByVisitor() {
    Toast.show("游客登录");
    // SpUtil.putString(Constant.phone, _nameController.text);
    NavigatorUtils.push(context, Routes.home, clearStack: true);
  }
}
