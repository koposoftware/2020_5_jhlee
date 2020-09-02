package kr.ac.hana.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.hana.admin.dao.AdminDAO;
import kr.ac.hana.admin.vo.AdminVO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDAO adminDAO;
	
	
	@Override
	public AdminVO login(AdminVO admin) {
		return adminDAO.login(admin);
	}


	
}
