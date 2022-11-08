
package com.learning.entities;


public class student {
    private int id;
    private String name;
    private String phone;
    private String email;
    private String dob;
    private String add;
    private String clg;
    private String gen;
    private String pass;
    private String img;

    public student(String s_name, String s_phone, String s_email, String s_dob, String s_add, String s_clg, String s_gen, String s_pass,String s_img) {
        this.name = s_name;
        this.phone = s_phone;
        this.email = s_email;
        this.dob = s_dob;
        this.add = s_add;
        this.clg = s_clg;
        this.gen = s_gen;
        this.pass = s_pass;
        this.img = s_img;
    }
    public student(){
        
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getAdd() {
        return add;
    }

    public void setAdd(String add) {
        this.add = add;
    }

    public String getClg() {
        return clg;
    }

    public void setClg(String clg) {
        this.clg = clg;
    }

    public String getGen() {
        return gen;
    }

    public void setGen(String gen) {
        this.gen = gen;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
    
}
