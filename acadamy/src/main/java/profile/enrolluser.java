package profile;

public class enrolluser {
  private String enrollment_date,status;
  private User user;
  private Teacher teacher;
  private addcourseuer course;
public String getEnrollment_date() {
	return enrollment_date;
}
public void setEnrollment_date(String enrollment_date) {
	this.enrollment_date = enrollment_date;
}
public addcourseuer getCourse() {
	return course;
}
public void setCourse(addcourseuer course) {
	this.course = course;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public User getUser() {
	return user;
}
public void setUser(User user) {
	this.user = user;
}
public Teacher getTeacher() {
	return teacher;
}
public void setTeacher(Teacher teacher) {
	this.teacher = teacher;
}
}
