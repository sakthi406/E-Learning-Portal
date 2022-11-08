/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.learning.dao;

import com.learning.entities.modules;
import com.learning.entities.questions;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author praveen vuddagiri
 */
public class QuestionDao {
     private Connection con;

    public QuestionDao(Connection con) {
        this.con = con;
    }
    public boolean addQuestion(questions q){
        boolean f = false;
        try {
            //user -->database
            String query = "insert into questions values (?,?,?,?,?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, String.valueOf(q.getC_id()));            
            pstmt.setString(2, String.valueOf(q.getQ_id()));
            pstmt.setString(3, q.getQue());            
            pstmt.setString(4, q.getA());
            pstmt.setString(5, q.getB());
            pstmt.setString(6, q.getC());
            pstmt.setString(7, q.getD());
            pstmt.setString(8, q.getAns());


            pstmt.executeUpdate();
            f = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return f;
    }
}
