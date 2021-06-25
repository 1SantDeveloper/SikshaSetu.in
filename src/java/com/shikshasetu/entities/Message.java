
package com.shikshasetu.entities;
public class Message {
    private String msg;
    private String type;
  private String content ;  

    public Message(String msg, String type, String content) {
        this.msg = msg;
        this.type = type;
        this.content = content;
    }

    public Message(String msg, String type) {
        this.msg = msg;
        this.type = type;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
  
    
    
}
