package com.example.demo.Service;

import com.example.demo.dto.ChzzkChanelDto;
import com.example.demo.dto.ChzzkChannelDto;
import com.example.demo.mapper.ChzzkChanelMapper;
import com.example.demo.mapper.ChzzkMemberMapper;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.Map;

@Service
public class ChzzkDataService {
    
    private static final Logger log = LoggerFactory.getLogger(ChzzkDataService.class);
    
    @Autowired
    private ChzzkChanelMapper chzzkChanelMapper;
    
    @Autowired
    private ChzzkMemberMapper memberMapper;
    
    /**
     * 기본 테스트 회원 ID 가져오기 (없으면 생성)
     */
    private Long getOrCreateDefaultMemberId() {
        try {
            log.info("기본 회원 조회 시작...");
            Long memberId = memberMapper.findDefaultMemberId();
            log.info("기본 회원 조회 결과: {}", memberId);
            
            if (memberId == null) {
                log.info("기본 회원이 없어서 생성합니다...");
                try {
                    // 기본 회원이 없으면 생성
                    memberMapper.insertDefaultMember();
                    log.info("기본 회원 생성 완료, ID 조회 중...");
                    
                    // 생성 후 바로 조회
                    memberId = memberMapper.findDefaultMemberId();
                    log.info("✅ 기본 테스트 회원 생성 완료: {}", memberId);
                    
                    if (memberId == null) {
                        log.warn("회원 생성 후에도 ID를 찾을 수 없습니다.");
                    }
                } catch (Exception insertEx) {
                    log.error("회원 생성 중 예외 발생, 재조회 시도", insertEx);
                    // 생성 실패 시 다시 조회 시도 (중복 생성 방지)
                    memberId = memberMapper.findDefaultMemberId();
                    if (memberId == null) {
                        log.error("회원 생성 및 조회 모두 실패");
                        throw insertEx;
                    }
                    log.info("재조회로 회원 ID 획득: {}", memberId);
                }
            } else {
                log.info("기존 기본 회원 사용: {}", memberId);
            }
            return memberId;
        } catch (Exception e) {
            log.error("기본 회원 조회/생성 실패, 기본값 1L 사용", e);
            e.printStackTrace();
            return 1L; // 실패 시 기본값
        }
    }
    
