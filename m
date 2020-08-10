Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id B8033241154
	for <lists+linux-cachefs@lfdr.de>; Mon, 10 Aug 2020 22:04:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597089869;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6nU0yZbY5NaPC5Dasle0N1ZDQslGwMMxOSMbpz4LqNI=;
	b=D8GRW8oClkDVbHqhIABx/wv1oOkwPeufz1e7pGdG5PssaQ8Jvc24qVmHtsOmBuU9g8bOBD
	ueMeEHaCt0OUKRq3SQuh9dzLiX7G+UUmoJIK76xSKh7UsIfO8XHT8tF2/WgrY95mb3PCLh
	3zfX0hUR7P6Uj8E7NgZ8dJxhTQfA5pY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-GTb6J1VAMHu-APe9GA_J3Q-1; Mon, 10 Aug 2020 16:04:27 -0400
X-MC-Unique: GTb6J1VAMHu-APe9GA_J3Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 049268017FB;
	Mon, 10 Aug 2020 20:04:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CF6E35D9CD;
	Mon, 10 Aug 2020 20:04:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E157A1809561;
	Mon, 10 Aug 2020 20:04:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07AH6aYk024523 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 10 Aug 2020 13:06:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 57748F49A1; Mon, 10 Aug 2020 17:06:36 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 53487CF609
	for <linux-cachefs@redhat.com>; Mon, 10 Aug 2020 17:06:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 72CE7185A797
	for <linux-cachefs@redhat.com>; Mon, 10 Aug 2020 17:06:30 +0000 (UTC)
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
	[209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-305-SXr6iO6QOSG7wKO3IvxT4g-1; Mon, 10 Aug 2020 13:06:29 -0400
X-MC-Unique: SXr6iO6QOSG7wKO3IvxT4g-1
Received: by mail-qv1-f72.google.com with SMTP id d1so7638181qvs.21
	for <linux-cachefs@redhat.com>; Mon, 10 Aug 2020 10:06:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=bG1UX7UvzyL+s17qjFjJT/RaH5grYgUy2tkao7iejMk=;
	b=RP9PGFJnserqD8mP4Pr3lOnP1qyg3e5S8ikApGP13SfofZobKjYSPQkOvO8SEvddrV
	mP0uS+/itxr8b8rTAsIhg/LEy+m/rXuh4u2mTlsw9Ux6I/XPjzRafGanHMzraUDYhE49
	yeDIaRt6b2CfvFOCzam4Ic9dy0ziTxbCgaE9sAPTBsUelIqSCEuN4IKP8BS0+uiZt2WU
	TiGR5JR6LjcT3M1WAYVuSiw9j5kvmQ2i/IW6GqRV+I3VH3NB62VSsnf5Qlwkaqba+3HL
	nUtbRlIo9scJLBlvAwCQHAsZ51u1NDVVpRr1hRkgpoFsQDIoZtk9FhLFhcaRAjsZlU4Q
	bJvg==
X-Gm-Message-State: AOAM532X+KnO61Qa6exT8v9qPSnMUqxNKVZ/bdWYU67p7MCF9j4ZqEoI
	dumBcGpQZmfanq63JZsAo0vlxBJ26cj3U1f7jxdrkzfpPEMLfZEc9UAIAR25J3AbQljlLs6V4Wq
	VkCBAjUvhbh7fdY7Rhe2UNg==
X-Received: by 2002:ac8:4117:: with SMTP id q23mr29005609qtl.186.1597079188355;
	Mon, 10 Aug 2020 10:06:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlWfqS29REyKPSWZucycGqedyBlydewM4zc1ic5w6qlLsuinsxlRcAI6mVIAmH2h++AmLqgw==
X-Received: by 2002:ac8:4117:: with SMTP id q23mr29005574qtl.186.1597079188107;
	Mon, 10 Aug 2020 10:06:28 -0700 (PDT)
Received: from tleilax.poochiereds.net
	(68-20-15-154.lightspeed.rlghnc.sbcglobal.net. [68.20.15.154])
	by smtp.gmail.com with ESMTPSA id
	l1sm15922877qtp.96.2020.08.10.10.06.27
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 10 Aug 2020 10:06:27 -0700 (PDT)
Message-ID: <fecc577d696f9cd58bbb2fae437c8acea170f7bf.camel@redhat.com>
From: Jeff Layton <jlayton@redhat.com>
To: David Wysochanski <dwysocha@redhat.com>, David Howells
	<dhowells@redhat.com>
Date: Mon, 10 Aug 2020 13:06:26 -0400
In-Reply-To: <CALF+zO=DkGmNDrrr-WxU6L1Xw8MA4+NrqVbvNMctwSKjy0Yh_w@mail.gmail.com>
References: <447452.1596109876@warthog.procyon.org.uk>
	<1851200.1596472222@warthog.procyon.org.uk>
	<667820.1597072619@warthog.procyon.org.uk>
	<CAH2r5msKipj1exNUDaSUN7h0pjanOenhSg2=EWYMv_h15yKtxg@mail.gmail.com>
	<672169.1597074488@warthog.procyon.org.uk>
	<CALF+zO=DkGmNDrrr-WxU6L1Xw8MA4+NrqVbvNMctwSKjy0Yh_w@mail.gmail.com>
User-Agent: Evolution 3.36.4 (3.36.4-1.fc32)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Mon, 10 Aug 2020 16:04:18 -0400
Cc: CIFS <linux-cifs@vger.kernel.org>, Trond, linux-afs@lists.infradead.org,
	Eric, LKML <linux-kernel@vger.kernel.org>,
	linux-nfs <linux-nfs@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Steve French <sfrench@samba.org>,
	Steve French <smfrench@gmail.com>, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Myklebust <trondmy@hammerspace.com>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2020-08-10 at 12:35 -0400, David Wysochanski wrote:
> On Mon, Aug 10, 2020 at 11:48 AM David Howells <dhowells@redhat.com> wrote:
> > Steve French <smfrench@gmail.com> wrote:
> > 
> > > cifs.ko also can set rsize quite small (even 1K for example, although
> > > that will be more than 10x slower than the default 4MB so hopefully no
> > > one is crazy enough to do that).
> > 
> > You can set rsize < PAGE_SIZE?
> > 
> > > I can't imagine an SMB3 server negotiating an rsize or wsize smaller than
> > > 64K in today's world (and typical is 1MB to 8MB) but the user can specify a
> > > much smaller rsize on mount.  If 64K is an adequate minimum, we could change
> > > the cifs mount option parsing to require a certain minimum rsize if fscache
> > > is selected.
> > 
> > I've borrowed the 256K granule size used by various AFS implementations for
> > the moment.  A 512-byte xattr can thus hold a bitmap covering 1G of file
> > space.
> > 
> > 
> 
> Is it possible to make the granule size configurable, then reject a
> registration if the size is too small or not a power of 2?  Then a
> netfs using the API could try to set equal to rsize, and then error
> out with a message if the registration was rejected.
> 

...or maybe we should just make fscache incompatible with an
rsize that isn't an even multiple of 256k? You need to set mount options
for both, typically, so it would be fairly trivial to check this at
mount time, I'd think.

-- 
Jeff Layton <jlayton@redhat.com>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

