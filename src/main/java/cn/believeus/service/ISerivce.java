package cn.believeus.service;

import java.util.List;

public interface ISerivce {

	/**merge方法保存或更新数据库之后,对象变为持久对象*/
	public abstract void merge(Object object);

	/**saveOrUpdata方法保存或更新到数据库之后,对象变为托管对象*/
	public abstract void saveOrUpdata(Object object);

	/** Begin Author:wuqiwei Data:2014-05-22 AddReason:根据id的方式删除对象 */
	public abstract void delete(Class<?> clazz, Integer id);

	/** End Author:wuqiwei Data:2014-05-22 AddReason:根据id的方式删除对象 */
	public abstract void delete(Object entity);

	/** Begin Author:wuqiwei Data:2014-05-22 AddReason:根据属性的方式删除对象 */
	public abstract void delete(Class<?> clazz, String property, Object value);

	/** End Author:wuqiwei Data:2014-05-22 AddReason:根据属性的方式删除对象 */

	// 获取单一对象
	public abstract Object findObject(String hql);

	/** Begin Author:wuqiwei Data:2014-05-12 AddReason:根据属性获取对象 */
	public abstract Object findObject(Class<?> clazz, Object property,
			Object value);

	/** End Author:wuqiwei Data:2014-05-12 AddReason:根据属性获取对象 */

	/** Begin Author:wuqiwei Data:2014-05-12 AddReason:根据id获取对象 */
	public abstract Object findObject(Class<?> clazz, Integer id);

	/** End Author:wuqiwei Data:2014-05-12 AddReason:根据id获取对象 */

	public abstract List<?> findObjectList(Class<?> clazz, Object property,
			Object value);

	public abstract List<?> findObjectListOrderById(Class<?> clazz,
			Object property, Object value);

	public abstract List<?> findObjectList(Class<?> clazz, Object property,
			Object value1, Object property2, Object value2);

	public abstract List<?> findObjectList(Class<?> clazz);

	public abstract List<?> findObjectList(Class<?> clazz, Integer num);

	public abstract List<?> findObjectList(Class<?> clazz, String property,
			Object value, int num);

	/** Begin Name:wuqiwei Date:2013-11-5 07:24:40 AddReason:返回一定数量的行数 */
	public abstract List<?> findObjectList(String hql, Integer num);

}