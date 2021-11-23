#!/bin/bash
if [ -z "$(ls -A /var/output/)" ]; then
  dotnet /app/DiscordChatExporter.Cli.dll export --channel -c $1 -t $2 -o /var/output/initial-%g-%c-%a-%b.csv -f Csv --before "`date +"%Y-%m-%d %H:%M:%S" -d '1 min ago'`" --dateformat unix
fi

while true
do
  dotnet /app/DiscordChatExporter.Cli.dll export --channel -c $1 -t $2 -o /var/output/%g-%c-`date +"+%s" -d '1 min ago'`.csv -f Csv --after "`date +"%Y-%m-%d %H:%M:%S" -d '1 min ago'`" --dateformat unix
  sleep 60
done