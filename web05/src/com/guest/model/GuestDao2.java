package com.guest.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.guest.bean.GuestBean;

public class GuestDao2 {
	private Connection conn;
	private Statement stmt;
	private ResultSet rs;
	private int result = -1;
	
	public GuestDao2(){
		
	}
	
	public int deleteOne(int sabun){
		String sql = "delete from guest where sabun="+sabun;
		conn =  OraDB.getConnection();
		try{
			stmt = conn.createStatement();
			result = stmt.executeUpdate(sql);
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			try {
				if(conn!=null)
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public int updateOne(GuestBean bean){
		String sql = "update guest set name='"+bean.getName()+"',";
		sql += "pay="+bean.getPay()+" where sabun="+bean.getSabun();
		System.out.println(sql);
		conn = OraDB.getConnection();
		try{
			stmt = conn.createStatement();
			result = stmt.executeUpdate(sql);
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}finally{
				try {
					if(conn!=null)
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		return result;
	}
	
	public int insertOne(String name, int pay){
		
		String sql = "insert into guest (sabun, name, nalja, pay)";
		sql += " values (guest_seq.nextval, '"+name+"', sysdate, "+pay+")";
		System.out.println(sql);
		conn = OraDB.getConnection();
		try{
			stmt = conn.createStatement();
			result = stmt.executeUpdate(sql);
		}catch(Exception ex){}finally{
			try{
				if(rs!=null)rs.close();
				if(stmt!=null)stmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex){
				ex.printStackTrace();
			}
		}
		return result;
	}
	
	public ArrayList<GuestBean> selectAll(){
		String sql =  "select * from guest";
		ArrayList<GuestBean> list = new ArrayList<GuestBean>();
		conn = OraDB.getConnection();
		try {
			stmt = conn.createStatement();
			rs =  stmt.executeQuery(sql);
			while(rs.next()){
				GuestBean bean = new GuestBean();
				bean.setSabun(rs.getInt("sabun"));
				bean.setName(rs.getString("name"));
				bean.setNalja(rs.getDate("nalja"));
				bean.setPay(rs.getInt("pay"));
				list.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try{
				if(rs!=null)rs.close();
				if(stmt!=null)stmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex){
				ex.printStackTrace();
			}
		}
		return list;
	}
	
	public GuestBean selectOne(int sabun){
		String sql =  "select * from guest where sabun="+sabun;
		GuestBean bean = new GuestBean();
		System.out.println(sql);
		conn = OraDB.getConnection();
		try {
			stmt = conn.createStatement();
			rs =  stmt.executeQuery(sql);
			if(rs.next()){
				bean.setSabun(rs.getInt("sabun"));
				bean.setName(rs.getString("name"));
				bean.setNalja(rs.getDate("nalja"));
				bean.setPay(rs.getInt("pay"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try{
				if(rs!=null)rs.close();
				if(stmt!=null)stmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex){
				ex.printStackTrace();
			}
		}
		return bean;
	}
}
