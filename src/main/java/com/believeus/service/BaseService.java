package com.believeus.service;

import java.util.List;
import org.springframework.stereotype.Service;
import com.believeus.dao.BaseDao;

@Service
public class BaseService implements ISerivce {
	private BaseDao baseDao;
	@Override
	public void merge(Object object) {
		baseDao.merge(object);
	}

	@Override
	public void saveOrUpdata(Object object) {
		baseDao.saveOrUpdata(object);
	}

	@Override
	public void delete(Class<?> clazz, Integer id) {
		baseDao.delete(clazz, id);
	}

	@Override
	public void delete(Object entity) {
		baseDao.delete(entity);
	}

	@Override
	public void delete(Class<?> clazz, String property, Object value) {
		baseDao.delete(clazz, property, value);
	}

	@Override
	public Object findObject(String hql) {
		return baseDao.findObject(hql);
	}

	@Override
	public Object findObject(Class<?> clazz, Object property, Object value) {
		return baseDao.findObject(clazz, property, value);
	}

	@Override
	public Object findObject(Class<?> clazz, Integer id) {
		return baseDao.findObject(clazz, id);
	}

	@Override
	public List<?> findObjectList(Class<?> clazz, Object property, Object value) {
		return baseDao.findObjectList(clazz, property, value);
	}

	@Override
	public List<?> findObjectListOrderById(Class<?> clazz, Object property,
			Object value) {
		return baseDao.findObjectListOrderById(clazz, property, value);
	}

	@Override
	public List<?> findObjectList(Class<?> clazz, Object property,
			Object value1, Object property2, Object value2) {
		return baseDao.findObjectList(clazz, property, value1, property2, value2);
	}

	@Override
	public List<?> findObjectList(Class<?> clazz) {
		return baseDao.findObjectList(clazz);
	}

	@Override
	public List<?> findObjectList(Class<?> clazz, Integer num) {
		return baseDao.findObjectList(clazz, num);
	}

	@Override
	public List<?> findObjectList(Class<?> clazz, String property,
			Object value, int num) {
		return baseDao.findObjectList(clazz, property, value, num);
	}

	@Override
	public List<?> findObjectList(String hql, Integer num) {
		return baseDao.findObjectList(hql,num);
	}

}
