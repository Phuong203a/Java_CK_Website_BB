package com.kayty.src.Controller;

import com.kayty.src.DAO.ShoppingCartDAO;
import com.kayty.src.DAO.ShoppingCartProductDAO;
import com.kayty.src.DAO.UserDAO;
import com.kayty.src.Helps.Utils;
import com.kayty.src.Model.Role;
import com.kayty.src.Model.ShoppingCart;
import com.kayty.src.Model.ShoppingCartProduct;
import com.kayty.src.Model.User;
import com.kayty.src.Repository.RoleRepository;
import jakarta.servlet.http.HttpServletRequest;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


import java.util.Collection;



@Controller
@RequestMapping("/auth")

public class AuthController {

    @Autowired
    private HttpServletRequest req;

    @Autowired
    private UserDAO userDAO = new UserDAO();
    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private  RoleRepository repository;

    @Autowired
    private ShoppingCartProductDAO shoppingCartProductDAO;

    @Autowired
    private ShoppingCartDAO shoppingCartDAO = new ShoppingCartDAO();

    //render giao diện login
    @GetMapping("/login")
    public String renderLogin(Model model) {
        return "login";


    }
    //render giao diện đăng kí
    @GetMapping("/register")
    public String renderRegister() {
        return "register";
    }

    //xử lý đăng kí người dùng

    @PostMapping("/register")
    public String handleRegister(@ModelAttribute User user, Model model) {
        User userExist = (User) userDAO.getByName(user.getUsername());
        if(userExist == null) {
            String encodedPassword = passwordEncoder.encode(user.getPassword());
            Role role =  repository.getById(2L);
            User newUser  = (User) userDAO.add(new User(user.getUsername(), encodedPassword,role));

            return "redirect:/auth/login";
        }
        model.addAttribute("error", "User already exists");
        return "register";
    }
    //authorization
    @GetMapping("/authorization")
    public String handleAuthorization(Authentication authentication) {
        String name = authentication.getName();

        Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();

        if (authorities.stream().anyMatch(authority -> authority.getAuthority().equals("ROLE_ADMIN"))) {
            // Chuyển hướng đến trang quản trị cho vai trò ADMIN
            return "redirect:/admin";
        } else {

            User user = (User) userDAO.getByName(name);
            Utils.userLogin = user;
            ShoppingCart sp = shoppingCartDAO.shoppingCartOfUser(user.getId());

            Utils.shoppingCart = sp;
            // total quantity
            int totalQuantity = shoppingCartProductDAO.getQuantityInCart(sp);

            HttpSession session = req.getSession();
            session.setAttribute("totalQuantity", totalQuantity);
            session.setAttribute("userName", name);
            // Chuyển hướng đến trang chủ cho vai trò USER hoặc các vai trò khác
            return "redirect:/home";
        }
    }

    //xử lý lỗi
    @GetMapping("/error")
    public String handleError() {
        return "redirect:/home";
    }
}





