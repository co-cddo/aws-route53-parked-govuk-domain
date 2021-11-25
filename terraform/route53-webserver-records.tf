# TBC

# Likely need a CloudFront with a *.gov.uk TLS certificate that
# can be used as a CNAME, and a simple Function/Lambda@Edge to
# parse the host request header and if a "gov.uk" domain, forward
# to "https://www.gov.uk"
