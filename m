Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2E9476502
	for <lists+linux-cachefs@lfdr.de>; Wed, 15 Dec 2021 22:55:33 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-zf5IDe5vNCynq4DYPsBmCA-1; Wed, 15 Dec 2021 16:55:29 -0500
X-MC-Unique: zf5IDe5vNCynq4DYPsBmCA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F44C802C96;
	Wed, 15 Dec 2021 21:55:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2667E5E4B6;
	Wed, 15 Dec 2021 21:55:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4167F4A7C9;
	Wed, 15 Dec 2021 21:55:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
	[10.11.54.10])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BFLslMq009059 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 15 Dec 2021 16:54:47 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 78A00400F3A; Wed, 15 Dec 2021 21:54:47 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7515A401E77
	for <linux-cachefs@redhat.com>; Wed, 15 Dec 2021 21:54:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5BF523D2CE86
	for <linux-cachefs@redhat.com>; Wed, 15 Dec 2021 21:54:47 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-301-ZzM_pG_zNfKFkX1ynR8OqQ-1; Wed, 15 Dec 2021 16:54:45 -0500
X-MC-Unique: ZzM_pG_zNfKFkX1ynR8OqQ-1
Received: from mail-wr1-f48.google.com ([209.85.221.48]) by
	mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA
	(Nemesis) id
	1N8GIa-1mSroJ2lcG-014Fbl; Wed, 15 Dec 2021 22:49:39 +0100
Received: by mail-wr1-f48.google.com with SMTP id s1so6418650wrg.1;
	Wed, 15 Dec 2021 13:49:39 -0800 (PST)
X-Gm-Message-State: AOAM5324YETxE+cJqKJc1lnAEkc/jTTXB3HBbsWCISMWiRearh2X1fS9
	jbYspB6R/lrD+BFUmU3F2r9r+zolOR4s++feSpg=
X-Google-Smtp-Source: ABdhPJyI4sFfqi3WV9r3gOmk1U//npIrS4nf8wBAkc7GviXMWmaD3dsHGyhZUXFZ+uysDsSwkLsuIqVlj3CoEC95hIQ=
X-Received: by 2002:a5d:530e:: with SMTP id e14mr6188596wrv.12.1639604979240; 
	Wed, 15 Dec 2021 13:49:39 -0800 (PST)
MIME-Version: 1.0
References: <20211105154334.1841927-1-alexandre.ghiti@canonical.com>
	<CAK8P3a2AnLJgGNBFvjUQqXd-Az9vjgE7yJQXGDwCav5E0btSsg@mail.gmail.com>
	<CA+zEjCtajRJhs8zSdR_oFBOO3P5FWWZJ3L6N-GK+JnUjdymTiA@mail.gmail.com>
