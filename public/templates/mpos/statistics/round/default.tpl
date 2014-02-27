{if $smarty.session.AUTHENTICATED|default:"0" == 1 && $GLOBAL.userdata.is_admin == 1}
{if $GLOBAL.config.payout_system == 'pplns'}
   {include file="statistics/round/pplns_block_stats.tpl"}
   {include file="statistics/round/pplns_transactions.tpl"}
   {include file="statistics/round/round_shares.tpl"}
   {include file="statistics/round/pplns_round_shares.tpl"}
{else if $GLOBAL.config.payout_system == 'prop'}
   {include file="statistics/round/block_stats.tpl"}
   {include file="statistics/round/round_shares.tpl"}
   {include file="statistics/round/round_transactions.tpl"}
{else}
   {include file="statistics/round/block_stats.tpl"}
   {include file="statistics/round/round_shares.tpl"}
{/if}
{/if}
