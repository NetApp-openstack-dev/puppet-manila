# == defnie: manila::network::nova_network
#
# Setup and configure Nova Networking communication
#
# === Parameters
#
# [*share_backend_name*]
# (required) Name of the backend in manila.conf that
# these settings will reside in
#
# [*nova_single_network_plugin_net_id*]
# (required) Default Nova network that will be used for share servers.
# This opt is used only with class 'NovaSingleNetworkPlugin'.
#

define manila::network::nova_network (
  $share_backend_name                = $name,
  $nova_single_network_plugin_net_id = undef,
) {

  $nova_net_plugin_name = 'manila.network.nova_network_plugin.NovaNetworkPlugin'

  manila_config {
    "${share_backend_name}/network_api_class":                 value => $nova_net_plugin_name;
    "${share_backend_name}/nova_single_network_plugin_net_id": value => $nova_single_network_plugin_net_id;
  }
}
