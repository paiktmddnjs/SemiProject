package com.example.demo.Repository;


import com.example.demo.Entity.Chanel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ChanelRepository extends JpaRepository<Chanel, Long> {
    // 필요하면 findByMemberId 등 커스텀 메서드 추가 가능
}

