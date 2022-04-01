
// Show First Page Num of Button on Front end
var endofpage = '{{pages}}';
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
$('.pagination li.page-item').on('click',function(){
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
            url: "{% url 'doxer_admin:allrides' %}", 
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
                        
                        $('#tests-table').append("<tr><td> # " + val.id  + "</td><td>" + val.trip_date + "<br><br>"+val.ride_time+"</td><td>" + val.getdr + "</td><td>"+ val.getpas +"</td><td>"+ val.vehicle +"<br><br>"+ val.vehicle_num +"<br><br>"+ val.vehicle_color +"</td><td>" + val.Location + "<br><br>" + val.destination + "</td><td><center>"+ val.status + "<br><br>"+ val.status2 +"</center></td><th> ₹ "+ val.fees + "</th><td><center><a class='btn btn-primary btn-rounded btn-sm' href='/doxer-admin/map-view/"+ val.linkd +"/'><i class='icon-direction btn-icon-append'></i></a></td></tr>")
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
        return false;
    }else{
        var currentpage = $('.pagination li.active').index();
        var nextpage = currentpage + 1;
        $.ajax({
            type: "POST",
            // define url name
            url: "{% url 'doxer_admin:allrides' %}", 
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
                        
                        if(val.trip_status == 'O' && val.pick_status == 'W'){
                            var status = "<label class='badge badge-info'>Driver Is Arrival</label>";
                        } else if(val.trip_status == 'O' && val.pick_status == 'P'){
                            var status = "<label class='badge badge-warning'>Driver On The Way</label>";
                        } else {
                            var status = '';
                        }

                        if(val.trip_status == 'P' && val.status == "P"){
                            var status1 = "<label class='badge badge-danger'>Waiting</label>";
                        } else if(val.pick_status == 'P'){
                            var status1 = "<label class='badge badge-warning'>Picked Passenger</label>";
                        } else if(val.pick_status == 'D' && val.trip_status == 'O'){
                            var status1 = "<label class='badge badge-info'>Droped Passenger</label>";
                        } else if(val.status == 'E' && val.trip_status == 'E'){
                            var status1 = "<label class='badge badge-success'>End Trip</label>";
                        } else {
                            var status1 = '';
                        }
                        
                        if(val.status == 'P' && val.trip_status == 'O'){
                            var status3 = "<label class='badge badge-info'>Waiting</label>";
                        } else if(val.status == 'O'){
                            var status3 = "<label class='badge badge-warning'>On The Way</label>";
                        } else if(val.status=='E' && val.pick_status=='P'){
                            var status3 = "<label class='badge badge-info'>Passenger End Trip</label>"; 
                        } else {
                            var status3 = '';
                        }

                        $('#tests-table').append("<tr><td> # " + val.id  + "</td><td>" + val.trip_date + "<br><br>"+val.ride_time+"</td><td>" + val.getdr + "</td><td>"+ val.getpas +"</td><td>"+ val.vehicle +"<br><br>"+ val.vehicle_num +"<br><br>"+ val.vehicle_color +"</td><td>" + val.Location + "<br><br>" + val.destination + "</td><td><center>"+ val.status + "<br><br>"+ val.status2 +"</center></td><th> ₹ "+ val.fees + "</th><td><center><a class='btn btn-primary btn-rounded btn-sm' href='/doxer-admin/map-view/"+ val.linkd +"/'><i class='icon-direction btn-icon-append'></i></a></td></tr>")
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
        return false;
    }else{
        var currentpage = $('.pagination li.active').index();
        var nextpage = currentpage - 1;
        $.ajax({
            type: "POST",
            // define url name
            url: "{% url 'doxer_admin:allrides' %}", 
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
                        
                        if(val.trip_status == 'O' && val.pick_status == 'W'){
                            var status = "<label class='badge badge-info'>Driver Is Arrival</label>";
                        } else if(val.trip_status == 'O' && val.pick_status == 'P'){
                            var status = "<label class='badge badge-warning'>Driver On The Way</label>";
                        } else {
                            var status = '';
                        }

                        if(val.trip_status == 'P' && val.status == "P"){
                            var status1 = "<label class='badge badge-danger'>Waiting</label>";
                        } else if(val.pick_status == 'P'){
                            var status1 = "<label class='badge badge-warning'>Picked Passenger</label>";
                        } else if(val.pick_status == 'D' && val.trip_status == 'O'){
                            var status1 = "<label class='badge badge-info'>Droped Passenger</label>";
                        } else if(val.status == 'E' && val.trip_status == 'E'){
                            var status1 = "<label class='badge badge-success'>End Trip</label>";
                        } else {
                            var status1 = '';
                        }
                        
                        if(val.status == 'P' && val.trip_status == 'O'){
                            var status3 = "<label class='badge badge-info'>Waiting</label>";
                        } else if(val.status == 'O'){
                            var status3 = "<label class='badge badge-warning'>On The Way</label>";
                        } else if(val.status=='E' && val.pick_status=='P'){
                            var status3 = "<label class='badge badge-info'>Passenger End Trip</label>"; 
                        } else {
                            var status3 = '';
                        }

                        $('#tests-table').append("<tr><td> # " + val.id  + "</td><td>" + val.trip_date + "<br><br>"+val.ride_time+"</td><td>" + val.getdr + "</td><td>"+ val.getpas +"</td><td>"+ val.vehicle +"<br><br>"+ val.vehicle_num +"<br><br>"+ val.vehicle_color +"</td><td>" + val.Location + "<br><br>" + val.destination + "</td><td><center>"+ val.status + "<br><br>"+ val.status2 +"</center></td><th> ₹ "+ val.fees + "</th><td><center><a class='btn btn-primary btn-rounded btn-sm' href='/doxer-admin/map-view/"+ val.linkd +"/'><i class='icon-direction btn-icon-append'></i></a></td></tr>")
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





$('.pagination ').hide();

$(document).ready(function(){
    var page_no = 1;
    console.log(page_no,"page_no")
    $.ajax({
        type: "POST",
        url: "{% url 'doxer_admin:allrides' %}", 
        data : {'page_no' : page_no, csrfmiddlewaretoken: '{{ csrf_token }}'},
        // handle a successful response
        success: function (response) {
            if ($(this).hasClass('active')){
                return false;
            } else {
                $('#tests-table').html('');
                $('.pagination ').fadeIn();
                $.each(response.results, function(i, val) {
                    //append to post
                    for(var j=1 ; j <= i ; j++){j};
                    $('#tests-table').append("<tr><td> # " + val.id  + "</td><td>" + val.trip_date + "<br><br>"+val.ride_time+"</td><td>" + val.getdr + "</td><td>"+ val.getpas +"</td><td>"+ val.vehicle +"<br><br>"+ val.vehicle_num +"<br><br>"+ val.vehicle_color +"</td><td>" + val.Location + "<br><br>" + val.destination + "</td><td><center>"+ val.status + "<br><br>"+ val.status2 +"</center></td><th> ₹ "+ val.fees + "</th><td><center><a class='btn btn-primary btn-rounded btn-sm' href='/doxer-admin/map-view/"+ val.linkd +"/'><i class='icon-direction btn-icon-append'></i></a></td></tr>")
                    });
                };
            },
            error: function () {
                alert('Page Not Founded');
            }
    }); 
});