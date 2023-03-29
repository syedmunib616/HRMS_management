




class ListAttandance {
  ListAttandance({
    required this.employee,
    required this.date,
    required this.timein,
    required this.addressIn,
    required this.timeout,
    required this.addressout,});
  String date;
  String timein;
  String addressIn;
  String timeout;
  String addressout;
  String employee;
}

class EmployeeAttendance{
  EmployeeAttendance({required this.employeename,required this.empAttendance});

  String employeename;
  List<ListAttandance> empAttendance;

}