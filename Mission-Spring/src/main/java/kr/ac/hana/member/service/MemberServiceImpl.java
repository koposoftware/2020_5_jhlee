package kr.ac.hana.member.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.hana.consulting.vo.ConsultingVO;
import kr.ac.hana.member.dao.MemberDAO;
import kr.ac.hana.member.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO memberDAO ;	
	
	@Override
	public MemberVO login(MemberVO member) {
	   
		return memberDAO.login(member);
	}

	@Override
	public void insertMember(MemberVO member) {
		memberDAO.insertMember(member);		
	}

	@Override
	public List<MemberVO> selectAllInform() {
		
		List<MemberVO> allInformList = memberDAO.selectAllInform();
		
		return allInformList;
	}

	@Override
	public List<MemberVO> selectCustomerInform(String id) {

		List<MemberVO> customerInform = memberDAO.selectCustomerInform(id);
		
		return customerInform;
	}

	@Override
	public int cntMember() {
		
		int totalBoardCnt = memberDAO.cntMember();
		
		return totalBoardCnt;
	}

	@Override
	public List<MemberVO> selectPageMember(int pageNo, int boardCntPerPage) {
		
		List<MemberVO> memberList = memberDAO.selectPageMember(pageNo, boardCntPerPage);
				
		return memberList;
	}

	@Override
	public List<MemberVO> selectSearchMember(Map<String, String> searchMap) {

		List<MemberVO> searchMemberList = new ArrayList<MemberVO>();
		
		searchMemberList = memberDAO.selectSearchMember(searchMap);
		
		return  searchMemberList;
	}
	
	

}
