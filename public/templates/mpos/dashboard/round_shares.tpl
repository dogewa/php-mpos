         <tr>
           <td colspan="2"><b><u>周期贡献数</u></b> <span id='tt'><img src='http://zeit.iwakuang.com/site_assets/mpos/images/questionmark.png' height='15px' width='15px' title='Submitted shares since last found block (ie. round shares)'></span></td>
         </tr>
         <tr>
           <td><b>预估爆块需要贡献数</b></td>
           <td id="b-target" class="right">{$ESTIMATES.shares} (done: {$ESTIMATES.percent}%)</td>
         </tr>
         <tr>
           <td><b>矿池接受贡献数</b></td>
           <td id="b-pvalid" class="right">{$GLOBAL.roundshares.valid}</td>
         </tr>
         <tr>
           <td><b>您的接受贡献数<b></td>
           <td id="b-yvalid" class="right">{$GLOBAL.userdata.shares.valid}</td>
         </tr>
         <tr>
           <td><b>矿池拒绝贡献数</b></td>
           <td id="b-pivalid" class="right">{$GLOBAL.roundshares.invalid}</td>
         </tr>
         <tr>
           <td><b>您的拒绝贡献数</b></td>
           <td id="b-yivalid" class="right">{$GLOBAL.userdata.shares.invalid}</td>
         </tr>
