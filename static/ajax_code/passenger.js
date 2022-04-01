// Blocke And Unblock Passenger

$('tbody').on('click','.check-block',function(){
    var id = $(this).attr('data-sid');
    console.log('id :-',id)
    mydata = {pid:id, 'csrfmiddlewaretoken': '{{ csrf_token }}'}
    mythis = this;
    console.log(mythis)
    $.ajax({
        url : "{% url 'doxer_admin:blockpas' %}",
        method : "POST",
        data : mydata,
        success : function(data){
            console.log(data);
            if (data.status==1){
                $('#'+id).html('');
                $('#'+id).append("<input type='checkbox' class='check-block' data-sid='"+ id +"' checked>&nbsp;<label class='badge badge-warning'>Blocked</label>");
            }
            if (data.status==2){
                console.log('id :-',id)
                $('#'+id).html('');
                $('#'+id).append("<input type='checkbox' class='check-block' data-sid='" +id+ "'>&nbsp;<label class='badge badge-success'>Active</label>"); 
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
    $(".pagination").append("<li><button class='btn btn-primary btn-rounded' id='prev-page' href='javascript:void(0)' disabled>Previous</button>&nbsp;</li><li class='page-item active'><a class='btn btn-info btn-rounded btn-sm' href='javascript:void(0)' data=1>" + 1 + "</a>&nbsp;</li>");
}

if(endofpage >= 2){
    // For Check Current Index
    var currentindex = $('.pagination li.active').index();
    
    // Show Num of Pages Button on Front end
    {% comment %} var j=0;
    var lastpg = endofpage - 2; {% endcomment %}
    for (var i = 2 ;i <= endofpage; i++){
        $(".pagination").append("<li class='page-item'><a class='btn btn-primary btn-rounded btn-sm' href='javascript:void(0)' data="+ i +">" + i + "</a>&nbsp;</li>");
        {% comment %} j++;
        if(j < 2){
        }
        if(j >= lastpg) {
            $(".pagination").append("<li class='page-item'><a class='btn btn-primary btn-rounded btn-sm' href='javascript:void(0)' data="+ i +">" + i + "</a>&nbsp;</li>");
        } {% endcomment %}
        
    }
    
    // Show Next Button on Front end
    $(".pagination").append("<li>&nbsp;<button class='btn btn-primary btn-rounded' id='next-page' href='javascript:void(0)' data=''>" + 'Next' + "</button></li>");
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
                            var status = "<input type='checkbox' class='check-block' data-sid='" +val.id+ "'>&nbsp;<label class='badge badge-success'>Active</label>";
                        } else if(val.status == 'Deactive'){
                            var status = "<input type='checkbox' class='check-block' data-sid='" +val.id+ "' checked>&nbsp;<label class='badge badge-warning'>Blocked</label>";
                        } else {
                            var status = '';
                        }
                        $('#tests-table').append("<tr><td> # " + val.id  + "</td><td><img src=" +val.pro_image + " alt='+ val.pro_image +' /></td><td>" + val.username + "</td><td>"+ val.email +"</td><td>"+ val.contact_no +"</td><td>" + val.gender + "</td><td id='"+val.id+"'>"+ status + "</td></tr>")
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
                            var status = "<input type='checkbox' class='check-block' data-sid='" +val.id+ "'>&nbsp;<label class='badge badge-success'>Active</label>";
                        } else if(val.status == 'Deactive'){
                            var status = "<input type='checkbox' class='check-block' data-sid='" +val.id+ "' checked>&nbsp;<label class='badge badge-warning'>Blocked</label>";
                        } else {
                            var status = '';
                        }
                        $('#tests-table').append("<tr><td> # " + val.id  + "</td><td>" + "<img src=" +val.pro_image + " alt='+ val.pro_image +' />" + "</td><td>" + val.username + "</td><td>"+ val.email +"</td><td>"+ val.contact_no +"</td><td>" + val.gender + "</td><td id='"+val.id+"'>"+ status + "</td></tr>")
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
                            var status = "<input type='checkbox' class='check-block' data-sid='" +val.id+ "'>&nbsp;<label class='badge badge-success'>Active</label>";
                        } else if(val.status == 'Deactive'){
                            var status = "<input type='checkbox' class='check-block' data-sid='" +val.id+ "' checked>&nbsp;<label class='badge badge-warning'>Blocked</label>";
                        } else {
                            var status = '';
                        }
                        $('#tests-table').append("<tr><td> # " + val.id  + "</td><td>" + "<img src=" +val.pro_image + " alt='+ val.pro_image +' />" + "</td><td>" + val.username + "</td><td>"+ val.email +"</td><td>"+ val.contact_no +"</td><td>" + val.gender + "</td><td id='"+val.id+"'>"+ status + "</td></tr>")
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