#!/bin/bash
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# docker-entrypoint for Solr docker

set -e

if [[ "$VERBOSE" == "yes" ]]; then
    set -x
fi

if [[ -v NIFI2_URL && -n "$NIFI2_URL" ]]; then
    /app/create-nifi-toolkit-properties.sh /opt/nifi/conf
fi


# run all the shell scripts in the init folder once
source run-init

# execute command passed in as arguments.
exec "$@"
