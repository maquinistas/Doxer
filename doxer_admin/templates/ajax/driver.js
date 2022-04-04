

$('tbody').on('click','.check-blocks',function(){
    var id = $(this).attr('data-sid');
    mydata = {pid:id, 'csrfmiddlewaretoken': '{{ csrf_token }}'}
    mythis = this;
    $.ajax({
        url : "{% url 'doxer_admin:blockdri' %}",
        method : "POST",
        data : mydata,
        success : function(data){
            if (data.status==1){
                $('#'+id).html('');
                // $('#errormsg').append("<div class='alert alert-danger' id='pass"+id+"'>"+ data.driver +"</div>")
                $('#'+id).append("<input type='checkbox' class='check-blocks' data-sid='"+ id +"' checked>&nbsp;<label class='badge badge-warning'>Blocked</label>");
                setTimeout(function(){
                    $("#errormsg div#pass"+id).remove();
                },1500);
            }
            if (data.status==2){
                $('#'+id).html('');
                // $('#errormsg').append("<div class='alert alert-success' id='pass"+id+"'>"+ data.driver +"</div>")
                $('#'+id).append("<input type='checkbox' class='check-blocks' data-sid='" +id+ "'>&nbsp;<label class='badge badge-success'>Active</label>"); 
                setTimeout(function(){
                    $("#errormsg div#pass"+id).remove();
                },1500);
            }
            if (data.status==0){
                // console.log("Unable To Delete User")
            }
        },
    });
});

$('tbody').on('click','.edit-btn',function(){
    let id = $(this).attr('data-sid');
    mydata = {pid:id, 'csrfmiddlewaretoken': '{{ csrf_token }}'}
    mythis = this;
    // console.log(mythis)
    $.ajax({
        url : "{% url 'doxer_admin:editprices' %}",
        method : "POST",
        data : mydata,
        dataType : "json",
        success : function(data){
            if (data.status==0){
                console.log('status 0')
                setTimeout(function() {
                    $('#modelsget').modal('hide');
                }, 800);
            } else {
                // console.log(data);
                $('#myModalLabel').text(data.email);
                $("#price").val(data.fees);
                $("#saveprice").attr('data-sid',data.id);
            }
        },
    });
});

// Update Page Fare Per Km
$(".saveprice").on('click',function(){
    var id = $(this).attr('data-sid');
    let price = $('#price').val();
    $(".saveprice").text("Please Wait...."); 
    $('.saveprice').attr('disabled', 'disabled');
    mydata = {'pid':id, 'csrfmiddlewaretoken': '{{ csrf_token }}','price' : price}
        $.ajax({
        url : "{% url 'doxer_admin:updatepriceb' %}",
        method : "POST",
        data : mydata,
        success : function(data){
            if (data.status==1){
                setTimeout(function() {
                    $('#modelsget').modal('hide');
                }, 1000);
                setTimeout(function() {
                    $('.saveprice').removeAttr('disabled');
                    $(".saveprice").text("Update");
                    $('#pr'+id).html('');
                    $('#pr'+id).append("₹ "+price +"")
                }, 2000);
            }
            if (data.status==2){
                $('label#name_label').removeAttr('hidden');
                $('.saveprice').removeAttr('disabled');
                $(".saveprice").text("Update");
    
            }
            if (data.status==0){
                console.log("Unable To Update Price")
            }
        },
    });
});

// Show First Page Num of Button on Front end
var endofpage = '{{pages}}';
console.log(endofpage)
if (endofpage > 1){
    $(".pagination").append("<li><button class='btn btn-primary btn-sm btn-rounded' id='prev-page' disabled>Previous</button>&nbsp;</li><li class='page-item active' hidden><a class='btn btn-info btn-rounded btn-sm' href='javascript:void(0)' data=1>" + 1 + "</a>&nbsp;</li>");
}

if(endofpage >= 2){
    // For Check Current Index
    var currentindex = $('.pagination li.active').index();

    // Show Num of Pages Button on Front end
    for (var i = 2 ;i <= endofpage; i++){
        // if(i <=3){
            $(".pagination").append("<li class='page-item' hidden><a class='btn btn-primary btn-rounded btn-sm' id='pagnum' href='javascript:void(0)'data="+ i +">" + i + "</a>&nbsp;</li>");
        // }
        // if(i >=3){
        //     $(".pagination").append("<li><button class='btn btn btn-rounded btn-sm'> .... </button>&nbsp;</li>");
        //     break;
        // }
    }
    // Show Next Button on Front ends
    // $(".pagination").append("<li class='page-item' data="+ endofpage +"><a class='btn btn-primary btn-rounded btn-sm' href='javascript:void(0)'>" + endofpage + "</a>&nbsp;</li>");
    $(".pagination").append("<li>&nbsp;<button id='next-page' class='btn btn-sm btn-primary btn-rounded'>" + 'Next' + "</button></li>");
}


