// Blocke And Unblock Passenger

$('tbody').on('click','.check-block',function(){
    var id = $(this).attr('data-sid');
    mydata = {pid:id, 'csrfmiddlewaretoken': '{{ csrf_token }}'}
    mythis = this;
    $.ajax({
        url : "{% url 'doxer_admin:blockpas' %}",
        method : "POST",
        data : mydata,
        success : function(data){
            if (data.status==1){
                $('#'+id).html('');
                $('#'+id).append("<div class='onoffswitch'><input type='checkbox' name='onoffswitch' data-sid='" +id+ "' class='check-block onoffswitch-checkbox' id='myonoffswitch"+id+"'><label class='onoffswitch-label' for='myonoffswitch"+id+"'><div class='onoffswitch-inner'></div><div class='onoffswitch-switch'></div></label></div>");
            }
            if (data.status==2){
                $('#'+id).html('');
                $('#'+id).append("<div class='onoffswitch'><input type='checkbox' name='onoffswitch' data-sid='" +id+ "' class='check-block onoffswitch-checkbox' id='myonoffswitch"+id+"' checked><label class='onoffswitch-label' for='myonoffswitch"+id+"'><div class='onoffswitch-inner'></div><div class='onoffswitch-switch'></div></label></div>");
            }
            if (data.status==0){
                // console.log("Unable To Block")
            }
        },
    });
});


// Show First Page Num of Button on Front end
var endofpage = '{{pages}}';
if (endofpage > 1){
    $(".pagination").append("<li><button class='btn btn-sm btn-primary btn-rounded' id='prev-page' href='javascript:void(0)' disabled>Previous</button>&nbsp;</li><li class='page-item active' hidden><a class='btn btn-info btn-rounded btn-sm' href='javascript:void(0)' data=1>" + 1 + "</a>&nbsp;</li>");
}

if(endofpage >= 2){
    // For Check Current Index
    var currentindex = $('.pagination li.active').index();
    
    // Show Num of Pages Button on Front end
    for (var i = 2 ;i <= endofpage; i++){
        $(".pagination").append("<li class='page-item' hidden><a class='btn btn-primary btn-rounded btn-sm' href='javascript:void(0)' data="+ i +">" + i + "</a>&nbsp;</li>");
    }
    
    // Show Next Button on Front end
    $(".pagination").append("<li>&nbsp;<button class='btn-sm btn btn-primary btn-rounded' id='next-page' href='javascript:void(0)' data=''>" + 'Next' + "</button></li>");
}

$('.pagination li.page-item').on('click',function(){
    var data = $(this).attr('data');
    if ($(this).hasClass('active')){
        return false;
    } else {
        var currentpage = $(this).index();
        var page_no = currentpage;
        if (page_no == '1'){
            $("#prev-page").attr('disabled','True');
        } else {
            $("#prev-page").removeAttr('disabled');
        }
        if (currentpage == endofpage){
            $("#next-page").attr('disabled','True');
        }else{
            $("#next-page").removeAttr('disabled');
        }
        $('.pagination li').removeClass('active');
        $(this).addClass('active');
        $('.pagination a').removeClass('btn-info').addClass('btn-primary');
        $('li.page-item.active a').removeClass('btn-primary').addClass('btn-info');
        $.ajax({
            type: "POST",
            // define url name
            url: "{% url 'doxer_admin:allpassenger' %}", 
            data : {    
                page_no : page_no, 
                csrfmiddlewaretoken: '{{ csrf_token }}',
            },
            // handle a successful response
            success: function (data) {
                if ($(this).hasClass('active')){
                    return false;
                } else {
                    $('#tests-table').html('');
                    $("#et1").text(data.a);
                    $("#et2").text(data.b);
                    $("#totale").text(data.t);
                    $.each(data.results, function(i, val) {
                        //append to post
                        for(var j=1 ; j <= i ; j++){j};

                        if(val.status == 'Active'){
                            //var status = "<input type='checkbox' class='check-blocks' data-sid='" +val.id+ "'>&nbsp;<label class='badge badge-success'>Active</label>";
                            var status = "<div class='onoffswitch'><input type='checkbox' name='onoffswitch' data-sid='" +val.id+ "' class='check-block onoffswitch-checkbox' id='myonoffswitch"+val.id+"' checked><label class='onoffswitch-label' for='myonoffswitch"+val.id+"'><div class='onoffswitch-inner'></div><div class='onoffswitch-switch'></div></label></div>";
                        } else if(val.status == 'Deactive'){
                            var status = "<div class='onoffswitch'><input type='checkbox' name='onoffswitch' data-sid='" +val.id+ "' class='check-block onoffswitch-checkbox' id='myonoffswitch"+val.id+"'><label class='onoffswitch-label' for='myonoffswitch"+val.id+"'><div class='onoffswitch-inner'></div><div class='onoffswitch-switch'></div></label></div>";
                        } else {
                            var status = '';
                        }
                        $('#tests-table').append("<tr><td> # " + val.id  + "</td><td>" + "<img src=" +val.pro_image + " alt='profile' /><span class='pl-2'>" + val.username + "</span></td><td>"+ val.email +"</td><td>"+ val.contact_no +"</td><td>" + val.gender + "</td><td id='"+val.id+"'>"+ status + "</td><td>" +val.id_proofe+ "</td></tr>")
                    });
                    };
                },
                error: function () {
                    alert('Page Not Founded');
                }
            }); 
        }
});

