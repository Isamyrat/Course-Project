package com.example.demo.controller;

import com.example.demo.model.Address;
import com.example.demo.model.User;
import com.example.demo.service.AddressService;
import com.example.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class AddressController {

    @Autowired
    private AddressService addressService;

    @Autowired
    private UserService userService;

    @GetMapping("/userAddressWatch{addressId}")
    public String userAddressWatch(@PathVariable(value = "addressId") Long addressId,
                                   Model model) {

        model.addAttribute("address", addressService.addressFind(addressId))
                .addAttribute("addressId", addressId);

        return "user/userAddressWatch";
    }

    @GetMapping("/addAddressUser")
    public String addAddressUser(Model model) {

        model.addAttribute("addressAdd", new Address());

        return "user/addAddressUser";
    }

    @PostMapping("/saveAddress")
    public String saveAddress(@ModelAttribute("addressAdd")
                                      Address address, Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();

        User user = userService.getUser(userDetails.getUsername());

        address.setUserAddress(user);

        if (!addressService.saveAddress(address)) {
            model.addAttribute("addressError", "Такой адрес уже существует!!!");
            return "user/addAddressUser";
        }

        return "redirect:/personalInformationUser";
    }

    @GetMapping("/editAddressUser{addressId}")
    public String editAddressUser(@PathVariable("addressId") Long addressId,
                                  Model model) {

        model.addAttribute("addressEdit", addressService.findById(addressId))
                .addAttribute("addressId", addressId);

        return "user/editAddressUser";
    }

    @PostMapping("/saveAddressEdit")
    public String saveAddressEdit(@ModelAttribute("addressEdit") Address address,Model model) {


        if (!addressService.editAddress(address)) {
            model.addAttribute("addressError", "Такой адрес уже существует!!!");
            return "manager/errors";
        }
        return "redirect:/personalInformationUser";
    }


    @PostMapping("/deleteAddress")
    public String  deleteAddress(@RequestParam(required = true, defaultValue = "" ) Long addressId,
                              @RequestParam(required = true, defaultValue = "" ) String action) {

        if (action.equals("delete")){
            addressService.deleteAddress(addressId);
        }

        return "redirect:/personalInformationUser";
    }
}
