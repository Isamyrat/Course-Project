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

    public Address findById(Long userId) {
        Optional<Address> address = addressRepository.findById(userId);
        return address.orElse(new Address());
    }

    public Boolean saveAddress(Address address) {
        User user = userRepository.findByUser(address.getUserAddress().getId());

        Address address1 = addressRepository.findByUserIdAndAddress(user.getId(), address.getCountry(), address.getCity(), address.getDistrict(), address.getStreet(), address.getHouse(), address.getApartment());

       if (address1 != null) {
            return false;
        }

        address.setUserAddress(user);
        addressRepository.save(address);
        return true;
    }

    public List<Address> addressFind(Long userId) {
        return addressRepository.findByUserId(userId);
    }

    public Boolean editAddress(Address address) {

        Address address1 = addressRepository.findByUserIdAndAddress(address.getUserAddress().getId(), address.getCountry(), address.getCity(), address.getDistrict(), address.getStreet(), address.getHouse(), address.getApartment());

        if (address1 != null) {
            return false;
        }

        addressRepository.save(address);
        return true;
    }

    public void deleteAddress(Long addressId) {
        addressRepository.deleteAddressById(addressId);
    }

}
