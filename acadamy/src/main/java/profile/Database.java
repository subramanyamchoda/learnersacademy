package profile;

import java.sql.*;

public class Database {

	String url, uname, pass, db;
	Connection con;
	String query;
	Statement st;
	PreparedStatement pt;
	
	public Database(String db) {
		super();
		this.db = "acadamy"; 
		this.url = "jdbc:mysql://localhost:3306/" + this.db;
		this.uname = "root";
		this.pass = "subbu";		
	}
	
	public void connection() throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection(url, uname, pass);
	}
	
	public User read(String uname, String table) throws SQLException, ClassNotFoundException {
	    this.connection();
	    query = "SELECT * FROM " + table + " WHERE uname=?";
	    pt = con.prepareStatement(query);
	    pt.setString(1, uname);
	    ResultSet result = pt.executeQuery();
	    User user = null; // Initialize to null to handle the case where no user is found
	    if (result.next()) {
	        user = new User(); // Create a new User object only if a record is found
	        user.setName(result.getString("name"));
	        user.setMobile(result.getLong("mobile"));
	        user.setEmail(result.getString("email"));
	        user.setDob(result.getString("dob"));
	        user.setAge(result.getInt("age"));
	        user.setGender(result.getString("gender"));
	        user.setUname(result.getString("uname"));
	        user.setPass(result.getString("pass"));
	        user.setCollege(result.getString("college"));
	        user.setEducation(result.getString("education"));
	        user.setAddress(result.getString("address"));
	        user.setYop(result.getString("yop"));
	    }
	    con.close();
	    return user;
	}

	public int insert(User user) throws SQLException, ClassNotFoundException {
	    this.connection();
	    this.query = "INSERT INTO student (name, mobile, email, dob, age, gender, uname, pass, college, education, address, yop) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	    pt = con.prepareStatement(query);

	    pt.setString(1, user.getName());
	    pt.setLong(2, user.getMobile());
	    pt.setString(3, user.getEmail());
	    pt.setString(4, user.getDob());
	    pt.setInt(5, user.getAge());
	    pt.setString(6, user.getGender());
	    pt.setString(7, user.getUname());
	    pt.setString(8, user.getPass());
	    pt.setString(9, user.getCollege());
	    pt.setString(10, user.getEducation());
	    pt.setString(11, user.getAddress());
	    pt.setString(12, user.getYop());

	    int row = pt.executeUpdate();

	    con.close();
	    return row;
	}

	public int delete(String uname) throws SQLException, ClassNotFoundException {
		this.connection();
		this.query = "delete from student where uname=?";
		pt = con.prepareStatement(query);
		pt.setString(1, uname);
		int row = pt.executeUpdate();
		con.close();
		return row;
	}

	public int update(String address, String uname) throws SQLException, ClassNotFoundException {
		this.connection();
		this.query = "update student set address=? where uname=?";
		pt = con.prepareStatement(query);
		pt.setString(1, address);
		pt.setString(2, uname);
		int row = pt.executeUpdate();
		con.close();
		return row;
	}	
	
	public int validate(String uname, String pass, String table) throws SQLException, ClassNotFoundException {
	    this.connection();
	    query = "SELECT pass FROM " + table + " WHERE uname=?";
	    pt = con.prepareStatement(query); // Prepare the statement
	    pt.setString(1, uname);
	    ResultSet result = pt.executeQuery(); // Execute the query
	    if (!result.next()) {
	        con.close();
	        return 1; // Wrong username
	    }
	    if (result.getString(1).equals(pass)) {
	        con.close();
	        return 2; // Correct username and password
	    } else {
	        con.close();
	        return 3; // Wrong password
	    }
	}
	
	public Teacher readTeacher(String uname) throws SQLException, ClassNotFoundException {
	    Teacher teacher = new Teacher();
	    String query = "SELECT * FROM teacher WHERE uname=?";

	    try (Connection con = DriverManager.getConnection(url, this.uname, pass);
	         PreparedStatement pt = con.prepareStatement(query)) {
	        pt.setString(1, uname);
	        try (ResultSet rs = pt.executeQuery()) {
	            if (rs.next()) {
	                teacher.setF_name(rs.getString("f_name"));
	                teacher.setL_name(rs.getString("l_name"));
	                teacher.setMobile(rs.getLong("mobile"));
	                teacher.setEmail(rs.getString("email"));
	                teacher.setDob(rs.getString("dob"));
	                teacher.setAge(rs.getInt("age"));
	                teacher.setGender(rs.getString("gender"));
	                teacher.setUname(rs.getString("uname"));
	                teacher.setPass(rs.getString("pass"));
	                teacher.setExperience(rs.getString("experience"));
	                teacher.setEducation(rs.getString("education"));
	                teacher.setAddress(rs.getString("address"));
	            }
	        }
	    } catch (SQLException e) {
	        // Handle SQL exception
	        e.printStackTrace();
	        throw e;
	    }

	    return teacher;
	}

	
	public Admin readAdmin(String uname) throws SQLException, ClassNotFoundException {
	    Admin admin = new Admin();
	    String query = "SELECT * FROM admin WHERE uname=?";
	    
	    try (Connection con = DriverManager.getConnection(url, this.uname, pass);
	         PreparedStatement pt = con.prepareStatement(query)) {
	        pt.setString(1, uname);
	        ResultSet rs = pt.executeQuery();
	        
	        if (rs.next()) {
	            admin.setUname(rs.getString("uname"));
	            admin.setPass(rs.getString("pass"));
	            admin.setEmail(rs.getString("email"));
	            admin.setMobile(rs.getLong("mobile"));
	            // Add more fields if necessary
	        }
	    }

	    return admin;
	}
	public void insert(Teacher user) throws SQLException, ClassNotFoundException {
	    this.connection();
	    this.query = "INSERT INTO teacher(f_name, l_name, mobile, email, dob, age, gender, uname, pass, experience, education, address) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	    pt = con.prepareStatement(query);
	    
	    pt.setString(1, user.getF_name());
	    pt.setString(2, user.getL_name());
	    pt.setLong(3, user.getMobile());
	    pt.setString(4, user.getEmail());
	    pt.setString(5, user.getDob());
	    pt.setInt(6, user.getAge());
	    pt.setString(7, user.getGender());
	    pt.setString(8, user.getUname());
	    pt.setString(9, user.getPass());
	    pt.setString(10, user.getExperience());
	    pt.setString(11, user.getEducation());
	    pt.setString(12, user.getAddress());

	    int row = pt.executeUpdate();

	    con.close();
	}

	

	
}
