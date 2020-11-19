package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class DBConnection {
    private DBConnection() {} //생성자. 객체 생성 불가능하게 private 설정
    //연결 객체를 리턴.
    static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/classdb","root","1234");
        }catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
    // 연결 종료
    static void close(Connection conn, Statement stmt, ResultSet rs) {
        try {
            if(rs != null) rs.close();
            if(stmt != null) stmt.close();
            if(conn != null) conn.close();
        } catch(Exception e){
            e.printStackTrace();
        }
    }
}
