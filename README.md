# Discord Technical Addon

This technical addon (TA) builds on the great [DiscordChatExporter](https://github.com/Tyrrrz/DiscordChatExporter) to ingest Discord chat archives.

This addon configures Splunk to ingest the CSV files produced by the exporter.

We provide an example Docker Compose set up for you to try it out.

### Instructions ###

If you plan on collecting data directly on the Search Head (SH) then you can just install this TA there.  If you are using a Universal Forwarder you will need to install it on both the Universal Forwarder (will use the inputs.conf) and Search Head (will use the props.conf)

The input is disabled by default.  Only enable it on the instance you plan to collect the discord CSVs from.  The default directory to unload the csvs into is $SPLUNK_HOME/etc/apps/TA_discord/data/

Restart your Splunk instances after setting disabled=0 in inputs.conf and confirming csv directory location.

### Docker-compose end to end example ###

Copy `.env.example` into `.env` and fill the `CHANNEL_ID` and `DISCORD_TOKEN` values per the comment in the file.

Run:
```bash
$> docker-compose up -d
```

It will bring up Splunk on port 18000. Connect to `http://localhost:18000` with admin/changeme to access the data.

Enable the TA to start ingesting data.

Search the `discord` index for data.

### Support ###

Send any questions to blockchain@splunk.com.