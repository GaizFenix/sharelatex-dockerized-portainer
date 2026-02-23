FROM sharelatex/sharelatex:latest

# Full install
RUN tlmgr update --self && tlmgr install scheme-full

# Add the cron job for scheduled updates
COPY cron/tlmgr-update /etc/cron.d/tlmgr-update
RUN chmod 0644 /etc/cron.d/tlmgr-update
