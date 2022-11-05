/**

* OZ, AI 리포트 툴과 웹 브라우저 - 크로스브라우징 문제 해결 
 
**/

// AI 리포트 띄우기
function fnAiView(reportName, args) {
    var data = "&reportID="+reportName+"&"+args;//+encodeURIComponent(args);
    var win = window.open('이부분은 포탈이름.co.kr/AISERVER?'+data, '_ozview', 'height=700,width=1100,menubar=no,toolbar=no,location=no,status=no,fullscreen=no,directories=no,scrollbars=no,resizable=no');
    win.focus();
}
 
 
 
//OZ 띄우기
function fnOzView(reportName, odiName, args, etcOption) {
    var data = "&reportName="+reportName+"&odiName="+odiName+"&args="+encodeURIComponent(args);
    var win = window.open('/common/oz/commonFinder.do?method=ozview'+data, '_ozview', 'height=700,width=1100,menubar=no,toolbar=no,location=no,status=no,fullscreen=no,directories=no,scrollbars=no,resizable=no');
    win.focus();
}

/* 기존 코드 */ 

//엑셀출력 버튼
function buttonFormatter(el, cval, opts) {
    if(opts.plorPrgsCdtnCode=="502" || opts.plorPrgsCdtnCode=="503") {
        if(opts.vndrDvsnCode=="B"){
            return "<a href='javascript:fnPrintMus(\"" + opts.vndrCode + "\",\"" + opts.vndrName + "\",\"" + opts.plorRdpCode + "\",\"" + opts.plorDate + "\",\"" + opts.plorNum + "\",\"" + opts.plorRdpName + "\",\"" + opts.plorPrgsCdtnCode + "\",\"" + opts.plorDecrId + "\")'><img src='/resources/partnersportal/images/btn/btn_t_excel_output.gif' width='66px'/></a>";
        } else {
            return "<a href='javascript:fnPrintMun(\"" + opts.vndrCode + "\",\"" + opts.vndrName + "\",\"" + opts.plorRdpCode + "\",\"" + opts.plorDate + "\",\"" + opts.plorNum + "\",\"" + opts.plorRdpName + "\",\"" + opts.plorPrgsCdtnCode + "\",\"" + opts.plorDecrId + "\")'><img src='/resources/partnersportal/images/btn/btn_t_excel_output.gif' width='66px'/></a>";
        }
    } else {
          return "";
    }
}



/* 리펙터링 코드 */ 


//엑셀출력 버튼
  function buttonFormatter(el, cval, opts) {
    if(opts.plorPrgsCdtnCode=="502" || opts.plorPrgsCdtnCode=="503") {
      if(opts.vndrDvsnCode=="B" && (navigator.userAgent.match(/msie/i) || navigator.userAgent.match(/trident/i)) ){
        return "<a href='javascript:fnPrintMus(\"" + opts.vndrCode + "\",\"" + opts.vndrName + "\",\"" + opts.plorRdpCode + "\",\"" + opts.plorDate + "\",\"" + opts.plorNum + "\",\"" + opts.plorRdpName + "\",\"" + opts.plorPrgsCdtnCode + "\",\"" + opts.plorDecrId + "\")'><img src='/resources/partnersportal/images/btn/btn_t_excel_output.gif' width='66px'/></a>";
      } else if(navigator.userAgent.match(/msie/i) || navigator.userAgent.match(/trident/i)) {
        return "<a href='javascript:fnPrintMun(\"" + opts.vndrCode + "\",\"" + opts.vndrName + "\",\"" + opts.plorRdpCode + "\",\"" + opts.plorDate + "\",\"" + opts.plorNum + "\",\"" + opts.plorRdpName + "\",\"" + opts.plorPrgsCdtnCode + "\",\"" + opts.plorDecrId + "\")'><img src='/resources/partnersportal/images/btn/btn_t_excel_output.gif' width='66px'/></a>";
      } else {
        return "<a href='javascript:fnPrintByBrowserType(\"" + opts.vndrCode + "\",\"" + opts.vndrName + "\",\"" + opts.plorRdpCode + "\",\"" + opts.plorDate + "\",\"" + opts.plorNum + "\",\"" + opts.plorRdpName + "\",\"" + opts.plorPrgsCdtnCode + "\",\"" + opts.plorDecrId + "\")'><img src='/resources/partnersportal/images/btn/btn_t_excel_output.gif' width='66px'/></a>";
      }
    } else {
       return
    }
  }
 
    //AI 리포트 호출
    function fnPrintByBrowserType(vndrCode,vndrName,plorRdpCode,plorDate,plorNum,plorRdpName,plorPrgsCdtnCode,plorDecrId){
       var param = "vndrCode=" + vndrCode + "&vndrName=" + vndrName +
          "&rdpCode=" + plorRdpCode +
          "&plorDate=" + plorDate + "&plorNum=" + plorNum +
          "&plorRdpName=" + plorRdpName +
          "&plorPrgsCdtnCode=" + plorPrgsCdtnCode +
          "&plorDecrId=" + plorDecrId;
 
      fnAiView("prdt1010", param);
    }

