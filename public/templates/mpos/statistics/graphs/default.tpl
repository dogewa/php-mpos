<article class="module width_full">
  <header>
    <h3 class="tabs_involved">统计</h3>
    <ul class="tabs">
        <li><a href="#mine">我的</a></li>
        <li><a href="#pool">矿池</a></li>
        <li><a href="#both">两者</a></li>
    </ul>
  </header>
  <div class="tab_container">
{include file="{$smarty.request.page|escape}/{$smarty.request.action|escape}/mine.tpl"}
{include file="{$smarty.request.page|escape}/{$smarty.request.action|escape}/pool.tpl"}
{include file="{$smarty.request.page|escape}/{$smarty.request.action|escape}/both.tpl"}
  </div>
</article>
