package com.kayty.src.API;

import com.kayty.src.DAO.UserDAO;
import com.kayty.src.Helps.Response;
import com.kayty.src.Model.Product;
import com.kayty.src.Model.User;
import com.kayty.src.Repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/user")
public class UserAPIController {
    @Autowired
    private UserRepository userRepository;

    @GetMapping("/get-all-users")
    public Object getAllUsers() {
        List<User> users = userRepository.findAll(Sort.by(Sort.Direction.DESC, "createdDate"));

        return Response.createSuccessResponseModel(users.size(), users);
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

                return Response.createResponseModel("add user success");
            }else {
                return Response.createResponseModel("password and confirm password must be same or username empty");
            }
        }catch (Exception e){
            e.printStackTrace();
            return Response.createResponseModel("Internal Server Error");
        }
    }
}