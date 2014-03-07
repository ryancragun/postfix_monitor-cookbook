# postfix_monitor cookbook

This cookbook enables the tail collectd plugin and configures an instance that monitors postfix activity.

# Requirements

* Chef 10 or higher
* RightScale RightLink and 12.11.3 or higher version of the `rightscale` cookbook.

# Attributes

The following are the attributes used by the this cookbook.
<table>
  <tr>
    <th>Name</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>node['postfix_monitor']['enable_plugin']</tt></td>
    <td>Enable or disable creating the configuration file</td>
    <td><tt>'true'</tt></td>
  </tr>
  <tr>
    <td><tt>node['postfix_monitor']['mail_log']</tt></td>
    <td>The full path to the postfix mail log</td>
    <td><tt>'/mnt/ephemeral'</tt></td>
  </tr>
</table>

# Usage

Place the `postfix_monitor::default` recipe in the runlist.

# Recipes

`postfix_monitor::default`
This recipe ensures collectd is installed and configures a tail plugin instance that monitors postfix activity.

# Author

Author:: Ryan Cragun. (<ryan@rightscale.com>)
