# What is this?

I wanted to keep stats across reboots and possibly work on integrating with the pools to better track mining information.

This is just the very start and currently doesn't have much functionality.

Currently activeadmin is the only way to view data....  but like I said.. just a start

## Getting started

### Deploy Rails
Hopefully you understand enough about rails to deploy a rails application.  Deploy and migrate your application.

ActiveAdmin is installed and you should login and change the default Admin info.


### Copy Perl Script to /opt/bamt

I created a perl script `data_post.pl` that posts gpu stats data to the rails app

```perl
#!/usr/bin/perl

eval
{
 require '/opt/bamt/common.pl';
};

use LWP::UserAgent;


my (@gpus) = &getFreshGPUData;
for (my $k = 0;$k < @gpus;$k++)
{
        my $ua = LWP::UserAgent->new;

        my $server_endpoint = "http://XXXXXX Your Rails app domain or ip XXXXXXXXX/api/v1/gpu_stats";

        # set custom HTTP request header fields
        my $req = HTTP::Request->new(POST => $server_endpoint);
        $req->header('content-type' => 'application/json');


        $msg = '{"gpu_stat":{"miner":"' . $gpus[$k]{'miner'} . '","hardware_errors":"' . $gpus[$k]{'hardware_errors'} . '","current_performance_level":"' . $gpus[$k]{'current_performance_level'} . '","current_powertune":"' . $gpus[$k]{'current_powertune'} . '","display":"' . $gpus[$k]{'display'} . '","fan_speed":"' . $gpus[$k]{'fan_speed'} . '","current_temp_0":"' . $gpus[$k]{'current_temp_0'} . '","current_core_clock":"' . $gpus[$k]{'current_core_clock'} . '","current_load":"' . $gpus[$k]{'current_load'} . '","hashrate":' . $gpus[$k]{'hashrate'} . ',"shares_invalid":"' . $gpus[$k]{'shares_invalid'} . '","fan_rpm":"' . $gpus[$k]{'fan_rpm'} . '","shares_accepted":"' . $gpus[$k]{'shares_accepted'} . '","pool_url":"' . $gpus[$k]{'pool_url'} . '","desc":"' . $gpus[$k]{'desc'} . '","current_mem_clock":"' . $gpus[$k]{'current_mem_clock'} . '","current_core_voltage":"' . $gpus[$k]{'current_core_voltage'} . '"}}';

        # add POST data to HTTP request body
        $req->content($msg);

        my $resp = $ua->request($req);
}


```

### Update your crotab


```txt
0 * * * *       root	/opt/bamt/data_post.pl
5 * * * *       root	/opt/bamt/data_post.pl
10 * * * *       root	/opt/bamt/data_post.pl
15 * * * *       root	/opt/bamt/data_post.pl
20 * * * *       root	/opt/bamt/data_post.pl
25 * * * *       root	/opt/bamt/data_post.pl
30 * * * *       root	/opt/bamt/data_post.pl
35 * * * *       root	/opt/bamt/data_post.pl
45 * * * *       root	/opt/bamt/data_post.pl
50 * * * *       root	/opt/bamt/data_post.pl
55 * * * *       root	/opt/bamt/data_post.pl

```

### Now data should be sent to your rails app


# Where to go from here.....

Graphs
Stats
Integrations with MPOS
