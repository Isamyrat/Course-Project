package com.example.demo.dao;

import com.example.demo.model.CallBack;
import com.example.demo.model.enumModel.Status;
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
    List<CallBack> findByUser(@Param("userId")Long userId);

    @Query("select c from  CallBack  c where c.userCallBack.id = :userId")
    List<CallBack> findAllByUserCallBack(@Param("userId")Long userId, Pageable pageable);

    List<CallBack> findByStatus(Status status);

    List<CallBack> findAllByStatus(Status status, Pageable pageable);


    List<CallBack> findAllByStatusOrStatus(Status status1, Status status2,Pageable pageable);

    @Query("select c from  CallBack  c where c.userCallBack.id = :userId and  c.courseCallBack.id = :courseId and c.status = :status")
    CallBack findByUserSingle(@Param("userId")Long userId, @Param("courseId")Long courseId, @Param("status")Status status );


    @Modifying
    @Transactional
    @Query(value = "DELETE from CALL_BACK  where id = :callBackId", nativeQuery = true)
    void deleteCallBackId(@Param("callBackId")Long callBackId);


    @Modifying
    @Transactional
    @Query(value = "delete from CALL_BACK where USER_ID = :id", nativeQuery = true)
    void deleteAllByUserCallBack(Long id);

}
