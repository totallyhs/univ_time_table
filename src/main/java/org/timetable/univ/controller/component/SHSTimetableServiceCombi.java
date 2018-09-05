package org.timetable.univ.controller.component;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.timetable.univ.dao.CSMCombinationDao;
import org.timetable.univ.model.vo.ClassVo;

@Component
public class SHSTimetableServiceCombi {
	@Autowired
	CSMCombinationDao combinationdao;

	// 교양 과목 조합해주는 메소드(필요한 정보 : 체크된 시간표리스트, 체크된 과목 합산 학점수)

	
	public List<Map> cultureCombination(Map<Integer, List<ClassVo>> checkedClassMap,
			int unitssum) {
		// 모든 교양과목 리스트
		List<ClassVo> cultureSubjectList = combinationdao.getcultivateClasses();
		
		// 최종 결과 시간표 리스트
		List<Map> resultList = new ArrayList();
		
		Map map = new HashMap();
		
		
		
		
		return null;
		
	}

}
