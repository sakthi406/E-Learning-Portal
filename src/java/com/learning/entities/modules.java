/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.learning.entities;

/**
 *
 * @author praveen vuddagiri
 */
public class modules {
    int mod_id;
    int c_id;
    String mod_title;
    String mod_link;
    String mod_notes;

    public modules(int mod_id,int c_id, String mod_title, String mod_link, String mod_notes) {
        this.mod_id = mod_id;        
        this.c_id = c_id;

        this.mod_title = mod_title;
        this.mod_link = mod_link;
        this.mod_notes = mod_notes;
    }

    public int getC_id() {
        return c_id;
    }

    public void setC_id(int c_id) {
        this.c_id = c_id;
    }

    public modules() {
    }

    public int getMod_id() {
        return mod_id;
    }

    public void setMod_id(int mod_id) {
        this.mod_id = mod_id;
    }

    public String getMod_title() {
        return mod_title;
    }

    public void setMod_title(String mod_title) {
        this.mod_title = mod_title;
    }

    public String getMod_link() {
        return mod_link;
    }

    public void setMod_link(String mod_link) {
        this.mod_link = mod_link;
    }

    public String getMod_notes() {
        return mod_notes;
    }

    public void setMod_notes(String mod_notes) {
        this.mod_notes = mod_notes;
    }
    
    
}