    /**
     * 치지직 채널 정보를 DB에 저장 (DTO 버전 - MyBatis 사용)
     * @param channelDto 채널 정보 DTO (API 응답용)
     * @param memberId 멤버 ID (null이면 기본 회원 사용)
     * @return 저장된 채널 DTO
     */
    @Transactional
    public ChzzkChanelDto saveChanel(ChzzkChannelDto channelDto, Long memberId) {
        // memberId가 null이면 기본 회원 사용
        if (memberId == null) {
            memberId = getOrCreateDefaultMemberId();
        }
        try {
            if (channelDto == null) {
                log.warn("채널 DTO가 null입니다.");
                return null;
            }
            
            String channelId = channelDto.getChannelId();
            String channelName = channelDto.getChannelName();
            
            if (channelId == null || channelName == null) {
                log.warn("채널 정보가 불완전합니다. channelId: {}, channelName: {}", channelId, channelName);
                return null;
            }
            
            // 채널 URL 생성
            String channelUrl = "https://chzzk.naver.com/live/" + channelId;
            
            // 1. 먼저 URL로 기존 채널 확인 (삭제된 채널 포함)
            ChzzkChanelDto existingChanel = chzzkChanelMapper.findByChanelUrl(channelUrl);
            
            ChzzkChanelDto chanelDto;
            boolean isUpdate = false;
            boolean isReactivated = false;
            
            if (existingChanel != null) {
                // 기존 채널이 있으면 (삭제된 채널이든 활성 채널이든)
                chanelDto = existingChanel;
                isUpdate = true;
                
                // 삭제된 채널이면 재활성화
                if ("N".equals(chanelDto.getChanelStatus())) {
                    chanelDto.setChanelStatus("Y");
                    isReactivated = true;
                    log.info("삭제된 채널 재활성화: {} (URL: {})", channelName, channelUrl);
                } else {
                    log.info("기존 채널 업데이트: {}", channelName);
                }
            } else {
                // URL로 찾지 못하면 이름과 플랫폼으로 확인
                existingChanel = chzzkChanelMapper.findByChanelNameAndPlatformType(channelName, "CHZZK");
                
                if (existingChanel != null) {
                    chanelDto = existingChanel;
                    isUpdate = true;
                    
                    // 삭제된 채널이면 재활성화
                    if ("N".equals(chanelDto.getChanelStatus())) {
                        chanelDto.setChanelStatus("Y");
                        isReactivated = true;
                        log.info("삭제된 채널 재활성화 (이름으로 찾음): {} (URL: {})", channelName, channelUrl);
                    } else {
                        log.info("기존 채널 업데이트 (이름으로 찾음): {}", channelName);
                    }
                } else {
                    // 새 채널 생성
                    chanelDto = new ChzzkChanelDto();
                    chanelDto.setChanelCreate(new Date());
                    log.info("새 채널 생성: {}", channelName);
                }
            }
            
            // 채널 정보 설정
            chanelDto.setChanelName(channelName);
            chanelDto.setPlatformType("CHZZK");
            chanelDto.setMemberId(memberId);
            
            // 구독자 수
            Long followerCount = channelDto.getFollowerCount();
            if (followerCount != null) {
                chanelDto.setPlatfromSubscribe(followerCount);
                // 팔로워 수도 같은 값으로 저장 (치지직에서는 구독자=팔로워)
                chanelDto.setChanelFollower(String.valueOf(followerCount));
            } else {
                chanelDto.setPlatfromSubscribe(0L);
                chanelDto.setChanelFollower("0");
            }
            
            // 채널 URL 설정
            chanelDto.setChanelUrl(channelUrl);
            
            // 채널 상태
            if (chanelDto.getChanelStatus() == null) {
                chanelDto.setChanelStatus("Y");
            }
            
            // DB 저장
            if (isUpdate) {
                chzzkChanelMapper.update(chanelDto);
            } else {
                chzzkChanelMapper.insert(chanelDto);
            }
            
            log.info("✅ 채널 저장 성공: {} (ID: {})", channelName, chanelDto.getChanelId());
            
            return chanelDto;
            
        } catch (Exception e) {
            log.error("❌ 채널 저장 실패", e);
            throw e;
        }
    }
    
