//****PROBLEM #1*****
import java.sql.* ;

public class one {
	
	 public static void main(String args[]) {
		 
		 try{  
 	    		//step1 load the driver class  
 			Class.forName("oracle.jdbc.driver.OracleDriver") ;
   
 			//step2 create  the connection object    
 			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "alim", "la3468") ;
   
 			//step3 create the statement object
 			String query = " SELECT DISTINCT job_id, location_id FROM employees e, departments d WHERE e.department_id = d.department_id AND e.department_id = 80 " ;
 			PreparedStatement pstmt_employees = con.prepareStatement(query) ;
   
 			//step4 execute query  
 			ResultSet rs_employees = pstmt_employees.executeQuery() ;
 			    					
 			while (rs_employees.next()){
 				
 				System.out.println("Job_ID:" + rs_employees.getString(1)) ;
 				System.out.println("Location_ID:" + rs_employees.getString(2));
 	      
 				
 			} 
		 } catch(Exception e){ System.out.println(e);}	
 
	 }

}

//****PROBLEM #2*****

import java.sql.* ;

public class one {
	
	 public static void main(String args[]) {
		 
		 try{  
 	    		//step1 load the driver class  
 			Class.forName("oracle.jdbc.driver.OracleDriver") ;
   
 			//step2 create  the connection object    
 			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "alim", "la3468") ;
   
 			//step3 create the statement object
 			String query = " SELECT DISTINCT job_id, location_id FROM employees e, departments d WHERE e.department_id = d.department_id AND e.department_id = 80 " ;
 			PreparedStatement pstmt_employees = con.prepareStatement(query) ;
   
 			//step4 execute query  
 			ResultSet rs_employees = pstmt_employees.executeQuery() ;
 			    					
 			while (rs_employees.next()){
 				
 				System.out.println("Job_ID:" + rs_employees.getString(1)) ;
 				System.out.println("Location_ID:" + rs_employees.getString(2));
 	      
 				
 			} 
		 } catch(Exception e){ System.out.println(e);}	
 
	 }

}

//****PROBLEM #3*****

import java.sql.* ;

public class three {
	
	 public static void main(String args[]) {
		 
		 try{  
 	    		//step1 load the driver class  
 			Class.forName("oracle.jdbc.driver.OracleDriver") ;
   
 			//step2 create  the connection object    
 			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "alim", "la3468") ;
   
 			//step3 create the statement object
 			String query = " SELECT e.last_name, e.job_id, e.department_id, d.department_name FROM employees e JOIN departments d ON (e.department_id = d.department_id) JOIN locations l ON (d.location_id = l.location_id) WHERE LOWER(l.city) = 'toronto' " ;
 			PreparedStatement pstmt_employees = con.prepareStatement(query) ;
   
 			//step4 execute query  
 			ResultSet rs_employees = pstmt_employees.executeQuery() ;
 			    					
 			while (rs_employees.next()){
 				
 				System.out.println("LAST_NAME:" + rs_employees.getString(1)) ;
 				System.out.println("JOB_ID:" + rs_employees.getString(2));
				System.out.println("DEPARTMENT_ID:" + rs_employees.getString(3)) ;
 				System.out.println("DEPARTMENT_NAME:" + rs_employees.getString(4));
 	      
 				
 			} 
		 } catch(Exception e){ System.out.println(e);}	
 
	 }

}

//****PROBLEM #4*****

import java.sql.* ;

public class four {
	
	 public static void main(String args[]) {
		 
		 try{  
 	    		//step1 load the driver class  
 			Class.forName("oracle.jdbc.driver.OracleDriver") ;
   
 			//step2 create  the connection object    
 			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "alim", "la3468") ;
   
 			//step3 create the statement object
 			String query = " SELECT w.last_name "Employee", w.employee_id "EMP#", m.last_name "Manager", m.employee_id "Mgr#" FROM employees w join employees m ON (w.manager_id = m.employee_id) " ;
 			PreparedStatement pstmt_employees = con.prepareStatement(query) ;
   
 			//step4 execute query  
 			ResultSet rs_employees = pstmt_employees.executeQuery() ;
 			    					
 			while (rs_employees.next()){
 				
 				System.out.println("Employee:" + rs_employees.getString(1)) ;
 				System.out.println("EMP#:" + rs_employees.getString(2));
				System.out.println("MANAGER:" + rs_employees.getString(3)) ;
 				System.out.println("Mgr#:" + rs_employees.getString(4));
 	      
 				
 			} 
		 } catch(Exception e){ System.out.println(e);}	
 
	 }

}

//****PROBLEM #5*****

import java.sql.* ;

public class five {
	
	 public static void main(String args[]) {
		 
		 try{  
 	    		//step1 load the driver class  
 			Class.forName("oracle.jdbc.driver.OracleDriver") ;
   
 			//step2 create  the connection object    
 			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "alim", "la3468") ;
   
 			//step3 create the statement object
 			String query = "SELECT w.first_name, w.last_name, w.hire_date, m.first_name, m.last_name, m.hire_date FROM employees w, employees m WHERE w.manager_id = m.employee_id AND w.hire_date < m.hire_date " ;
   
 			//step4 execute query  
 			ResultSet rs_employees = pstmt_employees.executeQuery() ;
 			    					
 			while (rs_employees.next()){
 				
 				System.out.println("FIRST_NAME:" + rs_employees.getString(1)) ;
 				System.out.println("LAST_NAME" + rs_employees.getString(2));
				System.out.println("HIRE_DATE" + rs_employees.getString(3)) ;
 				System.out.println("FIRST_NAME_1" + rs_employees.getString(4));
				System.out.println("LAST_NAME_1" + rs_employees.getString(5));
				System.out.println("HIRE_DATE_1" + rs_employees.getString(6)) ;
 	      
 				
 			} 
		 } catch(Exception e){ System.out.println(e);}	
 
	 }

}

