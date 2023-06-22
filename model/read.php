<?php
include_once 'operations.php';

$_SESSION['from'] = $_GET['from'];
//CORE

function get_pwd_reset($selector, $currentTimeStamp)
{
    $sql = "SELECT * FROM pwd_reset WHERE pwdResetSelector = '$selector' AND pwdResetExpires >= '$currentTimeStamp'";
    return select_rows($sql)[0];
}

//BOOKINGS

function get_latest_bookings($id)
{
    $sql = "SELECT booking.*, user.name, user.email, user.phone_number, user.id_number FROM booking JOIN user ON booking.userid = user.id WHERE booking.id = '$id' ";
    return select_rows($sql)[0];
}

function get_latest_booking($id)
{
    $sql = "SELECT booking_camping.*, user.name, user.email, user.phone_number, user.id_number FROM booking_camping JOIN user ON booking_camping.userid = user.id WHERE booking_camping.id = '$id' ";
    return select_rows($sql)[0];
}

function get_booking_details($id)
{
    $sql = "SELECT name FROM camping WHERE id = '$id' ";
    return select_rows($sql)[0];
}

function get_bookng_details($id)
{
    $sql = "SELECT name FROM tandem WHERE id='$id' UNION ALL SELECT name FROM yoga WHERE id='$id' UNION ALL SELECT name FROM biking WHERE id='$id'";
    return select_rows($sql)[0];
}

//SERVICES

function get_main_services($table)
{
    $sql = "SELECT * FROM $table";
    return select_rows($sql)[0];
}

function get_images($id)
{
    $sql = "SELECT * FROM other_images WHERE activity_id = '$id'";
    return select_rows($sql)[0];
}

function get_times($id)
{
    $sql = "SELECT * FROM service_times WHERE service_id = '$id' ORDER BY service_time ASC";
    return select_rows($sql);
}

//ORDERS

function get_my_orders($id, $orders_id = '')
{
    $sql  = "select order_number, orders.id, first_name, last_name, payment_method, orders.date_created, total, device from orders join user on orders.user_id = user.id where orders.user_id = '$id'";
    $orders_id != '' ? $sql .= " and orders.id = '$orders_id'" : '';
    $sql .= " order by orders.date_created desc";
    return select_rows($sql);
}

function get_my_orders_list($id)
{
    $sql  = "select activity.name, activity.poster, activity.vendor_id, activity.description, activity.prices, cart.cart_quantity, orders.total, sub_orders.date_created";
    $sql .= " from activity join cart on activity.id = cart.activity_id";
    $sql .= " join sub_orders on cart.cart_id = sub_orders.cart_id";
    $sql .= " join orders on sub_orders.order_id = orders.id";
    $sql .= " where orders.id = '$id' order by sub_orders.date_created desc";

    return select_rows($sql);
}


//PRODUCTS
function get_all_products()
{
    $sql = "SELECT * FROM products WHERE status = 'active'";
    return select_rows($sql);
}

function get_product_details($id)
{
    $sql = "SELECT * FROM activity";
    $sql .= " WHERE activity.id = '$id' and activity.status = 'active'";
    return select_rows($sql);
}


function get_product_by_id($id)
{
    $sql = "SELECT * FROM products WHERE id = '$id' AND status = 'active'";
    return select_rows($sql)[0];
}


function get_cart_num($user_id = '', $device = '')
{
    $device = $_COOKIE['device'];

    $sql = "select * from cart where status = 'active'";

    $sql .= $user_id    != '' ? " and user_id = '$user_id'" :  " and device = '$device'";

    return sql_counter($sql);
}



function get_cart_details($user_id = '', $device = '')
{
    $device = $_COOKIE['device'];

    $sql = "SELECT * FROM cart JOIN products ON cart.product_id = products.id WHERE cart.status = 'active'";

    $sql .= $user_id    != '' ? " and cart.user_id = '$user_id'" : " and cart.device = '$device'";

    $sql .= " order by cart.date_created asc";

    return select_rows($sql);
}






// USERS AND USER DETAILS

function get_user_by_attribute($column, $value)
{
    $sql = "SELECT * FROM user WHERE $column='$value'";
    return select_rows($sql)[0];
}

function get_specific_user($attr, $attr1, $col = 'password', $col1 = 'email')
{
    $sql = "SELECT * FROM user WHERE $col='$attr' AND $col1='$attr1' and status = 'active'";
    return select_rows($sql);
}


function get_profile($col_val, $col = 'id')
{
    $sql = "SELECT * from user WHERE $col='$col_val'  and status = 'active'";
    $row = select_rows($sql);
    return $row[0];
}

function get_profiles($col_val, $col = 'email')
{
    $sql = "SELECT * from user WHERE $col='$col_val' and status = 'active'";
    $row = select_rows($sql);
    return $row[0];
}



//BANNERS

function get_page_banner($id){
    $sql = "SELECT * FROM main_banner WHERE id='$id'";
    return select_rows($sql)[0];
}


// ERRORS

function check_error($col, $col_val)
{
    $sql = "select $col from user where $col='$col_val'";
    return select_rows($sql);
}

function get_search_check_box($rent, $type)
{
    //have some logic problems currently
    $sql = "SELECT * FROM property WHERE rented='0' AND paid='1' AND deleted='0' AND propertyRent != ''";

    if (isset($_POST[$rent])) {
        $propertyRent = implode("','", $_POST[$rent]);
        $sql .= "AND propertyRent IN ('" . $propertyRent . "')";
    }

    if (isset($_POST[$type])) {
        $propertyType = implode("','", $_POST[$type]);
        $sql .= "AND propertyType IN ('" . $propertyType . "')";
    }

    $sql .= "ORDER BY id DESC";
    return select_rows($sql);
}

