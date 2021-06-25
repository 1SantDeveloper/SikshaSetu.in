
package com.shikshasetu.entities;

import java.sql.Timestamp;

/**
 *
 * @author SantDeveloper
 */
public class BlogEntity {
    private int UserId;
    private String Useremail;
    private String userName;
    private int blogId;
    private String Title;
    private String Discription;
    private String img;
    private String detailDescription;
    private Timestamp DTime;
    private String category;

    public BlogEntity(int UserId,String Title, String Discription, String img, String detailDescription) {
        this.UserId = UserId;
//        this.Useremail = Useremail;
//        this.userName = userName;
        this.blogId=blogId;
        this.Title = Title;
        this.Discription = Discription;
        this.img = img;
        this.detailDescription = detailDescription;
    }
    public BlogEntity(int UserId,String Title, String Discription, String img, String detailDescription,String category) {
        this.UserId = UserId;
//        this.Useremail = Useremail;
//        this.userName = userName;
        this.blogId=blogId;
        this.Title = Title;
        this.Discription = Discription;
        this.img = img;
        this.detailDescription = detailDescription;
        this.category= category;
    }

    public BlogEntity(int UserId, String Useremail, String userName, int blogId, String Title, String Discription, String img, String detailDescription) {
        this.UserId = UserId;
        this.Useremail = Useremail;
        this.userName = userName;
        this.blogId = blogId;
        this.Title = Title;
        this.Discription = Discription;
        this.img = img;
        this.detailDescription = detailDescription;
    }

    public BlogEntity(int UserId, int blogId, String Title, String Discription, String img, String detailDescription) {
        this.UserId = UserId;
        this.blogId = blogId;
        this.Title = Title;
        this.Discription = Discription;
        this.img = img;
        this.detailDescription = detailDescription;
    }

    public BlogEntity(String Title, String Discription, String img, String detailDescription) {
        this.Title = Title;
        this.Discription = Discription;
        this.img = img;
        this.detailDescription = detailDescription;
    }

    public BlogEntity(int UserId, int blogId, String Title, String Discription, String img, String detailDescription, Timestamp DTime) {
        this.UserId = UserId;
        this.blogId = blogId;
        this.Title = Title;
        this.Discription = Discription;
        this.img = img;
        this.detailDescription = detailDescription;
        this.DTime = DTime;
    }
    public BlogEntity(int UserId, int blogId, String Title, String Discription, String img, String detailDescription, Timestamp DTime,String category) {
        this.UserId = UserId;
        this.blogId = blogId;
        this.Title = Title;
        this.Discription = Discription;
        this.img = img;
        this.detailDescription = detailDescription;
        this.DTime = DTime;
        this.category=category;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

   
    

    public int getUserId() {
        return UserId;
    }

    public Timestamp getDTime() {
        return DTime;
    }

    public void setDTime(Timestamp DTime) {
        this.DTime = DTime;
    }

    public int getBlogId() {
        return blogId;
    }

    public void setBlogId(int blogId) {
        this.blogId = blogId;
    }

    public void setUserId(int UserId) {
        this.UserId = UserId;
    }

    public String getUseremail() {
        return Useremail;
    }

    public void setUseremail(String Useremail) {
        this.Useremail = Useremail;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getTitle() {
        return Title;
    }

    public void setTitle(String Title) {
        this.Title = Title;
    }

    public String getDiscription() {
        return Discription;
    }

    public void setDiscription(String Discription) {
        this.Discription = Discription;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getDetailDescription() {
        return detailDescription;
    }

    public void setDetailDescription(String detailDescription) {
        this.detailDescription = detailDescription;
    }
    
    
    
}