$("#next-page").on('click',function(){
    var currentpage = $('.pagination li.active').index();
    if (currentpage == endofpage){
        $("#next-page").attr('disabled','True');
    }else{
        $("#next-page").removeAttr('disabled');
        $("#prev-page").removeAttr('disabled');
        var currentpage = $('.pagination li.active').index();
        var nextpage = currentpage + 1;
        $.ajax({
            type: "POST",
            // define url name
            url: "{% url 'doxer_admin:allpassenger' %}", 
            data : {    
                page_no : nextpage, 
                csrfmiddlewaretoken: '{{ csrf_token }}',
            },
            // handle a successful response
            success: function (data) {
                if ($(this).hasClass('active')){
                    return false;
                } else {
                    $('.pagination li').removeClass('active');
                    $('#tests-table').html('');
                    $("#et1").text(data.a);
                    $("#et2").text(data.b);
                    $("#totale").text(data.t);
                    $.each(data.results, function(i, val) {
                        //append to post
                        for(var j=1 ; j <= i ; j++){j};
                        if(val.status == 'Active'){
                            //var status = "<input type='checkbox' class='check-blocks' data-sid='" +val.id+ "'>&nbsp;<label class='badge badge-success'>Active</label>";
                            var status = "<div class='onoffswitch'><input type='checkbox' name='onoffswitch' data-sid='" +val.id+ "' class='check-block onoffswitch-checkbox' id='myonoffswitch"+val.id+"' checked><label class='onoffswitch-label' for='myonoffswitch"+val.id+"'><div class='onoffswitch-inner'></div><div class='onoffswitch-switch'></div></label></div>";
                        } else if(val.status == 'Deactive'){
                            var status = "<div class='onoffswitch'><input type='checkbox' name='onoffswitch' data-sid='" +val.id+ "' class='check-block onoffswitch-checkbox' id='myonoffswitch"+val.id+"'><label class='onoffswitch-label' for='myonoffswitch"+val.id+"'><div class='onoffswitch-inner'></div><div class='onoffswitch-switch'></div></label></div>";
                        } else {
                            var status = '';
                        }
                        $('#tests-table').append("<tr><td> # " + val.id  + "</td><td>" + "<img src=" +val.pro_image + " alt='profile' /><span class='pl-2'>" + val.username + "</span></td><td>"+ val.email +"</td><td>"+ val.contact_no +"</td><td>" + val.gender + "</td><td id='"+val.id+"'>"+ status + "</td><td>" +val.id_proofe+ "</td></tr>")
                    });
                    $(".pagination li.page-item:eq(" + (nextpage - 1 ) + ")").addClass('active');
                    $('.pagination a').removeClass('btn-info').addClass('btn-primary');
                    $('li.page-item.active a').removeClass('btn-primary').addClass('btn-info');
                    if ($('.pagination li.active').index() == endofpage){
                        $("#next-page").attr('disabled','True');
                    }
                };
            },
            error: function () {
                return false;
            }
        }); 
    }
});

