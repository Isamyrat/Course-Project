package com.example.demo.dao;

import com.example.demo.model.PersonalInformation;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Repository
public interface PersonalInfoRepository extends CrudRepository<PersonalInformation,Long> {

    @Override
    Optional<PersonalInformation> findById(Long aLong);

    @Query("select p from PersonalInformation p where p.userInformation.id =:userId")
    PersonalInformation findByPersonId(@Param("userId")Long userId);

    @Modifying
    @Transactional
    @Query(value = "delete from PERSONAL_INFORMATION  where ID_HUMAN = :id", nativeQuery = true)
    void deleteAllByUserId(Long id);
}
