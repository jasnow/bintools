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

# ADD THESE:
    # APP-NOT-RUBY: 10/26/2024, 1/19/2026: Not a gem, it's an app.
    rm -f ./gems/Autolab/CVE-2024-49376.yml

    # DUPLICATE: 9/23/2024,1/19/2026: Duplicate of gems/ruby-saml/CVE-2024-45409.yml
    rm -f ./gems/omniauth-saml/GHSA-cvp8-5r8g-fhvq.yml

    # DUPLICATE: 1/19/2026 Duplicate of gems/actionpack/CVE-2024-26143.
    rm -f ./gems/rails/CVE-2024-26143.yml

    # DUPLICATE: 1/19/2026 Duplicate of gems/Arabic-Prawn/CVE-2014-2322.yml
    rm -f ./gems/arabic-prawn/CVE-2014-2322.yml \

    # DUPLICATE: 1/19/2026 Duplicate of gems/RedCloth/CVE-2012-6684.yml#
    rm -f ./gems/redcloth/CVE-2012-6684.yml \

    # 1/19/2026: Used CVE instead of GHSA id.
    rm -f \
        ./gems/user_agent_parser/GHSA-pcqq-5962-hvcw.yml \
        ./gems/nokogiri/GHSA-fq42-c5rg-92c2.yml \
        ./gems/nokogiri/GHSA-gx8x-g87m-h5q6.yml \
        ./gems/nokogiri/GHSA-v6gp-9mmm-c6p5.yml \
        ./gems/nokogiri/GHSA-xxx9-3xcr-gjj3.yml

    # 1/19/2026: Empty dirs (rake doesn't like them)
    rmdir gems/arabic-prawn gems/redcloth gems/testdir 2> /dev/null

#STOPHERE#############################################################

    # (Used CVE instead of GHSA id)
# Commented out of 1/19/2026.
#    rm -f \
#        ./gems/spree_auth_devise/GHSA-6mqr-q86q-6gwr.yml \
#        ./gems/spree_auth_devise/GHSA-8xfw-5q82-3652.yml \
#        ./gems/spree_auth_devise/GHSA-gpqc-4pp7-5954.yml \

    # 9/27/2023: https://github.com/theforeman/foreman/pull/9836
    #   (Mentioned "withdrawn") 
# Commented out of 1/19/2026.
#    rm -f gems/foreman/CVE-2022-3874.yml

    # 10/4/2023: https://github.com/jquery-ui-rails/jquery-ui-rails/
    #    issues/140 (Probably "abandoned")
# Commented out of 1/19/2026.
#    rm -f gems/jquery-ui-rails/CVE-2022-31160.yml

    # 2/28/2024: Duplicates
# Commented out of 1/19/2026.
#    rm -f \
#	gems/rails/CVE-2024-26142.yml \
#	gems/rails/CVE-2024-26144.yml

    # 5/15/2024: Duplicate
# Commented out of 1/19/2026.
#    rm -f gems/nokogiri/GHSA-r3w4-36x6-7r99.yml

    # 2/21/2025: Duplicate of GHSA-vvfq-8hwr-qm4m
# Commented out of 1/19/2026.
#    rm -f gems/nokogiri/GHSA-5mwf-688x-mr7x.yml

    # 4/16/2025: P/M's comment: "I [postmodern] have temporarily removed
    #   gems/logstash-event/CVE-2014-4326.yml. This does indeed look
    #   like incorrect GHSA data. The original blog post mentions the
    #   elasticsearch/logstash-contrib GitHub repository, which contains
    #   a logstash-contrib.gemspec but doesn't appear to have ever been
    #   released to rubygems.org. Also, the logstash-event gem does not
    #   contain the mentioned vulnerable files (lib/logstash/outputs/
    #   zabbix.rb and lib/logstash/outputs/nagios_nsca.rb).
# Commented out of 1/19/2026.
#    rm -f gems/logstash-event/CVE-2014-4326.yml

    # 9/1/2025: P/M: "Removed both gems/bootstrap-sass/CVE-2024-6484.yml
    #  and gems/bootstrap/CVE-2024-6484.yml in 1be9b4a."
# Commented out of 1/19/2026.
#    rm -f gems/bootstrap-sass/CVE-2024-6484.yml \
#          gems/bootstrap/CVE-2024-6484.yml

