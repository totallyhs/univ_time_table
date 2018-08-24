package org.timetable.univ.dao.admin;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.timetable.univ.model.vo.ClassVo;
import org.timetable.univ.model.vo.SubjectVo;

@Repository
public class CSMAdminDao {
	@Autowired
	SqlSessionTemplate template;
	//과목 추가
	public boolean addSubject(SubjectVo svo) {

		int result = template.insert("csm_admin.insertSubject", svo);
		if (result == 1) {
			return true;
		} else {
			return false;
		}
	}
	//수업 추가
	public boolean addClass(ClassVo cvo) {

		int result = template.insert("csm_admin.insertClass", cvo);
		if (result == 1) {
			return true;
		} else {
			return false;
		}
	}
//	public List<ClassVo> findClasses()

}

