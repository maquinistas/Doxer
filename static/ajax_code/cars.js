// Show First Page Num of Button on Front end
var endofpage = '{{pages}}';

if (endofpage > 1) {
    $(".pagination").append("<li><button class='btn btn-primary btn-rounded' id='prev-page' href='javascript:void(0)'>Previous</button>&nbsp;</li><li class='page-item active'><a class='btn btn-info btn-rounded btn-sm' href='javascript:void(0)' data=1>" + 1 + "</a>&nbsp;</li>");
}


if (endofpage >= 2) {
    // For Check Current Index
    var currentindex = $('.pagination li.active').index();

    // Show Num of Pages Button on Front end
    for (var i = 2; i <= endofpage; i++) {
        $(".pagination").append("<li class='page-item'><a class='btn btn-primary btn-rounded btn-sm' href='javascript:void(0)' data=" + i + ">" + i + "</a>&nbsp;</li>");
    }

    // Show Next Button on Front end

    $(".pagination").append("<li>&nbsp;<button id='next-page' class='btn btn-primary btn-rounded' href='javascript:void(0)' data=''>" + 'Next' + "</button></li>");
}

function paginations() {
    $(document).ready(function() {
        console.log('paginations called')
            // Show First Page Num of Button on Front end
        page_range = $("#tests-table").attr('data-sid');
        page_range = $("#tests-table").attr('page_no');
        var endofpage = page_range;


        if (endofpage > 1) {
            $(".pagination").append("<li><button class='btn btn-primary btn-rounded' id='prev-page' href='javascript:void(0)'>Previous</button>&nbsp;</li><li class='page-item'><a class='btn btn-primary btn-rounded btn-sm' href='javascript:void(0)' data=1>" + 1 + "</a>&nbsp;</li>");
        }


        if (endofpage >= 2) {
            // For Check Current Index
            var currentindex = $('.pagination li.active').index();

            // Show Num of Pages Button on Front end
            for (var i = 2; i <= endofpage; i++) {
                $(".pagination").append("<li class='page-item'><a class='btn btn-primary btn-rounded btn-sm' href='javascript:void(0)' data=" + i + ">" + i + "</a>&nbsp;</li>");
            }

            // Show Next Button on Front end

            $(".pagination").append("<li>&nbsp;<button class='btn btn-primary btn-rounded' id='next-page' href='javascript:void(0)' data=''>" + 'Next' + "</button></li>");
        }

    });
};

// AJAX FOR Car Accept : 
$(".accept-car").on('click', function() {
    var Page_num = $('.pagination li.page-item.active').index();
    var id = $(this).attr('data-sid');
    $("#accept_car").text("Please Wait....");
    $('#accept_car').attr('disabled', 'disabled');
    mydata = { pid: id, 'csrfmiddlewaretoken': '{{ csrf_token }}', 'page_no': Page_num }
    mythis = this;
    console.log(mydata);
    $.ajax({
        url: "{% url 'doxer_admin:caraccept' %}",
        method: "POST",
        data: mydata,
        success: function(data) {
            if (data.status == 1) {
                setTimeout(function() {
                    $('#Accept').modal('hide');
                    $('#accept_car').removeAttr('disabled');
                    $("#accept_car").text("Accept Car");
                }, 1000);
                setTimeout(function() {
                    var page_range = data.page_range;
                    $("#tests-table").attr('data-sid', +page_range);
                    $("#tests-table").attr('page_no', +Page_num);
                    var pass = data.results;
                    if (pass == "None") {
                        $("#" + id).fadeOut();
                    } else {
                        $('#tests-table').html('');
                        $.each(pass, function(i, val) {
                            //append to post
                            for (var j = 1; j <= i; j++) { j };
                            if (val.status == '0') {
                                var status = "<label class='badge badge-danger'>New</label>";
                            } else if (val.status == '1') {
                                var status = "<label class='badge badge-success'>Approval</label>";
                            } else if (val.status == '2') {
                                var status = "<label class='badge badge-warning'>Rejected</label>";
                            } else {
                                var status = '';
                            }
                            $('#tests-table').append("<tr id='" + val.id + "'><td class='123'> # " + val.id + "</td><td>" + "<img src=" + val.pro_image + " alt='" + val.driverid.pro_image + "' />" + "</td><td>" + val.driverid + "</td><td>" + val.reg_num + "</td><td>" + val.vehical_variant + "</td><td>" + val.vehicle_color + "</td><td>" + status + "</td><td>" +
                                "<button class='btn btn-success btn-rounded btn-sm Accept-ca' data-target='#Accept' data-toggle='modal' data-sid='" + val.id + "'> <i class='icon-check btn-icon-append'></i></button>  <button class='btn btn-danger btn-rounded  btn-sm Reject-ca' data-target='#Reject' data-toggle='modal' data-sid='" + val.id + "'><i class='icon-close btn-icon-append'></i></button>" +
                                '</td></tr>')
                        });
                    }
                    $(".pagination").html('');
                }, 2000);
                setTimeout(function() {
                    paginations();
                }, 2500)
            }
            if (data.status == 0) {
                setTimeout(function() {
                    $('#Accept').modal('hide');
                    $('#accept_car').removeAttr('disabled');
                    $("#accept_car").text("Accept Car");
                }, 1000);
            }
        },
    });
});

