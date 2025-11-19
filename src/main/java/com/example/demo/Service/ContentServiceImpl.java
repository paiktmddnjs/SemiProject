package com.example.demo.Service;

import com.example.demo.model.mapper.ContentMapper;
import com.example.demo.model.vo.Categorical;
import com.example.demo.model.vo.Content;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class ContentServiceImpl implements ContentService {

    private final ContentMapper contentMapper;
    private final SqlSession sqlSession;

    @Autowired
    public ContentServiceImpl(ContentMapper contentMapper, SqlSession sqlSession) {

        this.contentMapper = contentMapper;
        this.sqlSession = sqlSession;
    }
    @Override
    public int selectCountContent(int chanelId) {

        //List<Board> list = boardMapper.selectAllBoard(rowBounds);
        return contentMapper.selectCountContent(chanelId);
    }

    @Override
    public int selectCountView(int chanelId) {

        return contentMapper.selectCountView(chanelId);
    }

    public int  selectPrevContent(int chanelId) {

        return contentMapper.selectPrevContent(chanelId);
    }

    public double selectPrevView(int chanelId) {

        return contentMapper.selectPrevView(chanelId);
    }

    @Override
    public int insertContent(Content content) {
        return contentMapper.insertContent(content);
    }

    @Override
    public double selectCountLike(int chanelId) {
        System.out.println(chanelId);
        System.out.println(contentMapper.selectCountLike(chanelId));
        return  contentMapper.selectCountLike(chanelId);
    }
    @Override
    public int selectCountAvergeView(int chanelId) {
        return  contentMapper.selectCountAvergeView(chanelId);

    }

    @Override
    public List<Categorical> selectContentByCategory(int chanelId) {

        return contentMapper.selectContentByCategory(chanelId);
    }
    @Override
    public List<Categorical> selectViewByCategory(int chanelId) {

        return contentMapper.selectViewByCategory(chanelId);
    }
    @Override
    public List<Categorical> selectDetailByCategory(int chanelId) {

        return contentMapper.selectDetailByCategory(chanelId);
    }
    @Override
    public List<Content> selectContent(int chanelId) {

        return contentMapper.selectContent(chanelId);
    }


}