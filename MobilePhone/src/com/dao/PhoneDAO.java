package com.dao;

import com.vo.Phone;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class PhoneDAO implements PhoneInterfaceDAO {

    private static List<Phone> phoneDB = new ArrayList<Phone>();

    static {
        Phone b1 = new Phone(62115, "小米 8",2700,"2018-09-26","新款推出",50,1);
        Phone b2 = new Phone(62364, "小米 6",2000,"2017-09-26","一款不错的手机",50,1);
        Phone b3 = new Phone(23197, "小米 Max2",1600,"2016-09-26","一款不错的手机",60,1);
        Phone b4 = new Phone(36566, "华为honour 8",2000,"2015-09-26","一款不错的手机",70,1);
        Phone b5 = new Phone(65763, "vivo x21",2600,"2014-09-26","一款不错的手机",100,1);
        Phone b6 = new Phone(27314, "vivo x21",2600,"2013-09-26","一款不错的手机",100,1);

        phoneDB.add(b1);
        phoneDB.add(b2);
        phoneDB.add(b3);
        phoneDB.add(b4);
        phoneDB.add(b5);
        phoneDB.add(b6);
    }


    public List<Phone> findAll() {
//        List<Phone> phoneList = new ArrayList<Phone>();
//        String sql = "select * from phone_info";
//        ResultSet rs = (ResultSet) DBUtil.executeQuery(sql);
//        Phone model = null;
//        try {
//            while (rs.next()) {
//                model = new Phone(
//                        rs.getInt("id"),
//                        rs.getString("name"),
//                        rs.getDouble("price"),
//                        rs.getString("datetime"),
//                        rs.getString("detailed"),
//                        rs.getInt("stock"),
//                        rs.getInt("state")
//                );
//                phoneList.add(model);
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }

        return phoneDB;
    }

    public Phone findById(int id) {
//        Phone phone = null;
//        String sql = "select * from phone_info where id = ?";
//        Object[] in = {id};
//        ResultSet rs = DBUtil.executeQuery(sql, in);
//        try {
//            while (rs.next()) {
//                phone = new Phone(
//                        rs.getInt("id"),
//                        rs.getString("name"),
//                        rs.getDouble("price"),
//                        rs.getString("datetime"),
//                        rs.getString("detailed"),
//                        rs.getInt("stock"),
//                        rs.getInt("state")
//                );
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }

        for (Phone phone : phoneDB) {
            if(phone.getId() == id) {
                return phone;
            }
        }
        return null;
    }

    @Override
    public List<Phone> getPhonesByName(String name) {
//        List<Phone> phoneList = new ArrayList<Phone>();
//        String sql = "select * from phone_info where name = ?";
//        Object[] in = {name};
//        ResultSet rs = (ResultSet) DBUtil.executeQuery(sql, in);
//        Phone model = null;
//        try {
//            while (rs.next()) {
//                model = new Phone(
//                        rs.getInt("id"),
//                        rs.getString("name"),
//                        rs.getDouble("price"),
//                        rs.getString("datetime"),
//                        rs.getString("detailed"),
//                        rs.getInt("stock"),
//                        rs.getInt("state")
//                );
//                phoneList.add(model);
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
        ArrayList<Phone> phones = new ArrayList<>();
        for (Phone phone : phoneDB) {
            String realName = phone.getName().toLowerCase();
            if (realName.contains(name.toLowerCase())) {
                phones.add(phone);
            }
        }
        return phones;
    }

    public Phone insert(Phone phone) {
        if(phoneDB.add(phone)){
            return phone;
        }
        return null;
    }

    public boolean update(Phone phone) {
        for (Phone phoneNew : phoneDB){
            if(phoneNew.getId() == phone.getId()){
                phoneNew.setName(phone.getName());
                phoneNew.setDatetime(phone.getDatetime());
                phoneNew.setPrice(phone.getPrice());
                phoneNew.setDetailed(phone.getDetailed());
                phoneNew.setState(phone.getState());
                phoneNew.setStock(phone.getStock());
                return true;
            }
        }
        return false;
    }

    public boolean delete(int id) {
//        int count = 0;
//        String sql = "delete from phone_info where id = ?";
//        Object [] in = {id};
//        count = DBUtil.executeUpdate(sql,in);
//        if(count>0){
//            return true;
//        }else{
//            return false;
//        }

        for (Phone phone : phoneDB) {
            if(phone.getId()==id){
                return phoneDB.remove(phone);
            }
        }
        return false;

    }
}