In-Reply-To: <CA+zEjCtajRJhs8zSdR_oFBOO3P5FWWZJ3L6N-GK+JnUjdymTiA@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 15 Dec 2021 22:49:23 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3aJJYcONV9JMcn47=mW4P4kvYFdwnTdyZfRqeo+eGndQ@mail.gmail.com>
Message-ID: <CAK8P3a3aJJYcONV9JMcn47=mW4P4kvYFdwnTdyZfRqeo+eGndQ@mail.gmail.com>
To: Alexandre Ghiti <alexandre.ghiti@canonical.com>
X-Provags-ID: V03:K1:Psv8cTbBEVc1lR1DbT2Dd82CgbUnWiBOqlE/n/cpzckVXMAQHrj
	guvI5CNidXWu73Bp89L9TJV/2Ie6TxLSgCvlod8ZcjrqSsObrKtn33P2umLNStTFMNkvjYR
	Pex5Gfxi9fJZh7sdjtahDlNw8MZoq1DV/VcaI7qak5xMwhpTJHjDtd4roWvBeLxbP4fUlXQ
	CU26XxRtFmotODbbl+pIQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ul2WZEhM0Qw=:Cn2cWKY8bIMLJB7SpLHoM7
	RK7bT18jqIiI1PtVF6dtGFl8cwtrRySxb+LhQyU6ulbtCPp8A7CdsxkskizuC+uNJDyRw0f8N
	ZD83ekYM0USKEshfOjgvwU3SIuQu86HqNaV9TNbOujlDuZ9pvePy+IMa50MQheHqp6RNT/LXN
	SFsUZr2Kgg7w76zaxN80HFz/Se6gt4EeG5I3UW/PjMA9caR1d4EDjI5UAmltxE8fJx70J4rM9
	RQnVSJEzOPMyFFwOB2rm5OgS7KPEx+9l32zr//pZq01SskSo5/nuoO34PVvjmhOhrHX7ttPSm
	bHgCuU3x/8R4Jeh5/pUdCzo54IpmdbLso3rDkNMzDm7aFxjNNaDr8qGe28zrFr99fj1xVfZcv
	ONZ/zJroMfAUSAxsOBzhP8zIMFK75DhVcxBJD2N9fy/rwRw8t3uI6yESSzAtlzA6FV5pbe+Im
	92ZcCQ/58YKTG3Bsnf0rlnFJHZJGPwtvEfpQDCf6kt1+zw5JjlsXlUkpeQQNM/OdKXOoxZpKZ
	mlFUQOx2MaTfM0JpPJVm1vEKKEtddR0lue7aow1yUl+YsGIHGMi7GrgOnDB8DDBClMVCgq/R1
	i+pdfLWV2EYYS+OKdFen91fUZ3oNlgNfHfp5DhE3LJr9uOz9UIZheSbEgrIWouFlVe1UwqB+M
	ObJ8N3RuF3FhnPnHYC+hhevpjr/8MLJalKd34N15f1o8QIZOp75GHYbh8HA2cSSQvJ/99nbJ6
	dNfypPtBrSdVZ6zGjvuqAk1Mz/3eT6vQF8TjJij0re3BeHZLlFeRAB7XQE/zVtEwfSOHKN68+
	ANab+YKlDScpGtqNOS42SJv5hBVum+s1aymphKnO6Q2NB9hYZY=
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
	Guenter Roeck <linux@roeck-us.net>, Arnd Bergmann <arnd@arndb.de>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Dec 10, 2021 at 9:38 PM Alexandre Ghiti
<alexandre.ghiti@canonical.com> wrote:
>
> On Fri, Nov 5, 2021 at 4:56 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Fri, Nov 5, 2021 at 4:43 PM Alexandre Ghiti
> > <alexandre.ghiti@canonical.com> wrote:
> > >
> > > While bumping from 5.13 to 5.15, I found that a few deleted configs had
> > > left some pieces here and there: this patchset cleans that.
> > >
> > > Alexandre Ghiti (7):
> > >   Documentation, arch: Remove leftovers from fscache/cachefiles
> > >     histograms
> > >   Documentation, arch: Remove leftovers from raw device
> > >   Documentation, arch: Remove leftovers from CIFS_WEAK_PW_HASH
> > >   arch: Remove leftovers from mandatory file locking
> > >   Documentation, arch, fs: Remove leftovers from fscache object list
> > >   include: mfd: Remove leftovers from bd70528 watchdog
> > >   arch: Remove leftovers from prism54 wireless driver
> >
> > Looks all good to me, thanks a lot for the cleanup!
> >
> > For arch/arm/configs:
> >
> > Acked-by: Arnd Bergmann <arnd@arndb.de>
> >
> > assuming this goes through someone else's tree. Let me know if you need me
> > to pick up the patches in the asm-generic tree for cross-architecture work.
>
> Arnd, do you mind taking the whole series except patch 6 ("include:
> mfd: Remove leftovers from bd70528 watchdog") as this will be handled
> separately. I can ask Jonathan for the doc patches if needed.

I tried to apply them, but only three of the patches applied cleanly. Can you
resend them based on v5.16-rc1?

        Arnd

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

