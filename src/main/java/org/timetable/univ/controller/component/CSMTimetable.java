package org.timetable.univ.controller.component;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.timetable.univ.dao.CSMCombinationDao;
import org.timetable.univ.model.vo.ClassVo;
import org.timetable.univ.model.vo.SubjectVo;

@Component
public class CSMTimetable {
	@Autowired
	CSMCombinationDao combinationdao;

	// 교양 과목 조합해주는 메소드(필요한 정보 : 체크된 시간표리스트, 체크된 과목 합산 학점수)
	public List<Map> cultureCombination(Map<Integer, List<ClassVo>> checkedClassMap,
			int unitssum) {
		// 모든 교양과목 리스트
		List<ClassVo> cultureSubjectList = combinationdao.getcultivateClasses();

		// 최종 결과 시간표(리스트)의 리스트
		List<Map> resultList = new ArrayList();
				
		// 교양과목마다 체크된 과목 리스트와 비교하는 포문
		for (int i = 0; i < cultureSubjectList.size(); i++) {
			boolean combi = true;
			// 더해줄 교양과목 class list form
			List<ClassVo> addCulture = new ArrayList();
			// 추가해줄 시간표 조합
			Map<Integer, List<ClassVo>> result = checkedClassMap;

			// 비교할 교양과목 classvo를 뽑아냄
			ClassVo cvo = cultureSubjectList.get(i);
			int day = cvo.getDay();
			int start = cvo.getStarttime();
			int end = cvo.getEndtime();
			int units = combinationdao.cutureUnits(cvo.getSubjectNo());
			if ((unitssum + units) > 20) {
				combi = false;
				continue;
			}
			Map<Integer, List<ClassVo>> immap = checkedClassMap;
			Map<Integer,Object> informMap = new HashMap<Integer, Object>();
			
			// 1.체크된 과목들을 하나하나 교양과목에 비교하는 포문
			for (Map.Entry<Integer, List<ClassVo>> entry : immap.entrySet()) {
				// 체크된 과목의 classvo list 정보를 뽑아옴
				List<ClassVo> imlist = new ArrayList<ClassVo>();
				imlist = entry.getValue();
				Integer imkey = entry.getKey();
				SubjectVo svo = combinationdao.getInformSubject(imkey);
				
				//체크된과목 이름
				informMap.put(-imkey, svo.getName());
				// 2. 뽑아온 class마다 요일,시간이 겹치는지 확인
				for (int k = 0; k < imlist.size(); k++) {

					// 뽑아온 과목의 요일, 시작, 끝 시간
					int imday = imlist.get(k).getDay();
					int imstart = imlist.get(k).getStarttime();
					int imend = imlist.get(k).getEndtime();

					// 시간이 겹치면 combi=false
					if (imday != day) {
						continue;
					} else {
						if ((start == imstart) || (end == imend)) {
							combi = false;
							break;
						} else if (start > imstart) {
							if (start < imend) {
								combi = false;
								break;
							}
						} else {
							if (end > imstart) {
								combi = false;
								break;
							}
						}
					}
				}
				// 2.for end
			}
			// 1.for end

			// 하나도 중복이 안되었을때 체크리스트에 추가후 시간표리스트에 추가
			if (combi) {
				addCulture.add(cvo);
				result.put(cvo.getNo(), addCulture);
				resultList.add(result);
			}

		}

		return resultList;
	}

	// 선택한 전공랜덤 함수
	public List<List<Map<Integer, List<ClassVo>>>> majorCombination(
			List<Map<Integer, List<ClassVo>>> checkedSubjectClassList, int unitssum) {

		return null;
	}
}