// Get Page By Num
$('.pagination li.page-item').on('click',function(){
    var da = $('ul#credit').find('li.active a').attr('data');
    if ($(this).hasClass('active')){
        return false;
    } else {
        let currentpage = $(this).index();
        var page_no = currentpage;
        //var afterpage = 1 + parseInt(page_no);
        //var beforepage = currentpage - 1;
        // $('.pagination').html("");
        $('.pagination li').removeClass('active');
        $(this).addClass('active');
        //pagin(currentpage,afterpage,beforepage);
        $('.pagination a').removeClass('btn-info').addClass('btn-primary');
        $('li.page-item.active a').removeClass('btn-primary').addClass('btn-info');
        $.ajax({
            type: "POST",
            // define url name
            url: "{% url 'doxer_admin:alldrivers' %}", 
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
                    // $('#credit').attr('current',page_no);
                    // $('.pagination').html('')
                    // paginations();
                    // $("#nuun").html('')
                    // $("#nuun").append("<p class='page-link'>" + currentpage + '&#160' + 'Out Of'+ ' ' + endofpage +"</p>")
                    
                    $.each(data.results, function(i, val) {
                        //append to post
                        for(var j=1 ; j <= i ; j++){j};
                        
                        if(val.status == 'Active'){
                            var status = "<input type='checkbox' class='check-blocks' data-sid='" +val.id+ "'>&nbsp;<label class='badge badge-success'>Active</label>";
                        } else if(val.status == 'Deactive'){
                            var status = "<input type='checkbox' class='check-blocks' data-sid='" +val.id+ "' checked>&nbsp;<label class='badge badge-warning'>Blocked</label>";
                        } else {
                            var status = '';
                        }

                        buttons = "<button class='btn btn-primary btn-rounded btn-sm edit-btn' data-target='#modelsget' data-toggle='modal' class='identifyingClass' data-sid=" + val.id +"><i class='icon-note btn-icon-append'></i></button>";

                        $('#tests-table').append("<tr><td> # " + val.id  + "</td><td>" + "<img src=" +val.pro_image + " alt='ProfileImage'/><span class='pl-2'>" + val.username + "</span></td><td>"+ val.email +"</td><td>"+ val.contact_no +"</td><td>" + val.gender + "</td><td>"+ val.city + "</td><th id='pr"+val.id+"'>₹ "+ val.fare_per_km + "</th><td id='"+val.id+"'>"+ status + "</td><td>"+ val.id_proofe +"</td><td>" + buttons + '</td></tr>')
                        });
                    };
                },
                error: function () {
                    alert('Page Not Founded');
                }
        }); 
    }
});

