#!/usr/bin/env bash

# enable arb_utils globally on machine
# use version 0.0.2 which is dart compliant
# dart pub global activate arb_utils 0.0.2

# generate from csv
fvm dart run arb_generator

# sort arbs
# pub global run arb_utils:sort assets_dev/l10n/l10n_en.arb

# generate localization delegates
fvm flutter gen-l10n
