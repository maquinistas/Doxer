
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
            console.log(data);
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
    $(".pagination").append("<li class='page-item active'><a class='btn btn-info btn-rounded btn-sm' href='javascript:void(0)' data=1>" + 1 + "</a>&nbsp;</li>");
}

if(endofpage >= 2){
    // For Check Current Index
    var currentindex = $('.pagination li.active').index();

    // Show Num of Pages Button on Front end
    for (var i = 2 ;i <= endofpage; i++){
        $(".pagination").append("<li class='page-item'><a class='btn btn-primary btn-rounded btn-sm' href='javascript:void(0)' data="+ i +">" + i + "</a>&nbsp;</li>");
    }

    // Show Next Button on Front end

    $(".pagination").append("<li id='next-page'>&nbsp;<a class='btn btn-primary btn-rounded' href='javascript:void(0)' data=''>" + 'Next' + "</a></li>");
}

// Get Page By Num
$('.pagination li.page-item').on('click',function(){
    var da = $('ul#credit').find('li.active').index();
    console.log('This Is Last Num',da)
    var data = $(this).attr('data');
    if ($(this).hasClass('active')){
        return false;
    } else {
        var currentpage = $(this).index();
        var page_no = currentpage;

        $('.pagination li').removeClass('active');
        $(this).addClass('active');
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
            success: function (response) {
                if ($(this).hasClass('active')){
                    return false;
                } else {
                    $('#tests-table').html('')
                    {% comment %} $("#nuun").html('')
                    $("#nuun").append("<p class='page-link'>" + currentpage + '&#160' + 'Out Of'+ ' ' + endofpage +"</p>") {% endcomment %}
                    
                    $.each(response.results, function(i, val) {
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

                        $('#tests-table').append("<tr><td> # " + val.id  + "</td><td>" + "<img src=" +val.pro_image + " alt='+ val.pro_image +' />" + "</td><td>" + val.username + "</td><td>"+ val.email +"</td><td>"+ val.contact_no +"</td><td>" + val.gender + "</td><td>"+ val.city + "</td><th id='pr"+val.id+"'>₹ "+ val.fare_per_km + "</th><td id='"+val.id+"'>"+ status + "</td><td>" + buttons + '</td></tr>')
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
    return false;
    }else{
        var currentpage = $('.pagination li.active').index();
        var nextpage = currentpage + 1;
        $.ajax({
            type: "POST",
            // define url name
            url: "{% url 'doxer_admin:alldrivers' %}", 
            data : {    
                page_no : nextpage, 
                csrfmiddlewaretoken: '{{ csrf_token }}',
            },
            // handle a successful response
            success: function (response) {
                if ($(this).hasClass('active')){
                    return false;
                } else {
                    $('.pagination li').removeClass('active');
                    $('#tests-table').html('')
                    {% comment %} $("#nuun").html('')
                    $("#nuun").append("<p class='page-link'>" + currentpage + '&#160' + 'Out Of'+ ' ' + endofpage +"</p>") {% endcomment %}
                    
                    $.each(response.results, function(i, val) {
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

                        $('#tests-table').append("<tr><td> # " + val.id  + "</td><td>" + "<img src=" +val.pro_image + " alt='+ val.pro_image +' />" + "</td><td>" + val.username + "</td><td>"+ val.email +"</td><td>"+ val.contact_no +"</td><td>" + val.gender + "</td><td>"+ val.city + "</td><th id='pr"+val.id+"'>₹ "+ val.fare_per_km + "</th><td id='"+val.id+"'>"+ status + "</td><td>" + buttons + '</td></tr>')
                        });
                    $(".pagination li.page-item:eq(" + (nextpage - 1 ) + ")").addClass('active');
                    $('.pagination a').removeClass('btn-info').addClass('btn-primary');
                    $('li.page-item.active a').removeClass('btn-primary').addClass('btn-info');
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
        return false;
    }else{
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
            success: function (response) {
                if ($(this).hasClass('active')){
                    return false;
                } else {
                    $('.pagination li').removeClass('active');
                    $('#tests-table').html('')
                    {% comment %} $("#nuun").html('')
                    $("#nuun").append("<p class='page-link'>" + currentpage + '&#160' + 'Out Of'+ ' ' + endofpage +"</p>") {% endcomment %}
                    
                    $.each(response.results, function(i, val) {
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
                        {% comment %} buttons = "<button class='btn btn-primary btn-rounded btn-sm edit-btn' data-target='#modelsget"+val.id+"' data-toggle='modal' class='identifyingClass' data-sid=" + val.id +"><i class='icon-note btn-icon-append'></i></button><div class='modal fade' id='modelsget"+val.id+"' tabindex='-1' role='dialog' aria-labelledby='my_modalLabel'><div class='modal-dialog' role='dialog'><div class='modal-content'><div class='modal-header'><h4 class='modal-title' id='myModalLabel'>"+ val.email_or_num +"</h4><button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div><form method='post'><div class='modal-body'><div class='input-group'><div class='input-group-prepend'><span class='input-group-text bg-primary text-white'>₹</span></div><input type='text' class='form-control' aria-label='Amount (to the nearest dollar)' value="+val.fare_per_km+"><div class='input-group-append'><span class='input-group-text'>.00</span></div></div></div><div class='modal-footer'><button type='reset' class='btn btn-default' >Reset</button><button type='button' value='Save' class='btn btn-primary saveprice' data-sid="+ val.id +">Update</button></div></form></div></div></div>"; {% endcomment %}

                        $('#tests-table').append("<tr><td> # " + val.id  + "</td><td>" + "<img src=" +val.pro_image + " alt='+ val.pro_image +' />" + "</td><td>" + val.username + "</td><td>"+ val.email +"</td><td>"+ val.contact_no +"</td><td>" + val.gender + "</td><td>"+ val.city + "</td><th id='pr"+val.id+"'>₹ "+ val.fare_per_km + "</th><td id='"+val.id+"'>"+ status + "</td><td>" + buttons + '</td></tr>')
                        });
                    $(".pagination li.page-item:eq(" + (nextpage - 1 ) + ")").addClass('active');
                    $('.pagination a').removeClass('btn-info').addClass('btn-primary');
                    $('li.page-item.active a').removeClass('btn-primary').addClass('btn-info');
                    };
                },
            error: function () {
                return false;
            }
        }); 
    }
});

