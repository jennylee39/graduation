package kr.ac.skuniv.graduation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import kr.ac.skuniv.graduation.dao.RuleMapper;
import kr.ac.skuniv.graduation.dto.Rule;

@Service
@Repository
public class RuleServiceImpl implements RuleService {

	@Autowired
	RuleMapper ruleDao;
	
	@Override
	public Rule regRule(Rule rule) {
		ruleDao.addRule(rule);
		
		return rule;
	}
	
	@Override
	public Rule getRule(int id) {
		
		return ruleDao.getRule(id);
	}

	
	  @Override 
	  public void deleteRule(int id) {
	  
		  ruleDao.deleteRule(id);
	  }


	@Override
	public List<Rule> getRules() {
		
		return ruleDao.getRules();
	}

	@Override
	public void updateRule(Rule rule) {
		ruleDao.updateRule(rule);
		
	}

	public Rule ruleCheck(int id) throws Exception{
		return ruleDao.ruleCheck(id);
	}
	 
}