$("#prev-page").on('click',function(){
    var currentpage = $('.pagination li.active').index();
    if (currentpage === 1){
        $("#prev-page").attr('disabled','True');
    }else{
        $("#prev-page").removeAttr('disabled');
        $("#next-page").removeAttr('disabled');
        var currentpage = $('.pagination li.active').index();
        var nextpage = currentpage - 1;
        $.ajax({
            type: "POST",
            // define url name
            url: "{% url 'doxer_admin:allpassenger' %}", 
            data : {    
                page_no : nextpage, 
                csrfmiddlewaretoken: '{{ csrf_token }}',
            },
            // handle a successful response
            success: function (data) {
                if ($(this).hasClass('active')){
                    return false;
                } else {
                    $('.pagination li').removeClass('active');
                    $('#tests-table').html('');
                    $("#et1").text(data.a);
                    $("#et2").text(data.b);
                    $("#totale").text(data.t);
                    $.each(data.results, function(i, val) {
                        //append to post
                        for(var j=1 ; j <= i ; j++){j};
                        if(val.status == 'Active'){
                            //var status = "<input type='checkbox' class='check-blocks' data-sid='" +val.id+ "'>&nbsp;<label class='badge badge-success'>Active</label>";
                            var status = "<div class='onoffswitch'><input type='checkbox' name='onoffswitch' data-sid='" +val.id+ "' class='check-block onoffswitch-checkbox' id='myonoffswitch"+val.id+"' checked><label class='onoffswitch-label' for='myonoffswitch"+val.id+"'><div class='onoffswitch-inner'></div><div class='onoffswitch-switch'></div></label></div>";
                        } else if(val.status == 'Deactive'){
                            var status = "<div class='onoffswitch'><input type='checkbox' name='onoffswitch' data-sid='" +val.id+ "' class='check-block onoffswitch-checkbox' id='myonoffswitch"+val.id+"'><label class='onoffswitch-label' for='myonoffswitch"+val.id+"'><div class='onoffswitch-inner'></div><div class='onoffswitch-switch'></div></label></div>";
                        } else {
                            var status = '';
                        }
                        $('#tests-table').append("<tr><td> # " + val.id  + "</td><td>" + "<img src=" +val.pro_image + " alt='profile' /><span class='pl-2'>" + val.username + "</span></td><td>"+ val.email +"</td><td>"+ val.contact_no +"</td><td>" + val.gender + "</td><td id='"+val.id+"'>"+ status + "</td><td>" +val.id_proofe+ "</td></tr>")
                    });
                    $(".pagination li.page-item:eq(" + (nextpage - 1 ) + ")").addClass('active');
                    $('.pagination a').removeClass('btn-info').addClass('btn-primary');
                    $('li.page-item.active a').removeClass('btn-primary').addClass('btn-info');
                    if($('.pagination li.active').index() === 1){
                        $("#prev-page").attr('disabled','True');
                    }
                    };
                },
            error: function () {
                return false;
            }
        }); 
    }
});

$(document).ready(function(){
    var page_no = 1;
    $.ajax({
        type: "POST",
        url: "{% url 'doxer_admin:allpassenger' %}", 
        data : {'page_no' : page_no, csrfmiddlewaretoken: '{{ csrf_token }}'},
        // handle a successful response
        success: function (data) {
            $("#et1").text(data.a);
            $("#et2").text(data.b);
            $("#totale").text(data.t);
            if (data.results == ''){
                console.log('empty');
                $('#tests-table').append("<tr><th colspan=7><center>No Records</center></th></tr>");
            } else {
                $('#tests-table').html('');
                $('.pagination ').fadeIn();
                $.each(data.results, function(i, val) {
                    //append to post
                    for(var j=1 ; j <= i ; j++){j};
                    if(val.status == 'Active'){
                        //var status = "<input type='checkbox' class='check-blocks' data-sid='" +val.id+ "'>&nbsp;<label class='badge badge-success'>Active</label>";
                        var status = "<div class='onoffswitch'><input type='checkbox' name='onoffswitch' data-sid='" +val.id+ "' class='check-block onoffswitch-checkbox' id='myonoffswitch"+val.id+"' checked><label class='onoffswitch-label' for='myonoffswitch"+val.id+"'><div class='onoffswitch-inner'></div><div class='onoffswitch-switch'></div></label></div>";
                    } else if(val.status == 'Deactive'){
                        var status = "<div class='onoffswitch'><input type='checkbox' name='onoffswitch' data-sid='" +val.id+ "' class='check-block onoffswitch-checkbox' id='myonoffswitch"+val.id+"'><label class='onoffswitch-label' for='myonoffswitch"+val.id+"'><div class='onoffswitch-inner'></div><div class='onoffswitch-switch'></div></label></div>";
                    } else {
                        var status = '';
                    }
                    $('#tests-table').append("<tr><td> # " + val.id  + "</td><td>" + "<img src=" +val.pro_image + " alt='profile' /><span class='pl-2'>" + val.username + "</span></td><td>"+ val.email +"</td><td>"+ val.contact_no +"</td><td>" + val.gender + "</td><td id='"+val.id+"'>"+ status + "</td><td>" +val.id_proofe+ "</td></tr>")
                    });
                }
            },
            error: function () {
                alert('Page Not Founded');
            }
    }); 
});

$('tbody').on('click','.documentview',function(){
    var id = $(this).attr('data');
    $.ajax({
        type : "POST",
        url: "{% url 'doxer_admin:showid' pk='2' %}", 
        data : {'id' : id, csrfmiddlewaretoken: '{{ csrf_token }}'},
        success: function (data) {
            $('#IdProofe1').html('');
            $('#IdProofe2').html('');
            $('#IdProofename').text(data.name);
            $('#IdProofe1').append("<img src="+ data.id1 +" alt='IdProofe1'>");
            $('#IdProofe2').append("<img src="+ data.id2 +" alt='IdProofe2'>");
        },
        error: function () {
            alert('Page Not Founded');
        }
    });
});