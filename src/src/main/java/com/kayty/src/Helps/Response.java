package com.kayty.src.Helps;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.HashMap;
import java.util.Map;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Response<T> {

    private int statusCode;
    private String message;
    private int totalRecords;
    private T data;

    public static <T> Response<T> createSuccessResponseModel(int totalRecord, T data) {
        return new Response<>(200, "Successful", totalRecord, data);
    }

    public static <T> Response<T> createErrorResponseModel(String message, T data) {
        return new Response<>(400, message, 0, null);
    }
    public static <T> Response<T> createResponseModel(String message) {
        return new Response<>(200, message, 0, null);
    }


}
