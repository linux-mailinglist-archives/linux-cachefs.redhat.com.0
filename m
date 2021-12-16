Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D71B5476E7F
	for <lists+linux-cachefs@lfdr.de>; Thu, 16 Dec 2021 11:05:44 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-573-URM-_oZSPz67cEO0R7IsNw-1; Thu, 16 Dec 2021 05:05:40 -0500
X-MC-Unique: URM-_oZSPz67cEO0R7IsNw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A43E10144E1;
	Thu, 16 Dec 2021 10:05:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A0AEB348F1;
	Thu, 16 Dec 2021 10:05:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A07091809CB8;
	Thu, 16 Dec 2021 10:05:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
	[10.11.54.10])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BGA5XM4005527 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 16 Dec 2021 05:05:33 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1968D401E77; Thu, 16 Dec 2021 10:05:33 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 154CE401E50
	for <linux-cachefs@redhat.com>; Thu, 16 Dec 2021 10:05:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F02B8380665C
	for <linux-cachefs@redhat.com>; Thu, 16 Dec 2021 10:05:32 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com
	(smtp-relay-internal-0.canonical.com [185.125.188.122]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-636-UAATfx5VO7iybyeU05Xkzw-1; Thu, 16 Dec 2021 05:05:31 -0500
X-MC-Unique: UAATfx5VO7iybyeU05Xkzw-1
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
	[209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
	SHA256) (No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id
	4C9F740036
	for <linux-cachefs@redhat.com>; Thu, 16 Dec 2021 10:05:29 +0000 (UTC)
Received: by mail-ed1-f69.google.com with SMTP id
	d13-20020a056402516d00b003e7e67a8f93so22857677ede.0
	for <linux-cachefs@redhat.com>; Thu, 16 Dec 2021 02:05:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=iEjFNSHMwi4aeXpe7cQghYno80kPHKULcTC4SGtg0Js=;
	b=fl0OAO1U0r9myXm85MEZpvb7HKQiWSwdZbIqgeO9TXlHUnNbiKRYPqOspVBggTGEbh
	mFPo5iGtwu+tnzRPQAcRC4lHaGgVFz+LyiGFfvOt1q/e8HaBp+5xLyiH2UeCYbuYsNov
	ZAJPq0+tR9m5FVpXtZz+6WWcp8sbyNKGf0YWl6c0as5/cbl6/+NUQ+dX5TbIUJy1YBy6
	u6gn/w3/Hby3CAkDcEUsD8EzLL59XJuRids7uzqRXBWCe3KWMrx/ZGQ0vQntQPIxzdLF
	v/jmWd6faFD17D/tdUSBjsA7QgEoiwqXcQH28Vk58DHCQYp83Gn2uQLzdJcbdM+TH4tg
	c7Pw==
X-Gm-Message-State: AOAM531jiXTOx2lkXh+iGlgTf6jufcTtznNjwLnxNnZ1Dd+2jjGEIPl6
	zOW5797y6seS2sXAndAHOUIftvc0bs38uR1G61oGArgY0fEbR+cZ2KEJ5i9XcNKi8dI5vHZrDi6
	i9p3i+btCSUv3i0lGfSHQ8t11Z3MSTlA01NfHx2DBXzMGdxSQqcEE
X-Received: by 2002:a17:906:48d:: with SMTP id
	f13mr1328899eja.178.1639649129031; 
	Thu, 16 Dec 2021 02:05:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw4csYse2ts0CIc+GNT8hFD4S36DkgIwbzgfyBzIjr+nwEiJtuY5m75c6D7//m27d8UIPSjBoFZUfOIoRMOvGc=
X-Received: by 2002:a17:906:48d:: with SMTP id
	f13mr1328883eja.178.1639649128845; 
	Thu, 16 Dec 2021 02:05:28 -0800 (PST)
MIME-Version: 1.0
References: <20211105154334.1841927-1-alexandre.ghiti@canonical.com>
	<CAK8P3a2AnLJgGNBFvjUQqXd-Az9vjgE7yJQXGDwCav5E0btSsg@mail.gmail.com>
	<CA+zEjCtajRJhs8zSdR_oFBOO3P5FWWZJ3L6N-GK+JnUjdymTiA@mail.gmail.com>
	<CAK8P3a3aJJYcONV9JMcn47=mW4P4kvYFdwnTdyZfRqeo+eGndQ@mail.gmail.com>
In-Reply-To: <CAK8P3a3aJJYcONV9JMcn47=mW4P4kvYFdwnTdyZfRqeo+eGndQ@mail.gmail.com>
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Date: Thu, 16 Dec 2021 11:05:18 +0100
Message-ID: <CA+zEjCu9KmTMpvXkFqgHX0C1jNZKquZU4owZKaJ_-o4+M_7ACg@mail.gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-loop: linux-cachefs@redhat.com
Cc: Rich Felker <dalias@libc.org>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
	Paul Mackerras <paulus@samba.org>, samba-technical@lists.samba.org,
	Lee Jones <lee.jones@linaro.org>, linux-cifs@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>, Linux-sh list <linux-sh@vger.kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Yoshinori Sato <ysato@users.osdn.me>,
	Russell King <linux@armlinux.org.uk>, linux-cachefs@redhat.com,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Kalle Valo <kvalo@codeaurora.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Ronnie Sahlberg <lsahlber@redhat.com>, Steve French <sfrench@samba.org>,
	Luis Chamberlain <mcgrof@kernel.org>, Jeff Layton <jlayton@kernel.org>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-power@fi.rohmeurope.com
Subject: Re: [Linux-cachefs] [PATCH 0/7] Cleanup after removal of configs
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Dec 15, 2021 at 10:49 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Fri, Dec 10, 2021 at 9:38 PM Alexandre Ghiti
> <alexandre.ghiti@canonical.com> wrote:
> >
> > On Fri, Nov 5, 2021 at 4:56 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > >
> > > On Fri, Nov 5, 2021 at 4:43 PM Alexandre Ghiti
> > > <alexandre.ghiti@canonical.com> wrote:
> > > >
> > > > While bumping from 5.13 to 5.15, I found that a few deleted configs had
> > > > left some pieces here and there: this patchset cleans that.
> > > >
> > > > Alexandre Ghiti (7):
> > > >   Documentation, arch: Remove leftovers from fscache/cachefiles
> > > >     histograms
> > > >   Documentation, arch: Remove leftovers from raw device
> > > >   Documentation, arch: Remove leftovers from CIFS_WEAK_PW_HASH
> > > >   arch: Remove leftovers from mandatory file locking
> > > >   Documentation, arch, fs: Remove leftovers from fscache object list
> > > >   include: mfd: Remove leftovers from bd70528 watchdog
> > > >   arch: Remove leftovers from prism54 wireless driver
> > >
> > > Looks all good to me, thanks a lot for the cleanup!
> > >
> > > For arch/arm/configs:
> > >
> > > Acked-by: Arnd Bergmann <arnd@arndb.de>
> > >
> > > assuming this goes through someone else's tree. Let me know if you need me
> > > to pick up the patches in the asm-generic tree for cross-architecture work.
> >
> > Arnd, do you mind taking the whole series except patch 6 ("include:
> > mfd: Remove leftovers from bd70528 watchdog") as this will be handled
> > separately. I can ask Jonathan for the doc patches if needed.
>
> I tried to apply them, but only three of the patches applied cleanly. Can you
> resend them based on v5.16-rc1?

Sure, I have just sent the v2.

Thanks,

Alex

>
>         Arnd

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

