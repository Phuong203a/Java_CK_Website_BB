package com.kayty.src.Helps;

import lombok.Getter;

import java.util.HashMap;
import java.util.Map;

@Getter
public class Response<T> {
    private int statusCode;
    private String message;
    private int totalRecords;
    private Map<String, T> data;



    public Response(int statusCode, String message, int totalRecords, Map<String, T> data) {
        this.statusCode = statusCode;
        this.message = message;
        this.totalRecords = totalRecords;
        this.data = data;
    }

    public Response(int statusCode, String message, Map<String, T> data) {
        this.statusCode = statusCode;
        this.message = message;
        this.data = data;
    }
    public Response(int statusCode, String message) {
        this.statusCode = statusCode;
        this.message = message;
    }

    public void setStatusCode(int statusCode) {
        this.statusCode = statusCode;
    }

    public void setMessage(String message) {
        this.message = message;
    }


    public  void setTotalRecords(int totalRecords) {
        this.totalRecords = totalRecords;
    }


    public void setData(Map<String, T> data) {
        this.data = data;
    }
}
