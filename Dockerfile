#
# OpenLDAP Container exposing the dynamic backend
# Please see http://openldap.org/ for copyright information
#
# MetaData 
#
FROM meschbach/ubuntu-1404-utd 
MAINTAINER Mark Eschbach <meschbach@gmail.com>

#
# Pull in binaries && ensure using user 389
#
RUN adduser --system --group --disabled-login -uid 389 ldap
ADD openldap-2.4.39.tgz /opt/openldap
ADD utilities /utilities
RUN ln -s /opt/openldap/openldap-2.4.39 /opt/openldap/openldap-latest
RUN mkdir -p /storage && chown -R ldap:ldap /utilities /storage /opt

#
# Build configuration structure
#
USER ldap
RUN /utilities/initialize.sh

#
# Run time configuration
#
USER ldap
EXPOSE 1025
CMD exec /opt/openldap/openldap-latest/libexec/slapd -d 0 -F /storage/configuration -h ldap://0.0.0.0:1025
