<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title></title>
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="css/bootstrap-theme.min.css">
		<!--<script src="http://libs.baidu.com/jquery/1.10.2/jquery.min.js"></script>-->
		<script src="js/jquery-3.2.1.min.js" type="text/javascript" charset="utf-8"></script>
		<!--<script src="js/jquery.validate.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/messages_zh.js" type="text/javascript" charset="utf-8"></script>-->
		<link rel="stylesheet" href="css/bootstrapValidator.css" />
		
		<link rel="stylesheet" href="css/sand.css">
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/bootstrapValidator.js"></script>
		<script type="text/javascript" src="js/language/zh_CN.js"></script>
		<style type="text/css">
			.breadcrumb {
				background-color: #FFFFFF;
			}
		</style>
		<script type="text/javascript">
			$(function() {
				function randomNumber(min, max) {
					return Math.floor(Math.random() * (max - min + 1) + min);
				};
				console.log("2222");
				$('#captchaOperation').html([randomNumber(1, 100), '+', randomNumber(1, 200), '='].join(' '));
				$('#form1').bootstrapValidator({
					message: 'This value is not valid',
					feedbackIcons: {
						valid: 'glyphicon glyphicon-ok',
						invalid: 'glyphicon glyphicon-remove',
						validating: 'glyphicon glyphicon-refresh'
					},
					fields: {
						username: {
							validators: {
								notEmpty: {
									message: '请填写你的用户名'
								},
								stringLength: {
									min: 3,
									max: 10,
									message: '用户名字长必须为3-10个字。亲换一个用户名吧'
								},

							}
						},
						passwd: {
							validators: {
								notEmpty: {
									message: '请填写你的密码'
								},
								stringLength: {
									min: 6,
									max: 30,
									message: '用户名字长必须为6-30个字符串之间'
								},
								regexp: {
									regexp: /^[a-zA-Z0-9_\.]+$/,
									message: '我知道你是中国人，但密码只允许为数字，字母，点，下划线的组合'
								}

							}
						},
						valPassword: {
							validators: {
								notEmpty: {
									message: '确认密码不得为空'
								},
								identical: {
									field: 'passwd',
									message: '两次密码不一致！请仔细检查'
								},

							}
						},
						age: {
							validators: {
								notEmpty: {
									message: '年龄不得为空'
								},
								regexp: {
									regexp: /^(0|[1-9][0-9]*)$/,
									message: '请填写数字,数字首位不得为零'
								}

							}
						},
						name: {
							validators: {
								notEmpty: {
									message: '请填写你的真实姓名'
								},
								stringLength: {
									min: 1,
									max: 1111,
									message: '中国人的名字不是一个字的！'
								},
								regexp: {
									regexp: /^[\u4E00-\u9FFF]+$/,
									message: '我记得这不是汉字呢'
								}

							}
						},
						tel: {
							validators: {
								notEmpty: {
									message: '手机号码不得为空'
								},
								stringLength: {
									min: 11,
									max: 11,
									message: '手机号码位数不匹配'
								},
								regexp: {
									regexp: /^(1[3578]\d{9})$/,
									message: '我记得中国大陆的手机号不是这个格式的呢'
								}

							}
						},
						id: {
							validators: {
								notEmpty: {
									message: '请填写你的证件号'
								},
								stringLength: {
									min: 18,
									max: 18,
									message: '请输入正确的证件号'
								},
								regexp: {
									regexp: /^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/,
									message: '请输入正确的证件号'
								}

							}
						},
						email: {
							validators: {
								notEmpty: {
									message: '请填写你的邮箱地址'
								},
								emailAddress: {
									message: '请填写正确的邮箱地址'

								}
							},
						},
						captcha: {
							validators: {
								callback: {
									message: '你的数学是体育老师教的么？',
									callback: function(value, validator) {
										console.log($('#captchaOperation').html())
										var items = $('#captchaOperation').html().split(' '),
											sum = parseInt(items[0]) + parseInt(items[2]);

										return value == sum;
									}
								}
							}
						}
					}

				});
			});
		</script>

	</head>

	<body>
		<div class="header">

			<div class="h_top">

				<div class="h_logo">

				</div>

				<div class="h_nav">

					<ul>
						<li>
							<a href="default.do">首页</a>
						</li>				
						<li>
							<a href="order.do">车票查询</a>
						</li>
						
						<li>
							<a href="userinfo.do">个人信息</a>
						</li>
						<li>
							<a href="register.do">新用户注册</a>
						</li>
					</ul>

				</div>
	
				<div class="h_search">

					<input type="text" class="h_text" />

					<a href="#" class="h_btn"></a>

				</div>

				<div class="h_message">

					<div class="h_info">

						
						
						<a href="#" class="">
						
						<img src="images/t1.png" alt="phone" height="25" width="25">
						
						</a>
						
					</div>
					

					<div class="h_pic" >
					
					
						
				</div>

			</div>

		</div>
		<br>
		<br>
		<br>
		<br>
		<ol class="breadcrumb col-md-offset-3">
			<li>
				<h1>添加个人信息</h1>
			</li>
		</ol>
		<form action="regeditsubmit.do" class="form-horizontal" role="form" id="form1" method="post">
			<div class="form-group">
				<div class="col-sm-6 col-md-offset-3">
					<input type="text" class="form-control" name="username" placeholder="请输入您的用户名，必须为3-10个字符串">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-6 col-md-offset-3">
					<input type="password" class="form-control" name="passwd" placeholder="请输入您的登录密码">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-6 col-md-offset-3">
					<input type="password" class="form-control" name="valPassword" placeholder="请确认你的登录密码，两者必须相等">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-6 col-md-offset-3">
					<input type="text" class="form-control" name="name" placeholder="请输入你的真实姓名（必须为汉字）">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-6 col-lg-offset-2">
					<label class="col-sm-4 control-label" for="inputSuccess1">请选择你的性别</label>
					<div class="col-sm-8">
						<select class="form-control" name="sex" id="list1">
							<option value="男">男</option>
							<option value="女">女</option>
							
						</select>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-6 col-md-offset-3">
					<input type="text" class="form-control" name="age" placeholder="请输入你的年龄">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-6 col-md-offset-3">
					<input type="text" class="form-control" name="id" placeholder="请输入你的证件号码">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-6 col-md-offset-3">
					<input type="text" class="form-control required email" name="email" placeholder="请输入你的邮箱地址">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-6 col-md-offset-3">
					<input type="text" class="form-control" name="tel" placeholder="请输入你的手机号码">
				</div>
			</div>
			<div class="form-group">
				<label class="col-lg-3 control-label" id="captchaOperation"></label>
				<div class="col-lg-2">
					<input type="text" class="form-control" name="captcha" />
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-6 col-md-offset-3">
					<input type="submit" class="btn btn-default" value="注册" />
				</div>
			</div>
		</form>
	</body>
</html>