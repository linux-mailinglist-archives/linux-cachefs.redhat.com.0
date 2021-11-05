Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD204466AA
	for <lists+linux-cachefs@lfdr.de>; Fri,  5 Nov 2021 17:04:13 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568--WJK1zWaN0GS6G6q5V1yhg-1; Fri, 05 Nov 2021 12:04:09 -0400
X-MC-Unique: -WJK1zWaN0GS6G6q5V1yhg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 083C710168C4;
	Fri,  5 Nov 2021 16:04:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B4085D9DE;
	Fri,  5 Nov 2021 16:04:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C78564EA31;
	Fri,  5 Nov 2021 16:03:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A5G1r27032243 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 5 Nov 2021 12:01:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 572084010E94; Fri,  5 Nov 2021 16:01:53 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5211E40CFD12
	for <linux-cachefs@redhat.com>; Fri,  5 Nov 2021 16:01:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3A112800B26
	for <linux-cachefs@redhat.com>; Fri,  5 Nov 2021 16:01:53 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-52-qF2VTgR1O9K-quAV6TgNhA-1; Fri, 05 Nov 2021 12:01:51 -0400
X-MC-Unique: qF2VTgR1O9K-quAV6TgNhA-1
Received: from mail-wm1-f44.google.com ([209.85.128.44]) by
	mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA
	(Nemesis) id
	1M6DrU-1mpcDV46o4-006gry; Fri, 05 Nov 2021 16:56:46 +0100
Received: by mail-wm1-f44.google.com with SMTP id v127so7418351wme.5;
	Fri, 05 Nov 2021 08:56:45 -0700 (PDT)
X-Gm-Message-State: AOAM530jwPVPKnENtdIu9eu6O7Uwebivj1zZJPXGG+/BHNxTpgLOz+UQ
	S7zRTqXQFBAe145LFuoHKmAaI+M9V2KY+yA9S74=
X-Google-Smtp-Source: ABdhPJxk4OCRMtLkil/Eyj8Bt7IiEC6cv8x2wWvEo25EBDjZmSRZavU4Cmw8YwQkdpld9oVGpzqUDybBNFF63jz+S4E=
X-Received: by 2002:a1c:2382:: with SMTP id j124mr20339339wmj.35.1636127805532;
	Fri, 05 Nov 2021 08:56:45 -0700 (PDT)
MIME-Version: 1.0
References: <20211105154334.1841927-1-alexandre.ghiti@canonical.com>
In-Reply-To: <20211105154334.1841927-1-alexandre.ghiti@canonical.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 5 Nov 2021 16:56:29 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2AnLJgGNBFvjUQqXd-Az9vjgE7yJQXGDwCav5E0btSsg@mail.gmail.com>
Message-ID: <CAK8P3a2AnLJgGNBFvjUQqXd-Az9vjgE7yJQXGDwCav5E0btSsg@mail.gmail.com>
To: Alexandre Ghiti <alexandre.ghiti@canonical.com>
X-Provags-ID: V03:K1:y5oybXqGxR3iiSDRSV+DSoxarv05MBdY4VjwXWPIODSI5Qqzec4
	C7llPoAXD+qZX9hWBfgz0oB//p69TXMLmlr2SSSSS2kG7kIJ6F/k/2AqrJdRL6gQKre+Fze
	DOqdUdiqEvUpVjDX7ptS1AVDxz0bncP5j1XMRWsufFTmnHeeVx3tHjtPDtorlpzqp10m/HS
	e8e6OYB1wHfUdH20jMWrQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:T+ZhPbyETCA=:z/utCiYV6QmAJ05YkqVDQR
	674xqmjgNquLfjoPx/YGzoCAK3PGy9QctIa0aBnfwoECJmF2/fDuVlzi0bkm5OUIO67VXeyhL
	7eKuctBCuwXnMpz3xpjnakfZfPrHVsCdcvkETc5GdDx10h7KkNR9N0pdKivhbzp9y9AYfvrBz
	TixbzUH25IvfMlVKdfEPC+YmPoLDgLrLx1WmJRwZbXi35dxpP0AQjc/MxmH0ItxQTtCMGA0sm
	w7Cq8WOH2o2YpsssDZwetagoxB0jhkP1lv1zWGSeN54pq4t6xuumoMjBkhAFtcaW++kgyg/un
	2V4SylQDA5B1EDETTd9Q9urPHtxk/5TioGTZy9SCyIKQaIipH0RImuCHq7nN0t6AS3aHAGOIp
	T5R09cgmscEjh36XsMtgNxKZRg5UX68Vzk6sGOMZcTe+vENzU6KaaN6W5HGz6MxKWLp3CTV0T
	PcT79TqbkmrQYxiluFVjy3kpCipn4z49VZsd2l867Zwmjbw8o/c0XFEWqvjeFM73831gJM4d/
	3lG/JxEIJ8Wc8T8WCP3VTKU7QjbjAQ4bofozm8e9Ks1p+1SbUPghPMYhFB3rnKjtlG9cLD421
	1ZpfYjViDSKABeeMXr5hjXXl++LGn/a9la5kAyBSb97vQkMiTiAjqLHH92zuCT39kjWc7o9fL
	T3zc3dzPbVoA+BZSPoPLtPft1XwBvCIAUbcPKJwY85Lm95nWKBTU8r+iwnK/fU70tWRw=
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Nov 5, 2021 at 4:43 PM Alexandre Ghiti
<alexandre.ghiti@canonical.com> wrote:
>
> While bumping from 5.13 to 5.15, I found that a few deleted configs had
> left some pieces here and there: this patchset cleans that.
>
> Alexandre Ghiti (7):
>   Documentation, arch: Remove leftovers from fscache/cachefiles
>     histograms
>   Documentation, arch: Remove leftovers from raw device
>   Documentation, arch: Remove leftovers from CIFS_WEAK_PW_HASH
>   arch: Remove leftovers from mandatory file locking
>   Documentation, arch, fs: Remove leftovers from fscache object list
>   include: mfd: Remove leftovers from bd70528 watchdog
>   arch: Remove leftovers from prism54 wireless driver

Looks all good to me, thanks a lot for the cleanup!

For arch/arm/configs:

Acked-by: Arnd Bergmann <arnd@arndb.de>

assuming this goes through someone else's tree. Let me know if you need me
to pick up the patches in the asm-generic tree for cross-architecture work.

         Arnd

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

