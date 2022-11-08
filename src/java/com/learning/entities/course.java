
package com.learning.entities;

public class course {
    private int c_id;
    private String c_name;
    private float c_price;    
    private String c_desc;
    private int c_dur;
    private int cat_id;
    private int f_id;
    private int c_mod;
    private String c_img;
    private String c_pro;

    public course(String c_name, float c_price, String c_desc, int c_dur, int cat_id, int f_id,String c_img) {
        this.c_name = c_name;
        this.c_price = c_price;
        this.c_desc = c_desc;
        this.c_dur = c_dur;
        this.cat_id = cat_id;
        this.f_id = f_id;
//        this.c_mod = c_mod;
        this.c_img = c_img;
    }

    public String getC_img() {
        return c_img;
    }

    public String getC_pro() {
        return c_pro;
    }

    public void setC_pro(String c_pro) {
        this.c_pro = c_pro;
    }

    public void setC_img(String c_img) {
        this.c_img = c_img;
    }

    public course() {
    }

    public int getC_id() {
        return c_id;
    }

    public void setC_id(int c_id) {
        this.c_id = c_id;
    }

    public String getC_name() {
        return c_name;
    }

    public void setC_name(String c_name) {
        this.c_name = c_name;
    }

    public float getC_price() {
        return c_price;
    }

    public void setC_price(float c_price) {
        this.c_price = c_price;
    }

    public String getC_desc() {
        return c_desc;
    }

    public void setC_desc(String c_desc) {
        this.c_desc = c_desc;
    }

    public int getC_dur() {
        return c_dur;
    }

    public void setC_dur(int c_dur) {
        this.c_dur = c_dur;
    }

    public int getCat_id() {
        return cat_id;
    }

    public void setCat_id(int cat_id) {
        this.cat_id = cat_id;
    }

    public int getF_id() {
        return f_id;
    }

    public void setF_id(int f_id) {
        this.f_id = f_id;
    }

    public int getC_mod() {
        return c_mod;
    }

    public void setC_mod(int c_mod) {
        this.c_mod = c_mod;
    }

}
