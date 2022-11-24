package com.wepr.watchshop.service;

import com.wepr.watchshop.model.User;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.Properties;

public class EmailService {
    public static void sendEmail(String host, String port,
                                 final String userName, final String password, String toAddress,
                                 String subject, String message, User user, String siteURL) throws MessagingException {
        // sets SMTP server properties
        Properties properties = new Properties();
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", port);
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.ssl.trust", "*");
        properties.put("mail.smtp.ssl.protocols", "TLSv1.2");
        properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

        // creates a new session with an authenticator
        Authenticator auth = new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(userName, password);
            }
        };

        Session session = Session.getInstance(properties, auth);

        // creates a new e-mail message
        MimeMessage msg = new MimeMessage(session);
        msg.setFrom(new InternetAddress(userName));
        InternetAddress[] toAddresses = { new InternetAddress(toAddress) };
        msg.setRecipients(Message.RecipientType.TO, toAddresses);
        msg.setSubject(subject,"UTF-8");
        msg.setSentDate(new Date());
        String verifyURL = siteURL + "/verify?code=" + user.getVerificationCode();

        message = message.replace("URLPATH", verifyURL );
        msg.setContent(message, "text/html; charset=UTF-8");
        // sends the e-mail
        Transport.send(msg);

    }
    public static String verifyEmail = "<!DOCTYPE html>\n" +
            "<html>\n" +
            "\n" +
            "<head>\n" +
            "    <title></title>\n" +
            "    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\n" +
            "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n" +
            "    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\" />\n" +
            "    <style type=\"text/css\">\n" +
            "        @media screen {\n" +
            "            @font-face {\n" +
            "                font-family: 'Lato';\n" +
            "                font-style: normal;\n" +
            "                font-weight: 400;\n" +
            "                src: local('Lato Regular'), local('Lato-Regular'), url(https://fonts.gstatic.com/s/lato/v11/qIIYRU-oROkIk8vfvxw6QvesZW2xOQ-xsNqO47m55DA.woff) format('woff');\n" +
            "            }\n" +
            "\n" +
            "            @font-face {\n" +
            "                font-family: 'Lato';\n" +
            "                font-style: normal;\n" +
            "                font-weight: 700;\n" +
            "                src: local('Lato Bold'), local('Lato-Bold'), url(https://fonts.gstatic.com/s/lato/v11/qdgUG4U09HnJwhYI-uK18wLUuEpTyoUstqEm5AMlJo4.woff) format('woff');\n" +
            "            }\n" +
            "\n" +
            "            @font-face {\n" +
            "                font-family: 'Lato';\n" +
            "                font-style: italic;\n" +
            "                font-weight: 400;\n" +
            "                src: local('Lato Italic'), local('Lato-Italic'), url(https://fonts.gstatic.com/s/lato/v11/RYyZNoeFgb0l7W3Vu1aSWOvvDin1pK8aKteLpeZ5c0A.woff) format('woff');\n" +
            "            }\n" +
            "\n" +
            "            @font-face {\n" +
            "                font-family: 'Lato';\n" +
            "                font-style: italic;\n" +
            "                font-weight: 700;\n" +
            "                src: local('Lato Bold Italic'), local('Lato-BoldItalic'), url(https://fonts.gstatic.com/s/lato/v11/HkF_qI1x_noxlxhrhMQYELO3LdcAZYWl9Si6vvxL-qU.woff) format('woff');\n" +
            "            }\n" +
            "        }\n" +
            "\n" +
            "        /* CLIENT-SPECIFIC STYLES */\n" +
            "        body,\n" +
            "        table,\n" +
            "        td,\n" +
            "        a {\n" +
            "            -webkit-text-size-adjust: 100%;\n" +
            "            -ms-text-size-adjust: 100%;\n" +
            "        }\n" +
            "\n" +
            "        table,\n" +
            "        td {\n" +
            "            mso-table-lspace: 0pt;\n" +
            "            mso-table-rspace: 0pt;\n" +
            "        }\n" +
            "\n" +
            "        img {\n" +
            "            -ms-interpolation-mode: bicubic;\n" +
            "        }\n" +
            "\n" +
            "        /* RESET STYLES */\n" +
            "        img {\n" +
            "            border: 0;\n" +
            "            height: auto;\n" +
            "            line-height: 100%;\n" +
            "            outline: none;\n" +
            "            text-decoration: none;\n" +
            "        }\n" +
            "\n" +
            "        table {\n" +
            "            border-collapse: collapse !important;\n" +
            "        }\n" +
            "\n" +
            "        body {\n" +
            "            height: 100% !important;\n" +
            "            margin: 0 !important;\n" +
            "            padding: 0 !important;\n" +
            "            width: 100% !important;\n" +
            "        }\n" +
            "\n" +
            "        /* iOS BLUE LINKS */\n" +
            "        a[x-apple-data-detectors] {\n" +
            "            color: inherit !important;\n" +
            "            text-decoration: none !important;\n" +
            "            font-size: inherit !important;\n" +
            "            font-family: inherit !important;\n" +
            "            font-weight: inherit !important;\n" +
            "            line-height: inherit !important;\n" +
            "        }\n" +
            "\n" +
            "        /* MOBILE STYLES */\n" +
            "        @media screen and (max-width:600px) {\n" +
            "            h1 {\n" +
            "                font-size: 32px !important;\n" +
            "                line-height: 32px !important;\n" +
            "            }\n" +
            "        }\n" +
            "\n" +
            "        /* ANDROID CENTER FIX */\n" +
            "        div[style*=\"margin: 16px 0;\"] {\n" +
            "            margin: 0 !important;\n" +
            "        }\n" +
            "    </style>\n" +
            "</head>\n" +
            "\n" +
            "<body style=\"background-color: #f4f4f4; margin: 0 !important; padding: 0 !important;\">\n" +
            "    <!-- HIDDEN PREHEADER TEXT -->\n" +
            "    <div style=\"display: none; font-size: 1px; color: #fefefe; line-height: 1px; font-family: 'Lato', Helvetica, Arial, sans-serif; max-height: 0px; max-width: 0px; opacity: 0; overflow: hidden;\"> Chúng tôi rất vui mừng vì bạn có mặt ở đây, cùng xác nhận tài khoản của bạn ngay.\n" +
            "    </div>\n" +
            "    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n" +
            "        <!-- LOGO -->\n" +
            "        <tr>\n" +
            "            <td bgcolor=\"#FFA73B\" align=\"center\">\n" +
            "                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width: 600px;\">\n" +
            "                    <tr>\n" +
            "                        <td align=\"center\" valign=\"top\" style=\"padding: 40px 10px 40px 10px;\"> </td>\n" +
            "                    </tr>\n" +
            "                </table>\n" +
            "            </td>\n" +
            "        </tr>\n" +
            "        <tr>\n" +
            "            <td bgcolor=\"#FFA73B\" align=\"center\" style=\"padding: 0px 10px 0px 10px;\">\n" +
            "                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width: 600px;\">\n" +
            "                    <tr>\n" +
            "                        <td bgcolor=\"#ffffff\" align=\"center\" valign=\"top\" style=\"padding: 40px 20px 20px 20px; border-radius: 4px 4px 0px 0px; color: #111111; font-family: 'Lato', Helvetica, Arial, sans-serif; font-size: 48px; font-weight: 400; letter-spacing: 4px; line-height: 48px;\">\n" +
            "                            <h1 style=\"font-size: 48px; font-weight: 400; margin: 2;\">Welcome!</h1> <img src=\" https://img.icons8.com/clouds/100/000000/handshake.png\" width=\"125\" height=\"120\" style=\"display: block; border: 0px;\" />\n" +
            "                        </td>\n" +
            "                    </tr>\n" +
            "                </table>\n" +
            "            </td>\n" +
            "        </tr>\n" +
            "        <tr>\n" +
            "            <td bgcolor=\"#f4f4f4\" align=\"center\" style=\"padding: 0px 10px 0px 10px;\">\n" +
            "                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width: 600px;\">\n" +
            "                    <tr>\n" +
            "                        <td bgcolor=\"#ffffff\" align=\"left\" style=\"padding: 20px 30px 40px 30px; color: #666666; font-family: 'Lato', Helvetica, Arial, sans-serif; font-size: 18px; font-weight: 400; line-height: 25px;\">\n" +
            "                            <p style=\"margin: 0;\">Chào mừng bạn đến với Watchshop\n" +
            "! Trước khi bắt đầu, vui lòng xác nhận email của bạn bằng cách nhấn vào nút phía bên dưới.</p>\n" +
            "                        </td>\n" +
            "                    </tr>\n" +
            "                    <tr>\n" +
            "                        <td bgcolor=\"#ffffff\" align=\"left\">\n" +
            "                            <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n" +
            "                                <tr>\n" +
            "                                    <td bgcolor=\"#ffffff\" align=\"center\" style=\"padding: 20px 30px 60px 30px;\">\n" +
            "                                        <table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n" +
            "                                            <tr>\n" +
            "                                                <td align=\"center\" style=\"border-radius: 3px;\" bgcolor=\"#FFA73B\"><a href=\"URLPATH\" target=\"_blank\" style=\"font-size: 20px; font-family: Helvetica, Arial, sans-serif; color: #ffffff; text-decoration: none; color: #ffffff; text-decoration: none; padding: 15px 25px; border-radius: 2px; border: 1px solid #FFA73B; display: inline-block;\">Confirm Account</a></td>\n" +
            "                                            </tr>\n" +
            "                                        </table>\n" +
            "                                    </td>\n" +
            "                                </tr>\n" +
            "                            </table>\n" +
            "                        </td>\n" +
            "                    </tr> <!-- COPY -->\n" +
            "                    <tr>\n" +
            "                        <td bgcolor=\"#ffffff\" align=\"left\" style=\"padding: 0px 30px 0px 30px; color: #666666; font-family: 'Lato', Helvetica, Arial, sans-serif; font-size: 18px; font-weight: 400; line-height: 25px;\">\n" +
            "                        </td>\n" +
            "                    </tr> <!-- COPY -->\n" +
            "                    <tr>\n" +
            "                        <td bgcolor=\"#ffffff\" align=\"left\" style=\"padding: 20px 30px 20px 30px; color: #666666; font-family: 'Lato', Helvetica, Arial, sans-serif; font-size: 18px; font-weight: 400; line-height: 25px;\">\n" +
            "                            <p style=\"margin: 0;\"></p>\n" +
            "                        </td>\n" +
            "                    </tr>\n" +
            "                    <tr>\n" +
            "                        <td bgcolor=\"#ffffff\" align=\"left\" style=\"padding: 0px 30px 20px 30px; color: #666666; font-family: 'Lato', Helvetica, Arial, sans-serif; font-size: 18px; font-weight: 400; line-height: 25px;\">\n" +
            "                            <p style=\"margin: 0;\">Nếu bạn có bất kỳ câu hỏi nào, vui lòng gửi mail cho chúng tôi &mdash;chúng tôi rất sẵn lòng phục vụ bạn.</p>\n" +
            "                        </td>\n" +
            "                    </tr>\n" +
            "                    <tr>\n" +
            "                        <td bgcolor=\"#ffffff\" align=\"left\" style=\"padding: 0px 30px 40px 30px; border-radius: 0px 0px 4px 4px; color: #666666; font-family: 'Lato', Helvetica, Arial, sans-serif; font-size: 18px; font-weight: 400; line-height: 25px;\">\n" +
            "                            <p style=\"margin: 0;\">Thân ái,<br>Watchshop | Group15</p>\n" +
            "                        </td>\n" +
            "                    </tr>\n" +
            "                </table>\n" +
            "            </td>\n" +
            "        </tr>\n" +
            "        <tr>\n" +
            "            <td bgcolor=\"#f4f4f4\" align=\"center\" style=\"padding: 30px 10px 0px 10px;\">\n" +
            "                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width: 600px;\">\n" +
            "                    <tr>\n" +
            "                        <td bgcolor=\"#FFECD1\" align=\"center\" style=\"padding: 30px 30px 30px 30px; border-radius: 4px 4px 4px 4px; color: #666666; font-family: 'Lato', Helvetica, Arial, sans-serif; font-size: 18px; font-weight: 400; line-height: 25px;\">\n" +
            "                            <h2 style=\"font-size: 20px; font-weight: 400; color: #111111; margin: 0;\">Need more help?</h2>\n" +
            "                            <p style=\"margin: 0;\"><a href=\"#\" target=\"_blank\" style=\"color: #FFA73B;\">We&rsquo;re here to help you out</a></p>\n" +
            "                        </td>\n" +
            "                    </tr>\n" +
            "                </table>\n" +
            "            </td>\n" +
            "        </tr>\n" +
            "        <tr>\n" +
            "            <td bgcolor=\"#f4f4f4\" align=\"center\" style=\"padding: 0px 10px 0px 10px;\">\n" +
            "                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width: 600px;\">\n" +
            "                    <tr>\n" +
            "                        <td bgcolor=\"#f4f4f4\" align=\"left\" style=\"padding: 0px 30px 30px 30px; color: #666666; font-family: 'Lato', Helvetica, Arial, sans-serif; font-size: 14px; font-weight: 400; line-height: 18px;\"> <br>\n" +
            "                            <p style=\"margin: 0;\">If these emails get annoying, please feel free to <a href=\"#\" target=\"_blank\" style=\"color: #111111; font-weight: 700;\">unsubscribe</a>.</p>\n" +
            "                        </td>\n" +
            "                    </tr>\n" +
            "                </table>\n" +
            "            </td>\n" +
            "        </tr>\n" +
            "    </table>\n" +
            "</body>\n" +
            "\n" +
            "</html>";


    public static String receiptEmail = "<!DOCTYPE html>\n" +
            "<html>\n" +
            "<head>\n" +
            "\n" +
            "  <meta charset=\"utf-8\">\n" +
            "  <meta http-equiv=\"x-ua-compatible\" content=\"ie=edge\">\n" +
            "  <title>Email Receipt</title>\n" +
            "  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n" +
            "  <style type=\"text/css\">\n" +
            "  /**\n" +
            "   * Google webfonts. Recommended to include the .woff version for cross-client compatibility.\n" +
            "   */\n" +
            "  @media screen {\n" +
            "    @font-face {\n" +
            "      font-family: 'Source Sans Pro';\n" +
            "      font-style: normal;\n" +
            "      font-weight: 400;\n" +
            "      src: local('Source Sans Pro Regular'), local('SourceSansPro-Regular'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/ODelI1aHBYDBqgeIAH2zlBM0YzuT7MdOe03otPbuUS0.woff) format('woff');\n" +
            "    }\n" +
            "\n" +
            "    @font-face {\n" +
            "      font-family: 'Source Sans Pro';\n" +
            "      font-style: normal;\n" +
            "      font-weight: 700;\n" +
            "      src: local('Source Sans Pro Bold'), local('SourceSansPro-Bold'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/toadOcfmlt9b38dHJxOBGFkQc6VGVFSmCnC_l7QZG60.woff) format('woff');\n" +
            "    }\n" +
            "  }\n" +
            "\n" +
            "  /**\n" +
            "   * Avoid browser level font resizing.\n" +
            "   * 1. Windows Mobile\n" +
            "   * 2. iOS / OSX\n" +
            "   */\n" +
            "  body,\n" +
            "  table,\n" +
            "  td,\n" +
            "  a {\n" +
            "    -ms-text-size-adjust: 100%; /* 1 */\n" +
            "    -webkit-text-size-adjust: 100%; /* 2 */\n" +
            "  }\n" +
            "\n" +
            "  /**\n" +
            "   * Remove extra space added to tables and cells in Outlook.\n" +
            "   */\n" +
            "  table,\n" +
            "  td {\n" +
            "    mso-table-rspace: 0pt;\n" +
            "    mso-table-lspace: 0pt;\n" +
            "  }\n" +
            "\n" +
            "  /**\n" +
            "   * Better fluid images in Internet Explorer.\n" +
            "   */\n" +
            "  img {\n" +
            "    -ms-interpolation-mode: bicubic;\n" +
            "  }\n" +
            "\n" +
            "  /**\n" +
            "   * Remove blue links for iOS devices.\n" +
            "   */\n" +
            "  a[x-apple-data-detectors] {\n" +
            "    font-family: inherit !important;\n" +
            "    font-size: inherit !important;\n" +
            "    font-weight: inherit !important;\n" +
            "    line-height: inherit !important;\n" +
            "    color: inherit !important;\n" +
            "    text-decoration: none !important;\n" +
            "  }\n" +
            "\n" +
            "  /**\n" +
            "   * Fix centering issues in Android 4.4.\n" +
            "   */\n" +
            "  div[style*=\"margin: 16px 0;\"] {\n" +
            "    margin: 0 !important;\n" +
            "  }\n" +
            "\n" +
            "  body {\n" +
            "    width: 100% !important;\n" +
            "    height: 100% !important;\n" +
            "    padding: 0 !important;\n" +
            "    margin: 0 !important;\n" +
            "  }\n" +
            "\n" +
            "  /**\n" +
            "   * Collapse table borders to avoid space between cells.\n" +
            "   */\n" +
            "  table {\n" +
            "    border-collapse: collapse !important;\n" +
            "  }\n" +
            "\n" +
            "  a {\n" +
            "    color: #1a82e2;\n" +
            "  }\n" +
            "\n" +
            "  img {\n" +
            "    height: auto;\n" +
            "    line-height: 100%;\n" +
            "    text-decoration: none;\n" +
            "    border: 0;\n" +
            "    outline: none;\n" +
            "  }\n" +
            "  </style>\n" +
            "\n" +
            "</head>\n" +
            "<body style=\"background-color: #D2C7BA;\">\n" +
            "\n" +
            "  <!-- start preheader -->\n" +
            "  <div class=\"preheader\" style=\"display: none; max-width: 0; max-height: 0; overflow: hidden; font-size: 1px; line-height: 1px; color: #fff; opacity: 0;\">\n" +
            "    A preheader is the short summary text that follows the subject line when an email is viewed in the inbox.\n" +
            "  </div>\n" +
            "  <!-- end preheader -->\n" +
            "\n" +
            "  <!-- start body -->\n" +
            "  <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n" +
            "\n" +
            "    <!-- start logo -->\n" +
            "    <tr>\n" +
            "      <td align=\"center\" bgcolor=\"#D2C7BA\">\n" +
            "        <!--[if (gte mso 9)|(IE)]>\n" +
            "        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\">\n" +
            "        <tr>\n" +
            "        <td align=\"center\" valign=\"top\" width=\"600\">\n" +
            "        <![endif]-->\n" +
            "        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width: 600px;\">\n" +
            "          <tr>\n" +
            "            <td align=\"center\" valign=\"top\" style=\"padding: 36px 24px;\">\n" +
            "              <a href=\"https://sendgrid.com\" target=\"_blank\" style=\"display: inline-block;\">\n" +
            "                <img src=\"./img/paste-logo-light@2x.png\" alt=\"Logo\" border=\"0\" width=\"48\" style=\"display: block; width: 48px; max-width: 48px; min-width: 48px;\">\n" +
            "              </a>\n" +
            "            </td>\n" +
            "          </tr>\n" +
            "        </table>\n" +
            "        <!--[if (gte mso 9)|(IE)]>\n" +
            "        </td>\n" +
            "        </tr>\n" +
            "        </table>\n" +
            "        <![endif]-->\n" +
            "      </td>\n" +
            "    </tr>\n" +
            "    <!-- end logo -->\n" +
            "\n" +
            "    <!-- start hero -->\n" +
            "    <tr>\n" +
            "      <td align=\"center\" bgcolor=\"#D2C7BA\">\n" +
            "        <!--[if (gte mso 9)|(IE)]>\n" +
            "        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\">\n" +
            "        <tr>\n" +
            "        <td align=\"center\" valign=\"top\" width=\"600\">\n" +
            "        <![endif]-->\n" +
            "        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width: 600px;\">\n" +
            "          <tr>\n" +
            "            <td align=\"left\" bgcolor=\"#ffffff\" style=\"padding: 36px 24px 0; font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; border-top: 3px solid #d4dadf;\">\n" +
            "              <h1 style=\"margin: 0; font-size: 32px; font-weight: 700; letter-spacing: -1px; line-height: 48px;\">Thank you for your order!</h1>\n" +
            "            </td>\n" +
            "          </tr>\n" +
            "        </table>\n" +
            "        <!--[if (gte mso 9)|(IE)]>\n" +
            "        </td>\n" +
            "        </tr>\n" +
            "        </table>\n" +
            "        <![endif]-->\n" +
            "      </td>\n" +
            "    </tr>\n" +
            "    <!-- end hero -->\n" +
            "\n" +
            "    <!-- start copy block -->\n" +
            "    <tr>\n" +
            "      <td align=\"center\" bgcolor=\"#D2C7BA\">\n" +
            "        <!--[if (gte mso 9)|(IE)]>\n" +
            "        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\">\n" +
            "        <tr>\n" +
            "        <td align=\"center\" valign=\"top\" width=\"600\">\n" +
            "        <![endif]-->\n" +
            "        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width: 600px;\">\n" +
            "\n" +
            "          <!-- start copy -->\n" +
            "          <tr>\n" +
            "            <td align=\"left\" bgcolor=\"#ffffff\" style=\"padding: 24px; font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px;\">\n" +
            "              <p style=\"margin: 0;\">Here is a summary of your recent order. If you have any questions or concerns about your order, please <a href=\"https://sendgrid.com\">contact us</a>.</p>\n" +
            "            </td>\n" +
            "          </tr>\n" +
            "          <!-- end copy -->\n" +
            "\n" +
            "          <!-- start receipt table -->\n" +
            "          <tr>\n" +
            "            <td align=\"left\" bgcolor=\"#ffffff\" style=\"padding: 24px; font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px;\">\n" +
            "              <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n" +
            "                <tr>\n" +
            "                  <td align=\"left\" bgcolor=\"#D2C7BA\" width=\"75%\" style=\"padding: 12px;font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px;\"><strong>Order #</strong></td>\n" +
            "                  <td align=\"left\" bgcolor=\"#D2C7BA\" width=\"25%\" style=\"padding: 12px;font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px;\"><strong>0000224</strong></td>\n" +
            "                </tr>\n" +
            "                <tr>\n" +
            "                  <td align=\"left\" width=\"75%\" style=\"padding: 6px 12px;font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px;\">Item</td>\n" +
            "                  <td align=\"left\" width=\"25%\" style=\"padding: 6px 12px;font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px;\">$24.00</td>\n" +
            "                </tr>\n" +
            "                <tr>\n" +
            "                  <td align=\"left\" width=\"75%\" style=\"padding: 6px 12px;font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px;\">Item</td>\n" +
            "                  <td align=\"left\" width=\"25%\" style=\"padding: 6px 12px;font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px;\">$24.00</td>\n" +
            "                </tr>\n" +
            "                <tr>\n" +
            "                  <td align=\"left\" width=\"75%\" style=\"padding: 6px 12px;font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px;\">Shipping</td>\n" +
            "                  <td align=\"left\" width=\"25%\" style=\"padding: 6px 12px;font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px;\">$6.00</td>\n" +
            "                </tr>\n" +
            "                <tr>\n" +
            "                  <td align=\"left\" width=\"75%\" style=\"padding: 6px 12px;font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px;\">Sales Tax</td>\n" +
            "                  <td align=\"left\" width=\"25%\" style=\"padding: 6px 12px;font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px;\">$0.00</td>\n" +
            "                </tr>\n" +
            "                <tr>\n" +
            "                  <td align=\"left\" width=\"75%\" style=\"padding: 12px; font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px; border-top: 2px dashed #D2C7BA; border-bottom: 2px dashed #D2C7BA;\"><strong>Total</strong></td>\n" +
            "                  <td align=\"left\" width=\"25%\" style=\"padding: 12px; font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px; border-top: 2px dashed #D2C7BA; border-bottom: 2px dashed #D2C7BA;\"><strong>$54.00</strong></td>\n" +
            "                </tr>\n" +
            "              </table>\n" +
            "            </td>\n" +
            "          </tr>\n" +
            "          <!-- end reeipt table -->\n" +
            "\n" +
            "        </table>\n" +
            "        <!--[if (gte mso 9)|(IE)]>\n" +
            "        </td>\n" +
            "        </tr>\n" +
            "        </table>\n" +
            "        <![endif]-->\n" +
            "      </td>\n" +
            "    </tr>\n" +
            "    <!-- end copy block -->\n" +
            "\n" +
            "    <!-- start receipt address block -->\n" +
            "    <tr>\n" +
            "      <td align=\"center\" bgcolor=\"#D2C7BA\" valign=\"top\" width=\"100%\">\n" +
            "        <!--[if (gte mso 9)|(IE)]>\n" +
            "        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\">\n" +
            "        <tr>\n" +
            "        <td align=\"center\" valign=\"top\" width=\"600\">\n" +
            "        <![endif]-->\n" +
            "        <table align=\"center\" bgcolor=\"#ffffff\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width: 600px;\">\n" +
            "          <tr>\n" +
            "            <td align=\"center\" valign=\"top\" style=\"font-size: 0; border-bottom: 3px solid #d4dadf\">\n" +
            "              <!--[if (gte mso 9)|(IE)]>\n" +
            "              <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\">\n" +
            "              <tr>\n" +
            "              <td align=\"left\" valign=\"top\" width=\"300\">\n" +
            "              <![endif]-->\n" +
            "              <div style=\"display: inline-block; width: 100%; max-width: 50%; min-width: 240px; vertical-align: top;\">\n" +
            "                <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width: 300px;\">\n" +
            "                  <tr>\n" +
            "                    <td align=\"left\" valign=\"top\" style=\"padding-bottom: 36px; padding-left: 36px; font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px;\">\n" +
            "                      <p><strong>Delivery Address</strong></p>\n" +
            "                      <p>1234 S. Broadway Ave<br>Unit 2<br>Denver, CO 80211</p>\n" +
            "                    </td>\n" +
            "                  </tr>\n" +
            "                </table>\n" +
            "              </div>\n" +
            "              <!--[if (gte mso 9)|(IE)]>\n" +
            "              </td>\n" +
            "              <td align=\"left\" valign=\"top\" width=\"300\">\n" +
            "              <![endif]-->\n" +
            "              <div style=\"display: inline-block; width: 100%; max-width: 50%; min-width: 240px; vertical-align: top;\">\n" +
            "                <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width: 300px;\">\n" +
            "                  <tr>\n" +
            "                    <td align=\"left\" valign=\"top\" style=\"padding-bottom: 36px; padding-left: 36px; font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px;\">\n" +
            "                      <p><strong>Billing Address</strong></p>\n" +
            "                      <p>1234 S. Broadway Ave<br>Unit 2<br>Denver, CO 80211</p>\n" +
            "                    </td>\n" +
            "                  </tr>\n" +
            "                </table>\n" +
            "              </div>\n" +
            "              <!--[if (gte mso 9)|(IE)]>\n" +
            "              </td>\n" +
            "              </tr>\n" +
            "              </table>\n" +
            "              <![endif]-->\n" +
            "            </td>\n" +
            "          </tr>\n" +
            "        </table>\n" +
            "        <!--[if (gte mso 9)|(IE)]>\n" +
            "        </td>\n" +
            "        </tr>\n" +
            "        </table>\n" +
            "        <![endif]-->\n" +
            "      </td>\n" +
            "    </tr>\n" +
            "    <!-- end receipt address block -->\n" +
            "\n" +
            "    <!-- start footer -->\n" +
            "    <tr>\n" +
            "      <td align=\"center\" bgcolor=\"#D2C7BA\" style=\"padding: 24px;\">\n" +
            "        <!--[if (gte mso 9)|(IE)]>\n" +
            "        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\">\n" +
            "        <tr>\n" +
            "        <td align=\"center\" valign=\"top\" width=\"600\">\n" +
            "        <![endif]-->\n" +
            "        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width: 600px;\">\n" +
            "\n" +
            "          <!-- start permission -->\n" +
            "          <tr>\n" +
            "            <td align=\"center\" bgcolor=\"#D2C7BA\" style=\"padding: 12px 24px; font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 20px; color: #666;\">\n" +
            "              <p style=\"margin: 0;\">You received this email because we received a request for [type_of_action] for your account. If you didn't request [type_of_action] you can safely delete this email.</p>\n" +
            "            </td>\n" +
            "          </tr>\n" +
            "          <!-- end permission -->\n" +
            "\n" +
            "          <!-- start unsubscribe -->\n" +
            "          <tr>\n" +
            "            <td align=\"center\" bgcolor=\"#D2C7BA\" style=\"padding: 12px 24px; font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 20px; color: #666;\">\n" +
            "              <p style=\"margin: 0;\">To stop receiving these emails, you can <a href=\"https://sendgrid.com\" target=\"_blank\">unsubscribe</a> at any time.</p>\n" +
            "              <p style=\"margin: 0;\">Paste 1234 S. Broadway St. City, State 12345</p>\n" +
            "            </td>\n" +
            "          </tr>\n" +
            "          <!-- end unsubscribe -->\n" +
            "\n" +
            "        </table>\n" +
            "        <!--[if (gte mso 9)|(IE)]>\n" +
            "        </td>\n" +
            "        </tr>\n" +
            "        </table>\n" +
            "        <![endif]-->\n" +
            "      </td>\n" +
            "    </tr>\n" +
            "    <!-- end footer -->\n" +
            "\n" +
            "  </table>\n" +
            "  <!-- end body -->\n" +
            "\n" +
            "</body>\n" +
            "</html>";
}
