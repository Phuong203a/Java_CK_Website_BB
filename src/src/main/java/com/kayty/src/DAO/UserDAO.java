package com.kayty.src.DAO;

import com.kayty.src.Model.User;
import com.kayty.src.Repository.Repository;
import com.kayty.src.Repository.UserRepository;
import jakarta.persistence.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.List;
import java.util.Optional;

@org.springframework.stereotype.Repository
public class UserDAO implements Repository {
    @PersistenceContext
    private EntityManager entityManager;
    @Autowired
    private  UserRepository userRepository;
    @Autowired
    private PasswordEncoder passwordEncoder;

    private final String GET_USER_BY_NAME = "SELECT u FROM User u WHERE u.username = :username";

    @Override
    public Object add(Object item) {
        return userRepository.save((User) item);

    }

    @Override
    public Object get(Object id) {
        return userRepository.findById((Long) id).orElse(null);
    }

    @Override
    public List getListSearch(String keyword) {
        return null;
    }

    @Override
    public boolean deleteById(Object id) {
        return false;
    }

    @Override
    public Object getByName(String name) {
        Query query = entityManager.createQuery(GET_USER_BY_NAME);
        query.setParameter("username", name);

        try {
            User user = (User) query.getSingleResult();

            return user;
        } catch (NoResultException e) {
            // Handle the case where no user is found
            System.out.println("User not found for username: " + name);
            return null;  // or throw a custom exception if needed
        } catch (Exception e) {
            // Log or handle other exceptions
            e.printStackTrace();
            throw new RuntimeException("Error retrieving user by name", e);
        }
    }


    @Override
    public boolean update(Object item) {
        return false;
    }

//    public Iterable<User> getAllUser(){
//        return userRepository.findAll();
//    }
public Iterable<User> getAllUser() {
    return userRepository.findAll();
}

    public Optional<User> findByEmail(String email) {
        return userRepository.findByEmail(email);
    }



    public void resetUserPassword(User user, String newPassword) {
        user.setPassword(passwordEncoder.encode(newPassword));
        userRepository.save(user);
    }


    public Optional<User> findById(Long idUser) {
        return userRepository.findById(idUser);
    }
    // Lấy danh sách tất cả các user từ cơ sở dữ liệu

}