//EVENTS
function get_events($date = '')
{
    $today = date('Y-m-d');
    $sql = "SELECT * FROM event WHERE status = 'active'";
    $date != '' ? $sql .= " AND event_date = '$date'" : '';
    $sql .= " and event_date >= '$today' ORDER BY date_created DESC";
    return select_rows($sql);
}



function get_events_by_vendor($id, $date = '')
{
    $today = date('Y-m-d');
    $sql = "SELECT * FROM event WHERE vendor_id = '$id' AND status = 'active' AND activation='activated'";
    $date != '' ? $sql .= " AND event_date = '$date'" : '';
    $sql .= " and event_date >= '$today' ORDER BY date_created DESC";
    return select_rows($sql);
}

function event_min_amount($eventid)
{
    $sql = "SELECT MIN(amount) as min_amount FROM ticket WHERE event_id = '$eventid'";
    return select_rows($sql)[0];
}

function get_event_details($id)
{
    $sql = "SELECT * FROM event WHERE event_id = '$id' ";
    return select_rows($sql);
}

function get_ticket($id)
{
    $sql_ticket = "select ticket_type, quantity, amount from ticket where event_id = '$id' and status = 'active'";
    return select_rows($sql_ticket);
}

function get_bought_ticket($id, $ticket_type)
{
    $sql_available = "select MAX(bought_tickets) as bought_tickets from event_booking where event_id = '$id' and ticket_type = '$ticket_type' and paid = 'paid' and status = 'active'";
    return select_rows($sql_available);
}

function get_bookings($id = '')
{
    $sql = "select event.name as event_name , event.*, booking.* from booking join event on booking.event_id = event.event_id where  booking.paid = 'paid'";
    $id != '' ? $sql .= " and event.vendor_id = '$id'" : '';
    $sql .= " and booking.status = 'active' order by id desc";
    return select_rows($sql);
}

function get_ticket_by_event_id($id)
{
    $id = decrypt($id);
    $sql = "select * from ticket where id = '$id' and status = 'active'";
    return select_rows($sql);
}

function get_ticket_by_id($id)
{
    $id = decrypt($id);
    $sql = "select * from ticket join event on ticket.event_id = event.event_id where ticket.event_id = '$id' and ticket.status = 'active'";
    return select_rows($sql);
}

function get_my_event_bookings($email)
{
    $sql  = "SELECT event_booking.id, event_booking.name, event_booking.date_created, event_booking.amount, event_booking.email, user.email FROM event_booking JOIN user ON event_booking.email = user.email WHERE event_booking.email = '$email' ";
    $sql .= " ORDER BY event_booking.date_created DESC";
    return select_rows($sql);
}

function get_my_event_bookings_list($id)
{
    $sql  = "SELECT event.name, event.event_date, event.event_time,  event.poster, event.description, event_booking.amount, event_booking.date_created";
    $sql .= " from event join event_booking on event.event_id = event_booking.event_id";
    $sql .= " where event_booking.id = '$id'  order by event_booking.date_created desc ";

    return select_rows($sql);
}


// SEARCH

function search($q)
{
    $sql = "SELECT * FROM property WHERE rented='0' AND paid='1' AND propertyLocation LIKE '%$q%' AND deleted='0' ORDER BY id DESC";
    return select_rows($sql);
}

function get_ids($table, $id, $random_str)
{
    $sql = "select * from `$table`";
    $row = select_rows($sql);

    foreach ($row as $item) {
        if ($item[$id] == $random_str) {
            $id_exists = true;
            break;
        } else {
            $id_exists = false;
        }
    }
    return $id_exists;
}

//LOGIN AND SESSIONS

function get_user_login()
{

    $email = security('email');
    $password = md5(security('password'));

    $logins = get_specific_user($password, $email);
    $redirect = path_url . ($_SESSION['from'] ?? '');
    if (!empty($logins)) {
        foreach ($logins as $log) {
            $_SESSION['id']         = $log['id'];
            $_SESSION['email']      = $log['email'];
            $_SESSION['idnumber']   = $log['id_number'];
            $_SESSION['phone']      = $log['phone_number'];
            $_SESSION['fullname']   = $log['name'];
        }

        $_SESSION['login']      = true;

        unset($_SESSION['checkout']);
       
            $arr['user_id'] = $_SESSION['id'];
            build_sql_edit('cart', $arr, $_COOKIE['device'], 'device');
       
        header('Location:' . $redirect);
    } else {
        header('Location:' . $redirect . '?false');
    }
}

function login_fallback($email)
{
    $arr['device'] = $device = $_COOKIE['device'];
    $login = get_profile($email, 'email');

    $_SESSION['login']      = true;
    $_SESSION['id']         = $login['id'];
    $_SESSION['email']      = $login['email'];
    $_SESSION['idnumber']   = $login['id_number'];
    $_SESSION['phone']      = $login['phone_number'];
    $_SESSION['fullname']   = $login['first_name'] . " " . $login['last_name'];

    if ($log['verified_at'] == null) {
        $arr['verified_at'] = $date;
        build_sql_edit("user", $arr, $_SESSION['email'], 'email');
    }

    build_sql_edit('user', $arr, $_SESSION['id']);

    $sql = "select * from cart where device = '$device'";

    if (!empty(select_rows($sql))) {
        build_sql_edit('cart', array('user_id' => $_SESSION['id']), $device, 'device');
    }

    $redirect = base_url . (isset($_GET['checkout']) ? 'checkout?logged' : (isset($_SESSION['redirect']) ? $_SESSION['redirect'] : ''));
    unset($_SESSION['checkout']);
    header('Location:' . $redirect);
    exit();
}
