package com.docker.container.Dto;


import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class GenericAPIResponse<D> {
    private String message;
    private D data;
    private Object error;
    private String timeStamp;
}
