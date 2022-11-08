
package com.learning.dao;
import com.learning.entities.admin;
import com.learning.helper.ConnectionProvider;
import java.sql.*;
public class AdminDao {
    private Connection con;

    public AdminDao(Connection con) {
        this.con = con;
    }
    
    public admin getAdmin(String email,String password){
        admin ad=null;
        try{
            String query = "select * from admin where email =? and password=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);

            ResultSet rs = pstmt.executeQuery();
            if(rs.next()){
                ad = new admin();
                ad.setEmail(rs.getString(1));
                ad.setPassword(rs.getString(2));
            }
            rs.close();
            pstmt.close();
        }catch(Exception e){
            System.out.println(e);
        }
        return ad;
    }
}
