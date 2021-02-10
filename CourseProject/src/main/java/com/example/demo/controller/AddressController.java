package com.example.demo.controller;


import com.example.demo.model.Address;
import com.example.demo.model.CallBack;
import com.example.demo.model.PersonalInformation;
import com.example.demo.model.User;
import com.example.demo.service.AddressService;
import com.example.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.List;
import javax.validation.Valid;

@Controller
public class AddressController {

    @Autowired
    private AddressService addressService;

    @Autowired
    private UserService userService;

    @GetMapping("/userAddressWatch")
    public String userAddressWatch(@RequestParam("addressId") Long addressId,
                                   Model model){

        List<Address> address = addressService.addressFind(addressId);

        model.addAttribute("address", address);

        return "user/userAddressWatch";
    }

    @GetMapping("/addAddressUser")
    public String addAddressUser(Model model) {

             model.addAttribute("addressAdd", new Address());

        return "user/addAddressUser";
    }

    @PostMapping("/saveAddress")
    public String saveAddress(@ModelAttribute("addressAdd")
                              @Valid Address address) {

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();

        User u = userService.getUser(userDetails.getUsername());

        User user = addressService.findUser(u.getId());

        address.setUser_address(user);

        if (!addressService.saveAddress(address)) {
/*
            model.addAttribute("addressError", "Пользователь с личными данными уже существует");
*/
            return "user/addAddressUser";
        }

        return "redirect:/personalInformationUser";
    }

    @GetMapping("/editAddressUser")
    public String editAddressUser(@RequestParam("addressId") Long addressId,
                                  Model model) {

        Address address = addressService.findById(addressId);


        model.addAttribute("addressEdit", address);


        return "user/editAddressUser";
    }

    @PostMapping("/saveAddressEdit")
    public String saveAddressEdit(@ModelAttribute("addressEdit") Address address) {

        addressService.editAddress(address);

        return "redirect:/personalInformationUser";
    }

    @PostMapping("/deleteAddress")
    public String deleteTopic(@RequestParam(required = true, defaultValue = "") Long idAddress,
                              @RequestParam(required = true, defaultValue = "") String action) {

        if(action.equals("delete")){
            addressService.deleteAddress(idAddress);
        }
        return "redirect:/personalInformationUser";
    }
}
