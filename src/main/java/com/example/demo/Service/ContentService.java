package com.example.demo.Service;

import com.example.demo.model.vo.Categorical;
import com.example.demo.model.vo.Content;

import java.util.List;

public interface ContentService {

    int selectCountContent(int chanelId);
    int selectCountView(int chanelId);
    int selectPrevContent(int chanelId);
    double selectPrevView(int chanelId);
    double selectCountLike(int chanelId);
    int selectCountAvergeView(int chanelId);
    int insertContent(Content content);
    List<Categorical> selectContentByCategory(int chanelId);
    List<Categorical> selectViewByCategory(int chanelId);
    List<Categorical> selectDetailByCategory(int chanelId);
    List<Content> selectContent(int chanelId);


}
