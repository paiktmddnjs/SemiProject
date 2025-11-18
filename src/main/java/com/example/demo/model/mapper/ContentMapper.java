package com.example.demo.model.mapper;


import com.example.demo.model.vo.Categorical;
import com.example.demo.model.vo.Content;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;


@Mapper
public interface ContentMapper {

    int selectCountContent(int chanelId);
    int selectCountView(int chanelId);
    double selectCountLike(int chanelId);
    int selectPrevContent(int chanelId);
    double selectPrevView(int chanelId);
    int selectCountAvergeView(int chanelId);
    List<Categorical> selectContentByCategory(int chanelId);
    List<Categorical> selectViewByCategory(int chanelId);
    List<Categorical> selectDetailByCategory(int chanelId);
    List<Content> selectContent(int chanelId);

    int insertContent(Content content , int chanelId);
}