// Get Next Page
$("#next-page").on('click',function(){
    var currentpage = $('.pagination li.active').index();
    if (currentpage == endofpage){
        $("#next-page").attr('disabled','True');
    }else{
        $("#next-page").removeAttr('disabled');
        $("#prev-page").removeAttr('disabled');
        var currentpage = $('.pagination li.active').index();
        var nextpage = currentpage + 1;
        console.log(nextpage);
        $.ajax({
            type: "POST",
            // define url name
            url: "{% url 'doxer_admin:alldrivers' %}", 
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
                        if(val.gender == 'M'){
                            var gender = 'Male';
                        } else if(val.gender == 'F'){
                            var gender = 'Female';
                        } else if(val.gender == 'O'){
                            var gender = 'Other';
                        } else {
                            var gender = '';
                        }

                        buttons = "<button class='btn btn-primary btn-rounded btn-sm edit-btn' data-target='#modelsget' data-toggle='modal' class='identifyingClass' data-sid=" + val.id +"><i class='icon-note btn-icon-append'></i></button>";

                        if(val.status == 'Active'){
                            var status = "<input type='checkbox' class='check-blocks' data-sid='" +val.id+ "'>&nbsp;<label class='badge badge-success'>Active</label>";
                        } else if(val.status == 'Deactive'){
                            var status = "<input type='checkbox' class='check-blocks' data-sid='" +val.id+ "' checked>&nbsp;<label class='badge badge-warning'>Blocked</label>";
                        } else {
                            var status = '';
                        }

                        $('#tests-table').append("<tr><td> # " + val.id  + "</td><td>" + "<img src=" +val.pro_image + " alt='ProfileImage'/><span class='pl-2'>" + val.username + "</span></td><td>"+ val.email +"</td><td>"+ val.contact_no +"</td><td>" + val.gender + "</td><td>"+ val.city + "</td><th id='pr"+val.id+"'>₹ "+ val.fare_per_km + "</th><td id='"+val.id+"'>"+ status + "</td><td>"+ val.id_proofe +"</td><td>" + buttons + '</td></tr>')
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

// Get Prev Page
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
            url: "{% url 'doxer_admin:alldrivers' %}", 
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
                    $('#tests-table').html('')
                    // $("#nuun").html('')
                    // $("#nuun").append("<p class='page-link'>" + currentpage + '&#160' + 'Out Of'+ ' ' + endofpage +"</p>")
                    $("#et1").text(data.a);
                    $("#et2").text(data.b);
                    $("#totale").text(data.t);
                    $.each(data.results, function(i, val) {
                        //append to post
                        for(var j=1 ; j <= i ; j++){j};

                        if(val.status == 'Active'){
                            var status = "<input type='checkbox' class='check-blocks' data-sid='" +val.id+ "'>&nbsp;<label class='badge badge-success'>Active</label>";
                        } else if(val.status == 'Deactive'){
                            var status = "<input type='checkbox' class='check-blocks' data-sid='" +val.id+ "' checked>&nbsp;<label class='badge badge-warning'>Blocked</label>";
                        } else {
                            var status = '';
                        }

                        buttons = "<button class='btn btn-primary btn-rounded btn-sm edit-btn' data-target='#modelsget' data-toggle='modal' class='identifyingClass' data-sid=" + val.id +"><i class='icon-note btn-icon-append'></i></button>";

                        $('#tests-table').append("<tr><td> # " + val.id  + "</td><td>" + "<img src=" +val.pro_image + " alt='ProfileImage'/><span class='pl-2'>" + val.username + "</span></td><td>"+ val.email +"</td><td>"+ val.contact_no +"</td><td>" + val.gender + "</td><td>"+ val.city + "</td><th id='pr"+val.id+"'>₹ "+ val.fare_per_km + "</th><td id='"+val.id+"'>"+ status + "</td><td>"+ val.id_proofe +"</td><td>" + buttons + '</td></tr>')
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
        url: "{% url 'doxer_admin:alldrivers' %}", 
        data : {'page_no' : page_no, csrfmiddlewaretoken: '{{ csrf_token }}'},
        // handle a successful response
        success: function (data) {
            if ($(this).hasClass('active')){
                return false;
            } else {
                if (data.results == ''){
                    $('#tests-table').append("<tr><th colspan=10><center>No Records</center></th></tr>");
                } else {
                    $("#et1").text(data.a);
                    $("#et2").text(data.b);
                    $("#totale").text(data.t);
                    $('#tests-table').html('');
                    $.each(data.results, function(i, val) {
                        //append to post
                        for(var j=1 ; j <= i ; j++){j};

                        if(val.status == 'Active'){
                            var status = "<input type='checkbox' class='check-blocks' data-sid='" +val.id+ "'>&nbsp;<label class='badge badge-success'>Active</label>";
                        } else if(val.status == 'Deactive'){
                            var status = "<input type='checkbox' class='check-blocks' data-sid='" +val.id+ "' checked>&nbsp;<label class='badge badge-warning'>Blocked</label>";
                        } else {
                            var status = '';
                        }

                        buttons = "<button class='btn btn-primary btn-rounded btn-sm edit-btn' data-target='#modelsget' data-toggle='modal' class='identifyingClass' data-sid=" + val.id +"><i class='icon-note btn-icon-append'></i></button>";

                        $('#tests-table').append("<tr><td> # " + val.id  + "</td><td>" + "<img src=" +val.pro_image + " alt='ProfileImage'/><span class='pl-2'>" + val.username + "</span></td><td>"+ val.email +"</td><td>"+ val.contact_no +"</td><td>" + val.gender + "</td><td>"+ val.city + "</td><th id='pr"+val.id+"'>₹ "+ val.fare_per_km + "</th><td id='"+val.id+"'>"+ status + "</td><td>"+ val.id_proofe +"</td><td>" + buttons + '</td></tr>')
                        });
                    }
                };
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
        url: "{% url 'doxer_admin:showid' pk='1' %}", 
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