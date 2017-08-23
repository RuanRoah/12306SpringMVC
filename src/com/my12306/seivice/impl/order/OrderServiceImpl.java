package com.my12306.seivice.impl.order;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.my12306.mapper.OrderMapper;
import com.my12306.mapper.SeatMapper;
import com.my12306.po.order.Order;
import com.my12306.service.order.OrderService;
import com.my12306.util.MybatisUtil;
import com.my12306.vo.OrderShow;
import com.my12306.vo.TicketShow;
public class OrderServiceImpl implements OrderService{
	//Mapper
	static SqlSessionFactory sqlSessionFactory = null;
    static {
        sqlSessionFactory = MybatisUtil.getSqlsessionfactory();
    }
    static SqlSession sqlSession=sqlSessionFactory.openSession();

	/**
	 * 添加订单
	 *
	 * 
	 * @param 用户id
	 * @param ticketshow数组
	 * @param 乘车人姓名
	 * @param 选中的车次
	 * */
    /**/
	@Override
	public int addOrder(String userid,List<TicketShow> list,List<String> human_name,String trainName) {
		System.out.println("进入service");
		
		OrderMapper orderMapper=sqlSession.getMapper(OrderMapper.class);
	    SeatMapper seatMapper=sqlSession.getMapper(SeatMapper.class);
	    System.out.println("ticketShow数组长度："+list.size());
	    System.out.println(" human_name数组长度："+ human_name.size());
		int result=0;//返回结果
		String seatPath=null;//座位表path
		String[] splitSeatPath;//分割后的座位表path
		TicketShow userTrain=null;//用户选择的车次
		
		for (TicketShow ticketShow : list) {
			if(ticketShow.getTrain_name().equals(trainName)){
				userTrain=ticketShow;
				break;
			}
		}
		
		
		for(int i=0;i<human_name.size();i++){
			if(userTrain!=null){
				System.out.println("选择的车次是:"+userTrain.train_name);
				System.out.println("该客人的座位id是:"+userTrain.seatid.get(i));
				
				seatPath=seatMapper.getPathBySeatid(userTrain.seatid.get(i));
				splitSeatPath=seatPath.split("/");
				
				//将预定经过的站点置为1
				for(int j=userTrain.getStartsec();j<userTrain.getEndsec();j++){
					
					splitSeatPath[j]="1";
				}
				
				//将splitSeatPath还原成一个字符串
				for(int j=0;j<splitSeatPath.length;j++){//加上分割符
					splitSeatPath[j]=splitSeatPath[j]+"/";
					
				 }
				 for(int j=1;j<splitSeatPath.length;j++){//合并到splitSeatPath[0]
					 splitSeatPath[0]+=splitSeatPath[j];
				 }
				 System.out.println("更新后的Path为:"+splitSeatPath[0]);
				 
				 //更新数据库座位表
				 int k=seatMapper.updatePathBySeatid(userTrain.seatid.get(i),splitSeatPath[0]);
				 System.out.println("更新数据库座位表成功");
				 //生成订单
				 //生成订单
				/* Order test=new Order(userid, human_name.get(i), userTrain.train_name, userTrain.seatid.get(i), userTrain.getStartsec(),userTrain.getStart(),
						 userTrain.getEndsec(),userTrain.getEnd(), userTrain.getDate()+"-"+userTrain.getStartTime(), String fINISH_DATE,double cost,String seatN) {
						*/
				 Order human_order=new Order(userid,human_name.get(i),userTrain.train_name,userTrain.seatid.get(i),
						 userTrain.getStartsec(),userTrain.getStart(),userTrain.getEndsec(),userTrain.getEnd(),
						 userTrain.getDate()+"-"+userTrain.getStartTime(),
						 userTrain.getDate()+"-"+userTrain.getEndTime(),userTrain.getMoney(),
						 seatMapper.getSeat(userTrain.seatid.get(i)));
				 System.out.println("订单为:"+human_order);
				 
				
				 //更新数据库订单表
				 result=orderMapper.addOrder(human_order);
				 
				 sqlSession.commit();
				 
			}
			
		}
		
		//sqlSession.close();
		
		return result;
	}


	/**
	 * 改签添加订单
	 *
	 * 
	 * @param 用户id
	 * @param ticketshow数组
	 * @param 乘车人姓名
	 * @param 选中的车次
	 * */
    /**/
	public int updateOrder(String userid,List<TicketShow> list,String human_name,String trainName) {
		OrderMapper orderMapper=sqlSession.getMapper(OrderMapper.class);
	    SeatMapper seatMapper=sqlSession.getMapper(SeatMapper.class);
		
		int result=0;//返回结果
		String seatPath=null;//座位表path
		String[] splitSeatPath;//分割后的座位表path
		TicketShow userTrain=null;//用户选择的车次
		
		for (TicketShow ticketShow : list) {
			if(ticketShow.getTrain_name().equals(trainName)){
				userTrain=ticketShow;
				break;
			}
		}
		
		

			if(userTrain!=null){
				System.out.println("选择的车次是:"+userTrain.train_name);
				System.out.println("该客人的座位id是:"+userTrain.seatid.get(0));
				
				seatPath=seatMapper.getPathBySeatid(userTrain.seatid.get(0));
				splitSeatPath=seatPath.split("/");
				
				//将预定经过的站点置为1
				for(int j=userTrain.getStartsec();j<userTrain.getEndsec();j++){
					
					splitSeatPath[j]="1";
				}
				
				//将splitSeatPath还原成一个字符串
				for(int j=0;j<splitSeatPath.length;j++){//加上分割符
					splitSeatPath[j]=splitSeatPath[j]+"/";
					
				 }
				 for(int j=1;j<splitSeatPath.length;j++){//合并到splitSeatPath[0]
					 splitSeatPath[0]+=splitSeatPath[j];
				 }
				 System.out.println("更新后的Path为:"+splitSeatPath[0]);
				 
				 //更新数据库座位表
				 int k=seatMapper.updatePathBySeatid(userTrain.seatid.get(0),splitSeatPath[0]);
				 System.out.println("更新数据库座位表成功");
				 //生成订单
				 Order human_order=new Order(userid,human_name,userTrain.train_name,userTrain.seatid.get(0),
						 userTrain.getStartsec(),userTrain.getStart(),userTrain.getEndsec(),userTrain.getEnd(),
						 userTrain.getDate()+"-"+userTrain.getStartTime(),
						 userTrain.getDate()+"-"+userTrain.getEndTime(),userTrain.getMoney(),
						 seatMapper.getSeat(userTrain.seatid.get(0)));
				 System.out.println("订单为:"+human_order);
				 
				 human_order.setIsPay(3);
				 //更新数据库订单表
				 result=orderMapper.addOrder(human_order);
				
				 sqlSession.commit();
			
			}
		
		
		
		return result;
	}

