Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C44470BF3
	for <lists+linux-cachefs@lfdr.de>; Fri, 10 Dec 2021 21:39:53 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-303-sdUbRxRzMVi0_UDQebEMxg-1; Fri, 10 Dec 2021 15:39:49 -0500
X-MC-Unique: sdUbRxRzMVi0_UDQebEMxg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8B11102CB73;
	Fri, 10 Dec 2021 20:39:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AE5855ED2B;
	Fri, 10 Dec 2021 20:39:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BC5414BB7C;
	Fri, 10 Dec 2021 20:39:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
	[10.11.54.8])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BAKd2Bc009694 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 10 Dec 2021 15:39:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 21AD0C15E73; Fri, 10 Dec 2021 20:39:02 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CEBBC159F6
	for <linux-cachefs@redhat.com>; Fri, 10 Dec 2021 20:39:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 02E751064E6A
	for <linux-cachefs@redhat.com>; Fri, 10 Dec 2021 20:39:02 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com
	(smtp-relay-internal-0.canonical.com [185.125.188.122]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-479-uHI4c8UfNZia_LKr6wKFiA-1; Fri, 10 Dec 2021 15:39:00 -0500
X-MC-Unique: uHI4c8UfNZia_LKr6wKFiA-1
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
	[209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
	SHA256) (No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id
	1EE0840192
	for <linux-cachefs@redhat.com>; Fri, 10 Dec 2021 20:38:59 +0000 (UTC)
Received: by mail-ed1-f70.google.com with SMTP id
	p4-20020aa7d304000000b003e7ef120a37so9141888edq.16
	for <linux-cachefs@redhat.com>; Fri, 10 Dec 2021 12:38:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5yoGUr7pzPnZBDOdChvpH3bNEBPR4tkHUNd2RR7JJH4=;
	b=YRtNkzY5vtIz0AApgaKExlz9iO3+reWi4FO1hUMElGWPcYF5I2LxY4aLGugcxkfJxA
	vAd+EkkqIl1n2XIDlV2MF/+/TN3thS5V1Mtjl9mRSJFqLmhfEJdqBDT10UjcvQsfNxyx
	gkhby1E/ZWD4FQ8J0HfkVhIWDV3WMoyl7rvSWaishQyys6nV89MY8G8FJaUtrOnHAv+2
	m/cjc8sO5rWWoJZ9vo8X9xu3wvLO8Ods7zFzLHOm21cIwEu0OKYigiv13DjmTLDgcu9y
	PP9GxjQNnTXfJcWTdut+GSUzLx60OHCANn7zXpfbp1XJZXegNK3wF2v6VvVsN6a3Kj0f
	IGrg==
X-Gm-Message-State: AOAM5313FWXhQehZ3U1jgvOSTmAKP5oC/q6WVu2eal3kFe3gSTdILhbj
	MfS2ET6uejXliXmddxsPDnkivghKO7h4JM80ZzYbILyiuguBylzl0qq6qZQp2HsULdGkntUeGn6
	SYT+G0IEMZ63wRc4sgRFl7xZMvn4KJoUS6S9jSsoTFN/vDtKjbEp2
X-Received: by 2002:a05:6402:274c:: with SMTP id
	z12mr43261383edd.294.1639168738739; 
	Fri, 10 Dec 2021 12:38:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxgA236x/yjx6TWkXOleXezvnEgrIAVa1yzBQb8Ze+JaO9/0KXgBOBtxlFprZiSdLFnjBlcdw/PZl80G6UL+y4=
X-Received: by 2002:a05:6402:274c:: with SMTP id
	z12mr43261361edd.294.1639168738589; 
	Fri, 10 Dec 2021 12:38:58 -0800 (PST)
MIME-Version: 1.0
References: <20211105154334.1841927-1-alexandre.ghiti@canonical.com>
	<CAK8P3a2AnLJgGNBFvjUQqXd-Az9vjgE7yJQXGDwCav5E0btSsg@mail.gmail.com>
In-Reply-To: <CAK8P3a2AnLJgGNBFvjUQqXd-Az9vjgE7yJQXGDwCav5E0btSsg@mail.gmail.com>
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Date: Fri, 10 Dec 2021 21:38:47 +0100
Message-ID: <CA+zEjCtajRJhs8zSdR_oFBOO3P5FWWZJ3L6N-GK+JnUjdymTiA@mail.gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Nov 5, 2021 at 4:56 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Fri, Nov 5, 2021 at 4:43 PM Alexandre Ghiti
> <alexandre.ghiti@canonical.com> wrote:
> >
> > While bumping from 5.13 to 5.15, I found that a few deleted configs had
> > left some pieces here and there: this patchset cleans that.
> >
> > Alexandre Ghiti (7):
> >   Documentation, arch: Remove leftovers from fscache/cachefiles
> >     histograms
> >   Documentation, arch: Remove leftovers from raw device
> >   Documentation, arch: Remove leftovers from CIFS_WEAK_PW_HASH
> >   arch: Remove leftovers from mandatory file locking
> >   Documentation, arch, fs: Remove leftovers from fscache object list
> >   include: mfd: Remove leftovers from bd70528 watchdog
> >   arch: Remove leftovers from prism54 wireless driver
>
> Looks all good to me, thanks a lot for the cleanup!
>
> For arch/arm/configs:
>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
>
> assuming this goes through someone else's tree. Let me know if you need me
> to pick up the patches in the asm-generic tree for cross-architecture work.

Arnd, do you mind taking the whole series except patch 6 ("include:
mfd: Remove leftovers from bd70528 watchdog") as this will be handled
separately. I can ask Jonathan for the doc patches if needed.

Thanks,

Alex

>
>          Arnd

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

