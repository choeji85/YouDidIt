package DAO;
import java.sql.*;
import DTO.Member;	//Java한테 Member가 뭔지 설계도를 가져다 주어야 한다.

public class MemberDAO {
	//회선의 역할을 해줄 객체이므로 
	//여러개가 생겨버리면 데이터의 일관성 문제에 원인이 될 수 있다.
	//따라서 회선은 전체 서비스에서 단 하나만 사용할 수 있도록 객체 생성을 막는다.
	private MemberDAO() {	//private이므로 해당 클래스 내부에서만 사용 가능, 객체생성 원천 차단
		
	}
	private static MemberDAO instance=new MemberDAO();
	//위의 것은 필드 : 데이터타입이 MemberDAO 타입의 변수
	//필드를 만들어봐야 생성자를 막았으니 사용이 불가능
	//생성자가 막혔음에도 해당 필드의 내용을 사용할 수 있도록 static 타입으로 변경
	//static타입의 변수에 객체를 담았으니 해당 객체는 하나 빼고 더이상 존재할 수 없다.
	//해당 필드의 값을 다른 개발자가 변경하면 문제의 원인이 되니 private으로 변경해서 사용불가처리
	
	//setter는 제작하지 않고 getter만 제작해서 사용할 수 있는 유일한 방법을 구현
	
	public static MemberDAO getInstance() {
		return instance;
	}
	//커넥션 연결을 위한 메서드
	public Connection getConnection() throws Exception{
		Connection conn=null;
		String url="jdbc:mysql://127.0.0.1:3306/portfolio";
		String db_id="root";
		String db_pw="iotiot";
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn=DriverManager.getConnection(url,db_id,db_pw);
		return conn;
	}
	//사용자 정보 조회(userid기반 검색) - 전체 정보 조회	- session에 들어갈 데이터를 제작
	public Member getMember(String id){	//void타입이 아니니까 return 있어야 한다.
		Member m=null;
		String sql="select * from user where id=?";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);//매개변수로 sql받아서 메서드 만들어써도 될듯...자주쓰니깐..
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {//resultset이 empty set이 아니라면...한줄을 읽고 {}내부를 실행하시오
				m=new Member();	//private타입 변수 7개와 get set 메서드 14개로 이루어진 객체생성
				m.setNum(rs.getString("num"));		//DB내부의 데이터를 객체내부 필드에 복사
				m.setName(rs.getString("name"));
				m.setId(rs.getString("id"));
				m.setPw(rs.getString("pw"));
				m.setEmail(rs.getString("email"));
				m.setPhone(rs.getString("phone"));
				m.setAddress(rs.getString("address"));
				m.setU_level(rs.getString("u_level"));
			}
		}catch(Exception e) {
			System.out.println("getMember(id) 접속 중 오류 발생: "+e);
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex) {
				System.out.println("getMember(id) 접속 해제중 오류 발생: "+ex);
			}
		}
		return m;
	}
	//사용자 정보 조회(userid기반 검색) - 비밀번호만 조회
	public int userCheck(String id, String pw) {
		int result=-1;//-1: 회원가입이 안된경우, 0: 비밀번호가 틀린경우, 1: 로그인성공
		String sql="select pw from user where id=?";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;//select문이니까 result필요
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);	//stmt는 선 제작 후 실행시 sql주입, pstmt는 제작시 sql주입
			pstmt.setString(1, id); 		//pstmt의 ? 순서는 1번부터 시작임, 0이 아님에 주의
			rs=pstmt.executeQuery();				//pstmt는 실행시에는 sql을 별도로 주지 않는다.
			if(rs.next()) {
				//select문의 결과가 있는 경우
				System.out.println("비밀번호 확인 : "+rs.getString("pw"));
				System.out.println("결과 1 확인"+rs.getString("pw").equals(pw));
				if(rs.getString("pw").equals(pw) && rs.getString("pw")!=null) {
					//비밀번호가 일치하고, 회원가입시 비밀번호가 null이 아닌경우 로그인
					result=1;
				}else {
					//비밀번호가 틀렸거나, 회원가입시 비밀번호를 null로 만든경우
					result=0;
				}
			}else {
				//select문의 결과가 empty set인 경우, 회원가입이 안된경우
				result=-1;
			}
		}catch(Exception e) {
			System.out.println("userCheck(id, pw)접속중 오류발생: "+e);
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex) {
				System.out.println("userCheck(id, pw)접속해제중 오류발생: "+ex);
			}
		}
		return result;
	}//이 방식은 많이 쓰인다...
	//아이디 중복체크 확인용 메서드
	public int confirmID(String id) {
		int result=-1;	//select문의 결과가 있으면 1, 없으면 -1(이건 그냥 개발자가 숫자는 알아서 정하기 나름...구분만 되면 됨)
		String sql="select id from user where id=?";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {	//데이터가 존재하는 경우, 이미 가입된 아이디가 있음
				result=1;
			}else {	//empty set인 경우, 해당 아이디 사용 가능
				result=-1; 
			}
		}catch(Exception e) {
			System.out.println("confirmID(id) 접속 중 오류발생: "+ e);
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex) {
				System.out.println("confirmID(id) 접속 해제중 오류발생: "+ ex);
			}
		}
		return result;
	}
	//회원가입 처리
	public int insertMember(Member m) {
		int result = -1;	//-1은 회원가입 실패, 1은 회원가입 성공
		String sql = "insert into member (id, pw, name, email, phone, address, u_level) values(?,?,?,?,?,?,?)";
		Connection conn=null;
		PreparedStatement pstmt=null;
		try {
			conn=getConnection();//하나 만들어두면 편하다..
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, m.getId()); 	//pstmt는 ? 자리에 데이터를 입력할 때 1번부터 시작한다.
			pstmt.setString(2, m.getPw());
			pstmt.setString(3, m.getName());
			pstmt.setString(4, m.getEmail());
			pstmt.setString(5, m.getPhone());
			pstmt.setString(6, m.getAddress());
			pstmt.setString(7, m.getU_level()); 
			result=pstmt.executeUpdate();
			//executeQuery() : return ResultSet - select문에 사용한다
			//execute() : return boolean - 통상적으로 insert문에 사용, ResultSet의 존재여부를 보내줌. 
			//executeUpdate() : return int - update, delete문에 사용, 변동된 줄의 수(숫자로 나오니깐)
		}catch(Exception e) {
			System.out.println("insertMember(Member) 접속 중 오류발생 : "+e);
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex){
				System.out.println("insertMember(Member) 접속 해제 중 오류발생 : "+ex);
			}
		}
		return result;
	}
	
	//회원정보 수정 메서드
	public int updateMember(Member m) {
		int result=-1; //정보수정 실패, 그 이외에는 정보가 수정된 줄수
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql="update member set pw=?, name=?, email=?, phone=?, address=?, u_level=? where id=?";
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, m.getPw());
			pstmt.setString(2, m.getName());
			pstmt.setString(3, m.getEmail());
			pstmt.setString(4, m.getPhone());
			pstmt.setString(5, m.getAddress());
			pstmt.setString(6, m.getU_level());
			result=pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("updateMember(Member)접속 중 오류 발생: " +e);
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex){
				System.out.println("updateMember(Member)접속 해제중 오류 발생: " +ex);
			}
		}
		return result;
	}
}
