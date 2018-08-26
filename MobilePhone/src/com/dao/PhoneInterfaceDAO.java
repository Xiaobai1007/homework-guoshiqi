package com.dao;

import com.vo.Phone;

import java.sql.SQLException;
import java.util.List;

public interface PhoneInterfaceDAO {
    List<Phone> findAll() throws SQLException;
    Phone findById(int id);
    List<Phone> getPhonesByName(String name);
    boolean update(Phone phone);
    boolean delete(int id);
    Phone insert(Phone phone);
}
