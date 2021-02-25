package com.example.demo.dao;

import com.example.demo.model.CallBack;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Repository
public interface CallBackRepository extends CrudRepository<CallBack, Long> {
    @Override
    Optional<CallBack> findById(Long aLong);

    @Query("select c from  CallBack  c where c.userCallBack.id = :userId")
    List<CallBack> findByUser(@Param("userId")Long userId);

    List<CallBack> findByStatus(String status);

    @Query("select c from CallBack  c where c.status = :status1 or  c.status = :status2")
    List<CallBack> findByStatuss(String status1, String status2);

    @Query("select c from  CallBack  c where c.userCallBack.id = :userId and  c.courseCallBack.id = :courseId and c.status = :status")
    CallBack findByUserSingle(@Param("userId")Long userId, @Param("courseId")Long courseId, @Param("status")String status );


    @Modifying
    @Transactional
    @Query(value = "DELETE from CALL_BACK  where id = :callBackId", nativeQuery = true)
    void deleteCallBackId(@Param("callBackId")Long callBackId);

}
