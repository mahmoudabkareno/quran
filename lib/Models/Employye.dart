class Employees {
  final String id;
  final String employeeName;
  final String employeeSalary;
  final String employeeAge;
  final String profileImage;

  Employees({this.id, this.employeeName, this.employeeSalary,
    this.employeeAge, this.profileImage});


  factory Employees.fromJson(Map<String, dynamic> json){
    return Employees(
      employeeName: json['employee_name'],
      employeeSalary: json['employee_salary'],
      employeeAge: json['employee_age'],
      profileImage: json['profile_image'],
    );
  }
}
