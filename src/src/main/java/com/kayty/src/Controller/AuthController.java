package com.kayty.src.Controller;

import com.kayty.src.DAO.ShoppingCartDAO;
import com.kayty.src.DAO.ShoppingCartProductDAO;
import com.kayty.src.DAO.UserDAO;
import com.kayty.src.Helps.EmailService;
import com.kayty.src.Helps.Utils;
import com.kayty.src.Model.Role;
import com.kayty.src.Model.ShoppingCart;
import com.kayty.src.Model.ShoppingCartProduct;
import com.kayty.src.Model.User;
import com.kayty.src.Repository.RoleRepository;
import com.kayty.src.Repository.ShoppingCartRepository;
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
import java.util.Optional;
import java.util.Random;


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
    private ShoppingCartRepository shoppingCartRepository;

    @Autowired
    private ShoppingCartProductDAO shoppingCartProductDAO;

    @Autowired
    private ShoppingCartDAO shoppingCartDAO = new ShoppingCartDAO();
    @Autowired
    private EmailService emailService;
    //dung de doi mat khau
    String code;
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
            User newUser  = (User) userDAO.add(new User(user.getUsername(), encodedPassword, user.getEmail(), role, true));
            ShoppingCart s = new ShoppingCart();
            s.setUser(newUser);
            shoppingCartRepository.save(s);
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

    //render giao diện quên mật khẩu
    @GetMapping("/forgot-password")
    public String renderForgotPassword() {
        return "forgot_password";
    }

    //xử lý quên mật khẩu
    @PostMapping("/forgot-password")
    public String sendEmailRequest(@ModelAttribute User user, Model model){
        Optional<User> userExist = userDAO.findByEmail(user.getEmail());
        if(userExist.isPresent()) {
            //random code
            code = generateRandomNumberString();
            //gui gmail
            passwordResetEmailLink(userExist, code);
            Long idUser = userExist.get().getId();
            model.addAttribute("idUser", idUser);
            return "confirm_code";
        }
        return "redirect:/auth/forgot-password";
    }

    @GetMapping("/confirm-code")
    public String confirm(){
        return "confirm_code";
    }
    @PostMapping("/confirm-code")
    public String confirmCode(@RequestParam(name = "code") String codeEmail, Model model, @RequestParam(name = "id-user") Long idUser1){
        if (code.equals(codeEmail)) {
            model.addAttribute("idUser", idUser1);
            return "reset_password";
        }
        return "redirect:/auth/forgot-password";
    }
    @GetMapping("/reset-password")
    public String resetPassword(){
        return "reset_password";
    }
    @PostMapping("/reset-password")
    public String resetPass(@RequestParam(name = "idUser") Long idUser, @RequestParam(name = "password1") String password){
        Optional<User> userOptional = userDAO.findById(idUser);
        if(userOptional.isPresent()) {
            User user = userOptional.get();
            String encodedPassword = passwordEncoder.encode(password);
            user.setPassword(encodedPassword);
            // In ra thông tin người dùng để kiểm tra
//            System.out.println("User information before update: " + user.toString());
            userDAO.update(user);
            return "redirect:/auth/login";
        } else {
            return "redirect:/login";
        }
    }

    //Hàm random 6 số để check
    public String generateRandomNumberString() {
        Random random = new Random();
        StringBuilder stringBuilder = new StringBuilder();
        for (int i = 0; i < 6; i++) {
            int randomNumber = random.nextInt(10); // 0 and 9
            stringBuilder.append(randomNumber);
        }
        return stringBuilder.toString();
    }


    //send email
    private void passwordResetEmailLink(Optional<User> user, String passwordResetToken) {
        String subject = "Password Reset Request Verification";
        String body = "Code: "+passwordResetToken;
        emailService.sendEmail(user.get().getEmail(), subject, body);
    }
}





