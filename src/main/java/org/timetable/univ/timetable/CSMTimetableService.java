package org.timetable.univ.timetable;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.timetable.univ.dao.CSMCombinationDao;
import org.timetable.univ.model.vo.ClassVo;
import org.timetable.univ.model.vo.SubjectVo;

@Service
public class CSMTimetableService {
	@Autowired
	CSMCombinationDao combinationdao;
	
	// 교양 과목 조합해주는 메소드(필요한 정보 : 체크된 시간표리스트, 체크된 과목 합산 학점수)
	/*
	 * List<Map<Integer, Object>>
	 * list = all the possibilities
	 * in Map:
	 *   key : -classno  => subjectname
	 *   key : -classno*2  => class units
	 *   key : classno => list<classvo> 
	 *   key : 0 => list of classes resulted with their no
	 * last index of list : classNoColorMap
	 */
	public List<Map> cultureCombination(Timetable timetable,
			int unitssum) {
		Map<Integer, List<ClassVo>> checkedClassMap = timetable.checkedClassMap;
		
		// 모든 교양과목 리스트
		List<ClassVo> cultureSubjectList = combinationdao.getcultivateClasses();

		// 최종 결과 시간표(리스트)의 리스트
		List<Map> resultList = new ArrayList();
		
		// 섹깔 리스트
		List colorList = timetable.colorList;
		Map classNoColorMap = timetable.classNoColorMap;
		Map colorClassMap = timetable.colorClassNoMap;
		
				
		// 교양과목마다 체크된 과목 리스트와 비교하는 포문
		for (int i = 0; i < cultureSubjectList.size(); i++) {
			boolean combi = true;
			// 한 example의 모든 classNo가 담긴 list
			List<Integer> classNoList = new ArrayList();
			// 더해줄 교양과목 class list form
			List<ClassVo> addCulture = new ArrayList();
			// 추가해줄 시간표 조합
			Map<Integer, Object> result = (Map<Integer,Object>) ((HashMap)checkedClassMap).clone();

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
			Map<Integer, List<ClassVo>> immap = (Map<Integer, List<ClassVo>>) ((HashMap)checkedClassMap).clone();
			
			// 1.체크된 과목들을 하나하나 교양과목에 비교하는 포문
			for (Map.Entry<Integer, List<ClassVo>> entry : immap.entrySet()) {
				// 체크된 과목의 classvo list 정보를 뽑아옴
				Integer imkey = entry.getKey();
				List<ClassVo> imlist = entry.getValue();
				
				SubjectVo svo = combinationdao.getInformSubject(imkey);
				
				// 체크된과목 이름
				result.put(-imkey, svo.getName());
				// 체크된과목의 학점
				result.put(-imkey*2, svo.getUnits());
				// classNoList에 classNo 추가
				if (!classNoList.contains(imkey)) {
					classNoList.add(imkey);
				}
				
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
				SubjectVo cultureSvo = combinationdao.getInformSubject(cvo.getNo());
				// 체크된과목 이름
				result.put(-cvo.getNo(), cultureSvo.getName());
				// 체크된과목의 학점
				result.put(-cvo.getNo()*2, cultureSvo.getUnits());
				
				addCulture.add(cvo);
				// classNoList에 classNo 추가
				if (!classNoList.contains(cvo.getNo())) {
					classNoList.add(cvo.getNo());
				}
				
				for (int j=0; j<colorList.size(); j++) {
					if (!colorClassMap.containsKey(colorList.get(j))) {
						colorClassMap.put(colorList.get(j), cvo.getNo());
						classNoColorMap.put(String.valueOf(cvo.getNo()), colorList.get(j));
						break;
					}
				}
				result.put(-1, classNoColorMap);
				result.put(cvo.getNo(), addCulture);
				result.put(0, classNoList);
				resultList.add(result);
				
				
			}

		} // cultureSubject for
		return resultList;
	}

}
