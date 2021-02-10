package com.example.demo.dao;

import com.example.demo.model.Address;
import com.example.demo.model.CallBack;
import com.example.demo.model.Course;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface CallBackRepository extends CrudRepository<CallBack, Long> {
    @Override
    Optional<CallBack> findById(Long aLong);

    @Query("select c from  CallBack  c where c.userCallBack.id = :userId")
    List<CallBack> findByUser(@Param("userId")Long userId);

    List<CallBack> findByStatus(String status);

    @Query("select c from CallBack  c where c.status = :status1 or  c.status = :status2")
    List<CallBack> findByStatuss(String status1, String status2);
}