// AJAX FOR Car Reject : 
$(".reject-car").on('click', function() {
    var id = $(this).attr('data-sid');
    var Page_num = $('.pagination li.page-item.active').index();
    $("#reject_car").text("Please Wait....");
    $('#reject_car').attr('disabled', 'disabled');
    mydata = { pid: id, 'csrfmiddlewaretoken': '{{ csrf_token }}', 'page_no': Page_num }
    mythis = this;
    $.ajax({
        url: "{% url 'doxer_admin:carreject' %}",
        method: "POST",
        data: mydata,
        success: function(data) {
            if (data.status == 1) {
                setTimeout(function() {
                    $('#Reject').modal('hide');
                    $('#reject_car').removeAttr('disabled');
                    $("#reject_car").text("Reject Car");
                }, 1000);
                setTimeout(function() {
                    var page_range = data.page_range;
                    $("#tests-table").attr('data-sid', +page_range);
                    $("#tests-table").attr('page_no', +Page_num);
                    var pass = data.results;
                    if (per_page == pagess) {
                        $(".pagination").fadeOut();
                    }
                    if (pass == "None") {
                        $("#" + id).fadeOut();
                    } else {
                        $('#tests-table').html('');
                        $.each(pass, function(i, val) {
                            //append to post
                            for (var j = 1; j <= i; j++) { j };
                            if (val.status == '0') {
                                var status = "<label class='badge badge-danger'>New</label>";
                            } else if (val.status == '1') {
                                var status = "<label class='badge badge-success'>Approval</label>";
                            } else if (val.status == '2') {
                                var status = "<label class='badge badge-warning'>Rejected</label>";
                            } else {
                                var status = '';
                            }
                            $('#tests-table').append("<tr id='" + val.id + "'><td class='123'> # " + val.id + "</td><td>" + "<img src=" + val.pro_image + " alt='" + val.driverid.pro_image + "' />" + "</td><td>" + val.driverid + "</td><td>" + val.reg_num + "</td><td>" + val.vehical_variant + "</td><td>" + val.vehicle_color + "</td><td>" + status + "</td><td>" +
                                "<button class='btn btn-success btn-rounded btn-sm Accept-ca' data-target='#Accept' data-toggle='modal' data-sid='" + val.id + "'> <i class='icon-check btn-icon-append'></i></button>  <button class='btn btn-danger btn-rounded  btn-sm Reject-ca' data-target='#Reject' data-toggle='modal' data-sid='" + val.id + "'><i class='icon-close btn-icon-append'></i></button>" +
                                '</td></tr>')
                        });
                    }
                    $(".pagination").html('');
                }, 2000);
                setTimeout(function() {
                    paginations();
                }, 2500)
            }
            if (data.status == 0) {
                setTimeout(function() {
                    $('#Reject').modal('hide');
                    $('#reject_car').removeAttr('disabled');
                    $("#reject_car").text("Reject Car");
                }, 1000);
            }
        },
    });
});

