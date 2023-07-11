#======================================================================
    # rmboth.sh files:
    #  gems/grpc/CVE-2023-32731.yml
    #  gems/jquery-rails/CVE-2012-6708.yml
    #  gems/jquery-rails/CVE-2015-9251.yml
    #  gems/jquery-rails/CVE-2020-7656.yml
    #  gems/nokogiri/CVE-2021-3518.yml
    #  gems/nokogiri/CVE-2021-3537.yml
#......................................................................
rm gems/nokogiri/GHSA-fq42-c5rg-92c2.yml
    # Use Case 1
#......................................................................
rm gems/spree_auth_devise/GHSA-8xfaw-5q82-3652.yml
    # Use Case 2
#......................................................................
rm gems/webrick/CVE-2009-4492.yml
    # Use Case 3
    # 7/8/2023 P/M RESPONSE(A): gems/webrick/CVE-2009-4492.yml (ONE LINE,
    # ONCE VALUE) - webrick versions jump from 1.3.1 to 1.4.0.
    # AL>> (How did the script know that?) (Use Case 3) (ASSUME NO IN-BETWEEN)
#......................................................................
echo "Need PR#678: https://github.com/advisories/GHSA-6mq2-37j5-w6r6 (webrick)"
#......................................................................
echo "Need PR#678: https://github.com/advisories/GHSA-f5ww-cq3m-q3g7 (sanitize)"
#......................................................................
rm gems/rest-client/CVE-2019-15224.yml # (Add to "more" repo") (IGNORED 2nd VVR)
    # 7/8/2023 P/M RESPONSE(C): ghsa: 333g-rpr4-7hxq - that's correct, 
    # we want to match the lower-bound of the least vulnerableVersionRange.
#......................................................................
rm gems/cocoapods-downloader/CVE-2022-24440.yml
    #7/8/2023 P/M RESPONSE(D)
    #GHSA-7627-mp87-jf6q - ah ha, it appears I do need to sort the 
    #vulnerableVersionRanges. It should view < 1.6.0 as the first
    #vulnerableVersionRange.
    #AL>> Need fix.
#......................................................................
rm gems/activerecord/CVE-2015-7577.yml
    # 7/8/2023 P/M RESPONSE(E): gems/activerecord/CVE-2015-7577.yml - Also
    # needs sorting and should output < 3.1.0.
    # AL>> Need Fix.
######################################################################
rm gems/strong_password/CVE-2019-13354.yml
######################################################################
# Day 3
rm gems/rails/CVE-2014-0081.yml         #1/  - "~> 4.1.0.beta2"
rm gems/nokogiri/CVE-2020-26247.yml     #2/  - ">= 1.11.0.rc4"
rm gems/railties/CVE-2019-5420.yml      #3/  - ">= 6.0.0.beta3"
rm gems/passenger/CVE-2012-6135.yml     #4A/ - "< 4.0.0.beta"
rm gems/publify_core/CVE-2021-25973.yml #4B/ - "< 9.0.0.pre1"
rm gems/sinatra/CVE-2018-11627.yml      #5/  - 2.0.0-alpha, ALSO "< 2.0.0.beta1"
