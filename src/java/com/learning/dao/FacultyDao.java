
package com.learning.dao;

import com.learning.entities.admin;
import com.learning.entities.faculty;
import com.learning.entities.student;
import com.learning.helper.ConnectionProvider;
import java.sql.*;
import java.util.ArrayList;
public class FacultyDao {
     private Connection con;

    public FacultyDao(Connection con) {
        this.con = con;
    }
    public boolean addFaculty(faculty fac){
        boolean f = false;
        try {
            String query = "insert into faculty values (?,?,?,?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1,"0");            
            pstmt.setString(2,fac.getFacname());
            pstmt.setString(3,fac.getFacphone());            
            pstmt.setString(4,fac.getFacemail());
            pstmt.setString(5,fac.getFacdob());
            pstmt.setString(6,fac.getFacgen());
            pstmt.setString(7,fac.getFacpass());

            pstmt.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
    public faculty getFaculty(String email,String password){
        faculty fac=null;
        
        try{
            String query = "select * from faculty where f_email =? and f_pass=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()){
                fac = new faculty();
                fac.setFacid(Integer.parseInt(rs.getString("f_id")));                
                fac.setFacname(rs.getString("f_name"));                
                fac.setFacphone(rs.getString("f_phone"));
                fac.setFacemail(rs.getString("f_email"));
                fac.setFacdob(rs.getString("f_dob"));
                fac.setFacgen(rs.getString("f_gender"));
                fac.setFacpass(rs.getString("f_password"));
            }
        }catch(Exception e){
            System.out.println(e);
        }
        return fac;
    }
    
    public boolean deleteFaculty(int id){
        boolean f = false;
        try{
            String q = "delete from faculty where f_id="+id;
            Statement st = con.createStatement();
            st.executeQuery(q);
            f=true;
        }catch(Exception e){
            System.out.println(e);
        }
        return f;
    }
    
    public faculty getFacultyById(int id){
        faculty fac = null;
        
        try{
            String query = "select * from faculty where f_id=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()){
                fac = new faculty();
                fac.setFacid(Integer.parseInt(rs.getString("f_id")));                
                fac.setFacname(rs.getString("f_name"));                
                fac.setFacphone(rs.getString("f_phone"));
                fac.setFacemail(rs.getString("f_email"));
                fac.setFacdob(rs.getString("f_dob"));
                fac.setFacgen(rs.getString("f_gender"));
                fac.setFacpass(rs.getString("f_password"));
            }
        }catch(Exception e){
            System.out.println(e);
        }
        return fac;
    }
    public boolean updateFaculty(faculty fac){
        boolean f = false;
        try {
            //user -->database

            String query = "update faculty set f_name=?,f_dob=?,f_gender=?,f_pass=? where f_id=?";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1,fac.getFacname());
            pstmt.setString(2,fac.getFacdob());
            pstmt.setString(3,fac.getFacgen());            
            pstmt.setString(4,fac.getFacpass());            
            pstmt.setInt(5,fac.getFacid());


            pstmt.setString(5,String.valueOf(fac.getFacid()));

            pstmt.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    public ArrayList<faculty> getAllFaculty(){
        ArrayList<faculty> allFaculty = new ArrayList<>();
        
        
        try{
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from faculty");
            while(rs.next()){
                faculty fac = new faculty();
                fac.setFacid(Integer.parseInt(rs.getString("f_id")));                
                fac.setFacname(rs.getString("f_name"));                
                fac.setFacphone(rs.getString("f_phone"));
                fac.setFacemail(rs.getString("f_email"));
                fac.setFacdob(rs.getString("f_dob"));
                fac.setFacgen(rs.getString("f_gender"));
                fac.setFacpass(rs.getString("f_password"));
                allFaculty.add(fac);
            }
        }catch(Exception e){
            System.out.println(e);
        }
        return allFaculty;
    }
}
