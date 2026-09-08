package com.finance.service;

import com.finance.DAO.UserDAO;
import com.finance.model.User;

public class UserService {

    private UserDAO userDAO;

    public UserService() {
        userDAO = new UserDAO();
    }

    public boolean registerUser(User user) {
        return userDAO.registerUser(user);
    }

	public User loginUser(String email, String password) {
		return userDAO.loginUser(email, password);
	}
	
	// fetch single user
	public User getUserByEmail(String email) {
	    return userDAO.getUserByEmail(email);
	}
	
	public boolean updatePassword(String email,String password) 
	{
	    return userDAO.updatePassword( email,password);
	}
	
	//== to fetch user by id
	public User getUserById(int id)
	{
		return userDAO.getUserById(id);
	}
	
	public boolean updateProfile( int uid, String name,String password,String cnfPassword, String dob, String gender) {
	    return userDAO.updateProfile(uid,name,password,cnfPassword,dob,gender
	    );
	}
}