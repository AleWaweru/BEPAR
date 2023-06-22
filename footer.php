<!-- Newsletter Section Start -->
        <div class="newsletter-section">
            <div class="container">
                <div class="newsletter-area">
                   <h2>Subscribe Our Newsletter</h2>
                    <div class="col-lg-6 offset-lg-3 p-0">
                        <form class="newsletter-form1" id="newsletter" method="post" action="model/create.php?action=newsletter&from=<?= $_SERVER['REQUEST_URI'] ?>">
                            
                            <input type="email" class="form-control" placeholder="Enter Your Email" name="email" required autocomplete="off">
    
                            <button class="default-btn electronics-btn g-recaptcha" data-sitekey="6LePb0MlAAAAAGmANdVwG4dLApZwxBN1bxHHE39b" 
                                data-callback='onSubmit' 
                                data-action='submit'>
                                Subscribe
                            </button>
                        </form>
                    </div>

                    <img src="assets/img/shapes/2.png" class="subscribe-shape" alt="shape">
                </div>
            </div>
        </div>
        <!-- Newsletter Section End -->
        
        <div class="modal" tabindex="-1" role="dialog" id="myModal1">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Bepari Fiduciaries</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body text-center">
        <p>Thank you for your subscription. <br>
        Our team will contact you.
        <br>
        If you can't see it in your <b>Inbox</b>, we suggest that you check your <b>Spam</b> folder.
       
        </p>
      </div>
      <div class="modal-footer">
      
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="myClose1">Close</button>
      </div>
    </div>
  </div>
</div>

<script>
    $(document).ready(function(){
        <?php
        if(isset($_GET['success'])){ ?>
            $('#myModal1').modal('show');
        <?php }
        
        ?>
        
        $('#myClose1').click(function(){
            $('#myModal1').modal('hide');
        })
        
    })
