<?php

// Make sure we are called from index.php
if (!defined('SECURITY'))
  die('Hacking attempt');

class Mail extends Base {
  /**
  * Mail form contact site admin
  * @param senderName string senderName
  * @param senderEmail string senderEmail
  * @param senderSubject string senderSubject
  * @param senderMessage string senderMessage
  * @param email string config Email address
  * @param subject string header subject
  * @return bool
  **/
  public function contactform($senderName, $senderEmail, $senderSubject, $senderMessage) {
    $this->debug->append("STA " . __METHOD__, 4);
    if (preg_match('/[^a-z_\.\!\?\-0-9\\s ]/i', $senderName)) {
      $this->setErrorMessage($this->getErrorMsg('E0024'));
      return false;
    }
    if (empty($senderEmail) || !filter_var($senderEmail, FILTER_VALIDATE_EMAIL)) {
      $this->setErrorMessage($this->getErrorMsg('E0023'));
      return false;
    }
    if (preg_match('/[^a-z_\.\!\?\-0-9\\s ]/i', $senderSubject)) {
      $this->setErrorMessage($this->getErrorMsg('E0034'));
      return false;
    }
    if (strlen(strip_tags($senderMessage)) < strlen($senderMessage)) {
      $this->setErrorMessage($this->getErrorMsg('E0024'));
      return false;
    }
    $aData['senderName'] = $senderName;
    $aData['senderEmail'] = $senderEmail;
    $aData['senderSubject'] = $senderSubject;
    $aData['senderMessage'] = $senderMessage;
    $aData['email'] = $this->setting->getValue('website_email');
    $aData['subject'] = 'Contact From';
      if ($this->sendMail('contactform/body', $aData)) {
        return true;
     } else {
       $this->setErrorMessage( 'Unable to send email' );
       return false;
     }
    return false;
  }

  /**
   * Send a mail with templating via Smarty
   * @param template string Template name within the mail folder, no extension
   * @param aData array Data array with some required fields
   *     SUBJECT : Mail Subject
   *     email   : Destination address
   **/
  public function sendMail($template, $aData) {
    // Make sure we don't load a cached filed
    $this->smarty->clearCache(BASEPATH . 'templates/mail/' . $template  . '.tpl');
    $this->smarty->clearCache(BASEPATH . 'templates/mail/subject.tpl');
    $this->smarty->assign('WEBSITENAME', $this->setting->getValue('website_name'));
    $this->smarty->assign('SUBJECT', $aData['subject']);
    $this->smarty->assign('DATA', $aData);
    $headers = 'From: Website Administration <' . $this->setting->getValue('website_email') . ">\n";
    $headers .= "MIME-Version: 1.0\n";
    $headers .= "Content-Type: text/html; charset=ISO-8859-1\r\n";
    if (strlen(@$aData['senderName']) > 0 && @strlen($aData['senderEmail']) > 0 )
      $headers .= 'Reply-To: ' . $aData['senderName'] . ' <' . $aData['senderEmail'] . ">\n";
//    if (mail($aData['email'], $this->smarty->fetch(BASEPATH . 'templates/mail/subject.tpl'), $this->smarty->fetch(BASEPATH . 'templates/mail/' . $template  . '.tpl'), $headers))
//      return true;
    if($this->send($aData['email'],$this->smarty->fetch(BASEPATH . 'templates/mail/subject.tpl'),$this->smarty->fetch(BASEPATH . 'templates/mail/' . $template  . '.tpl')))
      return true;
    $this->setErrorMessage($this->sqlError('E0031'));
    return false;
  }

  public function send($to, $subject, $body){
    $mail = new PHPMailer;

    $mail->isSMTP();                                      // Set mailer to use SMTP
    $mail->Host = $this->config['email']['Host'] ;  // Specify main and backup server
    $mail->Port = $this->config['email']['Port'];
    $mail->SMTPAuth = $this->config['email']['SMTPAuth'];                               // Enable SMTP authentication
    $mail->Username =$this->config['email']['Username'];                            // SMTP username
    $mail->Password = $this->config['email']['Password'] ;                           // SMTP password
    $mail->SMTPSecure = $this->config['email']['SMTPSecure'];                            // Enable encryption, 'ssl' also accepted

    $mail->From = $this->config['email']['From'];
    $mail->FromName = $this->config['email']['FromName'] ;
    $mail->addAddress($to);               // Name is optional

    $mail->WordWrap = 50;                                 // Set word wrap to 50 characters
    $mail->isHTML(true);                                  // Set email format to HTML

    $mail->Subject = $subject;
    $mail->Body    = $body;
//    $mail->AltBody = 'This is the body in plain text for non-HTML mail clients';

    if(!$mail->send()) {
      return false;
    }
    return true;
  }

}

// Make our class available automatically
$mail = new Mail ();
$mail->setDebug($debug);
$mail->setMysql($mysqli);
$mail->setSmarty($smarty);
$mail->setConfig($config);
$mail->setSetting($setting);
$mail->setErrorCodes($aErrorCodes);
?>
