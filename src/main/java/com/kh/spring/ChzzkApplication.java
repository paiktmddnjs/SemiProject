package com.kh.spring;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.kh.spring.mapper")
public class ChzzkApplication {
    public static void main(String[] args) {
        SpringApplication.run(ChzzkApplication.class, args);
    }
}