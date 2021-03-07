package com.example.demo.service;

import com.example.demo.dao.PersonalInfoRepository;
import com.example.demo.dao.UserRepository;
import com.example.demo.model.PersonalInformation;
import com.example.demo.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Service
public class PersonalInformationService {

    @Autowired
    private PersonalInfoRepository personalInfoRepository;

    @Autowired
    private UserRepository userRepository;

    public PersonalInformation findById(Long userId) {
        Optional<PersonalInformation> personalInformation = personalInfoRepository.findById(userId);
        return personalInformation.orElse(new PersonalInformation());
    }

    public Boolean savePersonInfo(PersonalInformation personalInformation) {
        User user = userRepository.findByUser(personalInformation.getUserInformation().getId());

        PersonalInformation personalInformation1 = personalInfoRepository.findByPersonId(user.getId());

        if (personalInformation1 != null) {
            return false;
        }
        personalInformation.setUserInformation(user);
        personalInfoRepository.save(personalInformation);
        return true;
    }

    public PersonalInformation findPerson(Long user) {
        return personalInfoRepository.findByPersonId(user);
    }

    @Transactional
    public void editPerson(PersonalInformation personalInformation) {
        personalInfoRepository.save(personalInformation);
    }

}
