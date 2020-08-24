package kr.ac.skuniv.graduation.service;

import java.util.List;

import kr.ac.skuniv.graduation.dto.Rule;

public interface RuleService {
	public Rule regRule(Rule rule); //insert
	public List<Rule> getRules();//select 
	public Rule getRule(int id);  //select one
	public void updateRule(Rule rule); 
	public void deleteRule(int id); 
	public Rule ruleCheck(int id) throws Exception;
}
