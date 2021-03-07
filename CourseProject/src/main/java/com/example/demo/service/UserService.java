package com.example.demo.service;

import com.example.demo.dao.*;
import com.example.demo.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class UserService implements UserDetailsService {

    @Autowired
    UserRepository userRepository;

    @Autowired
    RoleRepository roleRepository;

    @Autowired
    GroupService groupService;

    @Autowired
    JournalGroupRepository journalGroupRepository;

    @Autowired
    AddressRepository addressRepository;

    @Autowired
    CallBackRepository callBackRepository;

    @Autowired
    PersonalInfoRepository personalInfoRepository;

    @Autowired
    BCryptPasswordEncoder bCryptPasswordEncoder;


    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepository.findByUsername(username);

        if (user == null) {
            throw new UsernameNotFoundException("User not found");
        }

        return user;
    }

    public User findUserById(Long userId) {
        Optional<User> user = userRepository.findById(userId);
        return user.orElse(new User());
    }

    public List<User> allUsers() {
        return userRepository.findAll();
    }

    public List<User> allUser(int pageNumber, int pageSize) {
        Pageable pageable = PageRequest.of(pageNumber, pageSize);
        Page<User> page = userRepository.findAll(pageable);
        List<User> userList = new ArrayList<>();
        for (User user : page) {
            for (Role role : user.getRoles()) {
                if (role.getName().equals("ROLE_USER"))
                    userList.add(user);
            }
        }
        return userList;
    }

    public List<User> allManagers(int pageNumber, int pageSize) {
        Pageable pageable = PageRequest.of(pageNumber, pageSize);
        Page<User> page = userRepository.findAll(pageable);
        List<User> userList = new ArrayList<>();
        for (User user : page) {
            for (Role role : user.getRoles()) {
                if (role.getName().equals("ROLE_MANAGER"))
                    userList.add(user);
            }
        }
        return userList;
    }

    public List<User> allTeachers(int pageNumber, int pageSize) {
        Pageable pageable = PageRequest.of(pageNumber, pageSize);
        Page<User> page = userRepository.findAll(pageable);
        List<User> userList = new ArrayList<>();
        for (User user : page) {
            for (Role role : user.getRoles()) {
                if (role.getName().equals("ROLE_TEACHER"))
                    userList.add(user);
            }
        }
        return userList;
    }

    public boolean saveUser(User user) {
        User userFromDB = userRepository.findByUsername(user.getUsername());

        if (userFromDB != null) {
            return false;
        }

        user.setRoles(Collections.singleton(new Role(1L, "ROLE_USER")));
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        userRepository.save(user);
        return true;
    }

    public boolean saveManager(User user) {
        User userFromDB = userRepository.findByUsername(user.getUsername());

        if (userFromDB != null) {
            return false;
        }

        user.setRoles(Collections.singleton(new Role(3L, "ROLE_MANAGER")));
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        userRepository.save(user);
        return true;
    }

    public boolean saveTeacher(User user) {
        User userFromDB = userRepository.findByUsername(user.getUsername());

        if (userFromDB != null) {
            return false;
        }

        user.setRoles(Collections.singleton(new Role(4L, "ROLE_Teacher")));
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        userRepository.save(user);
        return true;
    }

    public void editTeacher(User user) {
        user.setRoles(Collections.singleton(new Role(4L, "ROLE_Teacher")));
        userRepository.save(user);
    }

    public void editAdmin(User user) {
        user.setRoles(Collections.singleton(new Role(2L, "ROLE_ADMIN")));
        userRepository.save(user);
    }

    public void editManager(User user) {
        user.setRoles(Collections.singleton(new Role(3L, "ROLE_MANAGER")));
        userRepository.save(user);
    }

    public void editUser(User user) {
        user.setRoles(Collections.singleton(new Role(1L, "ROLE_USER")));
        userRepository.save(user);
    }

    public void deleteManager(Long userId) {
        userRepository.deleteById(userId);
    }

    public Boolean deleteStudents(Long userId) {
        List<JournalGroup> journalGroupList = journalGroupRepository.findByUserId(userId);
        List<Address> addressList = addressRepository.findByUserId(userId);
        List<Group> groupList = groupService.findByUserId(userId);
        List<CallBack> callBackList = callBackRepository.findByUserId(userId);
        PersonalInformation personalInformation = personalInfoRepository.findByPersonId(userId);
        if (groupList.size() == 0) {
            if (callBackList.size() > 0) {
                callBackRepository.deleteAllByUserId(userId);
            }
            if (addressList.size() > 0) {
                addressRepository.deleteAllByUserId(userId);
            }
            if (journalGroupList.size() > 0) {
                journalGroupRepository.deleteAllByUserId(userId);
            }
            if (personalInformation != null) {
                personalInfoRepository.deleteAllByUserId(userId);
            }
            if (userRepository.findById(userId).isPresent()) {
                userRepository.deleteById(userId);
            }
            return true;
        } else
            return false;
    }

    public Boolean deleteTeacher(Long userId) {
        List<Group> groupList = groupService.findByTeacherId(userId);
        if (groupList.size() == 0) {
            if (userRepository.findById(userId).isPresent()) {
                userRepository.deleteById(userId);
            }
            return true;
        } else
            return false;
    }

    public User getUser(String username) {
        return userRepository.findByUsername(username);
    }


}
