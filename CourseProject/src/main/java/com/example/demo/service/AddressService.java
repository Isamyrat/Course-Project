package com.example.demo.service;

import com.example.demo.dao.AddressRepository;
import com.example.demo.dao.UserRepository;
import com.example.demo.model.Address;
import com.example.demo.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class AddressService {

    @Autowired
    private AddressRepository addressRepository;

    @Autowired
    private UserRepository userRepository;

    public Address findById(Long userId){
        Optional<Address> address = addressRepository.findById(userId);
        return address.orElse(new Address());
    }

    public Boolean saveAddress(Address address){
        User user = userRepository.findByUser(address.getUser_address().getId());

        /*if(user == null){
            return false;
        }
*/
        address.setUser_address(user);
        addressRepository.save(address);
        return true;
    }

    public List<Address> addressFind(Long userId){
        return addressRepository.findByUser(userId);
    }

    public User findUser(Long user){
        return userRepository.findByUser(user);
    }

    public Address editAddress(Address address){
        return addressRepository.save(address);
    }

    public boolean deleteAddress(Long id){
        Address address = findById(id);



        if(address != null){
            addressRepository.delete(address);
            return true;
        }/*
        if(addressRepository.findById(id).isPresent()){
            addressRepository.deleteById(id);
            return true;
        }*/
        return false;
    }


}
