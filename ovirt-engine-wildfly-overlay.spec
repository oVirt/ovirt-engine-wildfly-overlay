Name:		ovirt-engine-wildfly-overlay
Version:	13.0.0
Release:	1%{?dist}
Summary:	WildFly 11 overlay for ovirt-engine
Group:		Virtualization/Management
License:	ASL-2.0
URL:		http://www.ovirt.org
BuildArch:	noarch
Source0:	README

Requires:	ovirt-engine-wildfly >= 13.0.0
Conflicts:	ovirt-engine-wildfly >= 14.0.0

%description
WildFly 11 overlay for ovirt-engine

%install
install -d -m 0755 "%{buildroot}%{_docdir}/%{name}"
install -m 0644 "%{SOURCE0}" "%{buildroot}%{_docdir}/%{name}/README"
install -d -m 0755 "%{buildroot}%{_datadir}/%{name}/modules"

%files
%{_datadir}/%{name}/
%{_docdir}/%{name}/

%changelog
* Wed May 23 2018 Martin Perina <mperina@redhat.com> 13.0.0-1
- Initial release for WildFly 13

* Mon Aug 28 2017 Martin Perina <mperina@redhat.com> 11.0.1-1
- Added dependency on relevant ovirt-engine-wildfly package

* Tue Aug 15 2017 Martin Perina <mperina@redhat.com> 11.0.0-1
- Initial release for WildFly 11
