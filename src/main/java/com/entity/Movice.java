package com.entity;

import java.util.Date;

public class Movice {
    private Integer id;

    private String name;

    private String url;

    private String icon;

    private Date createtime;

    private Date updatetime;

    private Integer mcategoryId;

    private Integer complain;

    private Integer readed;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon == null ? null : icon.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }

    public Integer getMcategoryId() {
        return mcategoryId;
    }

    public void setMcategoryId(Integer mcategoryId) {
        this.mcategoryId = mcategoryId;
    }

    public Integer getComplain() {
        return complain;
    }

    public void setComplain(Integer complain) {
        this.complain = complain;
    }

    public Integer getReaded() {
        return readed;
    }

    public void setReaded(Integer readed) {
        this.readed = readed;
    }
}