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
public class questions {
    int q_id;
    int c_id;
    String que;
    String a;
    String b;
    String c;
    String d;
    String ans;

    public questions() {
    }

    public questions(int q_id, int c_id, String que, String a, String b, String c, String d, String ans) {
        this.q_id = q_id;
        this.c_id = c_id;
        this.que = que;
        this.a = a;
        this.b = b;
        this.c = c;
        this.d = d;
        this.ans = ans;
    }

    public String getAnswerAccToAns(String ans){
        if(ans.equals("A")){
            return getA();
        }
        else if(ans.equals("B")){
            return getB();
        }
        else if(ans.equals("C")){
            return getC();
        }
        else{
            return getD();
        }
    }
    public int getQ_id() {
        return q_id;
    }

    public void setQ_id(int q_id) {
        this.q_id = q_id;
    }

    public int getC_id() {
        return c_id;
    }

    public void setC_id(int c_id) {
        this.c_id = c_id;
    }

    public String getQue() {
        return que;
    }

    public void setQue(String que) {
        this.que = que;
    }

    public String getA() {
        return a;
    }

    public void setA(String a) {
        this.a = a;
    }

    public String getB() {
        return b;
    }

    public void setB(String b) {
        this.b = b;
    }

    public String getC() {
        return c;
    }

    public void setC(String c) {
        this.c = c;
    }

    public String getD() {
        return d;
    }

    public void setD(String d) {
        this.d = d;
    }

    public String getAns() {
        return ans;
    }

    public void setAns(String ans) {
        this.ans = ans;
    }
    
    
}