    /**
     * 치지직 채널 정보를 DB에 저장 (Map 버전 - 호환성 유지)
     * @param channelData 채널 데이터 (Map)
     * @param memberId 멤버 ID (null이면 기본 회원 사용)
     * @return 저장된 채널 DTO
     */
    @Transactional
    public ChzzkChanelDto saveChanel(Map<String, Object> channelData, Long memberId) {
        // memberId가 null이면 기본 회원 사용
        if (memberId == null) {
            memberId = getOrCreateDefaultMemberId();
        }
        try {
            if (channelData == null) {
                log.warn("채널 데이터가 null입니다.");
                return null;
            }
            
            String channelId = (String) channelData.get("channelId");
            String channelName = (String) channelData.get("channelName");
            
            if (channelId == null || channelName == null) {
                log.warn("채널 정보가 불완전합니다. channelId: {}, channelName: {}", channelId, channelName);
                return null;
            }
            
            // 채널 URL 생성
            String channelUrl = "https://chzzk.naver.com/live/" + channelId;
            
            // 1. 먼저 URL로 기존 채널 확인 (삭제된 채널 포함)
            ChzzkChanelDto existingChanel = chzzkChanelMapper.findByChanelUrl(channelUrl);
            
            ChzzkChanelDto chanelDto;
            boolean isUpdate = false;
            boolean isReactivated = false;
            
            if (existingChanel != null) {
                // 기존 채널이 있으면 (삭제된 채널이든 활성 채널이든)
                chanelDto = existingChanel;
                isUpdate = true;
                
                // 삭제된 채널이면 재활성화
                if ("N".equals(chanelDto.getChanelStatus())) {
                    chanelDto.setChanelStatus("Y");
                    isReactivated = true;
                    log.info("삭제된 채널 재활성화: {} (URL: {})", channelName, channelUrl);
                } else {
                    log.info("기존 채널 업데이트: {}", channelName);
                }
            } else {
                // URL로 찾지 못하면 이름과 플랫폼으로 확인
                existingChanel = chzzkChanelMapper.findByChanelNameAndPlatformType(channelName, "CHZZK");
                
                if (existingChanel != null) {
                    chanelDto = existingChanel;
                    isUpdate = true;
                    
                    // 삭제된 채널이면 재활성화
                    if ("N".equals(chanelDto.getChanelStatus())) {
                        chanelDto.setChanelStatus("Y");
                        isReactivated = true;
                        log.info("삭제된 채널 재활성화 (이름으로 찾음): {} (URL: {})", channelName, channelUrl);
                    } else {
                        log.info("기존 채널 업데이트 (이름으로 찾음): {}", channelName);
                    }
                } else {
                    // 새 채널 생성
                    chanelDto = new ChzzkChanelDto();
                    chanelDto.setChanelCreate(new Date());
                    log.info("새 채널 생성: {}", channelName);
                }
            }
            
            // 채널 정보 설정
            chanelDto.setChanelName(channelName);
            chanelDto.setPlatformType("CHZZK");
            chanelDto.setMemberId(memberId);
            
            // 구독자 수
            Object followerCountObj = channelData.get("followerCount");
            if (followerCountObj != null) {
                Long followerCount = null;
                if (followerCountObj instanceof Number) {
                    followerCount = ((Number) followerCountObj).longValue();
                } else {
                    try {
                        followerCount = Long.parseLong(followerCountObj.toString());
                    } catch (NumberFormatException e) {
                        log.warn("구독자 수 파싱 실패: {}", followerCountObj);
                        followerCount = 0L;
                    }
                }
                chanelDto.setPlatfromSubscribe(followerCount);
                // 팔로워 수도 같은 값으로 저장
                chanelDto.setChanelFollower(String.valueOf(followerCount));
            } else {
                chanelDto.setPlatfromSubscribe(0L);
                chanelDto.setChanelFollower("0");
            }
            
            // 채널 URL 설정
            chanelDto.setChanelUrl(channelUrl);
            
            // 채널 상태
            if (chanelDto.getChanelStatus() == null) {
                chanelDto.setChanelStatus("Y");
            }
            
            // DB 저장
            if (isUpdate) {
                chzzkChanelMapper.update(chanelDto);
            } else {
                chzzkChanelMapper.insert(chanelDto);
            }
            
            log.info("✅ 채널 저장 성공: {} (ID: {})", channelName, chanelDto.getChanelId());
            
            return chanelDto;
            
        } catch (Exception e) {
            log.error("❌ 채널 저장 실패", e);
            throw e;
        }
    }
    
    /**
     * 구독자 정보 저장 (선택적)
     */
    @Transactional
    public void saveSubscriberData(Long chanelId, java.util.List<Map<String, Object>> subscribers) {
        try {
            if (subscribers == null || subscribers.isEmpty()) {
                log.info("구독자 데이터가 없습니다.");
                return;
            }
            
            log.info("구독자 {}명의 정보를 저장합니다.", subscribers.size());
            
            // 구독자 정보 저장 로직 (필요시 구현)
            
        } catch (Exception e) {
            log.error("❌ 구독자 데이터 저장 실패", e);
        }
    }
}


