package data_handle;

import dao.*;
import model.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.alibaba.fastjson.JSONObject;

/**
 * Servlet implementation class YuceInfoHandle
 */
@WebServlet("/YuceInfoHandle")
public class YuceInfoHandle extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public YuceInfoHandle() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");// ����request����
		String CONTENT_TYPE = "text/html; charset=utf-8";
		response.setContentType(CONTENT_TYPE);// ���� response �� ContentType
		response.setCharacterEncoding("utf-8");// ���� response ����
		PrintWriter out = response.getWriter();// response �����

		String businessFunc = request.getParameter("func");
		System.out.println(businessFunc);
		String retStr = "";
		switch (businessFunc) {
		case "All":
			retStr = YuceAll(request, response);
			break;
		case "Edit":
			retStr = YuceEdit(request, response);
			break;
		case "Add":
			retStr = YuceAdd(request, response);
			break;
		case "Del":
			retStr = YuceDel(request, response);
			break;
		case "Query":
			retStr = YuceQuery(request, response);
			break;
		default:
			retStr = YuceQuery(request, response);
			break;
		} 
		out.write(retStr);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	protected String YuceAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		YuceDao mycdao = new YuceDao();
		List<YuceData> clist = mycdao.QueryYuceInfoAll();
		String retStr = JSONObject.toJSONString(clist);
		System.out.println("�б���"+retStr);
		return retStr;
	}

	protected String YuceQuery(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String retStr = "";
		String strSql = "";
		String cname = new String(request.getParameter("cname").getBytes("ISO-8859-1"), "UTF-8");
		System.out.println("��ѯ�����ǣ�" + cname);
		if (cname == null || cname.trim().equals("")) {
			strSql = "select * from yuce_info";
		} else {
			strSql = "select * from yuce_info where yuce_num like '%" + cname + "%'";
		}
		YuceDao mycdao = new YuceDao();
		List<YuceData> clist = mycdao.QueryYuceInfo(strSql);
		retStr = JSONObject.toJSONString(clist);
		System.out.println("��ѯ�����"+retStr);
		return retStr;
	}

	protected String YuceAdd(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String retStr = "";
		// ��ȡǰ̨����
		
		String own_houses = request.getParameter("yuce_week");
		int yuce_week = Integer.valueOf(own_houses);
		String yuce_num1 = request.getParameter("yuce_num");
		int yuce_num = Integer.valueOf(yuce_num1);
	
		String errorMsg = "";
		String successMsg = "";

		System.out.println("������Ϣ��"+ ", yuce_week:" + yuce_week + ", yuce_num:"
				+ yuce_num + "");



		

		if (errorMsg.equals("")) {
			// ���� Dao �㷽�������¼�����ݿ����
			YuceData yucelist = new YuceData( yuce_week
					, yuce_num);
			YuceDao myDao = new YuceDao();
			boolean affectedrows;
			try {
				affectedrows = myDao.addYuceInfo(yucelist);
				if (affectedrows) {
					successMsg = "������1����¼��";
				} else {
					errorMsg = "��Ӽ�¼���ɹ�,������¼�����ݣ�";
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		JSONObject object = new JSONObject();
		if (!errorMsg.equals("")) {
			object.put("errorMsg", errorMsg);
		} else {
			object.put("success", successMsg);
		}
		retStr = JSONObject.toJSONString(object);
		return retStr;
	}

	protected String YuceEdit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String retStr = "";
		// ��ȡǰ̨����
	
		String own_houses = request.getParameter("yuce_week");
		int yuce_week = Integer.valueOf(own_houses);
		String yuce_num1 = request.getParameter("yuce_num");
		int yuce_num = Integer.valueOf(yuce_num1);
		
		
		String errorMsg = "";
		String successMsg = "";

		System.out.println(errorMsg);
		System.out.println("�޸����ݣ�"+ ", yuce_week:" + yuce_week + ", yuce_num:"
				+ yuce_num   +"'");
		if (errorMsg.endsWith("")) {
			// ���� Dao �㷽�������¼�����ݿ����
			YuceData yucelist = new YuceData(  yuce_week
					, yuce_num);
			YuceDao myDao = new YuceDao();
			boolean affectedrows = myDao.updateYuceinfo(yucelist);
			if (affectedrows) {
				successMsg = "������1����¼��";
			} else {
				errorMsg = "���¼�¼���ɹ���������¼�����ݣ�";
			}
		}

		JSONObject object = new JSONObject();
		if (!errorMsg.equals("")) {
			object.put("errorMsg", errorMsg);
		} else {
			object.put("success", successMsg);
		}
		retStr = JSONObject.toJSONString(object);
		return retStr;
	}

	protected String YuceDel(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String retStr = "";
		// ��ȡǰ̨����
		String own_houses = request.getParameter("yuce_week");
		int yuce_week = Integer.valueOf(own_houses);
		System.out.println("��ɾ���Ŀͻ�id:" + yuce_week);
		String errorMsg = "";
		String successMsg = "";

		YuceData yucelist = new YuceData(yuce_week);
		YuceDao myDao = new YuceDao();
		boolean affectedrows;
		try {
			affectedrows = myDao.DeleteYuceInfo(yucelist);
			// �������ݿ����������д���
			if (affectedrows) {
				successMsg = "ɾ����1����¼��";
			} else {
				errorMsg = "ɾ�����ݿ��¼����ʧ�ܣ��������Ա��ϵ��";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		JSONObject object = new JSONObject();
		if (!errorMsg.equals("")) {
			object.put("errorMsg", errorMsg);
		} else {
			object.put("success", successMsg);
		}
		retStr = JSONObject.toJSONString(object);
		return retStr;
	}
}