$('tbody').on('click', '.Accept-ca', function() {
    let id = $(this).attr('data-sid');
    mydata = { pid: id, 'csrfmiddlewaretoken': '{{ csrf_token }}' }
    mythis = this;
    // console.log(mydata)
    $.ajax({
        url: "{% url 'doxer_admin:editcar' %}",
        method: "POST",
        data: mydata,
        dataType: "json",
        success: function(data) {
            $('#title_car').text(data.car);
            $("#accept_car").attr('data-sid', data.id);
        },
    });
});

$('tbody').on('click', '.Reject-ca', function() {
    let id = $(this).attr('data-sid');
    mydata = { pid: id, 'csrfmiddlewaretoken': '{{ csrf_token }}' }
    mythis = this;
    $.ajax({
        url: "{% url 'doxer_admin:editcar' %}",
        method: "POST",
        data: mydata,
        dataType: "json",
        success: function(data) {
            $('#title_car2').text(data.car);
            $("#reject_car").attr('data-sid', data.id);
        },
    });
});


$('.pagination li.page-item').on('click', function() {
    var data = $(this).attr('data');
    if ($(this).hasClass('active')) {
        return false;
    } else {
        var currentpage = $(this).index();
        var page_no = currentpage;
        console.log("page_no", page_no)
        $('.pagination li').removeClass('active');
        $(this).addClass('active');
        $('.pagination a').removeClass('btn-info').addClass('btn-primary');
        $('li.page-item.active a').removeClass('btn-primary').addClass('btn-info');
        $.ajax({
            type: "POST",
            // define url name
            url: "{% url 'doxer_admin:allcars' %}",
            data: {
                page_no: page_no,
                csrfmiddlewaretoken: '{{ csrf_token }}',
            },
            // handle a successful response
            success: function(response) {
                if ($(this).hasClass('active')) {
                    return false;
                } else {
                    $('#tests-table').html('')
                        // $("#nuun").html('')
                        // $("#nuun").append("<p class='page-link'>" + currentpage + '&#160' + 'Out Of' + ' ' + endofpage + "</p>")

                    $.each(response.results, function(i, val) {
                        //append to post
                        for (var j = 1; j <= i; j++) { j };
                        if (val.status == '0') {
                            var status = "<label class='badge badge-danger'>New</label>";
                        } else if (val.status == '1') {
                            var status = "<label class='badge badge-success'>Approval</label>";
                        } else if (val.status == '2') {
                            var status = "<label class='badge badge-warning'>Rejected</label>";
                        } else {
                            var status = '';
                        }
                        $('#tests-table').append("<tr id='" + val.id + "'><td class='123'> # " + val.id + "</td><td>" + "<img src=" + val.pro_image + " alt='" + val.driverid.pro_image + "' />" + "</td><td>" + val.driverid + "</td><td>" + val.reg_num + "</td><td>" + val.vehical_variant + "</td><td>" + val.vehicle_color + "</td><td>" + status + "</td><td>" +
                            "<button class='btn btn-success btn-rounded btn-sm Accept-ca' data-target='#Accept' data-toggle='modal' data-sid='" + val.id + "'> <i class='icon-check btn-icon-append'></i></button>  <button class='btn btn-danger btn-rounded  btn-sm Reject-ca' data-target='#Reject' data-toggle='modal' data-sid='" + val.id + "'><i class='icon-close btn-icon-append'></i></button>" +
                            '</td></tr>')
                    });
                };
            },
            error: function() {
                alert('Page Not Founded');
            }
        });
    }
});

