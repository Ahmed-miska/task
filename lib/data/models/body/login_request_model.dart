class LoginRequestBody {
  final String phone;
  final String password;

  LoginRequestBody({required this.phone, required this.password});

  Map<String, dynamic> toJson() => {
        "Phone": "+2$phone",
        "Password": password,    
      };
}
