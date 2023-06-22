<?php include_once 'header.php' ?>   
        
        <!-- Modal Start  -->
        <div class="right-modal">
            <div class="modal fade right" id="sidebar-right" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <a href="index.php">
                                <img src="assets/img/logo.png" alt="logo">
                            </a>
                            <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>

                        <div class="modal-body">
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-12 p-0">
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="modal-link">
                                                   <a href="index.php">
                                                        <img src="assets/img/modal/1.jpg" alt="home one">
                                                   </a>
                                                   <h3><a href="index.php">Home One</a></h3>
                                                </div>
                                            </div>

                                            <div class="col-lg-6">
                                                <div class="modal-link">
                                                   <a href="index-two.php">
                                                        <img src="assets/img/modal/2.jpg" alt="home one">
                                                   </a>
                                                   <h3><a href="index-two.php">Home Two</a></h3>
                                                </div>
                                            </div>
                                            
                                            <div class="col-lg-6">
                                                <div class="modal-link">
                                                   <a href="about.php">
                                                        <img src="assets/img/modal/3.jpg" alt="home one">
                                                   </a>
                                                   <h3><a href="about.php">About</a></h3>
                                                </div>
                                            </div>

                                            <div class="col-lg-6">
                                                <div class="modal-link">
                                                   <a href="service.php">
                                                        <img src="assets/img/modal/4.jpg" alt="home one">
                                                   </a>
                                                   <h3><a href="service.php">Service</a></h3>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal End -->

        <!-- Contact Title Section Start -->
        <div class="contact-title">
            <div class="d-table">
                <div class="d-table-cell">
                    <div class="title-text text-center">
                        <h2>Contact Us</h2>
                        <ul>
                            <li><a href="index.php">Home</a></li>
                            <li>
                                Contact Us
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- Contact Title Section End -->

        <!-- Contact Card Section Start -->
        <div class="contact-area">
            <div class="container">
                <div class="row contact-box">
                   <!--<div class="col-lg-3 col-md-6">
                        <div class="contact-card">
                            <i class="flaticon-pin"></i>
                            <h3>Location</h3>
                            <ul>
                                <li>Commonwealth House, 4th Floor, Moi Avenue, Nairobi, Kenya</li>
                            </ul>
                        </div>
                    </div>-->
    
                    <div class="col-lg-3 col-md-6">
                        <div class="contact-card">
                            <i class="flaticon-call"></i>
                            <h3>Phone</h3>
                            <ul>
                                <li>
                                    <a href="tel:+254792072705">
                                        +254792072705
                                    </a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="contact-card">
                           <i><img src="assets/img/whatsapp.png" alt="logo" style="height: 28px;"></i>
                            <h3>Whatsapp</h3>
                            <ul>
                                <li><a href="https://wa.me/254792072705" target="_blank">+254792072705</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="contact-card">
                           <i><img src="assets/img/telegram.png" alt="logo" style="height: 28px;"></i>
                            <h3>Telegram</h3>
                            <ul>
                                <li><a href="https://t.me/beparisales" target="_blank">beparisales</a></li>
                            </ul>
                        </div>
                    </div>
                    
    
                    <div class="col-lg-3 col-md-6 offset-md-3 offset-lg-0">
                        <div class="contact-card">
                            <i class="flaticon-envelope"></i>
                            <h3>Email</h3>
                            <ul>
                                <li><a href="mailto:sales@beparifiduciaries.com" target="_blank">
                                        sales@beparifiduciaries.com
                                    </a></li>
                                <li><a href="mailto:support@beparifiduciaries.com" target="_blank">
                                        support@beparifiduciaries.com
                                    </a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Contact Card Section End -->

        <!-- Contact Section Start -->
        <div class="contact-section pt-100 pb-100">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-6 contact-img p-0">
                        <img src="assets/img/shapes/1.jpg" alt="contact">
                    </div>

                    <div class="col-lg-6 p-0">
                        <div class="contact-form">
                            <div class="contact-text">
                                <h3>We Love to Hear From You</h3>
                                <p>Feel free and share with us. We will get back to you</p>
                            </div>
                           
                            <form  method="post" action="model/create.php?action=contact" >
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <input type="text" name="name" id="name" class="form-control" required data-error="Please enter your name" placeholder="Name">
                                            <div class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <input type="email" name="email" id="email" class="form-control" required data-error="Please enter your email" placeholder="Email">
                                            <div class="help-block with-errors"></div>
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <input type="text" name="phone" id="phone" class="form-control" required data-error="Please enter your Phone Number" placeholder="Phone Number">
                                            <div class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <textarea name="message" class="message-field" id="message" cols="30" rows="5" required data-error="Please type your message" placeholder="Message"></textarea>
                                            <div class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                
                                    <div class="col-lg-12">
                                        <button type="submit" class="default-btn contact-btn">
                                            Send Message
                                        </button>
                                        <div id="msgSubmit" class="h3 text-center hidden"></div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                            </form>
                            <img src="assets/img/shapes/1.png" class="contact-shape" alt="shape">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Contact Section End -->

        <!-- Map Section Start -->
        <div class="map">
            <div class="container-fluid p-0">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3988.818378363909!2d36.813880415362775!3d-1.2827958359856808!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x182f10d23912632b%3A0xa3e642f1ab7822a8!2sView%20Park%20Towers%2C%20Utalii%20St%2C%20Nairobi!5e0!3m2!1sen!2ske!4v1674710999551!5m2!1sen!2ske" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>
        </div>
        <!-- Map Section End -->
        
        <div class="modal" tabindex="-1" role="dialog" id="myModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Bepari Fiduciaries</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body text-center">
        <p>Thank you for your message. <br>
        Our team will contact you.
        <br>
        If you can't see it in your <b>Inbox</b>, we suggest that you check your <b>Spam</b> folder.
       
        </p>
      </div>
      <div class="modal-footer">
      
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="myClose">Close</button>
      </div>
    </div>
  </div>
</div>

<script>
    $(document).ready(function(){
        <?php
        if(isset($_GET['msg'])){ ?>
            $('#myModal').modal('show');
        <?php }
        
        ?>
        
        $('#myClose').click(function(){
            $('#myModal').modal('hide');
        })
        
    })
</script>

        <?php include_once 'footer.php' ?>   