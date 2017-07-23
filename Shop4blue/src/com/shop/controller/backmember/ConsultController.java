package com.shop.controller.backmember;

import java.lang.ProcessBuilder.Redirect;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.shop.entity.XxConsultation;
import com.shop.service.backstage.ConsultService;

import cn.itcast.utils.Page;

/**
 * 咨询管理Controller
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/")
public class ConsultController {
	@Autowired
	ConsultService consultService;
	
	//��ʾ��ѯ,Ĭ��20��һҳ
	//flag=editShow �Ǳ༭ҳ��Ĺ���,���ڸı��Ƿ���ʾ,�������Controller����������֮�����ת,��������
	@RequestMapping("consult")
	public String selConsultPagging(Model model,Integer rows,Integer page,XxConsultation xx,String flag,HttpSession session,int []ids){
		if("editShow".equals(flag)){
			if(xx.getIsShow()==null){
				xx.setIsShow(false);
			}
			consultService.updateIsShow(xx.getId(),xx.getIsShow());	
		}
		if("delMes".equals(flag)){
			System.out.println(Arrays.toString(ids));
			consultService.delMessByIds(ids);
		}
		if(page==null){
			page=1;
		}
		List<Map<String,Object>> list=consultService.selConsult(page,rows);
		Page<Map<String,Object>> ppage=new Page<>();
		ppage.setSize(rows);
		
		ppage.setPage(page);
		ppage.setRows(list);
		ppage.setTotal(consultService.selectNum());
        model.addAttribute("page", ppage);
        session.setAttribute("rows", rows);
		return "backstage/user/consult";
	}
	//�ظ�ҳ����ʾ,��ѯ�����Լ��ظ���������
	//x�Ǹ���ѯ������,m�ǻظ�����ѯ������
	@RequestMapping("consultreply")
	public String reply(XxConsultation xx,Model model,String flag){
		if("reMess".equals(flag)){
			consultService.insertReply(xx);
		}
		Map<String,Object> x=consultService.selById(xx.getId());
		List<Map<String,Object>> m=consultService.selReplybyId(xx.getId());
		//System.out.println(x);
		
        model.addAttribute("map", x); 
        model.addAttribute("reply", m);
		return "backstage/user/consultreply";
	}
	
	@RequestMapping("consultedit")
	public String edit(XxConsultation xx,Model model){
		Map<String,Object> x=consultService.selById(xx.getId());
		List<Map<String,Object>> m=consultService.selReplybyId(xx.getId());
        model.addAttribute("map", x); 
        model.addAttribute("reply", m);
		return "backstage/user/consultedit";
	}
	
	//�༭ҳ����ɾ���ظ�����
	//�ٸ�����ѯidɾ������ѯ
	//��,��ͬconsultreply�е�x,m
	@RequestMapping("replyDel")
	public String delReply(Long id,Long cid,Model model){
		consultService.delById(id);//��
		Map<String,Object> x=consultService.selById(cid);//��
		List<Map<String,Object>> m=consultService.selReplybyId(cid);//��
        model.addAttribute("map", x); 
        model.addAttribute("reply", m);
		return "backstage/user/consultedit";
	}
	
	@RequestMapping("getmember")
	public String getMember(Long id,Model model){
		System.out.println(id);
		
		return "backstage/user/consultedit";
	}
	
	
}