</script>
 <!-- Footer Section Start -->
 <footer class="footer-area">
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-sm-6">
                        <div class="footer-widget">
                            <div class="footer-logo">
                                <a href="index.php">
                                    <img src="assets/img/Bepari Logo Edited-02.png" alt="logo" style="height: 70px;">
                                </a>
                            </div>
                            <!-- <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.</p> -->

                            <div class="footer-social">
                                <a href="#"><i class="flaticon-facebook"></i></a>
                                <a href="#"><i class="flaticon-twitter"></i></a>
                                <a href="#"><i class="flaticon-instagram"></i></a>
                                <a href="#"><i class="flaticon-linkedin"></i></a>
                                 <a href="#"><i class="flaticon-telegram"></i></a>
                            </div>
                        </div>
                        
                    </div>

                    <div class="col-md-3 col-sm-6">
                        <div class="footer-widget pl-75">
                            <h3>Services</h3>
                            <ul>
                                <li>
                                    <a href="corporate-services.php">
                                        <i class="flaticon-right-chevron"></i>
                                        Corporate Services
                                    </a>
                                </li>
                                <li>
                                    <a href="#Trust-Foundations-fiduciary.php">
                                        <i class="flaticon-right-chevron"></i>
                                        Trust and Foundations fiduciary services
                                    </a>
                                </li>
                                <li>
                                    <a href="financial-licenses.php">
                                        <i class="flaticon-right-chevron"></i>
                                        Financial Licenses
                                    </a>
                                </li>
                                <li>
                                    <a href="gaming-gambling-licenses.php">
                                        <i class="flaticon-right-chevron"></i>
                                        Gaming and Gambling Licenses
                                    </a> 
                                </li>
                                <li>
                                    <a href="fund-services.php">
                                        <i class="flaticon-right-chevron"></i>
                                        Fund services
                                    </a>   
                                </li>
                                <li>
                                    <a href="bank-account-services.php">
                                        <i class="flaticon-right-chevron"></i>
                                        Bank Account Services
                                    </a>   
                                </li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-md-3 col-sm-6">
                        <div class="footer-widget pl-75">
                            <h3>Quick Links</h3>
                                                      <ul>
                                <li>
                                    <a href="index.php">
                                        <i class="flaticon-right-chevron"></i>
                                        Home
                                    </a>
                                </li>
                                <li>
                                    <a href="about.php">
                                        <i class="flaticon-right-chevron"></i>
                                        About Us
                                    </a>
                                </li>
                                <li>
                                    <a href="contact.php">
                                        <i class="flaticon-right-chevron"></i>
                                        Contact Us
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-md-3 col-sm-6">
                        <div class="footer-widget pl-75">
                            <h3>Find Us</h3>
                            <ul>
                                <li>
                                    <i class="flaticon-pin"></i>
                                    Commonwealth House, 4th Floor, Moi Avenue, Nairobi, Kenya
                                </li>
                                <li>
                                    <a href="https://wa.me/254792072705" target="_blank">
                                        <i><img src="assets/img/whatsapp.png" alt="logo" style="height: 24px;"></i>
                                        +254792072705
                                    </a>
                                </li>
                                 <li>
                                    <a href="https://t.me/beparisales" target="_blank">
                                        <i><img src="assets/img/telegram.png" alt="logo" style="height: 24px; padding"></i>
                                        beparisales
                                    </a>
                                </li>
                                <li>
                                    <a href="tel:+254792072705">
                                        <i class="flaticon-call"></i>
                                        +254792072705
                                    </a>
                                </li>
                                <li>
                                    <a href="mailto:sales@beparifiduciaries.com" target="_blank">
                                        <i class="flaticon-envelope"></i>
                                        sales@beparifiduciaries.com
                                    </a>
                                </li>
                                <li>
                                    <a href="mailto:support@beparifiduciaries.com" target="_blank">
                                        <i class="flaticon-envelope"></i>
                                        support@beparifiduciaries.com
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="copyright-area">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-md-6 lh-1 text-left">
                            <p>&copy;<script>document.write(/\d{4}/.exec(Date())[0])</script> Bepari Fiduciaries. All Rights Reserved</p>
                        </div>
                        <!-- <div class="col-md-6 lh-1 text-end">
                            <ul>
                                <li><a href="privacy.php">Privacy Policy</a></li>
                                <li><a href="#">Terms & Conditions</a></li>
                            </ul>
                        </div> -->
                    </div>
                </div>
            </div>
        </footer>
        <!-- Footer Section End -->

        <!-- Jquery JS -->
        <script src="assets/js/jquery.min.js"></script>
        <!-- Bootstrap JS -->
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <!-- Subscribe From JS -->
        <script src="assets/js/jquery.ajaxchimp.min.js"></script>
		<!-- Form Validator JS -->
        <script src="assets/js/form-validator.min.js"></script>
        <!-- Contact JS -->
        <script src="assets/js/contact-form-script.js"></script>
        <!-- Owl Carousel Slider JS -->
        <script src="assets/js/owl.carousel.min.js"></script>
        <!-- Magnific Popup JS -->
        <script src="assets/js/jquery.magnific-popup.min.js"></script>
        <!-- Mixit Up JS -->
        <script src="assets/js/jquery.mixitup.min.js"></script>
        <!-- Meanmenu JS -->
        <script src="assets/js/meanmenu.js"></script>
        <!-- Custom JS -->
        <script src="assets/js/custom.js"></script>
        <!--Start of Tawk.to Script-->
        <script type="text/javascript">
            var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
            (function(){
            var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
            s1.async=true;
            s1.src='https://embed.tawk.to/63ec846f4742512879136616/1gp9uamuk';
            s1.charset='UTF-8';
            s1.setAttribute('crossorigin','*');
            s0.parentNode.insertBefore(s1,s0);
            })();
        </script>
        <!--End of Tawk.to Script-->
          <script src="https://www.google.com/recaptcha/api.js"></script>
        
         <script>
           function onSubmit(token) {
             document.getElementById("newsletter").submit();
           }
         </script>
    </body>
</html>