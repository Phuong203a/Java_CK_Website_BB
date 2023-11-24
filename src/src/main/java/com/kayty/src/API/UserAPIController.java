package com.kayty.src.API;

import com.kayty.src.DAO.UserDAO;
import com.kayty.src.Helps.Response;
import com.kayty.src.Model.Product;
import com.kayty.src.Model.User;
import com.kayty.src.Repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/user")
public class UserAPIController {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private UserDAO userDAO;

    //lay thong tin tat ca status nguoi dung
    @GetMapping("/")
    public Response<List<User>> getAllUser(){
        Iterable<User> liUser = userDAO.getAllUser();
        Map<String, List<User>> data = new HashMap<>();
        data.put("list", (List<User>) liUser);
        return new Response<>(200, "Successful", ((List<User>) liUser).size(), data);
    }

    @PostMapping("/add-user")
    public Response<User> addUser(@RequestBody Map<String, Object> req){
        try {
            String username = (String) req.get("username");
            String password = (String) req.get("password");
            String confirm = (String) req.get("confirmpassword");
            username = username.trim();
            password = password.trim();
            confirm = confirm.trim();

            if(password.equals(confirm) && !username.isEmpty()){
                User user = new User();
                user.setUsername(username);
                user.setPassword(password);
                userRepository.save(user);

                return new Response(200, "add user success");
            }else {
                return new Response<>(404, "password and confirm password must be same or username empty");
            }
        }catch (Exception e){
            e.printStackTrace();
            return new Response<>(500, "Internal Server Error");
        }
    }

//    @PostMapping("/update-status/{id}")
//    public Response<User> updateStatus(@PathVariable Long id, ){
//        User user = userRepository.getById(id);
//        boolean status = req.;
//
//
//        return new Response<>(200, "update successful");
//    }

}