package com.util;

public class MapResponse {
    private Boolean state;
    private String msg;
    private String data = "";

    public MapResponse(Boolean state, String msg, String data) {
        this.state = state;
        this.msg = msg;
        this.data = data;
    }

    public MapResponse(Boolean state, String msg) {
        this.state = state;
        this.msg = msg;
    }

    public Boolean getState() {
        return state;
    }

    public void setState(Boolean state) {
        this.state = state;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }
}
