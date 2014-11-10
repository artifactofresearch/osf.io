<%inherit file="../base.mako"/>

<%def name="og_description()">

    %if node['description']:
        ${sanitize.strip_html(node['description']) + ' | '}
    %endif
    Hosted on the Open Science Framework


</%def>

<%def name="content()">

<%include file="project_header.mako"/>
<%include file="modal_show_links.mako"/>

${next.body()}

% if node['node_type'] == 'project':
    <%include file="modal_duplicate.mako"/>
% endif

</%def>

<%def name="javascript_bottom()">
<script>

    <% import json %>

    // Import modules
    $script(['/static/js/pointers.js'], 'pointers');


    ## TODO: Move this logic into badges add-on
    % if 'badges' in addons_enabled and badges and badges['can_award']:
    $script(['/static/addons/badges/badge-awarder.js'], function() {
        attachDropDown('${'{}badges/json/'.format(user_api_url)}');
    });
    % endif

    // TODO: Put these in the contextVars object below
    var nodeId = '${node['id']}';
    var userApiUrl = '${user_api_url}';
    var nodeApiUrl = '${node['api_url']}';
    // Mako variables accessible globally
    window.contextVars = {
        currentUser: {
            ## TODO: Abstract me
            username: ${json.dumps(user['username']) | n},
            id: '${user_id}',
            urls: {api: userApiUrl}
        },
        node: {
            ## TODO: Abstract me
            id: nodeId,
            title: ${json.dumps(node['title']) | n},
            urls: {api: nodeApiUrl}
        }
    };

    $script.ready('pointers', function() {
        var pointerDisplay = new Pointers.PointerDisplay('#showLinks');
    });

    // Make unregistered contributors claimable
    % if not user.get('is_contributor'):
    $script(['/static/js/accountClaimer.js'], function() {
        var accountClaimer = new OSFAccountClaimer('.contributor-unregistered');
    });
    % endif

</script>
% if node.get('is_public') and node.get('piwik_site_id'):
<script type="text/javascript">

    $(function() {
        // Note: Don't use cookies for global site ID; cookies will accumulate
        // indefinitely and overflow uwsgi header buffer.
        $.osf.trackPiwik('${ piwik_host }', ${ node['piwik_site_id'] });
    });
</script>
% endif

</%def>
