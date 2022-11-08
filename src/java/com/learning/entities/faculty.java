
package com.learning.entities;

public class faculty {
    private int facid;
    private String facname;
    private String facphone;
    private String facemail;
    private String facdob;
    private String facgen;
    private String facpass;

    public faculty(String facname, String facphone, String facemail, String facdob, String facgen, String facpass) {
        this.facname = facname;
        this.facphone = facphone;
        this.facemail = facemail;
        this.facdob = facdob;
        this.facgen = facgen;
        this.facpass = facpass;
    }

    public faculty() {
    }

    public int getFacid() {
        return facid;
    }

    public void setFacid(int facid) {
        this.facid = facid;
    }

    public String getFacname() {
        return facname;
    }

    public void setFacname(String facname) {
        this.facname = facname;
    }

    public String getFacphone() {
        return facphone;
    }

    public void setFacphone(String facphone) {
        this.facphone = facphone;
    }

    public String getFacemail() {
        return facemail;
    }

    public void setFacemail(String facemail) {
        this.facemail = facemail;
    }

    public String getFacdob() {
        return facdob;
    }

    public void setFacdob(String facdob) {
        this.facdob = facdob;
    }

    public String getFacgen() {
        return facgen;
    }

    public void setFacgen(String facgen) {
        this.facgen = facgen;
    }

    public String getFacpass() {
        return facpass;
    }

    public void setFacpass(String facpass) {
        this.facpass = facpass;
    }
    
}
