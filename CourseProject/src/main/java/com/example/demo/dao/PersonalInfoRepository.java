package com.example.demo.dao;

import com.example.demo.model.PersonalInformation;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface PersonalInfoRepository extends CrudRepository<PersonalInformation,Long> {


    @Override
    Optional<PersonalInformation> findById(Long aLong);

    @Query("select p from PersonalInformation p where p.user_information.id =:userId")
    public PersonalInformation findByPersonId(@Param("userId")Long userId);

}
