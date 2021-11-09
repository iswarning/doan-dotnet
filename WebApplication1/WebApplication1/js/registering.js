			function myFunction () {
				var x = "50%";
				// var y = parseInt(document.getElementsByClassName('gtco-cover')[0].style.backgroundPositionY) + document.documentElement.scrollTop*0.05;

				// document.getElementsByClassName('gtco-cover')[0].style.backgroundPosition = "50% "+y+"px";						
			}

			function readURL(input) {
				if (input.files && input.files[0]) {
					var reader = new FileReader();

					reader.onload = function (e) {
						$('#avatarView')
						.attr('src', e.target.result)
						.width(150)
						.height(200);
					};

					reader.readAsDataURL(input.files[0]);
				}
			}

			function check() {

				/*Ho Ten*/
				hoten = $("#hoten")[0].value;
				resetAlert();

				if(hoten != "")
				{

				}
				else
				{
					showAlert("warn_hoten","Bắt buộc phải nhập họ tên !");
				}
				/*Tên đăng nhập*/
				tdn = $("#tdn")[0].value;
				if(tdn.length != 0)
				{
					var retdn =/^[a-zA-Z][a-zA-Z0-9]{5,31}$/;
					if(retdn.test(tdn)==true)
					{

					}
					else
					{
						showAlert("warn_tdn","Tên đăng nhập không hợp lệ !")
					}
				}
				else
				{
					showAlert("warn_tdn","Bắt buộc phải có tên đăng nhập !");
				}


				/*SDT*/
				sdt = document.querySelectorAll("#sdt")[0].value;				

				if(sdt.length != 0)
				{
					var reSDT = /^0(1\d{9}|9\d{8})$/;
					if(reSDT.test(sdt)==true)
					{

					}
					else
					{
						showAlert("warn_sdt","Số điện thoại phải có 10 số!");
					}
				}
				else
				{
					showAlert("warn_sdt","Bắt buộc phải nhập số điện thoại !");
				}

				/*Gioi tinh*/
				gioitinh = $("input[name='gioitinh']:checked").length;
				if(gioitinh != 0)
				{

				}
				else
				{
					showAlert("warn_gioitinh","Vui lòng chọn giới tính !");
				}

				/*Email*/
				email = $("#email")[0].value;
				if(email.length != 0)
				{
					var reEmail = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
					if(reEmail.test(email)==true)
					{

					}
					else
					{
						showAlert("warn_email","Phải nhập đúng email !");
					}
				}
				else
				{
					showAlert("warn_email","Bắt buộc phải nhập email !");
				}
				/*tinh thanh*/
				tinhthanh = $("#tinhthanh")[0].value;
				if(tinhthanh==0)
				{
					showAlert("warn_tinhthanh","Vui lòng chọn tỉnh thành !");
				}
				/*hinhdaidien*/
				hinh = $("#avatarView")[0].src[32];
				if(hinh !== "#")
				{
					
				}
				else
				{
					showAlert("warn_avatar","Vui lòng chọn hình !");
				}

				/*mat khau*/
				matkhau = $("#matkhau")[0].value;
				if(matkhau.length != 0)
				{
					var rematkhau = new RegExp("^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})");
					if(rematkhau.test(matkhau) == true)
					{

					}
					else
					{
						showAlert("warn_matkhau","Mật khẩu phải có ít nhất 1 ký tự chữ hoa, 1 chữ thường, 1 số, 1 ký tự đặc biệt và độ dài ít nhất 8 ký tự !");
					}
				}
				else
				{
					showAlert("warn_matkhau","Bắt buộc nhập mật khẩu !");
				}
				matkhau2 = $("#nhaplaimatkhau")[0].value;
				if(matkhau2.length != 0)
				{
					if(matkhau2 == matkhau)
					{

					}
					else
					{
						showAlert("warn_nhaplaimatkhau","Vui lòng nhập đúng mật khẩu !");
					}
				}
				else
				{
					showAlert("warn_nhaplaimatkhau","Bắt buộc nhập lại mật khẩu !");
				}
				var checkbox = document.getElementsByName("gioitinh");
                for (var i = 0; i < checkbox.length; i++){
                    if (checkbox[i].checked === true)
                    {
                        if(checkbox[i].value==0)
                        {
                        	checkbox="Nam";
                        }
                        else
                        {
                        	checkbox="Nữ";
                        }
                    }
                }
                if(hoten.length!=0 && sdt.length!=0 && gioitinh!=0 && email.length!=0 && matkhau.length!=0 && tinhthanh!=0 && matkhau2.length!=0 )
                {
                	document.write("Thông tin của bạn đã đăng ký"+"<br>"+"Họ tên: "+hoten+"<br>"+"Tên đăng nhập: "+tdn+"<br>"+"SĐT: "+sdt+"<br>"+"Giới tính: "+checkbox+"<br>"+"Email: "+email+"<br>"+"Tỉnh thành: "+tinhthanh+"<br>"+"Mật khẩu: "+matkhau);
                }
                else
                {
					showAlert("warn_checkall","Vui lòng nhập đầy đủ thông tin !");
                }
				return false;
			}
			function showAlert(id, content) {
				// body...
				alert = document.querySelector("#"+id);
				alert.innerText = content;
				alert.style.display = "block";
			}

			function resetAlert() {
				// body...
				arrAlert = document.querySelectorAll(".alert");

				for(i=0; i<arrAlert.length; i++)
				{
					arrAlert[i].style.display = "none";
				}
			}

			window.onload = function () {

				$('#ngaysinh').datepicker({
					weekStart: 1,
					daysOfWeekHighlighted: "6,0",
					autoclose: true,
					todayHighlight: true,
				});
				$('#ngaysinh').datepicker("setDate", new Date("01/01/1990"));


				resetAlert();
			}