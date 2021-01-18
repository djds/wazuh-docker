#!/bin/bash

# Wazuh Docker Copyright (C) 2021 Wazuh Inc. (License GPLv2)

set -euo pipefail

if [[ "${CHANGE_WELCOME}" = "true" ]]; then
    printf "Set Wazuh app as the default landing page\n"
    printf "server.defaultRoute: /app/wazuh\n" >>'/usr/share/kibana/config/kibana.yml'

    printf "Set custom welcome styles\n"
    cp -f /tmp/custom_welcome/template.js.hbs /usr/share/kibana/src/legacy/ui/ui_render/bootstrap/template.js.hbs
    cp -f /tmp/custom_welcome/light_theme.style.css /usr/share/kibana/src/core/server/core_app/assets/legacy_light_theme.css
    cp -f /tmp/custom_welcome/*svg /usr/share/kibana/src/core/server/core_app/assets/
fi
