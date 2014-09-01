FROM meschbach/ubuntu-1404-utd 
RUN adduser --system --group --disabled-login -uid 389 ldap
ADD openldap-2.4.39.tgz /opt/openldap
ADD utilities /utilities
RUN ln -s /opt/openldap/openldap-2.4.39 /opt/openldap/openldap-latest
RUN mkdir -p /storage && chown -R ldap:ldap /utilities /storage /opt
USER ldap
RUN /utilities/initialize.sh
CMD exec /opt/openldap/openldap-latest/libexec/slapd -d 0 -F /storage/configuration -h ldap://0.0.0.0:1025
