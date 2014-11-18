package cn.believeus.admin.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.believeus.PaginationUtil.Page;
import cn.believeus.PaginationUtil.Pageable;
import cn.believeus.PaginationUtil.PaginationUtil;
import cn.believeus.model.Message;
import cn.believeus.service.BaseService;

@Controller
public class MessageController {
	@Resource
	private BaseService baseService;

	
	/**
	 *留言列表
	 * @return
	 */
	@RequestMapping(value="/admin/message/list")
	public String messageList(HttpServletRequest request){
		String pageNumber = request.getParameter("pageNumber");
		// 如果为空，则设置为1
		if (StringUtils.isEmpty(pageNumber)) {
			pageNumber="1";
		}
		Pageable pageable=new Pageable(Integer.valueOf(pageNumber),20);
		String hql= "from Message as entity order by editTime desc";
		Page<?> page = baseService.findObjectList(hql, pageable);
		request.setAttribute("messageList", page.getContent());
		request.setAttribute("size",page.getTotal());
		// 分页
		PaginationUtil.pagination(request, page.getPageNumber(),page.getTotalPages(), 0);
		
		return "/WEB-INF/back/message/list.jsp";
	}
	/**
	 * 留言添加
	 * @return
	 */
//	@RequiresPermissions("contact:create")
	@RequestMapping(value="/message/add",method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> messageAdd(String name,String phone,String email,String title,String content){
		Message message = new Message();
		message.setCreateTime(System.currentTimeMillis());
		message.setName(name);
		message.setContent(content);
		message.setEmail(email);
		message.setPhone(phone);
		baseService.saveOrUpdata(message);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("msg", "留言成功，等待审核！");
		return map;
	}
	/**
	 * 留言查看
	 * @return
	 */
	@RequiresPermissions("contact:view")
	@RequestMapping(value="/admin/message/view")
	public String messageView(Integer id,HttpServletRequest request){
		Message message = (Message)baseService.findObject(Message.class,id);
		request.setAttribute("message", message);
		return "/WEB-INF/back/message/view.jsp";
	}
	
	/**
	 * 留言删除
	 * @return
	 */
	@RequiresPermissions("contact:delete")
	@RequestMapping(value="/admin/message/delete")
	public @ResponseBody String messageDel(Integer[] ids){
		List<Integer> list = Arrays.asList(ids); 
		baseService.delete(Message.class, list);
		return "{\"type\":\"success\"}";
	}
}
