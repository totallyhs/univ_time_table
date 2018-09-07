package org.timetable.univ.timetable.mongo;

import java.util.List;

import org.bson.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;


@Repository
public class TimetableMongoRepository {

	@Autowired
	MongoTemplate template;
	
	public void insertListTimeTable(TimetableMongoVo vo) {
		template.insert(vo, "timetable");
	}
	
	public TimetableMongoVo readByMemberId(String memberId) {
		Query query = new BasicQuery(new Document().append("memberId", memberId));
		
		List<TimetableMongoVo> list = template.find(query, TimetableMongoVo.class, "timetable");
		
		if (list.size() == 0) {
			return null;
		} else {
			return list.get(0);
		}
	}
	
	public void deleteByMemberId(String memberId) {
		Query query = new BasicQuery(new Document().append("memberId", memberId));
		
		template.remove(query, "timetable");
	}
}
