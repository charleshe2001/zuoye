package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbcode.*;
import model.*;

public class YuceDao {
	private ExecuteDB myExecuteDB;
	
	// 閺嬪嫰锟界姴鍤遍弫甯礉閸掓繂顫愰崠鏍ㄦ殶閹癸拷
	public YuceDao() {
			myExecuteDB = new ExecuteDB();
	}
	
	/**
	 * 查询全部客户信息
	 * 
	 * @return 返回客户信息model链表
	 */
	public List<YuceData> QueryYuceInfoAll() {
		ResultSet rs = null;         
		String strSql = "select * from yuce_info";
		try {
			rs = myExecuteDB.exeQuery(strSql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		List<YuceData> yucelist = new ArrayList<YuceData>();
		YuceData myYuce = null;
		try {
			while (rs.next()) {

				int yuce_num=rs.getInt("yuce_num");	
			
				int yuce_week=rs.getInt("yuce_week");
				  
				
				myYuce = new YuceData();
              
                myYuce.setYuce_num(yuce_num);
              
                myYuce.setYuce_week(yuce_week); 
                yucelist.add(myYuce);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		try {
			myExecuteDB.closedbobj();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return yucelist;
	}
		
	/**
	 * 条件查询客户信息-根据客户姓名模糊查询
	 * 
	 * @return 返回客户信息model链表
	 */
		public List<YuceData> QueryYuceInfo(String strsql) {
			List<YuceData> yucelist = new ArrayList<YuceData>();
			ResultSet rs = null;				
						
			try {
				System.out.println(strsql);
				rs = myExecuteDB.exeQuery(strsql);
			} catch (Exception e) {
					e.printStackTrace();
			}
			YuceData myYuce = null;
			try {
				while (rs.next()) {
					
					int yuce_num=rs.getInt("yuce_num");	
					
					int yuce_week=rs.getInt("yuce_week");
					
					
					myYuce = new YuceData();
					
		                myYuce.setYuce_num(yuce_num);
		                
		                myYuce.setYuce_week(yuce_week);   
	                yucelist.add(myYuce);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			
			//閸忔娊妫撮弫鐗堝祦鎼存挸顕挒锟�
			try {
				myExecuteDB.closedbobj();
			} catch (SQLException e) {
				e.printStackTrace();
			}

			return yucelist;
		}		
		
		/**
		 * 将model插入到数据库记录中
		 * 
		 * @param myClient
		 * @return
		 * @throws Exception
		 */
		
		public boolean addYuceInfo(YuceData myYuce) throws Exception {
			String mysql = "insert into yuce_info ( yuce_week,yuce_num) "
					+ "values("  + myYuce.getYuce_week() + "," 
					+ myYuce.getYuce_num()   + ")";
			System.out.println(mysql);

			boolean succ = false;

			// 濞屸剝婀侀崑姘彠闁款喖鐡ч柌宥咁槻閹勵梾閺屻儻绱濋弽瑙勫祦閸忔娊鏁�涙顥呴弻銉︽Ц閸氾箓鍣告径宥冿拷锟�
			try {
				succ = myExecuteDB.updateSql(mysql);
			} catch (Exception e) {
				e.printStackTrace();
				throw (e);
			}
			//閸忔娊妫撮弫鐗堝祦鎼存挸顕挒锟�
			try {
				myExecuteDB.closedbobj();
			} catch (SQLException e) {
				e.printStackTrace();
			}

			return succ;
		}
		
		/**
		 * 对model对相应的数据库记录进行更新，其中客户ID，客户姓名不能更改
		 * 
		 * @param myClient
		 * @return
		 */
		public boolean updateYuceinfo(YuceData myYuce) {
			boolean succ = false;
			String strSql = "update yuce_info set yuce_num=" + myYuce.getYuce_num()
			+"'where yuce_week='" + myYuce.getYuce_week() 
			+ "'";
			System.out.println(strSql);
			
			try {
				succ = myExecuteDB.updateSql(strSql);
			} catch (Exception e) {
				e.printStackTrace();
			}
			//閸忔娊妫撮弫鐗堝祦鎼存挸顕挒锟�
			try {
				myExecuteDB.closedbobj();
			} catch (SQLException e) {
				e.printStackTrace();
			}

			return succ;
		}

		
		
		/**
		 * 删除客户对象，根据客户id删除
		 * 
		 * @param visit_id
		 * @return
		 * @throws Exception
		 */
		public boolean DeleteYuceInfo(YuceData myYuce) throws Exception {
			String mysql = "delete from yuce_info where yuce_week='" + myYuce.getYuce_week() + "'";
			System.out.println(mysql);
			
			boolean succ = false;
			try {
				succ = myExecuteDB.updateSql(mysql);
			} catch (Exception e) {
				e.printStackTrace();
			}
			//閸忔娊妫撮弫鐗堝祦鎼存挸顕挒锟�
			try {
				myExecuteDB.closedbobj();
			} catch (SQLException e) {
				e.printStackTrace();
			}

			return succ;
		}
		
		/**
		 * 查询表中客户最大ID信息(为自动生成新客户的ID服务)
		 * 
		 * @return 返回客户model链表
		 */
		
}
