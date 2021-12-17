Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D94D5478C02
	for <lists+linux-cachefs@lfdr.de>; Fri, 17 Dec 2021 14:10:04 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-422-HQkOUHhcMoSu7nLNc6lXNQ-1; Fri, 17 Dec 2021 08:10:00 -0500
X-MC-Unique: HQkOUHhcMoSu7nLNc6lXNQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4D3118B613A;
	Fri, 17 Dec 2021 13:09:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 60135101E819;
	Fri, 17 Dec 2021 13:09:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B27B04BB7C;
	Fri, 17 Dec 2021 13:09:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BHD9tZ9015601 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 17 Dec 2021 08:09:55 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 18FF32166B13; Fri, 17 Dec 2021 13:09:55 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 126ED2166B4F
	for <linux-cachefs@redhat.com>; Fri, 17 Dec 2021 13:09:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C88721C8C296
	for <linux-cachefs@redhat.com>; Fri, 17 Dec 2021 13:09:51 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-632-GSVg9dqzOZ-sGSDWe_7wvA-1; Fri, 17 Dec 2021 08:09:50 -0500
X-MC-Unique: GSVg9dqzOZ-sGSDWe_7wvA-1
Received: from mail-wm1-f49.google.com ([209.85.128.49]) by
	mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA
	(Nemesis) id
	1Mq33i-1mCHKD3VYI-00n7ck; Fri, 17 Dec 2021 14:09:47 +0100
Received: by mail-wm1-f49.google.com with SMTP id
	p27-20020a05600c1d9b00b0033bf8532855so1518699wms.3; 
	Fri, 17 Dec 2021 05:09:47 -0800 (PST)
X-Gm-Message-State: AOAM533t+TDXFTW80w62pO/1wFPvOzhQgi/zW0uvMD+yQjbkzexRfxNF
	lSA39ud8o1/siUJsqh7gZRC0MpHG3suuivDzFDY=
X-Google-Smtp-Source: ABdhPJz7G1Jphi5B+WPZUUBROjJfTQT5bMgaRQTtBbW6svcijGRnk/NTqL4833WgkZbH4dijpWWNsIR992CZFrm3sB8=
X-Received: by 2002:a05:600c:6d2:: with SMTP id
	b18mr2709166wmn.98.1639746587350; 
	Fri, 17 Dec 2021 05:09:47 -0800 (PST)
MIME-Version: 1.0
References: <20211216094426.2083802-1-alexandre.ghiti@canonical.com>
	<20211216094426.2083802-6-alexandre.ghiti@canonical.com>
	<1956456.1639746081@warthog.procyon.org.uk>
In-Reply-To: <1956456.1639746081@warthog.procyon.org.uk>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 17 Dec 2021 14:09:31 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1M-kDqe0uwzyfUiErOavoEi3bVpy4m4BPbBXQr6JrHdw@mail.gmail.com>
Message-ID: <CAK8P3a1M-kDqe0uwzyfUiErOavoEi3bVpy4m4BPbBXQr6JrHdw@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
X-Provags-ID: V03:K1:XdGyWQn8ek9brPQzXYQyO0wXbWtLMnMZwf5poBVgtfbHwBJxMV5
	oMJrvqOx+wljbew+y+r1OmGfvB9CvOUnBOCj1ttVQVfpMFdsq36Xpz+VbeRfA0muMf0Lfe6
	0gPPZZgyu0j1aPKZT1F4pey7IDGOwzN9OCsCCijsQ9UMrKb1ceQXCdnsHH03oEqiK0Ukkh8
	HKugvtedMBexpxR0pLpcg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:cgl232XziTg=:cypBBuyJES6lftu90FmuOY
	vCeYSCt0BdL98r/UW1lGZkL290CBUtqs4SXvoBdtuRLDEh0aalGYfw8g8NHCPV0trl3bxELUV
	/BhQZOqnTRqxJMVf/RpCx5hborS1HjVpuHds20WKzo04c/6f31sjC/G5rPm5QLAdq9E7/5u2u
	jRVTm3iqf+gGwUWTVwZZxJ22qvkODiHauANWcDKlIKJ4bcxEeOoys+wffTM8fe67IV1vhyCWy
	svkZWGs3R2MkyfyU9LxwSmJnaCERa/uf0vnqTPvVQqb80JbSTJZAahoCWS0sX0KCDU1iX9jpi
	/csJ+gH/8XWy0lw/kJN5//4qt4mMbxXUXPiJL8S7jnSlURevDp6B48fy6ax6F9G8gYpj5Sa06
	v8wefBvCeDW0EcblDvc6YCfOBkml3mY+X8/M34nEamWJEYukBNoztmiwYcuSjUAftW+TOPch+
	flvK1D+9fjHuuh28EerkEqOT8c7cvhoZhK1fYQ5d3aHw8pgokJE+ZpO8gS4q4KbIaCks2Cfu5
	7mEdvPBhvB06f7XZjk83bAbpwUYJ/3mqpjaFKJodh9nRmLmBL9rVcooyMdaCXKzgHfBSADlnX
	+Za4GapL54HKlDu0eeTPRwTsyxWaOdiuZqRII6CCkUn9TDU5Dd/WMHI5EZganYmhKazV2FGE6
	xrzAWJuszCbpklv8QlWoOmYS/+ofxOAt0kVYYmOJ6QKEuXsUGyLdg2OV8VMkWvIZsViA=
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Jonathan Corbet <corbet@lwn.net>, samba-technical@lists.samba.org,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Steve French <sfrench@samba.org>, linux-cachefs@redhat.com,
	Alexandre Ghiti <alexandre.ghiti@canonical.com>
Subject: Re: [Linux-cachefs] [PATCH v2 5/6] Documentation, arch,
 fs: Remove leftovers from fscache object list
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Dec 17, 2021 at 2:01 PM David Howells <dhowells@redhat.com> wrote:
>
> Hi Alexandre,
>
> >  Documentation/filesystems/caching/fscache.rst | 89 -------------------
> > ...
> >  fs/fscache/object.c                           |  3 -
> >  fs/fscache/proc.c                             | 12 ---
>
> Can you please drop all of the fscache bits?  They're dealt with by my
> fscache-rewrite patchset that I'm proposing for the next merge window[1].

I've dropped them both from the asm-generic tree.

       Arnd

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

