/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.learning.dao;

import com.learning.entities.modules;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author praveen vuddagiri
 */
public class ModuleDao {
    private Connection con;

    public ModuleDao(Connection con) {
        this.con = con;
    }
    public boolean addModule(modules mod){
        boolean f = false;
        try {
            //user -->database
            String query = "insert into modules values (?,?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, String.valueOf(mod.getMod_id()));            
            pstmt.setString(2, String.valueOf(mod.getC_id()));
            pstmt.setString(3, mod.getMod_title());            
            pstmt.setString(4, mod.getMod_link());
            pstmt.setString(5, mod.getMod_notes());

            pstmt.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
}
