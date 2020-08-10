Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 56813240991
	for <lists+linux-cachefs@lfdr.de>; Mon, 10 Aug 2020 17:34:54 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-D7Krf_2oMVKImK8H-j7eUw-1; Mon, 10 Aug 2020 11:34:48 -0400
X-MC-Unique: D7Krf_2oMVKImK8H-j7eUw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C9DA1B18BDE;
	Mon, 10 Aug 2020 15:34:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 24B3810013C2;
	Mon, 10 Aug 2020 15:34:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B92F21809554;
	Mon, 10 Aug 2020 15:34:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07AFYgFt010526 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 10 Aug 2020 11:34:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4ED232156A3B; Mon, 10 Aug 2020 15:34:42 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 33D5D2166BA4
	for <linux-cachefs@redhat.com>; Mon, 10 Aug 2020 15:34:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 078BF801188
	for <linux-cachefs@redhat.com>; Mon, 10 Aug 2020 15:34:40 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
	[209.85.166.44]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-128-93KsoUGcOiWQ-tAHanAi3g-1; Mon, 10 Aug 2020 11:34:33 -0400
X-MC-Unique: 93KsoUGcOiWQ-tAHanAi3g-1
Received: by mail-io1-f44.google.com with SMTP id b16so886978ioj.4;
	Mon, 10 Aug 2020 08:34:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5WTYhGSMVJwaOGI5CfF/LhAkHD90jfpwgnfPX4Hecs4=;
	b=Rd0HK24L8QAagFyGRHwliEhVl78k7PEY22zJFHCMAih3lXFkc6Qnm567gMpugaFx1b
	N63vivVaBsw0Fw0kpTg5Ss656PTg2gfSJ4NwMG+yMWyXh4Y2y0R7mPm7MfGV4tgXQrVg
	bJeKsLwrSlLCMaCDnGeyvU3aiB0OsXKc6S4VmOnyj8meL9ZhhqEOG5AHnfBLpt825xoM
	4mXIL/I6pSW+LXyo4n2g4w1+lMTD7B8fGq5LhEOQzc2Yn3aLQ3sV0aCylN9NA0KMvdEN
	5JhiyJ4qhBuS+Bf+Lh4tOt0+pgq9iHDzRgpIM399noYQcZ2B+o9LqhU3e0VitheffFy6
	yGmg==
X-Gm-Message-State: AOAM530rCUEZevdUuPG9qLASeabel8VhQ2HmeIXlYdSoR2bWNyVZVtV2
	5CBYLP9K80Vk4vuvz5o8LRgUKdfWdtgCe+PLovQksUqN
X-Google-Smtp-Source: ABdhPJx/72p6MbNErre05awlascVxCqkGhI8Z4HJDnMGlc4VJwJdcxlxvUk8VJQtBs+c1JaA8neSe/NM/cZiAC2o7ms=
X-Received: by 2002:a05:6638:bd1:: with SMTP id
	g17mr20791285jad.132.1597073672791; 
	Mon, 10 Aug 2020 08:34:32 -0700 (PDT)
MIME-Version: 1.0
References: <447452.1596109876@warthog.procyon.org.uk>
	<1851200.1596472222@warthog.procyon.org.uk>
	<667820.1597072619@warthog.procyon.org.uk>
In-Reply-To: <667820.1597072619@warthog.procyon.org.uk>
From: Steve French <smfrench@gmail.com>
Date: Mon, 10 Aug 2020 10:34:21 -0500
Message-ID: <CAH2r5msKipj1exNUDaSUN7h0pjanOenhSg2=EWYMv_h15yKtxg@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
Cc: CIFS <linux-cifs@vger.kernel.org>, linux-nfs <linux-nfs@vger.kernel.org>,
	linux-afs@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Steve French <sfrench@samba.org>, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [Linux-cachefs] [GIT PULL] fscache rewrite -- please drop for
	now
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
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

cifs.ko also can set rsize quite small (even 1K for example, although
that will be more than 10x slower than the default 4MB so hopefully no
one is crazy enough to do that).   I can't imagine an SMB3 server
negotiating an rsize or wsize smaller than 64K in today's world (and
typical is 1MB to 8MB) but the user can specify a much smaller rsize
on mount.  If 64K is an adequate minimum, we could change the cifs
mount option parsing to require a certain minimum rsize if fscache is
selected.

On Mon, Aug 10, 2020 at 10:17 AM David Howells <dhowells@redhat.com> wrote:
>
> Hi Linus,
>
> Can you drop the fscache rewrite pull for now.  We've seem an issue in NFS
> integration and need to rework the read helper a bit.  I made an assumption
> that fscache will always be able to request that the netfs perform a read of a
> certain minimum size - but with NFS you can break that by setting rsize too
> small.
>
> We need to make the read helper able to make multiple netfs reads.  This can
> help ceph too.
>
> Thanks,
> David
>


-- 
Thanks,

Steve

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

