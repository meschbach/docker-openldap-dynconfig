# Containerized OpenLDAP Serivce
Provides an instance of *slapd* with a dynamic configuration backend.  The default rootDN is *cn=root,cn=config* with the password *secret*.  Please chnage this before exposing this container to any network setup.

## OpenLDAP Version
OpenLDAP 2.4.39

### Compliation Configuration 
Please note this configuration does not include the BDB or HDB backends due to licensing complexities.  The LMDB/MDB backend is compiled in and may be added via the dynamic backend.  Please see *openldap-2.4.39.configure* for the options used in compiling OpenLDAP.

## Container Configuration
OpenLDAP is installed into */opt/openldap-latest* (symlinked ot the current revision).  The dynamic configuration backend is stored at */storage/coniguration*, with the intention of additional databases are stoared at */storage/{role-name}*.  The additional database storage mechanisms may either be volume mapped or kept witihn your instance of the container.

## Copyright
OpenLDAP is under it's own license, please see it at http://openldap.org.  The configuration is public domain; use at your own risk.
