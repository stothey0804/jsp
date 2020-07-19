<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로또번호 생성기</title>
<style type="text/css">
	div { margin: 50px auto; width: 300px}
	.result-table { margin: 20px auto }
</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
</head>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	String command = request.getParameter("command");
%>
<body>
	<div>
		<h2 class="text-center">로또번호 생성기</h2>
		<p class="text-center">얼마나 구매하시겠습니까?</p>
		<form action="lotto.jsp" method="post">
			<table align="center">	
				<tr>
					<td width="150px"><select class="form-control" name="amount">
					  <option value="1">1,000원</option>
					  <option value="2">2,000원</option>
					  <option value="3">3,000원</option>
					  <option value="4">4,000원</option>
					  <option value="5">5,000원</option>
					</select></td>
					<td>
						<input type="hidden" name="command" value="execute">
						<input class="btn btn-primary" type="submit" value="생성">
					</td>
				</tr>		
			</table>
		</form>
			<%
			if(command != null && command.equals("execute")){
				int amount = Integer.parseInt(request.getParameter("amount"));
				Random rand = new Random();
				rand.setSeed(System.currentTimeMillis());	// 현재시간으로 시드 설정
			%>	
				<table class="table table-striped result-table">
					<thead>
						<tr>
							<th>#</th><th style="text-align:center">번호</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							
						
			<% 
				// 설정한 수량만큼 로또번호 Set
				for(int i = 0; i < amount; i++){
			%>			<td ><%= i+1 %></td>
			<%
					Collection<Integer> lottoNum = new HashSet<Integer>();
					while(lottoNum.size() != 6)	lottoNum.add(rand.nextInt(45)+1);
					// ArrayList로 변경 및 정렬 후 추가
					ArrayList<Integer> sortedLottoNum = new ArrayList<Integer>(lottoNum);
					Collections.sort(sortedLottoNum);
					// 바로출력하자 !
			%>
						<td style="text-align:center"><%= sortedLottoNum  %></td></tr>
			<%
					//lottos.add(sortedLottoNum);
					
				}
			}
			%>
					</tbody>
				</table>
		
	</div>
</body>
</html>