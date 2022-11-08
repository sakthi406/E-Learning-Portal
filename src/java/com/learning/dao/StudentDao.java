
package com.learning.dao;

import com.learning.entities.admin;
import com.learning.entities.student;
import java.sql.*;
import static oracle.net.aso.C00.q;

public class StudentDao {
    private Connection con;

    public StudentDao(Connection con) {
        this.con = con;
    }
    public boolean addStudent(student st){
        boolean f = false;
        try {
            //user -->database
            String query = "insert into student values (?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1,"0");            
            pstmt.setString(2,st.getName());            
            pstmt.setString(9,st.getPhone());
            pstmt.setString(10,st.getEmail());
            pstmt.setString(3,st.getDob());
            pstmt.setString(4,st.getAdd());
            pstmt.setString(5,st.getClg());
            pstmt.setString(6,st.getGen());
            pstmt.setString(7,st.getPass());            
            pstmt.setString(8,st.getImg());
            pstmt.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    public student getStudent(String email,String password){
        student st=null;
        
        try{
            String query = "select * from student where email =? and password=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);

            ResultSet rs = pstmt.executeQuery();
            if(rs.next()){
                st = new student();
                st.setId(Integer.parseInt(rs.getString("id")));                
                st.setName(rs.getString("name"));                
                st.setPhone(rs.getString("phone"));
                st.setEmail(rs.getString("email"));
                st.setDob(rs.getString("dob"));
                st.setAdd(rs.getString("address"));
                st.setClg(rs.getString("college"));
                st.setGen(rs.getString("gender"));
                st.setPass(rs.getString("password"));
                st.setImg(rs.getString("img"));
            }
        }catch(Exception e){
            System.out.println(e);
        }
        return st;
    }
    
    public boolean deleteStudent(int id){
        boolean f = false;
        try{
            String q = "delete from student where id="+id+";";
            Statement st = con.createStatement();
            st.executeQuery(q);
            f=true;
        }catch(Exception e){
            System.out.println(e);
        }
        return f;
    }
    
    public student getStudentById(int id){
        student st=null;
        
        try{
            String query = "select * from student where id="+id;
            Statement stm = con.createStatement();

            ResultSet rs = stm.executeQuery(query);
            if(rs.next()){
                st = new student();
                st.setId(Integer.parseInt(rs.getString("id")));                
                st.setName(rs.getString("name"));                
                st.setPhone(rs.getString("phone"));
                st.setEmail(rs.getString("email"));
                st.setDob(rs.getString("dob"));
                st.setAdd(rs.getString("address"));
                st.setClg(rs.getString("college"));
                st.setGen(rs.getString("gender"));
                st.setPass(rs.getString("password"));
                st.setImg(rs.getString("img"));
            }
        }catch(Exception e){
            System.out.println(e);
        }
        return st;
    }
    public String updateStudent(student st){
        boolean f = false;
        try {
            //user -->database

            String query = "update student set name=?,dob=?,address=?,college=?,gender=?,password=?,img=? where id=?";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1,st.getName());            
            pstmt.setString(2,st.getDob());
            pstmt.setString(3,st.getAdd());
            pstmt.setString(4,st.getClg());
            pstmt.setString(5,st.getGen());
            pstmt.setString(6,st.getPass());
            pstmt.setString(7,st.getImg());
            pstmt.setString(8,String.valueOf(st.getId()));
            pstmt.executeUpdate();
            f = true;
        } catch (SQLException e) {
            return String.valueOf(e);
        }
        return "";
    }
}
