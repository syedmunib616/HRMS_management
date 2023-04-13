




class ListAttandance {
  ListAttandance({
    required this.employee,
    required this.date,
    required this.timein,
    required this.addressIn,
    required this.timeout,
    required this.addressout,
    required this.name
  });
  String date;
  String timein;
  String addressIn;
  String timeout;
  String addressout;
  String employee;
  String name;
}

class EmployeeAttendance{
  EmployeeAttendance({required this.employeename,required this.empAttendance});

  String employeename;
  List<ListAttandance> empAttendance;

}