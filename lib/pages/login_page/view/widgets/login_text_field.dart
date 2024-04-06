part of '../login_page.dart';

class LoginTextFieldWidget extends StatefulWidget {
  const LoginTextFieldWidget({super.key});

  @override
  State<LoginTextFieldWidget> createState() => _LoginTextFieldWidgetState();
}

class _LoginTextFieldWidgetState extends State<LoginTextFieldWidget> {
  late final GlobalKey<FormState> formKey;
  late final TextEditingController _userNameController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    _initControllers();
    super.initState();
  }

  void _initControllers() {
    formKey = GlobalKey<FormState>();
    _passwordController = TextEditingController();
    _userNameController = TextEditingController();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.sizeOf(context).width;
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: TextFormField(
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return "*Required Value";
                }
                return null;
              },
              controller: _userNameController,
              textInputAction: TextInputAction.next,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: MediaQuery.sizeOf(context).width * 0.04,
                  ),
              decoration: InputDecoration(
                filled: false,
                alignLabelWithHint: true,
                labelText: "Username",
                labelStyle: TextFieldStyles.getlabelTextStyle(context),
                errorStyle: TextFieldStyles.geterrorTextStyle(context),
                enabledBorder: TextFieldStyles.enabledTextFieldBorderStyle(),
                border: TextFieldStyles.selectedTextFieldBorderStyle(),
              ),
            ),
          ),
          const SizedBox(height: 18.0),
          Flexible(
            child: TextFormField(
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return "*Required Value";
                }
                return null;
              },
              controller: _passwordController,
              obscureText: true,
              textInputAction: TextInputAction.go,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: MediaQuery.sizeOf(context).width * 0.04,
                  ),
              decoration: InputDecoration(
                filled: false,
                alignLabelWithHint: true,
                labelText: "Password",
                labelStyle: TextFieldStyles.getlabelTextStyle(context),
                errorStyle: TextFieldStyles.geterrorTextStyle(context),
                enabledBorder: TextFieldStyles.enabledTextFieldBorderStyle(),
                border: TextFieldStyles.selectedTextFieldBorderStyle(),
              ),
            ),
          ),
          const SizedBox(height: 24.0),
          ElevatedButton(
            onPressed: () {
              if (formKey.currentState?.validate() ?? false) {
                context.pushReplacementNamed(RoutesName.FILE_PAGE);
              }
            },
            style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                  minimumSize: MaterialStateProperty.all(
                    Size(
                      size,
                      size * 0.15,
                    ),
                  ),
                  maximumSize: MaterialStateProperty.all(
                    Size(
                      size,
                      size * 0.18,
                    ),
                  ),
                ),
            child: Text(
              "Login",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: MediaQuery.sizeOf(context).width * 0.05,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
