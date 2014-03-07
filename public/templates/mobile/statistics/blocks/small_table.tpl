
  <table width="100%" style="font-size:13px;">
    <thead>
      <tr>
        <th>块ID</th>
        <th>爆块者</th>
        <th>日期</th>
        <th align="right">Shares数</th>
      </tr>
    </thead>
    <tbody>
{assign var=rank value=1}
{section block $BLOCKSFOUND}
      <tr class="{cycle values="odd,even"}">
        <th><a href="{$GLOBAL.website.blockexplorer.url}{$BLOCKSFOUND[block].height}" target="_blank">{$BLOCKSFOUND[block].height}</a></th>
        <td>{if $BLOCKSFOUND[block].is_anonymous|default:"0" == 1 && $GLOBAL.userdata.is_admin|default:"0" == 0}anonymous{else}{$BLOCKSFOUND[block].finder|default:"unknown"|escape}{/if}</td>
        <td>{date('Y-m-d H:i:s', $BLOCKSFOUND[block].time+0*60*60)}</td>
        <td align="right">{$BLOCKSFOUND[block].shares|number_format}</td>
      </tr>
{/section}
    </tbody>
  </table>
