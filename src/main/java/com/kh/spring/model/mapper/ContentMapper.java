package com.kh.spring.model.mapper;

import com.kh.spring.model.vo.Categorical;
import com.kh.spring.model.vo.Content;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ContentMapper {

    // 숫자 리턴 → 모두 래퍼 타입으로 변경 (null 허용)
    Integer selectCountContent(int chanelId);
    Integer selectCountView(int chanelId);
    Double  selectCountLike(int chanelId);
    Integer selectPrevContent(int chanelId);
    Double  selectPrevView(int chanelId);
    Integer selectCountAvergeView(int chanelId);

    // insert 결과는 MyBatis가 int로 고정해서 넘겨주므로 그대로 둬도 됨
    int insertContent(Content content);

    // 리스트 타입은 그대로 (MyBatis가 기본적으로 빈 리스트를 주지만 혹시 모를 null에도 대비할 거라면 Service에서 방어)
    List<Categorical> selectContentByCategory(int chanelId);
    List<Categorical> selectViewByCategory(int chanelId);
    List<Categorical> selectDetailByCategory(int chanelId);
    List<Content> selectContent(int chanelId);
}
