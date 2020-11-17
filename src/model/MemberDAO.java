package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDAO {
    public int insert(Member member){
        //연결객체 생성
        Connection conn = DBConnection.getConnection();
        //문장을 준비하는 객체.
        PreparedStatement pstmt = null;
        String sql = "insert into member"
                + " (id, pass, name, gender, email, tel, picture)"
                + " values (?,?,?,?,?,?,?)";
        try {
            //sql 구문을 dbms에 전달. 파라미터 전송이 가능
            pstmt = conn.prepareStatement(sql);
            //1 : 첫번째 ?의 값 설정
            pstmt.setString(1, member.getId());
            pstmt.setString(2,member.getPass());
            pstmt.setString(3, member.getName());
            pstmt.setInt(4,member.getGender());
            pstmt.setString(5, member.getEmail());
            pstmt.setString(6, member.getTel());
            pstmt.setString(7, member.getPicture());
            //int executeUpdate() : select 구문을 제외한 sql 구문 실행시 사용
            //                      레코드가 변경된 갯수 리턴
            return pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.close(conn, pstmt, null);
        }
        return 0;
    }
    //id: 화면에서 입력된 id값
    public Member selectOne(String id) {
        Connection conn =DBConnection.getConnection();
        String sql = "select * from member where id = ?";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,id);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                Member member = new Member();
                member.setId(rs.getString("id"));
                member.setPass(rs.getString("pass"));
                member.setName(rs.getString("name"));
                member.setGender(rs.getInt("gender"));
                member.setTel(rs.getString("tel"));
                member.setEmail(rs.getString("email"));
                member.setPicture(rs.getString("picture"));
                return member;
            }
        }catch(SQLException e) {
            e.printStackTrace();
        }finally {
            DBConnection.close(conn,pstmt,rs);
        }
        return null;
    }
}
