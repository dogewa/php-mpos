{include file="statistics/pool/contributors_hashrate.tpl"}

{if $smarty.session.AUTHENTICATED|default:"0" == 1 && ($GLOBAL.userdata.is_admin == 1 || $Global.userdata.is_vip)}

{include file="statistics/pool/contributors_shares.tpl"}

{include file="statistics/pool/general_stats.tpl"}

{include file="statistics/blocks/small_table.tpl" ALIGN="right" SHORT=true}
{/if}
{if !$GLOBAL.website.api.disabled && !$GLOBAL.config.disable_navbar && !$GLOBAL.config.disable_navbar_api}
{include file="statistics/js.tpl"}
{/if}
