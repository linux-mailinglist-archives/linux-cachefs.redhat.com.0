Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBFC4A4BB7
	for <lists+linux-cachefs@lfdr.de>; Mon, 31 Jan 2022 17:20:44 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-362-A1b7ZlEgPUm1I4H7ppiWhw-1; Mon, 31 Jan 2022 11:20:40 -0500
X-MC-Unique: A1b7ZlEgPUm1I4H7ppiWhw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D69C53E744;
	Mon, 31 Jan 2022 16:20:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E23897AB54;
	Mon, 31 Jan 2022 16:20:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0C37518095C9;
	Mon, 31 Jan 2022 16:20:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20VGKW6W012416 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 31 Jan 2022 11:20:32 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 176E11121332; Mon, 31 Jan 2022 16:20:32 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 11E05112132E
	for <linux-cachefs@redhat.com>; Mon, 31 Jan 2022 16:20:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D6D3B3C01B82
	for <linux-cachefs@redhat.com>; Mon, 31 Jan 2022 16:20:27 +0000 (UTC)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
	[209.85.166.169]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-197-Q7L842KdPsWmgEH83YJ23w-1; Mon, 31 Jan 2022 11:20:26 -0500
X-MC-Unique: Q7L842KdPsWmgEH83YJ23w-1
Received: by mail-il1-f169.google.com with SMTP id i1so11842553ils.5;
	Mon, 31 Jan 2022 08:20:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UbFm592rz0IKfu+VnJFNxz1Msppocc460xkpKheRmIo=;
	b=gATGqbsSlSwlyfBP/9GZ+SaBS986+mxgSuvFwNu5/9CBuk3MbAdQ+4y+/rjdpBVhwW
	JvEKBC97/uAQAyVL0YocMxHA4CKupWPl05TzPyzY6ya9igJMTS9RpAJA6k3B8z3zmi5m
	PEFlGxSFfzPgolWKyx1fJo5XtBhjzdt4RhxhQdXIp9FidQvbU8uE3tJdzo6fwr1TMOQJ
	HN9S5dk54vpvShbJW/2Pr3dadJqKjftJkYrOMAyL79iVgxVS8182lSsItr2C5qTExScU
	JvzJOqnQaFQnL/XbdH6OGkLuENanhFGZnTbJPssh73T6XqvuLxKAk96ypIJRkM/s62s0
	1dzQ==
X-Gm-Message-State: AOAM533zAqTwg7xgaOdPRjmgT/iqZyN+EXrxQ55awCAFhA9fNYRiLstx
	SLg4ClcxzbfYcXopn79tPwfWuEnrrnvmwyVVot2wY3shIqE=
X-Google-Smtp-Source: ABdhPJyRorRaMlWkkgIN9K2SnqW/g5GLCJG6D2tuEyorWa6Y39EQqCnR0aSGdXlSeCoGJkW+S6ipBxaQeGvq99bLJmk=
X-Received: by 2002:a05:6e02:1708:: with SMTP id
	u8mr5000825ill.319.1643646025247; 
	Mon, 31 Jan 2022 08:20:25 -0800 (PST)
MIME-Version: 1.0
References: <164364196407.1476539.8450117784231043601.stgit@warthog.procyon.org.uk>
	<164364197646.1476539.3635698398603811895.stgit@warthog.procyon.org.uk>
	<CAOQ4uxiorvXhhJbCsGo-B7aBX0BbSYp7wUHmYS1e1xxJ4dpF3w@mail.gmail.com>
	<1531209.1643643128@warthog.procyon.org.uk>
In-Reply-To: <1531209.1643643128@warthog.procyon.org.uk>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 31 Jan 2022 18:20:14 +0200
Message-ID: <CAOQ4uxhc6FW-io5mC=FN=vFawEAwjXZO7kCcGt5gzqq3ON1Y7w@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-cachefs@redhat.com
Cc: Miklos Szeredi <miklos@szeredi.hu>, Jeff Layton <jlayton@kernel.org>,
	overlayfs <linux-unionfs@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Christoph Hellwig <hch@infradead.org>, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [Linux-cachefs] [PATCH 1/5] vfs, overlayfs,
 cachefiles: Turn I_OVL_INUSE into something generic
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 31, 2022 at 5:32 PM David Howells <dhowells@redhat.com> wrote:
>
> Amir Goldstein <amir73il@gmail.com> wrote:
>
> > Please leave ovl_* as wrappers instead of changing super.c.
>
> Do you want them turning into inline functions?
>

inline would be fine.

But I just noticed something that may wreck this party.

The assumption, when I proposed this merger, was that an inode for
upper/work and is exclusively owned by ovl driver, so there should be no
conflicts with other drivers setting inuse flag.

However, in ovl_check_layer(), we walk back to root to verify that an ovl
layer of a new instance is not a descendant of another ovl upper/work inuse.
So the meaning of I_OVL_INUSE is somewhat stronger than an exclusive inode lock.
It implies ownership on the entire subtree.

I guess there is no conflict with cachefiles since ovl upper/work should not be
intersecting with any cachefiles storage, but that complicates the
semantics when
it comes to a generic flag.

OTOH, I am not sure if this check on ovl mount is so smart to begin with.
This check was added (after the exclusive ownership meaning) to silence syzbot
that kept mutating to weird overlapping ovl setups.
I think that a better approach would be to fail a lookup in the upper layer
that results with a d_mountpoint() - those are not expected inside the overlay
upper layer AFAICT.

Anyway, I can make those changes if Miklos agrees with them, but I don't
want to complicate your work on this, so maybe for now, create the I_EXCL_INUSE
generic flag without changing overlayfs and I can make the cleanup to get rid of
I_OVL_INUSE later.

Thanks,
Amir.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