######################################################################
# Commented out before 1/19/2026

    # Disputed (8/4/2023: by author) advisory
    # 5/24/2025: COMMENT OUT PER P/M request. 
    # rm -f ./gems/alchemy_cms/CVE-2018-18307.yml

    # 8/13/2023: Waiting on repo author for "Never Patched" clarification.
    # 5/24/2025: COMMENT OUT PER P/M request.
    # rm -f gems/fluentd-ui/CVE-2020-21514.yml \
    #      gems/fluentd/CVE-2020-21514.yml

    # 3/20/2024: Duplicate
    # 5/25/2025: COMMENT OUT PER P/M request.
    # rm -f gems/nokogiri/GHSA-vcc3-rw6f-jv97.yml

    # 10/3/2024; Duplicate of gems/camaleon_cms/
    # GHSA-7x4w-cj9r-h4v9.yml and CVE-2024-45409.yml.
    # 5/25/2025: COMMENT OUT PER P/M request.
    # rm -f gems/camaleon_cms/GHSA-3hp8-6j24-m5gm.yml

    # 3/14/2025: Duplicate of [CVE-2025-25292,
    # CVE-2025-25291, CVE-2025-25293]
    # 5/25/2025: COMMENT OUT PER P/M request.
    # rm -f gems/omniauth-saml/GHSA-hw46-3hmr-x9xv.yml


    # Duplicates:
    # ghsa-g47j-3m2m-74qv (Duplicate)
    # ghsa-vfpf-xmwh-8m65 (Duplicate)

    # Under rubies/ruby instead of "gems" (OK AS-IS) (GHSA#2437)
    # 5/24/2025: COMMENT OUT PER P/M request.
    # rm -f ./gems/webrick/CVE-2009-4492.yml
}

rmdups

# If I have a custom copy, get rid of it.
git checkout -- lib/github_advisory_sync.rb

######################################################################
# 1/16/2026: o_44_plus below
#(WAIT/RUBY TOOL) gem/rvm/CVE-2017-1000037.yml
#         -- https://rubygems.org/gems/rvm (last release in 2014)
######################################################################
#(ADDED) gem/rollout-ui/CVE-2023-25309.yml
#         -- https://rubygems.org/gems/rollout-ui
#......................................................................
#DISPUTED:    gem/actionpack/CVE-2022-3704.yml
#DISPUTED:    gem/rails/CVE-2022-3704.yml
#DISPUTED:    gem/nokogiri/CVE-2025-6490.yml
#DISPUTED:    gem/nokogiri/CVE-2025-6494.yml
#DISPUTED:    gem/nokogiri/CVE-2023-45322.yml
#DISPUTED:    gem/agoo/CVE-2022-30288.yml
#......................................................................
#REJECTED:    gem/devise-two-factor/CVE-2024-0227.yml
#REJECTED:    gem/doorkeeper/CVE-2012-5664.yml
#REJECTED:    gem/bootstrap/CVE-2024-6484.yml
#REJECTED:    gem/bootstrap-sass/CVE-2024-6484.yml
#......................................................................
#PYTHON       gem/mechanize/CVE-2021-32837.yml
#PTTHON       gem/user_agent_parser/CVE-2018-20164.yml
#PYTHON       gem/jubatus/CVE-2018-0524.yml
#PYTHON       gem/jubatus/CVE-2018-0525.yml
#......................................................................
#WITHDRAWN    gem/metasploit-framework/CVE-2023-0669.yml (not ruby)
#......................................................................
#NOT RUBY     gem/head_start/CVE-2023-40617.yml
#NOT RUBY     gem/head_start/CVE-2023-40618.yml
#NOT RUBY     gem/oneview/CVE-2022-28625.yml
#NOT RUBY     gem/oneview/CVE-2023-28091.yml
#NOT RUBY     gem/oneview/CVE-2023-30909.yml
#NOT RUBY     gem/opensearch/CVE-2022-41917.yml
#NOT RUBY     gem/opensearch/CVE-2022-41918.yml
#NOT RUBY     gem/opensearch/CVE-2023-23933.yml
#NOT RUBY     gem/opensearch/CVE-2023-25806.yml
#NOT RUBY     gem/opensearch/CVE-2023-31141.yml
#NOT RUBY     gem/opensearch/CVE-2023-45807.yml
#NOT RUBY     gem/rugged/CVE-2018-10887.yml (libgit2)
#NOT RUBY     gem/rugged/CVE-2018-10888.yml (libgit2)
#NOT RUBY     gem/rugged/CVE-2018-15501.yml (libgit2)
#NOT RUBY     gem/rugged/CVE-2020-12278.yml (libgit2)
#NOT RUBY     gem/rugged/CVE-2020-12279.yml (libgit2)
#NOT RUBY     gem/rugged/CVE-2023-22742.yml (libgit2)
#NOT RUBY     gem/rugged/CVE-2014-9390.yml (libgit2)
#NOT RUBY     gem/json/CVE-2020-7712.yml (node.js)
#NOT RUBY     gem/bson/CVE-2020-7610.yml (node.js)
#NOT RUBY     gem/net-ssh/CVE-2023-48795.yml (javascript, python)
######################################################################
#RAILSAPP     gem/arvados/CVE-2022-36006.yml
#RAILSAPP     gem/arvados/CVE-2022-39238.yml
#......................................................................
#APP-NOT-RUBY gem/Autolab/CVE-2024-49376.yml
#WRONG THING  gem/gem_publisher/CVE-2019-10426.yml
#WRONG THING  gem/kontena-cli/CVE-2018-8728.yml
#NOT NOKOGIRI gem/nokogiri/CVE-2016-1683.yml
#EOF
