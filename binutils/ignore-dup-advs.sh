#!/usr/bin/env bash

# Usage: Usually called by "syncbot.sh" script, but can be run separately."

echo "In ignore-dup-advs.sh"

if [ "X$(basename $(pwd))X" == "Xruby-advisory-dbX" ] ; then
    :
else
    echo "Change dir to ruby-advisory-db first."
    exit
fi

rmdups() {
    # (Mixed case gem name) (GHSA#2312) (GHSA#2310)
    rm -f \
        ./gems/arabic-prawn/CVE-2014-2322.yml \
        ./gems/redcloth/CVE-2012-6684.yml

    # empty dirs (rake doesn't like them)
    rmdir gems/arabic-prawn gems/redcloth gems/testdir 2> /dev/null

    # Under rubies/ruby instead of "gems" (OK AS-IS) (GHSA#2437)
    # 5/24/2025: COMMENT OUT PER P/M request.
    # rm -f ./gems/webrick/CVE-2009-4492.yml

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

    # Disputed (8/4/2023: by author) advisory
    # 5/24/2025: COMMENT OUT PER P/M request. 
    # rm -f ./gems/alchemy_cms/CVE-2018-18307.yml

    # 8/13/2023: Waiting on repo author for "Never Patched" clarification.
    # 5/24/2025: COMMENT OUT PER P/M request.
    # rm -f gems/fluentd-ui/CVE-2020-21514.yml \
    #      gems/fluentd/CVE-2020-21514.yml

    # 9/27/2023: https://github.com/theforeman/foreman/pull/9836 (Mentioned "withdrawn") 
    rm -f gems/foreman/CVE-2022-3874.yml

    # 10/4/2023: https://github.com/jquery-ui-rails/jquery-ui-rails/
    #    issues/140 (Probably "abandoned")
    rm -f gems/jquery-ui-rails/CVE-2022-31160.yml

    # 2/28/2024: Duplicates
    rm -f \
	gems/rails/CVE-2024-26142.yml \
	gems/rails/CVE-2024-26143.yml \
	gems/rails/CVE-2024-26144.yml

    # 3/20/2024: Duplicate
    # 5/25/2025: COMMENT OUT PER P/M request.
    # rm -f gems/nokogiri/GHSA-vcc3-rw6f-jv97.yml

    # 5/15/2024: Duplicate
    rm -f gems/nokogiri/GHSA-r3w4-36x6-7r99.yml

    # 9/23/2024: Duplicate of CVE-2024-45409.yml.
    rm -f gems/omniauth-saml/GHSA-cvp8-5r8g-fhvq.yml

    # 10/3/2024; Duplicate of gems/camaleon_cms/
    # GHSA-7x4w-cj9r-h4v9.yml and CVE-2024-45409.yml.
    # 5/25/2025: COMMENT OUT PER P/M request.
    # rm -f gems/camaleon_cms/GHSA-3hp8-6j24-m5gm.yml

    # 10/26/2024: Not a gem, it's an app.
    rm -f gems/Autolab/CVE-2024-49376.yml

    # 2/21/2025: Duplicate of GHSA-vvfq-8hwr-qm4m
    rm -f gems/nokogiri/GHSA-5mwf-688x-mr7x.yml

    # 3/14/2025: Duplicate of [CVE-2025-25292,
    # CVE-2025-25291, CVE-2025-25293]
    # 5/25/2025: COMMENT OUT PER P/M request.
    # rm -f gems/omniauth-saml/GHSA-hw46-3hmr-x9xv.yml

    # 4/16/2025: P/M's comment: "I [postmodern] have temporarily removed
    #   gems/logstash-event/CVE-2014-4326.yml. This does indeed look
    #   like incorrect GHSA data. The original blog post mentions the
    #   elasticsearch/logstash-contrib GitHub repository, which contains
    #   a logstash-contrib.gemspec but doesn't appear to have ever been
    #   released to rubygems.org. Also, the logstash-event gem does not
    #   contain the mentioned vulnerable files (lib/logstash/outputs/
    #   zabbix.rb and lib/logstash/outputs/nagios_nsca.rb).
    rm -f gems/logstash-event/CVE-2014-4326.yml
}

rmdups

# If I have a custom copy, get rid of it.
git checkout -- lib/github_advisory_sync.rb
