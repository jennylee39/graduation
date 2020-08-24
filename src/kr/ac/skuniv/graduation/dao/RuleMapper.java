package kr.ac.skuniv.graduation.dao;

import java.util.List;

import kr.ac.skuniv.graduation.dto.Rule;
import kr.ac.skuniv.graduation.mapper.Mapper;

@Mapper
public interface RuleMapper {
	public Rule getRule(int id); 
	public List<Rule> getRules();
	public void addRule(Rule rule);
	public void updateRule(Rule rule); 
	public void deleteRule(int id); 
	public Rule ruleCheck(int id) throws Exception;
}