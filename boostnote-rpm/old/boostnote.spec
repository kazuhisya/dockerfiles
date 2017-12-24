%global debug_package %{nil}
%define bdir	%{_builddir}/%{name}-%{version}

Name:		boostnote
Version:	0.8.19
Release:	1%{?dist}
Summary:	The opensource note app for developer.

Group:		Applications/Editors
License:	GPLv3
URL:		https://github.com/BoostIO/Boostnote
Source0:	boostnote-%{version}.tar.gz
AutoReqProv:	no

%description
Boostnote is an open source note-taking app made for programmers just like you.

%prep
%setup -q -c %{RPM_PACKAGE_NAME}

%build


%install
cd %{bdir}
%{__rm} -rf $RPM_BUILD_ROOT
%{__mkdir} -p $RPM_BUILD_ROOT%{_bindir}/
%{__mkdir} -p $RPM_BUILD_ROOT%{_datadir}/boostnote
%{__mkdir} -p $RPM_BUILD_ROOT%{_datadir}/applications
%{__mkdir} -p $RPM_BUILD_ROOT%{_datadir}/doc/boostnote
%{__mkdir} -p $RPM_BUILD_ROOT%{_datadir}/lintian/overrides
%{__mkdir} -p $RPM_BUILD_ROOT%{_datadir}/pixmaps/

%{__cp} -r %{bdir}/usr/bin/boostnote $RPM_BUILD_ROOT%{_bindir}/boostnote
%{__cp} -r %{bdir}/usr/share/* $RPM_BUILD_ROOT%{_datadir}/

%files
/usr/bin/boostnote
/usr/share/boostnote
/usr/share/applications/boostnote.desktop
/usr/share/doc/boostnote/copyright
/usr/share/lintian/overrides/boostnote
/usr/share/pixmaps/boostnote.png

%changelog

