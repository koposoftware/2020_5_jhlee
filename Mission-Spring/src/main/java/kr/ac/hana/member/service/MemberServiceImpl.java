package kr.ac.hana.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public void updateMember(MemberVO member) {
		memberDAO.updateMember(member);		
	}
	
	

}