	/**
	 * 删除订单
	 * @param 订单id
	 * */
	@Override
	  public int deleteOrder(String orderId) {
		OrderMapper orderMapper=sqlSession.getMapper(OrderMapper.class);
	    SeatMapper seatMapper=sqlSession.getMapper(SeatMapper.class);
	    Order order=new Order(orderMapper.getOrderByOrderId(orderId));
		System.out.println("要退的订单为:"+order);
		String seatid=order.getSeatId();
		String path=seatMapper.getPathBySeatid(seatid);
		String[] splitSeatPath=path.split("/");
		for(int i=order.getStartIndex();i<order.getEndIndex();i++){
			splitSeatPath[i]="0";			
		}
		//将splitSeatPath还原成一个字符串
		for(int j=0;j<splitSeatPath.length;j++){//加上分割符
			splitSeatPath[j]=splitSeatPath[j]+"/";
			
		 }
		 for(int j=1;j<splitSeatPath.length;j++){//合并到splitSeatPath[0]
			 splitSeatPath[0]+=splitSeatPath[j];
		 }
		 
		 //更新数据库座位表
		 int k=seatMapper.updatePathBySeatid(seatid,splitSeatPath[0]);
		//更新数据库订单表
		 int result=orderMapper.deleteOrder(orderId);
		 sqlSession.commit();
		return result;
	}

	/**
	 * 查看订单
	 * @param 用户id
	 * */
	 public List<OrderShow> showUserOrderInfo(String userid){
		 System.out.println("userid="+userid);
		 OrderMapper orderMapper=sqlSession.getMapper(OrderMapper.class);
		 System.out.println("获得mapper:"+orderMapper);
		 List<Order> orders=orderMapper.getOrderByUserId(userid);//读取用户order
		 for (Order order : orders) {
			System.out.println(order);
		}
		 List<OrderShow> orderShows = new ArrayList<OrderShow>();
		 
		 //生成ordershow
		 for(int i=0;i<orders.size();i++){
			 orderShows.add(new OrderShow(orders.get(i)));
		 }
		 //sqlSession.close();
		 return orderShows;
		 
		 
	 }
	
		/**
		 * 查看未出行订单
		 */
		public List<OrderShow> showUserUnStartOrderInfo(String userid){
		
			 System.out.println("userid="+userid);
			 OrderMapper orderMapper=sqlSession.getMapper(OrderMapper.class);
			 System.out.println("获得mapper:"+orderMapper);
			 List<Order> orders=orderMapper.getOrderByUserId(userid);//读取用户order
			 for (Order order : orders) {
				System.out.println(order);
			}
			 List<OrderShow> orderShows = new ArrayList<OrderShow>();
			 //获取系统时间
				Date now = new Date(); 
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");//可以方便地修改日期格式


				String nowDates = dateFormat.format( now ); 
				System.out.println(nowDates); 
				Calendar c = Calendar.getInstance();//可以对每个时间域单独修改
				int year = c.get(Calendar.YEAR); 
				int month = c.get(Calendar.MONTH); 
				int date = c.get(Calendar.DATE); 
				int hour = c.get(Calendar.HOUR_OF_DAY); 
				int minute = c.get(Calendar.MINUTE); 
				int second = c.get(Calendar.SECOND); 
				System.out.println(year + "/" + month + "/" + date + " " +hour + ":" +minute + ":" + second); 
			 //生成ordershow
			 for(int i=0;i<orders.size();i++){
				 String[] orderDate=orders.get(i).getSTART_DATE().split("-");
				 int orderYear = Integer.parseInt(orderDate[0]);
				 int orderMonth = Integer.parseInt(orderDate[1]);
				 int orderDay = Integer.parseInt(orderDate[2]);
				 String[] orderTime = orderDate[3].split(":");
				 int orderHour = Integer.parseInt(orderTime[0]);
				 int orderMinute = Integer.parseInt(orderTime[1]);		 				 				 
					 if(orderYear>year){
						 orderShows.add(new OrderShow(orders.get(i)));
					 }
					 else if(orderYear == year && orderMonth>month){
					 orderShows.add(new OrderShow(orders.get(i)));
					 }
					 else if (orderYear == year && orderMonth == month && orderDay>date) {
						 orderShows.add(new OrderShow(orders.get(i)));
					}
					 else if (orderYear == year && orderMonth == month && orderDay == date && orderHour*60+orderMinute>hour*60+minute+30) {
						 orderShows.add(new OrderShow(orders.get(i)));
					}
				 }			
			 return orderShows;
		}
}