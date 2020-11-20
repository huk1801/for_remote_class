package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
            if(rs.next()) { // id 존재
                Member member = new Member();
                member.setId(rs.getString("id"));
                member.setPass(rs.getString("pass"));
                member.setName(rs.getString("name"));
                member.setGender(rs.getInt("gender"));
                member.setTel(rs.getString("tel"));
                member.setEmail(rs.getString("email"));
                member.setPicture(rs.getString("picture"));
                return member; // id 해당하는 db의 정보 저장
            }
        }catch(SQLException e) {
            e.printStackTrace();
        }finally {
            DBConnection.close(conn,pstmt,rs);
        }
        return null;
    }
    public int update(Member member) {
        Connection conn = DBConnection.getConnection();
        PreparedStatement pstmt = null;
        String sql = "update member set name = ?,"
                + " gender=?, email=?, tel=?, picture=? where id=?"; //공백 항상 추가하는 습관들이기
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, member.getName());
            pstmt.setInt(2,member.getGender());
            pstmt.setString(3, member.getEmail());
            pstmt.setString(4, member.getTel());
            pstmt.setString(5, member.getPicture());
            pstmt.setString(6, member.getId());
            return pstmt.executeUpdate(); //변경된 레코드의 갯수
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.close(conn,pstmt,null);
        }
        return 0;
    }
    public List<Member> list() {
        Connection conn = DBConnection.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Member> list = new ArrayList<Member>();
        try {
            pstmt = conn.prepareStatement("select * from member");
            rs = pstmt.executeQuery();
            while(rs.next()) {
                Member m = new Member();
                m.setId(rs.getString("id"));
                m.setPass(rs.getString("pass"));
                m.setName(rs.getString("name"));
                m.setGender(rs.getInt("gender"));
                m.setTel(rs.getString("tel"));
                m.setEmail(rs.getString("email"));
                m.setPicture(rs.getString("picture"));
                list.add(m);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.close(conn,pstmt,rs);
        }
        return null;
    }
    public int delete(String id) {
        Connection conn = DBConnection.getConnection();
        PreparedStatement pstmt = null;
        String sql = "delete from member where id = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,id);
            return pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.close(conn,pstmt,null);
        }
        return 0;
    }
    public int updatePass(String id, String pass) {
        Connection conn = DBConnection.getConnection();
        PreparedStatement pstmt = null;
        String sql = "update member set pass = ? where id = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,pass);
            pstmt.setString(2,id);
            return pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.close(conn,pstmt,null);
        }
        return 0;
    }

    public String idSearch(String email, String tel){
        Connection conn = DBConnection.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "select id from member where email = ? and tel = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,email);
            pstmt.setString(2,tel);
            rs = pstmt.executeQuery();
            if (rs.next()){
                return rs.getString("id");
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            DBConnection.close(conn,pstmt,rs);
        }
        return null;
    }

    public String pwSearch(String id ,String email, String tel){
        Connection conn = DBConnection.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "select pass from member where id = ? and email = ? and tel = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,id);
            pstmt.setString(2,email);
            pstmt.setString(3,tel);
            rs = pstmt.executeQuery();
            if (rs.next()){
                return rs.getString("pass");
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            DBConnection.close(conn,pstmt,rs);
        }
        return null;
    }
}
