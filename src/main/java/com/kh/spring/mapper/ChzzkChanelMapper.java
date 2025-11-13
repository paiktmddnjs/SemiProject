package com.kh.spring.mapper;

import com.kh.spring.dto.ChzzkChanelDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 치지직 채널 MyBatis Mapper
 */
@Mapper
public interface ChzzkChanelMapper {
    
    /**
     * 채널 ID로 조회
     */
    ChzzkChanelDto findById(Long chanelId);

    /**
     * 채널 이름과 플랫폼 타입으로 조회
     */
    ChzzkChanelDto findByChanelNameAndPlatformType(@Param("chanelName") String chanelName,
                                                     @Param("platformType") String platformType);
    
    /**
     * 채널 URL로 조회 (삭제된 채널 포함)
     */
    ChzzkChanelDto findByChanelUrl(@Param("chanelUrl") String chanelUrl);

    /**
     * 멤버 ID로 채널 목록 조회
     */
    List<ChzzkChanelDto> findByMemberId(Long memberId);

    /**
     * 플랫폼 타입으로 채널 목록 조회
     */
    List<ChzzkChanelDto> findByPlatformType(String platformType);
    
    /**
     * 플랫폼 타입과 상태로 채널 목록 조회 (활성 채널만)
     */
    List<ChzzkChanelDto> findByPlatformTypeAndStatus(@Param("platformType") String platformType, 
                                                       @Param("status") String status);

    /**
     * 전체 채널 목록 조회
     */
    List<ChzzkChanelDto> findAll();
    
    /**
     * 채널 상태 변경 (삭제 시 'N'으로 변경)
     */
    int updateStatus(@Param("chanelId") Long chanelId, @Param("status") String status);
    
    /**
     * 채널 저장 (INSERT)
     */
    int insert(ChzzkChanelDto chanel);
    
    /**
     * 채널 업데이트 (UPDATE)
     */
    int update(ChzzkChanelDto chanel);
    
    /**
     * 채널 삭제 (DELETE)
     */
    int deleteById(Long chanelId);
    
    /**
     * 다음 시퀀스 값 조회
     */
    Long getNextSequence();
}