$("#next-page").on('click', function() {
    var currentpage = $('.pagination li.active').index();
    if (currentpage == endofpage) {
        return false;
    } else {
        var currentpage = $('.pagination li.active').index();
        var nextpage = currentpage + 1;
        $.ajax({
            type: "POST",
            // define url name
            url: "{% url 'doxer_admin:allcars' %}",
            data: {
                page_no: nextpage,
                csrfmiddlewaretoken: '{{ csrf_token }}',
            },
            // handle a successful response
            success: function(response) {
                if ($(this).hasClass('active')) {
                    return false;
                } else {
                    $('.pagination li').removeClass('active');
                    $('#tests-table').html('')
                        // $("#nuun").html('')
                        // $("#nuun").append("<p class='page-link'>" + currentpage + '&#160' + 'Out Of' + ' ' + endofpage + "</p>")

                    $.each(response.results, function(i, val) {
                        //append to post
                        for (var j = 1; j <= i; j++) { j };

                        if (val.status == '0') {
                            var status = "<label class='badge badge-danger'>New</label>";
                        } else if (val.status == '1') {
                            var status = "<label class='badge badge-success'>Approval</label>";
                        } else if (val.status == '2') {
                            var status = "<label class='badge badge-warning'>Rejected</label>";
                        } else {
                            var status = '';
                        }
                        $('#tests-table').append("<tr id='" + val.id + "'><td class='123'> # " + val.id + "</td><td>" + "<img src=" + val.pro_image + " alt='" + val.driverid.pro_image + "' />" + "</td><td>" + val.driverid + "</td><td>" + val.reg_num + "</td><td>" + val.vehical_variant + "</td><td>" + val.vehicle_color + "</td><td>" + status + "</td><td>" +
                            "<button class='btn btn-success btn-rounded btn-sm Accept-ca' data-target='#Accept' data-toggle='modal' data-sid='" + val.id + "'> <i class='icon-check btn-icon-append'></i></button>  <button class='btn btn-danger btn-rounded  btn-sm Reject-ca' data-target='#Reject' data-toggle='modal' data-sid='" + val.id + "'><i class='icon-close btn-icon-append'></i></button>" +
                            '</td></tr>')
                    });
                    $(".pagination li.page-item:eq(" + (nextpage - 1) + ")").addClass('active');
                    $('.pagination a').removeClass('btn-info').addClass('btn-primary');
                    $('li.page-item.active a').removeClass('btn-primary').addClass('btn-info');
                };
            },
            error: function() {
                return false;
            }
        });
    }
});

$("#prev-page").on('click', function() {
    var currentpage = $('.pagination li.active').index();
    if (currentpage === 1) {
        return false;
    } else {
        var currentpage = $('.pagination li.active').index();
        var nextpage = currentpage - 1;
        $.ajax({
            type: "POST",
            // define url name
            url: "{% url 'doxer_admin:allcars' %}",
            data: {
                page_no: nextpage,
                csrfmiddlewaretoken: '{{ csrf_token }}',
            },
            // handle a successful response
            success: function(response) {
                if ($(this).hasClass('active')) {
                    return false;
                } else {
                    $('.pagination li').removeClass('active');
                    $('#tests-table').html('')
                        // $("#nuun").html('')
                        // $("#nuun").append("<p class='page-link'>" + currentpage + '&#160' + 'Out Of' + ' ' + endofpage + "</p>")

                    $.each(response.results, function(i, val) {
                        //append to post
                        for (var j = 1; j <= i; j++) { j };

                        if (val.status == '0') {
                            var status = "<label class='badge badge-danger'>New</label>";
                        } else if (val.status == '1') {
                            var status = "<label class='badge badge-success'>Approval</label>";
                        } else if (val.status == '2') {
                            var status = "<label class='badge badge-warning'>Rejected</label>";
                        } else {
                            var status = '';
                        }
                        $('#tests-table').append("<tr id='" + val.id + "'><td class='123'> # " + val.id + "</td><td>" + "<img src=" + val.pro_image + " alt='" + val.driverid.pro_image + "' />" + "</td><td>" + val.driverid + "</td><td>" + val.reg_num + "</td><td>" + val.vehical_variant + "</td><td>" + val.vehicle_color + "</td><td>" + status + "</td><td>" +
                            "<button class='btn btn-success btn-rounded btn-sm Accept-ca' data-target='#Accept' data-toggle='modal' data-sid='" + val.id + "'> <i class='icon-check btn-icon-append'></i></button>  <button class='btn btn-danger btn-rounded  btn-sm Reject-ca' data-target='#Reject' data-toggle='modal' data-sid='" + val.id + "'><i class='icon-close btn-icon-append'></i></button>" +
                            '</td></tr>')
                    });
                    $(".pagination li.page-item:eq(" + (nextpage - 1) + ")").addClass('active');
                    $('.pagination a').removeClass('btn-info').addClass('btn-primary');
                    $('li.page-item.active a').removeClass('btn-primary').addClass('btn-info');
                };
            },
            error: function() {
                return false;
            }
        });
    }
});