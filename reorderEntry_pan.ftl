<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>pmtable</title>

    <link href="/images/project_demo/css/bootstrap.min.css" rel="stylesheet">
    <link href="/images/project_demo/font-awesome/css/font-awesome.css" rel="stylesheet">

    <link href="/images/project_demo/css/plugins/dataTables/datatables.min.css" rel="stylesheet">
    <link href="/images/project_demo/css/plugins/dataTables/media/css/dataTables.bootstrap.min.css" rel="stylesheet">



    <link href="/images/project_demo/css/plugins/dataTables/media/css/dataTables.jqueryui.min.css" rel="stylesheet">
    <link href="/images/project_demo/css/plugins/dataTables/media/css/jquery.dataTables.min.css" rel="stylesheet">


    <link href="/images/project_demo/css/animate.css" rel="stylesheet">
    <link href="/images/project_demo/css/style_project_demo.css" rel="stylesheet">

</head>

<body class="pace-done mini-navbar">

    <div id="wrapper">

        <div id="page-wrapper_1" class="gray-bg">
        <div class="wrapper wrapper-content-PMTable animated fadeInRight">
            <div class="row">
                <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>订货表</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="#">Config option 1</a>
                                </li>
                                <li><a href="#">Config option 2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                    <div>
                        <table  border="0" cellspacing="0" cellpadding="0" class='table' id="abc">
                            <tr>
                                <td>总额度</td>
                                <td ><#if twoMonthsSales?has_content>${twoMonthsSales}</#if></td>
                            </tr>
                            <tr><td>剩余额度<input type="text" size=5 id="totalScore" value="${surplusQuota!}" name="totalScore"/></td></tr>
                        </table>
                    </div>

                    <div class="table-responsive">
                    <form action="<@ofbizUrl>gotoPurchaserview</@ofbizUrl>" method="post" id="">
                    <table class="table table-bordered dataTables-example" id="mainTable table" style="width: 100%; white-space: nowrap;" width="100%">
                    <thead>
                    <tr>
                        <th align="center">sku</th>
                        <th align="center">库存</th>
                        <th align="center">品名</th>
                        <th align="center">产品状态</th>
                        <th align="center">5天销量</th>
                        <th align="center">15天销量</th>
                        <th align="center">30天销量</th>
                        <th align="center">在途</th>
                        <th align="center">缺货数量</th>
                        <th align="center">净库存</th>
                        <th align="center">订货人</th>
                        <th align="center">订货数量</th>
                        <th align="center">总采购额</th>
                        <th align="center">组别</th>
                        <th align="center">周转天数</th>
                        <th align="center">pm备注</th>
                        <th align="center">主次</th>
                        <th align="center">供应商</th>
                        <th align="center">链接</th>
                        <th align="center">起订量</th>
                        <th align="center">成本</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list reorderList! as order>
                        <tr id="city_${(order.sku!)?replace('-','_')}" class="quotation" >
                            <td align="center">
                                <form action="<@ofbizUrl>deleteReorderSku</@ofbizUrl>" method="post" name="reorder_${(order.sku!)?replace('-','_')}" onsubmit='return saveReport();'  target='targetIfr'>
                                    <input type="submit" value="delete"/>
                                    <input type="hidden" name="productId" value="${order.sku}"/>
                                    <input type="hidden" name="date" value ="${order.date}">
                                </form>
                            </td>
                            <td align="center"><#if order.sku?has_content>${order.sku}</#if></td>
                            <td align="center"><#if order.qty?has_content>${order.qty}</#if></td>
                            <td align="center"><#if order.chineseName?has_content>${order.chineseName}</#if></td>
                            <td align="center"><#if order.statusId?has_content>${order.statusId}</#if></td>
                            <td align="center"><#if order.fiveDaysSales?has_content>${order.fiveDaysSales}</#if></td>
                            <td align="center"><#if order.fifteenDaysSales?has_content>${order.fifteenDaysSales}</#if></td>
                            <td align="center"><#if order.oneMonthSales?has_content>${order.oneMonthSales}</#if></td>
                            <td align="center"><#if order.pootw?has_content>${order.pootw}</#if></td>
                            <td align="center"><#if order.outOfStock?has_content>${order.outOfStock}</#if></td>
                            <td align="center"><#if order.atp?has_content>${order.atp}</#if></td>
                            <td align="center"><#if order.purchaser?has_content>${order.purchaser}</#if></td>
                            <td align="center"><input type="number" id="input1_${(order.sku!)?replace('-','_')}"  name="orderCount" class="per" value="<#if order.orderCount?has_content>${order.orderCount}<#else>0</#if>" size="3"/> 
                            </td>
                            <td align="center"><#if order.totalPurchases?has_content>${order.totalPurchases}</#if></td>
                            <td align="center"><#if order.ownerGroup?has_content>${order.ownerGroup}</#if></td>
                            <td align="center"><#if order.turnOverDayCount?has_content>${order.turnOverDayCount}</#if></td>
                            <td align="center"><#if order.pmNotes?has_content>${order.pmNotes}</#if></td>
                            <td align="center">
                                <select id="selectKK_${(order.sku!)?replace('-','_')}" class="prov" onChange="onChangeSelect();" name="zhuci"></select>
                                <input type="hidden" id="classID_${(order.sku!)?replace('-','_')}"  value="MAIN" />      
                            </td>
                            <td align="center"><select class="city" disabled="disabled" name="supplier"></select></td>
                            <td align="center"><select class="dist" disabled="disabled" name="link"></select></td>
                            <td align="center">
                                <input  id="totalScore_${(order.sku!)?replace('-','_')}" name="qidingliang" value="${order.minimumOrderCountm}" autoComplete='off'   >
                            </td>
                            <td align="center">
                                <input class="num" id="costes_${(order.sku!)?replace('-','_')}" name="cost" value="${order.minimumCostm}" autoComplete='off'>
                            </td>
                        </tr>
                            <input type="hidden" name="sku" value="${order.sku}"/>
                            <input type="hidden" name="date" value ="${order.date}">
                    </#list>
                    </tbody>
                    </table>
                    <div class="">
                            <button id="button" class="btn btn-w-m btn-warning demo4">Delete selected row</button>

                    </div>
                    </form>


                    <iframe name="targetIfr" style="display:none"></iframe>

                    <div class="screenlet-title-bar">
                        <ul>
                            <li class="h3">补货表</li>
                        </ul>
                        <br class="clear"/>
                    </div>
                    <div class="screenlet-body">
                        <form action="<@ofbizUrl>addNewSku</@ofbizUrl>" method="post" name="form1" onsubmit="return checkscript()">
                            <table  border="0" cellspacing="0" cellpadding="0" id='table' >
                            <tr class="header-row">
                            <td align="center">sku</td>
                            <td align="center">订货数量</td>
                            </tr>
                            <tr>
                            <td align="center"></td>
                            <td align="center"></td>
                            </tr>
                            </table>
                        </form>
                    </div>
                    </div>

                    </div>
                </div>
            </div>
            </div>
        </div>
        </div>
        </div>



    <!-- Mainly scripts -->
    <script src="/images/project_demo/js/bootstrap.min.js"></script>
    <script src="/images/project_demo/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="/images/project_demo/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <script src="/images/project_demo/js/plugins/dataTables/datatables.min.js"></script>
    <link href="/images/project_demo/js/plugins/dataTables/media/js/dataTables.bootstrap.min.js" rel="stylesheet">
    <link href="/images/project_demo/js/plugins/dataTables/media/js/dataTables.jqueryui.min.js" rel="stylesheet">
    <link href="/images/project_demo/js/plugins/dataTables/media/js/jquery.dataTables.min.js" rel="stylesheet">


        <!-- Chosen -->
    <script src="/images/project_demo/js/plugins/chosen/chosen.jquery.js"></script>

    <!-- Custom and plugin javascript -->
    <script src="/images/project_demo/js/inspinia.js"></script>
    <script src="/images/project_demo/js/plugins/pace/pace.min.js"></script>

    <script type="text/javascript" src="/images/reorder/1/jquery.cityselect.js"></script>

    <!-- Page-Level Scripts -->
    <script>
        $(document).ready(function(){

           var oTable = $('.dataTables-example').DataTable({
                "scrollY": 400,
                "sScrollX": "100%",
                "sScrollXInner": "110%",
                "bScrollCollapse": true,
                "pageLength": 100,
                "responsive": true,
                "dom": '<"html5buttons"B>lTfgitp',
                "bAutoWidth": true,//自动宽度
                "language": {
                    "emptyTable":     "Custom Search Message Result Is Empty"
                }

            });

           // 点击选中一行

           $('#table tbody').on( 'click', 'tr', function () {
                if ( $(this).hasClass('selected') ) {
                    $(this).removeClass('selected');
                }
                else {
                    oTable.$('tr.selected').removeClass('selected');
                    $(this).addClass('selected');
                }
            } );
         
            // $('#button').click( function () {
            //     oTable.row('.selected').remove().draw( false );
            // } );


            //<#list reorderList! as order1>
            $("#city_${(order1.sku!)?replace('-','_')}").citySelect({
                url: {"citylist": [
                   {"p": "MAIN", "c": [{"n": "${order1.mainSupplier!}", "a": [{"s": "${order1.mainSupplierLink!}"}]}]},
                   {"p": "BACKUP", "c": [{"n": "${order1.backupSupplier!}", "a": [{"s": "${order1.backupSupplierLink!}"}]}]},
                ]},
                prov: "",
                city: "",
                dist: "",
                nodata: "none"
            });
            //</#list>
            var virtual_total1=0.00;
            $('#table').change(function(){
                    var TOTAL;
                    TOTAL=0.00;
                    TOTALLAST=0.00;
                    virtual_total=0.00;
                    $(".quotation").each(function() {
                        var per = $(this).find('.per').val();
                        var num = $(this).find('.num').val();
                        var subtotal = per*num;
                        var SUBTOTAL = subtotal;

                        if(SUBTOTAL){
                            TOTAL = parseFloat(SUBTOTAL)+TOTAL;
                            virtual_total = virtual_total1;
                            TOTALLAST = virtual_total - TOTAL;
                            $('#totalScore').val(TOTALLAST.toFixed(2));
                            if(TOTALLAST >= 0){
                                $("#gotoPurch").prop("type", "submit");
                            }else{
                                $("#gotoPurch").prop("type", "hidden");
                            }
                        }
                    });
                });
            var TOTAL1;
            TOTAL1=0.00;
            virtual_total11=0.00;
            $(".quotation").each(function() {
                 var per1 = $(this).find('.per').val();
                 var num1 = $(this).find('.num').val();
                 var subtotal1 = per1*num1;
                 var SUBTOTAL1 = subtotal1;
                 if(SUBTOTAL1){
                   TOTAL1 = parseFloat(SUBTOTAL1)+TOTAL1;
                    virtual_total1 = ${surplusQuota!} + TOTAL1;
                   TOTAL1LAST = virtual_total1 - TOTAL1;
                   $('#totalScore').val(TOTAL1LAST.toFixed(2));
                    if(TOTAL1LAST >= 0){
                                $("#gotoPurch").prop("type", "submit");
                            }else{
                                $("#gotoPurch").prop("type", "hidden");
                            }
                 }
            });

            } );



              function saveReport() {


                // jquery 表单提交
                $("#saveReportForm").ajaxSubmit(function(message) { 
                // 对于表单提交成功后处理，message为提交页面saveReport.htm的返回内容 
                });


                return false; // 必须返回false，否则表单会自己再做一次提交操作，并且页面跳转 
                }



    </script>

    <!-- select input 值获取 -->
    <script>
    function onChangeSelect(){
    //<#list reorderList! as order2>
            document.getElementById("classID_${(order2.sku!)?replace('-','_')}").value=document.getElementById("selectKK_${(order2.sku!)?replace('-','_')}").value;
    //</#list>
            }
    </script>
    <script type="text/javascript">
    function delete()
    {
           var check=false;
           if (confirm("Are you sure you want to delete?")) {  
                return true; 
            }  
            else {  
                check=false;
            }  
            return check;
    }
    </script>

</body>

</html>
