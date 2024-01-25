<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>커피 뭐마실?</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        
        <script type="text/javascript">
        
		$(document).ready(function(){
			
			$(".namebtn").click(function(){
				let name = $(this).prev().val();
				alert(name);
				sandData(name);
			});
			
			$(".coffee1").click(function() {
		        let coffee_name = "아메리카노";
		        let coffee;
		        if ($(this).text().trim() === 'HOT') {
		            coffee = 1;
		        } else {
		            coffee = 0;
		        }
		        alert("1번을 선택하셨습니다 ." + coffee_name + coffee);
		        sendData(coffee);
		        sendData(coffee_name);
		    });

		    $(".coffee2").click(function() {
		        let coffee_name = "카라멜마끼아또";
		        let coffee;
		        if ($(this).text().trim() === 'HOT') {
		            coffee = 1;
		        } else {
		            coffee = 0;
		        }
		        alert("2번을 선택하셨습니다 ." + coffee_name + coffee);
		        sendData(coffee);
		        sendData(coffee_name);
		    });

		    $(".coffee3").click(function() {
		        let coffee_name = "복숭아티";
		        let coffee;
		        if ($(this).text().trim() === 'HOT') {
		            coffee = 1;
		        } else {
		            coffee = 0;
		        }
		        alert("3번을 선택하셨습니다 ." + coffee_name + coffee);
		        sendData(coffee);
		        sendData(coffee_name);
		    });

		    $(".coffee4").click(function() {
		        let coffee_name = "자몽티";
		        let coffee;
		        if ($(this).text().trim() === 'HOT') {
		            coffee = 1;
		        } else {
		            coffee = 0;
		        }
		        alert("4번을 선택하셨습니다 ." + coffee_name + coffee);
		        sendData(coffee);
		        sendData(coffee_name);
		    });

		    $(".coffee5").click(function() {
		        let coffee_name = "허브티";
		        let coffee;
		        if ($(this).text().trim() === 'HOT') {
		            coffee = 1;
		        } else {
		            coffee = 0;
		        }
		        alert("5번을 선택하셨습니다 ." + coffee_name + coffee);
		        sendData(coffee);
		        sendData(coffee_name);
		    });

		    $(".coffee6").click(function() {
		        let coffee_name = "과일티";
		        let coffee;
		        if ($(this).text().trim() === 'HOT') {
		            coffee = 1;
		        } else {
		            coffee = 0;
		        }
		        alert("6번을 선택하셨습니다 ." + coffee_name + coffee);
		        sendData(coffee);
		        sendData(coffee_name);
		    });

		    $(".nothing").click(function() {
		        let coffee = null;
		        alert("안먹어를 선택하셨습니다 ." + coffee);
		        sendData(coffee);
		    });
			function sendData(data){
				$.ajax({
					url : './cafe',
					type : 'post',			
					dataType : 'text',		
					data : {choice: data},
					success : function(result){
						/* if(result == 1){
						//alert("수정이 완료되었습니다.");
						
						} else {
							alert(" 관리자에게 문의하세요.");
						} */
					},
					error : function(error) {
					alert("문제가 발생했습니다.");
				}
			}); //end ajax
			
			};
			
		});
        </script>
        
    </head>
    <style type="text/css">
    header{
    background-image:url('./image/compose.png');
    height: 250px;
    }
    </style>
    
    <body>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="#!">커피골라보세요</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="./index">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="./coffee">메뉴판</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">

                </div>
            </div>
        </header>
        <!-- Section-->
        <section class="py-5">
        <div class="namecoffee">
			<textarea id="namecoffee" ></textarea>
			<button type="button" class="namebtn" name="namebtn">이름입력</button>
		</div>
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="./image/americano.png" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder" id="americano">아메리카노</h5>
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><button type="button" name="coffee1" class="coffee1" >HOT</button>
                                <button type="button" name="coffee1" class="coffee1" >ICE</button></div>
                            </div>
                        </div>
                    </div>

                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="./image/makiato.png" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder" id="makiato">카라멜 마끼아또</h5>  
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>                                  
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><button type ="button" name="coffee2" class="coffee2" >HOT</button>
                                <button type ="button" name="coffee2" class="coffee2" >ICE</button></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="./image/peachtea.png" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder" id="peachtea">복숭아티</h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><button type ="button" name="coffee3" class="coffee3">HOT</button>
                                <button type ="button" name="coffee3" class="coffee3">ICE</button></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="./image/jamongtea.png" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder" id="amongtea">자몽허니블랙티</h5>
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><button type ="button" name="coffee4"  class="coffee4">HOT</button>
                                <button type ="button" name="coffee4"  class="coffee4">ICE</button></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="./image/hubtea.png" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder" id="hubtea">유기농허브티<br></h5>            
                                    페퍼민트,캐모마일,로즈마리
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><button type ="button" name="coffee5"  class="coffee5" >HOT</button>
                                <button type ="button" name="coffee5" class="coffee5" >ICE</button></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="./image/fruits.png" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder" id="fruits">과일티</h5>
                                    자몽,레몬,유자
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><button type ="button" name="coffee6" class="coffee6" >HOT</button>
                                <button type ="button" name="coffee6" class="coffee6" >ICE</button></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">안마심</h5>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><button type ="button" name="nothing" class="nothing">선택</button></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Bootstrap core JS-->

    </body>
</html>
