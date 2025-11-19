package com.kh.spring.service;

import com.kh.spring.model.mapper.ContentMapper;
import com.kh.spring.model.vo.Categorical;
import com.kh.spring.model.vo.Content;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
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

    /**
     * 콘텐츠 개수
     */
    @Override
    public int selectCountContent(int chanelId) {
        Integer count = contentMapper.selectCountContent(chanelId);
        return (count == null) ? 0 : count;
    }

    /**
     * 총 조회수
     */
    @Override
    public int selectCountView(int chanelId) {
        Integer count = contentMapper.selectCountView(chanelId);
        return (count == null) ? 0 : count;
    }

    /**
     * 이전 기간 콘텐츠 수
     */
    public int selectPrevContent(int chanelId) {
        Integer prev = contentMapper.selectPrevContent(chanelId);
        return (prev == null) ? 0 : prev;
    }

    /**
     * 이전 기간 조회수 (double)
     */
    public double selectPrevView(int chanelId) {
        Double prevView = contentMapper.selectPrevView(chanelId);
        return (prevView == null) ? 0.0 : prevView;
    }

    /**
     * 콘텐츠 인서트
     */
    @Override
    public int insertContent(Content content) {
        // insert 결과는 0 또는 양수(int)라 null 안 들어오지만 혹시 모를 상황 대비해서 그대로 리턴
        return contentMapper.insertContent(content);
    }

    /**
     * 좋아요 수 (double)
     */
    @Override
    public double selectCountLike(int chanelId) {
        Double likeCount = contentMapper.selectCountLike(chanelId);
        double safeLikeCount = (likeCount == null) ? 0.0 : likeCount;

        System.out.println(chanelId);
        System.out.println(safeLikeCount);

        return safeLikeCount;
    }

    /**
     * 평균 조회수
     */
    @Override
    public int selectCountAvergeView(int chanelId) {
        Integer avgView = contentMapper.selectCountAvergeView(chanelId);
        return (avgView == null) ? 0 : avgView;
    }

    /**
     * 카테고리별 콘텐츠 수
     */
    @Override
    public List<Categorical> selectContentByCategory(int chanelId) {
        List<Categorical> list = contentMapper.selectContentByCategory(chanelId);
        return (list == null) ? Collections.emptyList() : list;
    }

    /**
     * 카테고리별 조회수
     */
    @Override
    public List<Categorical> selectViewByCategory(int chanelId) {
        List<Categorical> list = contentMapper.selectViewByCategory(chanelId);
        return (list == null) ? Collections.emptyList() : list;
    }

    /**
     * 카테고리별 상세
     */
    @Override
    public List<Categorical> selectDetailByCategory(int chanelId) {
        List<Categorical> list = contentMapper.selectDetailByCategory(chanelId);
        return (list == null) ? Collections.emptyList() : list;
    }

    /**
     * 콘텐츠 리스트
     */
    @Override
    public List<Content> selectContent(int chanelId) {
        List<Content> list = contentMapper.selectContent(chanelId);
        return (list == null) ? Collections.emptyList() : list;
    }
}
