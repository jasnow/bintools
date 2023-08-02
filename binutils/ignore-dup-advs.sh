#!/usr/bin/env bash

# Usage: Usually called by "syncbot.sh" script, but can be run separately."

rmdups() {
    # (Mixed case gem name) (GHSA#2312) (GHSA#2310)
    rm -f \
        ./gems/arabic-prawn/CVE-2014-2322.yml \
        ./gems/redcloth/CVE-2012-6684.yml

    # empty dirs (rake doesn't like them)
    rmdir gems/arabic-prawn gems/redcloth gems/testdir 2> /dev/null

    # Under rubies/ruby instead of "gems" (OK AS-IS) (GHSA#2437)
    rm -f ./gems/webrick/CVE-2009-4492.yml

    # (Used CVE instead of GHSA id) (GHSA#2316) (GHSA#2315) (GHSA#2314) among others
    rm -f \
        ./gems/spree_auth_devise/GHSA-6mqr-q86q-6gwr.yml \
        ./gems/spree_auth_devise/GHSA-8xfw-5q82-3652.yml \
        ./gems/spree_auth_devise/GHSA-gpqc-4pp7-5954.yml \
        ./gems/user_agent_parser/GHSA-pcqq-5962-hvcw.yml \
        ./gems/nokogiri/GHSA-fq42-c5rg-92c2.yml \
        ./gems/nokogiri/GHSA-gx8x-g87m-h5q6.yml \
        ./gems/nokogiri/GHSA-v6gp-9mmm-c6p5.yml \
        ./gems/nokogiri/GHSA-xxx9-3xcr-gjj3.yml
}

rmdups

# If I have a custom copy, get rid of it.
git checkout -- lib/github_advisory_sync.rb
