# Discord Technical Addon

This technical addon (TA) builds on the great [DiscordChatExporter](https://github.com/Tyrrrz/DiscordChatExporter) to ingest Discord chat archives.

This addon configures Splunk to ingest the CSV files produced by the exporter.

You can also choose to run the OpenTelemetry Collector to collect CSV data.

We provide an example Docker Compose set up for you to try it out.

## Instructions as a Splunk addon

If you plan on collecting data directly on the Search Head (SH) then you can just install this TA there.  If you are using a Universal Forwarder you will need to install it on both the Universal Forwarder (will use the inputs.conf) and Search Head (will use the props.conf)

The input is disabled by default.  Only enable it on the instance you plan to collect the discord CSVs from.  The default directory to unload the csvs into is $SPLUNK_HOME/etc/apps/TA_discord/data/

Restart your Splunk instances after setting disabled=0 in inputs.conf and confirming csv directory location.

## Instructions with OpenTelemetry Collector

This addon can also work with the OpenTelemetry Collector, using the collector to collect the CSV file contents and send it to Splunk.

This repository contains the necessary configuration for the OpenTelemetry Collector to pick up the data under the file [`otel-collector-config.yml`](otel-collector-config.yml).

In this case, you just need to edit the configuration of the collector to point at your Splunk instance HEC endpoint with a valid HEC token.

### Docker-compose end to end example

Copy `.env.example` into `.env` and fill the `CHANNEL_ID` and `DISCORD_TOKEN` values per the comment in the file.

Run:
```bash
$> docker-compose up -d
```

It will bring up Splunk on port 18000. Connect to `http://localhost:18000` with admin/changeme to access the data.

Search the `discord` index for data.

## Support

Send any questions to blockchain@splunk.com.

## License

Copyright 2021 Splunk Inc.
 
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at
 
http://www.apache.org/licenses/LICENSE-2.0
 
Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
