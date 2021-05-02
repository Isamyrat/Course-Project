package com.example.demo.service;

import com.example.demo.dao.PersonalInfoRepository;
import com.example.demo.dao.UserRepository;
import com.example.demo.model.PersonalInformation;
import com.example.demo.model.User;
import com.example.demo.model.enumModel.Gender;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Objects;
import java.util.Optional;
import java.util.ResourceBundle;

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

        ResourceBundle resourceBundle = ResourceBundle.getBundle("locale/messages", Objects.requireNonNull(
                Objects.requireNonNull(LocaleContextHolder.getLocaleContext()).getLocale()));

        personalInformation.setGender(resourceBundle.getString(personalInformation.getGender()));
        personalInformation.setUserInformation(user);
        personalInfoRepository.save(personalInformation);
        return true;
    }

    public PersonalInformation findPerson(Long user) {
        return personalInfoRepository.findByPersonId(user);
    }

    @Transactional
    public void editPerson(PersonalInformation personalInformation) {
        ResourceBundle resourceBundle = ResourceBundle.getBundle("locale/messages", Objects.requireNonNull(
                Objects.requireNonNull(LocaleContextHolder.getLocaleContext()).getLocale()));

        personalInformation.setGender(resourceBundle.getString(personalInformation.getGender()));

        personalInfoRepository.save(personalInformation);
    }

}
