package com.util;

import java.util.ArrayList;
import java.util.List;

public class UploadResult {
    private Integer error;
    private List<String> data = new ArrayList<>();

    public Integer getError() {
        return error;
    }

    public void setError(Integer error) {
        this.error = error;
    }

    public List<String> getData() {
        return data;
    }

    public void setData(List<String> data) {
        this.data = data;
    }
}
