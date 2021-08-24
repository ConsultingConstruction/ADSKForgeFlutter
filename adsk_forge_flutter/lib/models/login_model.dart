class LoginModel {
	int? statusCode;
	String? message;
	String? url;
	bool? validateAuth;

	LoginModel({this.statusCode, this.message, this.url, this.validateAuth});

	factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
				statusCode: json['statusCode'] as int?,
				message: json['message'] as String?,
				url: json['url'] as String?,
				validateAuth: json['validateAuth'] as bool?,
			);

	Map<String, dynamic> toJson() => {
				'statusCode': statusCode,
				'message': message,
				'url': url,
				'validateAuth': validateAuth,
			};

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		return other is LoginModel && 
				other.statusCode == statusCode &&
				other.message == message &&
				other.url == url &&
				other.validateAuth == validateAuth;
	}

	@override
	int get hashCode =>
			statusCode.hashCode ^
			message.hashCode ^
			url.hashCode ^
			validateAuth.hashCode;
}
