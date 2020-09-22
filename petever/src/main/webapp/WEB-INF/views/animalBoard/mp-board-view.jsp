<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%--한글 인코딩처리 --%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mp-board-view.css">
	    <div id="main-wrap">
        <section class="main">

        </section>
        <section class="content-wrap">
            <h1>[보호] 퍼그(수컷)을 보호하고 있습니다.</h1>
            <p>#강아지 #3살 #퍼그 #수컷 #강남구 #중성화</p>
            <div class="content">
                <div class="board-container">
                    <div class="board-header">
                        <span class="board-title-tag" style="color:#5F9EA0;">[보호]</span>
                        <span class="board-title">퍼그(수컷)을 보호하고 있습니다.</span>
                        <br>
                        <span class="writer">honggd</span>
                        <div class="writer-menu">
                            <ul>
                                <li><a href="">쪽지보내기</a></li>
                                <li><a href="">입양신청하기</a></li>
                            </ul>
                        </div>
                        <span class="write-time">2020.09.18 11:11</span>
                        <a href="#board-comment-container" class="header-comment-view">댓글 31</a>
                    </div>
                    <div class="pet-info">

                    </div>
                    <div class="board-content">
                        <p>감사원의 조직·직무범위·감사위원의 자격·감사대상공무원의 범위 기타 필요한 사항은 법률로 정한다. 비상계엄이 선포된 때에는 법률이 정하는 바에 의하여 영장제도,
                            언론·출판·집회·결사의 자유, 정부나 법원의 권한에 관하여 특별한 조치를 할 수 있다.</p>
                        <br>
                        <p>모든 국민은 헌법과 법률이 정한 법관에 의하여 법률에 의한 재판을 받을 권리를 가진다. 근로자는 근로조건의 향상을 위하여 자주적인 단결권·단체교섭권 및 단체행동권을
                            가진다.</p>
                        <br>
                        <p>국회의 회의는 공개한다. 다만, 출석의원 과반수의 찬성이 있거나 의장이 국가의 안전보장을 위하여 필요하다고 인정할 때에는 공개하지 아니할 수 있다.</p>
                        <br>
                        <p>국가는 농업 및 어업을 보호·육성하기 위하여 농·어촌종합개발과 그 지원등 필요한 계획을 수립·시행하여야 한다. 형사피의자 또는 형사피고인으로서 구금되었던 자가 법률이
                            정하는 불기소처분을 받거나 무죄판결을 받은 때에는 법률이 정하는 바에 의하여 국가에 정당한 보상을 청구할 수 있다.</p>
                        <br>
                        <p>국회는 국민의 보통·평등·직접·비밀선거에 의하여 선출된 국회의원으로 구성한다. 이 헌법시행 당시의 대법원장과 대법원판사가 아닌 법관은 제1항 단서의 규정에 불구하고 이
                            헌법에 의하여 임명된 것으로 본다.</p>
                        <br>
                        <p>대통령은 국가의 독립·영토의 보전·국가의 계속성과 헌법을 수호할 책무를 진다. 모든 국민은 그 보호하는 자녀에게 적어도 초등교육과 법률이 정하는 교육을 받게 할 의무를
                            진다.</p>
                        <br>
                        <p>법률안에 이의가 있을 때에는 대통령은 제1항의 기간내에 이의서를 붙여 국회로 환부하고, 그 재의를 요구할 수 있다. 국회의 폐회중에도 또한 같다. 위원은 정당에
                            가입하거나 정치에 관여할 수 없다.</p>
                        <br>
                        <p>국회의원은 국회에서 직무상 행한 발언과 표결에 관하여 국회외에서 책임을 지지 아니한다. 모든 국민은 행위시의 법률에 의하여 범죄를 구성하지 아니하는 행위로 소추되지
                            아니하며, 동일한 범죄에 대하여 거듭 처벌받지 아니한다.</p>
                        <br>
                        <img src="./resources/images/pug.jpg" alt="" width="600">

                    </div>
                    <div class="pet-info">
                        <span>#강아지</span>
                        <span>#퍼그</span>
                        <span>#수컷</span>
                        <span>#3살</span>
                        <span>#강남구 태해란로</span>
                        <span>#중성화 완료</span>
                    </div>
                    <div id="board-comment-container">
                        <div class="comment-header">
                            <span class="comment-view">댓글 31</span>
                            <a class="report-btn" onclick="javascript:openReport();">신고</a>
                        </div>
                        <div class="board-comment">
                            <p class="id-box">honggd</p>
                            <p>안녕하세요</p>
                            <span class="comment-time">2020.09.18 11:11</span>
                            <span class="reply-btn">답글쓰기</span>
                        </div>
                        <div class="board-comment-reply">
                            <p class="id-box">&#8627; sinsa</p>
                            <p>안녕하세요</p>
                            <span class="comment-time">2020.09.18 11:11</span>
                            <span class="reply-btn">답글쓰기</span>
                        </div>
                        <div class="comment-reply-write">
                            <span>honggd</span>
                            <textarea rows="1" class="comment_inbox_text" placeholder="댓글을 입력하세요"
                                onkeyup="xSize(this)"></textarea>
                            <div class="btn-align">
                                <button class="comment-reg-btn">등록</button>
                                <button class="comment-cancle-btn">취소</button>
                            </div>
                        </div>
                    </div>
                    <div class="comment-write">
                        <span>honggd</span>
                        <textarea rows="1" class="comment_inbox_text" placeholder="댓글을 입력하세요"
                            onkeyup="xSize(this)"></textarea>
                        <div class="btn-align">
                            <button class="comment-reg-btn">등록</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
<script>
    function openReport() {
        window.open("report.html", "신고하기",
            "width=500, height=330, toolbar=no, menubar=no, scrollbars=no, resizable=yes, top=300, left=500");
    }

     //댓글입력창 자동 높이조절
     function xSize(e) {
            console.log(e.value.length);
            e.style.height = '1px';
            e.style.height = (e.scrollHeight) + 'px';
        }
        
        $(".reply-btn").click(function() {
            $(".comment-reply-write").toggle();
            // var reply = '<div class="comment-reply-write">'
            //             +'<span>honggd</span>'
            //             +'<textarea rows="1" class="comment_inbox_text" placeholder="댓글을 입력하세요" onkeyup="xSize(this)"></textarea>'
            //             +'<div class="btn-align">'
            //             +'<button class="comment-cancle-btn">취소</button>'
            //             +'<button class="comment-reg-btn">등록</button>'
            //             +'</div>'
            //             +'</div>';
            // $(this).parent().append(reply);
            // $(this).parent(reply).trigger("create");
            // $(this).parent().append(reply).show();
            $(this).off("click");
        });

        $(function() {
            var $tag = $(".board-title-tag");
            if($tag.text().includes('보호'))
                $tag.css('color', 'green');
        });

        $(".writer").click(function() {
            $(".writer-menu").toggle();
        });

        $(".comment-cancle-btn").click(function() {
            $(".comment-reply-write").hide();
        });
</script>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
