%define name albert
%define version 0.14.18

%define prefix     /usr
%define bindir     /usr/bin
%define libdir     /usr/lib64
%define mandir     /usr/share/man
%define datadir    /usr/share
%define sysconfdir /etc
%define libexecdir /usr/libexec/albert
%define pixmapdir  /usr/share/pixmaps

Summary:     A DE agnostic omnilauncher.
Name:        %{name}
Version:     %{version}
Release:     1%{?dist}
License:     GPL
Group:       User Interface/X
URL:         https://github.com/albertlauncher/albert
Source0:     https://github.com/albertlauncher/%{name}/archive/v%{version}.tar.gz#/%{name}-%{version}.tar.gz

# Source10:    %%name.desktop
# Source11:    %%name.png

Packager:    Rabin .Y
Requires:    qt5-qtbase libX11 muParser qt5-qtx11extras python-keybinder qt5-qtsvg
Requires:    qt5-qtgraphicaleffects qt5-qtquickcontrols

BuildRequires: cmake qt5-qtbase qt5-qttools 
BuildRequires: qt5-qtbase-devel qt5-qtx11extras-devel muParser-devel
BuildRequires: qt5-qtsvg-devel qt5-qtdeclarative-devel
BuildRequires: qt5-qtgraphicaleffects qt5-qtquickcontrols
BuildRequires: git

%description


%prep
%setup -q

%build
rm -rf plugins
git clone --depth=1 https://github.com/albertlauncher/plugins
cmake \
 -DCMAKE_INSTALL_PREFIX=/usr \
 -DCMAKE_BUILD_TYPE=Release \
 -DBUILD_VIRTUALBOX=OFF \
 -DBUILD_PYTHON=OFF
make %{?_smp_mflags}

%install
# rm -rf $RPM_BUILD_ROOT
make DESTDIR=$RPM_BUILD_ROOT install


%post 

%postun 


%clean
rm -rf $RPM_BUILD_ROOT


%files
%defattr(-,root,root)
%{bindir}/albert
#%%{datadir}/albert/plugins/*
%{libdir}/albert/plugins/*
%{datadir}/albert
%{libdir}/albert/*.so
%{datadir}/icons/hicolor/scalable/apps/albert.svg
%{datadir}/applications/albert.desktop


%changelog
* Mon Mar 26 2018 Kazuhisa Hara <kazuhisya@gamial.com> - 0.14.18-1
- build for ver 0.14.18
* Sun Dec 24 2017 Kazuhisa Hara <kazuhisya@gamial.com> - 0.14.14-1
- build for ver 0.14.14
* Mon Nov 27 2017 Kazuhisa Hara <kazuhisya@gamial.com> - 0.14.13-1
- build for ver 0.14.13
* Thu Nov 23 2017 Kazuhisa Hara <kazuhisya@gamial.com> - 0.14.11-1
- build for ver 0.14.11
* Thu Nov 16 2017 Kazuhisa Hara <kazuhisya@gamial.com> - 0.14.8-1
- build for ver 0.14.8
* Fri Nov 10 2017 Kazuhisa Hara <kazuhisya@gamial.com> - 0.14.7-1
- build for ver 0.14.7
* Tue Oct 31 2017 Kazuhisa Hara <kazuhisya@gamial.com> - 0.14.5-1
- build for ver 0.14.5
- fix plugin libs file not found
* Tue Oct 24 2017 Kazuhisa Hara <kazuhisya@gamial.com> - 0.14.3-1
- build for ver 0.14.3
* Mon Oct  2 2017 Kazuhisa Hara <kazuhisya@gamial.com> - 0.13.1-1
- build for ver 0.13.1
* Sat Jun 10 2017 Kazuhisa Hara <kazuhisya@gamial.com> - 0.12.0-1
- build for ver 0.12.0
* Mon Jun  5 2017 Kazuhisa Hara <kazuhisya@gamial.com> - 0.11.3-1
- build for ver 0.11.3
* Mon May 15 2017 Kazuhisa Hara <kazuhisya@gamial.com> - 0.11.2-1
- build for ver 0.11.2
* Tue Mar 21 2017 Kazuhisa Hara <kazuhisya@gamial.com> - 0.10.1-1
- build for ver 0.10.1
* Mon Mar 20 2017 Kazuhisa Hara <kazuhisya@gamial.com> - 0.10.0-1
- build for ver 0.10.0
* Fri Mar  3 2017 Kazuhisa Hara <kazuhisya@gamial.com> - 0.9.4-1
- build for ver 0.9.4
* Fri Jan 20 2017 Rabin .Y <s+albert@rabin.io> - 0.9.0-1
- build for ver 0.9.0
* Wed Jun 22 2016 Rabin .Y <s+albert@rabin.io> - 0.8.9-1
- build for ver 0.8.9
* Thu Oct 29 2015 Rabin .Y <s+albert@rabin.io> - 0.8-1
- build for ver 0.8
* Tue Oct 20 2015 Rabin .Y <s+albert@rabin.io> - 0.7.7-1
- build for ver 0.7.7
* Sun Feb 1 2015 Rabin .Y <s+albert@rabin.io>
- init build
