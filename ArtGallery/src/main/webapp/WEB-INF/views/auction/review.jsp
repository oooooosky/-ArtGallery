<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<style>
#index {
  padding: 10px;
  animation: fadein 3s;
  -moz-animation: fadein 3s; /* Firefox */
  -webkit-animation: fadein 3s; /* Safari and Chrome */
  -o-animation: fadein 3s; /* Opera */
}

@keyframes fadein {
    from {
        opacity:0;
    }
    to {
        opacity:1;
    }
}
@-moz-keyframes fadein { /* Firefox */
    from {
        opacity:0;
    }
    to {
        opacity:1;
    }
}
@-webkit-keyframes fadein { /* Safari and Chrome */
    from {
        opacity:0;
    }
    to {
        opacity:1;
    }
}
@-o-keyframes fadein { /* Opera */
    from {
        opacity:0;
    }
    to {
        opacity: 1;
    }
}

* {
	font-family: 'Gowun Dodum', sans-serif;
}

</style>
</head>
<body>

	<div class="container mt-3" id="index" style="border: 1px solid black; border-radius: 1rem;">
        
        <div class="d-flex bd-highlight">
			<div class="p-2 flex-grow-1 bd-highlight" style="font-size:1.5em;">
				<a class="nav-link active text-dark" aria-current="page" href="/auction/reviewPaging">R e v i e w</a>
			</div>
		</div>
        
        <div class="text-center">
            <table class="table table-hover text-center">
                <tr>
                    <th>리뷰 번호</th>
                    <th>리뷰 제목</th>
                    <th>구매 작품명</th>
                    <th>작성자</th>
                </tr>
            <c:forEach items="${rList}" var="r">
                <tr>
                    <td>${r.r_number}</td>
                    <td><a class="text-dark" style="text-decoration-line: none;" href="/auction/reviewDetail?r_number=${r.r_number}&page=${paging.page}">${r.r_title}</a></td>
                    <td>${r.a_title}</td>
                    <td>${r.m_id}</td>
                </tr>
            </c:forEach>
        </table>
        
            <a href="/auction/paging" class="btn btn-outline-danger mb-3">C a n c l e</a>
            
        <div class="d-flex justify-content-center">
		    
		    <nav aria-label="Page navigation">
                <ul class="pagination">
                    
                    <c:choose>
                        <c:when test="${paging.page<=1}">

                            <li class="page-item disabled">
                                <a class="page-link" href="#" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>

			            </c:when>
			            <c:otherwise>

                            <li class="page-item">
                                <a class="page-link" href="/auction/paging?page=${paging.page-1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>

                        </c:otherwise>
		            </c:choose>

                <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
			    <c:choose>
				    <c:when test="${i eq paging.page}">
                        <li class="page-item active">
                            <a class="page-link">
                                ${i}
                            </a>
                        </li>
				    </c:when>
				    <c:otherwise>
                        <li class="page-item">
                            <a class="page-link" href="/auction/paging?page=${i}">${i}</a>
                        </li>
				    </c:otherwise>
			    </c:choose>
		        </c:forEach>



                <c:choose>
                    <c:when test="${paging.page>=paging.maxPage}">
                        
                        <li class="page-item disabled">
                            <a class="page-link" href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>

                    </c:when>
                    <c:otherwise>

                        <li class="page-item">
                            <a class="page-link" href="/auction/paging?page=${paging.page+1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>

                    </c:otherwise>
                </c:choose>
                  
                </ul>
            </nav>
		    
	    </div>

    </div>
	
	</div>


</body>
</html>