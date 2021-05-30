package com.example.demo.dao;

import com.example.demo.model.CallBack;
import com.example.demo.model.User;
import com.example.demo.model.enumModel.Status;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Repository
public interface CallBackRepository extends PagingAndSortingRepository<CallBack, Long> {
    @Override
    Optional<CallBack> findById(Long aLong);

    @Query("select c from  CallBack  c where c.userCallBack.id = :userId")
    List<CallBack> findByUserId(@Param("userId")Long userId);

    @Query("select c from  CallBack  c where c.userCallBack.id = :userId")
    Page<CallBack> findAllByUserId(@Param("userId")Long userId, Pageable pageable);

    @Query("select c from  CallBack  c where c.userCallBack.id = :userId and  c.courseCallBack.id = :courseId and c.status = :status")
    CallBack findByUserIdAndCallBakIdAndStatus(@Param("userId")Long userId, @Param("courseId")Long courseId, @Param("status")String status );

    @Modifying
    @Transactional
    @Query(value = "DELETE from CALL_BACK  where id = :callBackId", nativeQuery = true)
    void deleteCallBackById(@Param("callBackId")Long callBackId);

    @Modifying
    @Transactional
    @Query(value = "delete from CALL_BACK where USER_ID = :id", nativeQuery = true)
    void deleteAllByUserId(Long id);

    @Query("select c from CallBack  c where c.status = :status")
    Page<CallBack> findByStatus(String status, Pageable pageable);

    @Query("select c from CallBack  c where c.status = :status or c.status = :status1")
    Page<CallBack> findAllByStatusOrStatus(String status, String status1, Pageable pageable);

}
