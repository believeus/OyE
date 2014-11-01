package cn.believeus.admin.controller;



import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/admin/message/list")
	public String messageList(HttpServletRequest request){
		List<Message> messages = (List<Message>)baseService.findObjectList(Message.class);
		/*if (messages.size()==0) {
			Message message=new Message();
			message.setTheme("Believeus睿软");
			message.setEmail("569009496@qq.com");
			message.setName("武汉睿软信息技术有限责任公司");
			message.setContent("网站开发，请联系我们！了解我们(http://www.balieveus.cn) 电话：15623454830。谢谢！");
			message.setCreateTime(System.currentTimeMillis());
			baseService.saveOrUpdata(message);
			messages.add(message);
		}*/
		request.setAttribute("messageList", messages);
		return "/WEB-INF/back/message/list.jsp";
	}
	/**
	 * 留言添加
	 * @return
	 */
	@RequiresPermissions("contact:create")
	@RequestMapping(value="/admin/message/add")
	public String messageAdd(Message message){
		message.setCreateTime(System.currentTimeMillis());
		baseService.saveOrUpdata(message);
		return "/WEB-INF/back/message/add.jsp";
	}
	/**
	 * 留言查看
	 * @return
	 */
	@RequiresPermissions("contact:update")
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
